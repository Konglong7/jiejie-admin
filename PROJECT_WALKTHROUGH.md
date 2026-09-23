# Jiejie Admin 项目讲解：企业级微容器中后台

> 本文基于对仓库源码、构建产物与配置文件的实读整理，面向「讲清楚这个项目到底是什么、怎么运作、亮点与风险在哪」。
> 所有结论均标注了文件路径，便于对照源码。

---

## 〇、先纠正一个概念：这里的「微容器」指什么

`微容器` **不是** 微前端（没有 qiankun / wujie / micro-app —— 全仓库 grep 零命中），也**不是** 微服务。

它指的是 **Render Free Tier 的超小规格容器**：

| 资源 | 规格 |
| :--- | :--- |
| CPU | **0.1 核** |
| 内存 | **512 MB** |
| 磁盘 | 临时 |
| 休眠策略 | 15 分钟无 HTTP 流量即挂起，冷启动 40~90s |

参见 `PROJECT_ARCHIVE.md:30`、`DEPLOY.md:47`、`Dockerfile:44-45`。

**所以"微容器"这个前缀，本质是给整个项目加了一条硬约束**：所有技术选型、JVM 参数、构建流程、部署策略，都必须在这个 0.1C/512MB 的笼子里跑通。这条约束催生了项目后面 4 个工程亮点。理解这一点，整个项目的设计动机就通了。

---

## 一、系统形态全景

```
                         ┌──────────────────────────────────────┐
   访客/HR/面试官  ──────►│  Render 单容器 (0.1 CPU / 512 MB)     │
   PC + 手机微信          │  Spring Boot 3.2.2 fat jar           │
                         │  └─ 内含 Vue 3 静态产物 + .gz 预压缩   │
                         └───────┬──────────────────┬───────────┘
                       JDBC/TLS  │                  │  Redis/TLS
                                 ▼                  ▼
                        TiDB Cloud Serverless   Upstash Redis
                        (MySQL 8.0 兼容, 5GB)   (10,000 req/day)
```

**关键形态决策：单容器、同源、fat jar 内嵌前端。**
没有 Nginx、没有独立前端服务、没有反向代理。Vue 构建产物直接输出进 `jiejie-starter/src/main/resources/static`，由 Spring Boot 的静态资源处理器托管（`vite.config.ts:14`）。

这个决策的收益是：**一份镜像、一个进程、一个端口、同源无跨域**。代价是：静态资源的缓存、压缩、SPA 路由回退全都得自己在 Spring MVC 层实现 —— 这正是后面 `WebMvcConfig` 那 77 行代码要解决的事。

---

## 二、后端多模块架构

Maven 聚合工程，6 个一级模块 / 22 个二级模块。

```
jiejie-common      基础：统一响应 Result、全局异常、基础实体、工具类、注解
jiejie-infra       基础设施：db / redis / oss / sms / pay / push / social /
                              wechat / websocket / crypto / mail
jiejie-core        业务内核：system(83类) / auth / file / gen / message /
                              workflow / biz
jiejie-api         接入层：admin-api(35类) / app-api / web-api
jiejie-job         Quartz 调度：16 个类
jiejie-starter     启动模块：仅 1 个 @SpringBootApplication
```

规模：**259 个 Java 文件、48 个 Vue 文件、52 张业务表、12 次 Git 提交**。

### 依赖方向（实测）

```
jiejie-common  ◄──── db / redis / crypto / job
                        ▲
                        │
jiejie-system  ─────────┘   ← system/core 依赖 infra，方向正确
      ▲
      │  ✅ 正常
      ├── jiejie-auth / file / gen / message / workflow / biz
      │
      └── ⚠️ 反向依赖
          jiejie-pay / jiejie-push / jiejie-sms / jiejie-social / jiejie-wechat
```

**架构上值得讨论的一点**：`jiejie-oss`、`jiejie-mail`、`jiejie-redis`、`jiejie-db` 都干净地只依赖 `jiejie-common`；但 `jiejie-sms`、`jiejie-push`、`jiejie-pay`、`jiejie-social`、`jiejie-wechat` 却反过来依赖了上层的 `jiejie-system`。

这破坏了"基础设施层不感知业务层"的分层原则。推测原因：这些模块需要读取 `SysConfigGroup` 里的配置项（如短信 AccessKey、支付商户号），于是直接从 `system` 模块取配置实体。

**更干净的做法**：在 `jiejie-common` 定义一个 `ConfigProvider` 接口，`system` 实现它，infra 模块依赖接口而非具体实现（依赖倒置）。这样既保住了分层，也不影响功能。

### 几个设计得不错的地方

- **`ApiPrefixConfig`** —— 用一个 `configurePathMatch` + `addPathPrefix("/api", ...)` 给**所有 `@RestController`** 统一加 `/api` 前缀，并排除 Warm-Flow 的包（`ApiPrefixConfig.java:19-21`）。Controller 里写 `@RequestMapping("/sys/user")` 即可，不用每个类都重复写 `/api`。
- **Mapper 用 `@Mapper` 逐个标注**（34 处），没用 `@MapperScan` 一把扫。好处是显式、可控；代价是新增 Mapper 容易漏。
- **`jiejie-starter` 只放一个启动类**，业务代码零侵入，测试和替换启动方式都方便。

---

## 三、请求处理全链路（这是最该讲清楚的部分）

一个 `/api/sys/user/page` 请求进来，会依次穿过这些关卡：

```
HTTP 请求
  │
  ├─ ① 静态资源命中？ ──► WebMvcConfig 的 /assets/** handler
  │                       └─ EncodedResourceResolver 优先下发 .gz
  │                       └─ 未命中则 SPA 回退到 index.html
  │
  ├─ ② ApiPrefixConfig 已把 /api 前置到所有 @RestController
  │
  ├─ ③ DemoModeInterceptor (order=0, 最先执行)
  │     └─ demo-mode=true 时拦掉所有非 GET/OPTIONS，白名单除外
  │        (DemoModeInterceptor.java:53-66)
  │
  ├─ ④ SaInterceptor
  │     └─ SaRouter.match("/api/**").notMatch(19条白名单)
  │        .check(r -> StpUtil.checkLogin())     (SaTokenConfig.java:22-45)
  │
  ├─ ⑤ @SaCheckPermission("sys:user:list")   ← 注解鉴权（AOP）
  │     └─ StpInterfaceImpl 从 SaSession 取权限（会话级缓存，不查库）
  │
  ├─ ⑥ @RepeatSubmit → RepeatSubmitAspect   ← Redis setIfAbsent 幂等防重
  │
  ├─ ⑦ @Log → LogAspect                     ← 记录操作日志
  │
  ├─ ⑧ Controller → Service → Mapper
  │     └─ MybatisPlusInterceptor:
  │          DataPermissionInterceptor (行级数据权限, 反射改写 BoundSql.sql)
  │          → PaginationInnerInterceptor (分页)
  │
  └─ ⑨ Result<T> ← GlobalExceptionHandler 统一兜底
```

### 3.1 鉴权核心三件套

**① `SaTokenConfig`（唯一注册点）**
```java
SaRouter.match("/api/**")
    .notMatch("/api/auth/login", "/api/auth/register", "/api/crypto/**", ...)
    .check(r -> StpUtil.checkLogin());
```

**② `StpInterfaceImpl` —— 权限/角色缓存在 SaSession**

这是设计亮点：权限列表不是每次请求查库，而是懒加载进 `SaSession`（key: `user_permissions` / `user_roles`）。角色菜单变更时，由 `SysUserServiceImpl` / `SysRoleServiceImpl` 显式调用 `clearPermissionCache()` 精准失效。

**③ RBAC 数据来源**

```sql
SELECT DISTINCT m.permission
FROM sys_menu m
  JOIN sys_role_menu rm ON m.id = rm.menu_id
  JOIN sys_user_role ur ON rm.role_id = ur.role_id
WHERE ur.user_id = ?
```
admin 角色走 `selectAllPermissions()` 全量放行。权限标识格式为 `sys:user:add`、`monitor:job:edit` 这类三段式。

**注意**：全项目**没有一处 `@SaCheckRole`**，角色只作为权限聚合器存在。这个选择是自洽的（权限最终还是落到 menu.permission 字符串），但也意味着 `sys_menu` 表数据一旦被污染，等价于提权。

### 3.2 数据权限（行级隔离）

`@DataScope(deptAlias="dept_id", userAlias="create_by")` 注解 + MyBatis-Plus `InnerInterceptor` 实现：

```
原 SQL:  SELECT * FROM sys_user WHERE status = 1
         ↓ 非 admin 时包裹
新 SQL:  SELECT * FROM (SELECT * FROM sys_user WHERE status = 1) temp_data_scope
         WHERE dept_id IN (...)
```

支持 `sys_role.data_scope` 的 5 档：全部 / 自定义部门 / 本部门 / 本部门及以下 / 仅本人。

实现上通过反射改写 `BoundSql.sql` 私有字段（`DataPermissionInterceptor.java:66-68`）。**能跑，但脆弱** —— 依赖 MyBatis 私有字段名，升级即可能崩。

插件注册顺序是对的：数据权限在前、分页在后，保证 `LIMIT` 落在最外层。

### 3.3 统一响应与异常

`Result<T>`（code/message/data，成功 200）+ `GlobalExceptionHandler` 分支：

| 异常 | 响应 |
| :--- | :--- |
| `BusinessException` | 原业务码 |
| `NotLoginException` | 401 |
| `NotPermissionException` / `NotRoleException` | 403 |
| 参数校验异常 | 400 |
| `RuntimeException` | fail(原 message) |
| `Exception` | "系统繁忙" |

---

## 四、登录体系：策略工厂 + 双维度分发

`jiejie-core/jiejie-auth` 的设计比较讲究：

```
LoginStrategyFactory
  └─ 构造注入 List<LoginStrategy>（Spring 自动收集所有实现）
     └─ @PostConstruct 装入 EnumMap<LoginType, LoginStrategy>
        └─ getStrategy(LoginType, ClientType) 二次校验 supportedClients()
```

四个策略实现：

| 策略 | 支持的端 |
| :--- | :--- |
| `PasswordLoginStrategy` | ADMIN / WEB |
| `SmsCodeLoginStrategy` | APP / WEB |
| `SocialLoginStrategy` | APP / WEB |
| `MiniProgramLoginStrategy` | APP |

**双维度**（登录方式 × 客户端类型）是关键设计 —— `AdminAuthController` 强制 `ClientType.ADMIN`，`AppAuthController` 强制 `APP`，从入口就杜绝了「用小程序登录方式拿到后台管理会话」。

公共落库逻辑收敛在 `LoginHelper.doLogin()`：单点登录踢人、写 SaSession、记录登录日志。

**新增一种登录方式 = 实现接口 + 声明 `supportedClients()`，分发逻辑零改动。**

---

## 五、前端工程化（jiejie-ui）

Vue 3.4 + Vite 5 + TS 5.3 + Naive UI 2.37 + Pinia 2 + vue-router 4。
**src 共 24,824 行 / 68 个文件。**

### 5.1 构建：产物直出后端

```ts
// vite.config.ts:14
build: {
  outDir: resolve(__dirname, '../jiejie-starter/src/main/resources/static'),
  emptyOutDir: true,
  rollupOptions: { output: { manualChunks: {
    'vue-vendor': [...], 'echarts': [...], 'xterm': [...]
  }}}
}
```

`package.json` 只有 `dev / build / preview` 三个脚本 —— **没有 lint、没有 test、没有 type-check，`vue-tsc` 装了但构建不跑**。这是明显的工程化缺口。

### 5.2 首屏性能：渐进式注册 Naive UI（实测有效）

`main.ts` 首屏只 `create({ components: [19 个] })` 注册关键组件，然后用 `requestIdleCallback(timeout: 2000)` 在空闲时 `import('naive-ui')` 注册全量。

**产物验证有效**：
- entry `index-DAlWcQ_f.js` = **512 KB**，仅含这 19 个组件（无 `n-cascader`/`n-transfer`/`n-color-picker`）
- 异步块 `index-D9wRHvha.js` = **810 KB**（全量，空闲才拉）

这不是注释式优化，是真实生效的。

### 5.3 路由：静态全量 + 动态补充

- 静态声明约 30 条（`/login`、`/register`、`Layout` 下的业务页、404 兜底放在 Layout 内以保留侧边栏）
- 动态：`import.meta.glob('/src/views/**/*.vue')` 建索引，后端菜单树里 `type===2` 的项通过 `router.addRoute('Layout', ...)` 补挂
- 双去重：`addedRouteNames` Set + `isLayoutRouteExists()` 探测
- `resetRouter()` 在 logout 时逐个 `removeRoute`

守卫逻辑（`router/index.ts:369-399`）：
```
requiresAuth===false → 放行
无 token → /login?redirect=
无 user  → getInfo() + addDynamicRoutes() + next({...to, replace:true})
```

⚠️ **守卫不校验 `meta.permission`** —— 路由 meta 里写了 permission 字段却从不读取。静态路由已包含全部业务页，所以**任何登录用户手输 `/system/user` 就能进入页面**（数据会不会返回是另一回事，后端 `@SaCheckPermission` 会拦）。前端缺一道纵深防御。

### 5.4 请求层：加密 + 三级缓存

`utils/request.ts`：
- 单实例 axios，`baseURL: '/api'`，timeout 30s
- 请求拦截：`config.headers['Authorization'] = userStore.token`（**无 `Bearer` 前缀**）
- 响应拦截：`code !== 200` 统一提示；401 用 `isLoggingOut` 标志去重后 logout

**响应自动解密**值得一提：拦截器探测 `iv.ciphertext` 格式（IV 12 字节 → Base64 长 16），命中就透明走 AES-GCM 解密，对业务调用方零侵入，解密失败自动清缓存降级。

加密配置三级缓存：内存单例 → `sessionStorage`（4h）→ 并发 Promise 去重，实现 0ms 直出且防并发打爆。

⚠️ **但只有响应解密，没有请求加密消费方**：`utils/crypto.ts` 用 jsencrypt 加密 password 字段，`/api/crypto/config` 也下发了 RSA 公钥，但请求体从未做整体 RSA/AES 加密。所谓"接口加密传输"实际只覆盖了密码字段。

### 5.5 状态管理

| store | 职责 | 持久化 |
| :--- | :--- | :--- |
| `user` | token/user/roles/permissions/menus | ✅ 仅持久化 `token` |
| `tabs` | 页签 CRUD、固定 /dashboard、关闭左/右/其他 | ❌ 刷新即丢 |
| `theme` | 明暗、菜单位置、页签开关、18 组主题色 | 手写 localStorage |
| `site` | 站点名/Logo/版权/水印/防调试 | ✅ `persist: true` |
| `message` | 未读计数、最近 20 条、WS 事件驱动 | ❌ |

`user` store 只持久化 token 是正确做法 —— 刷新后 `user` 为 null，守卫会自动重新 `getInfo()` 拉最新权限，避免权限变更后前端用旧缓存。

### 5.6 移动端适配

断点高度集中：`@media (max-width: 768px)`，全项目 25 次（另有 640/480/1200 各 1 次）。

策略（`styles/index.scss:629-857`）—— **靠全局样式覆盖 Naive UI 内部类，业务页面零改造**：
- `.n-form--inline` 强制 `flex-direction: column`，控件 `width: 100%`
- `.n-data-table { overflow-x: auto; -webkit-overflow-scrolling: touch }` + 表格 `min-width: 650px`（横向滑动看完整字段）
- `.n-modal { width: calc(100vw - 16px); max-height: 92vh }`，内容区独立滚动
- `.n-grid` 转单列，分页居中换行并隐藏 quick-jumper
- 布局层 `isMobile = window.innerWidth <= 768`，侧边栏切换为 `n-drawer`

⚠️ **文档说做了 "微信 100vh 动态视口高度修正（dvh）"，但代码里零 `dvh`、零 `env(safe-area-inset-*)`**，`layout/index.vue:257` 仍是 `height: 100vh`。这是文档与代码不符的一处。

---

## 六、四大工程亮点（逐条核验）

### 亮点 1：构建期 Gzip 预压缩 + 运行时零 CPU 下发 ✅ 真实成立

**痛点**：0.1 CPU 下，若让 Tomcat 做动态 Gzip，每个请求都要 JVM 现场压缩，CPU 瞬间打满、TTFB 暴增甚至 OOM。

**方案**：把压缩提前到 Docker 构建期。

```dockerfile
# Dockerfile:11-12
RUN npm run build && \
    find ../jiejie-starter/src/main/resources/static/assets -type f \
      \( -name "*.js" -o -name "*.css" \) -exec gzip -k -9 {} +
```

```java
// WebMvcConfig.java:36-40
registry.addResourceHandler("/assets/**")
        .addResourceLocations("classpath:/static/assets/")
        .setCacheControl(CacheControl.maxAge(365, DAYS).cachePublic().immutable())
        .resourceChain(true)
        .addResolver(new EncodedResourceResolver());   // ← 消费 .gz 的关键
```

**`EncodedResourceResolver` + `resourceChain(true)` 就是那批 `.gz` 的消费方。** 它按 `Accept-Encoding` 做内容协商，直接以二进制流下发 `.gz` 并打上 `Content-Encoding: gzip`，JVM 零压缩开销。

**实测数据**：

| 项 | 原始 | Gzip | 压缩率 |
| :--- | ---: | ---: | ---: |
| JS（92 个） | 3,932 KB | 1,171 KB | −70.2% |
| CSS（29 个） | 105 KB | 24 KB | −77.1% |
| **合计** | **4,037 KB** | **1,195 KB** | **−70.4%** |
| 首屏关键路径（entry 512KB + vendor 104KB） | 616 KB | **189 KB** | −69.3% |

gzip 文件魔数验证为 `0x1F8B`，格式有效，共 121 个 `.gz` 产物。

**不会重复压缩**：`application-prod.yml:3` 虽然开了 `server.compression.enabled: true`，但 Spring 的 `CompressionHttpServletResponse` 会先检查 `Content-Encoding` 是否已存在，已存在则跳过。所以预压缩资源走直发，只有未被预压缩的响应（如 JSON 接口）才走动态压缩 —— 两者互补，不冲突。

⚠️ **一处覆盖缺口**：`EncodedResourceResolver` 只挂在 `/assets/**` handler 上。而 `/index.html`、`/sw.js`、`/vite.svg` 走的是通用 `/**` handler（`WebMvcConfig.java:49-52`），那里的 resolver 是自定义的 `PathResourceResolver`。所以 **index.html 没有 `.gz` 预压缩**（且 Dockerfile 的 find 也排除了它）。index.html 只有 1.5 KB，影响很小，但严格说覆盖不全。

⚠️ **另一处**：`WebMvcConfig.java:51` 给整个 `/**` handler 设了 `noCache()`，而 SPA 回退也在这个 handler 里。这意味着**所有非 `/assets` 静态文件都不缓存**。assets 走独立 handler 有 365 天 immutable，所以影响可控，但 `sw.js`、`vite.svg` 每次访问都重新下载。

### 亮点 2：Service Worker 双层缓存 ✅ 存在，与预压缩形成互补

`public/sw.js`（`main.ts:111-115` 在 load 后注册）：

| 资源类型 | 策略 |
| :--- | :--- |
| `/assets/**`、`.js/.css/.svg/.png` | **Cache-First** + 后台静默更新（stale-while-revalidate 变体） |
| `/api/crypto/config`、`/api/system/config/public` | Stale-While-Revalidate |
| 其它 GET | 不拦截，走网络 |

Cache-First 对带内容哈希的 assets 是完全正确的选择 —— 文件名变了就是新资源，永远不会脏。

⚠️ **SWR 规则路径写错了**：`sw.js:73` 写的是 `/api/system/config/public`，但后端实际端点是 `/api/sys/config-group/public`（`SysConfigGroupController.java:89` + `org.ts:194`）。所以那条 SWR 缓存**从未命中**。功能不受影响（请求照常走网络），但等于白写了一条规则。

⚠️ **`CACHE_NAME = 'jiejie-cache-v1'` 是硬编码的**，没有构建期注入版本号。发布新版本时 SW 的 `activate` 不会清旧缓存（因为名字没变），只能靠 assets 文件名哈希自然失效 —— 而 index.html 本身走 noCache，所以整体还能正常更新。属于「能工作但不够严谨」。

### 亮点 3：JVM 调优适配 512MB ✅ 参数合理

```dockerfile
ENV JAVA_OPTS="-Xms128m -Xmx300m -XX:+UseSerialGC \
               -XX:MaxMetaspaceSize=128m -Xss512k \
               -Djava.security.egd=file:/dev/./urandom"
```

逐条拆解为什么这么配：

| 参数 | 作用 |
| :--- | :--- |
| `-Xms128m -Xmx300m` | 堆锁定 128~300MB，给 OS + Metaspace 留 212MB。堆固定小值还避免了伸缩带来的 GC 抖动 |
| `-XX:+UseSerialGC` | **0.1 核场景的关键选择**。G1/ZGC 的并发 GC 线程需要额外 CPU 和内存来做并发标记，单核下反而拖慢应用线程；SerialGC 单线程、内存占用最小 |
| `-XX:MaxMetaspaceSize=128m` | 防止类加载器泄漏导致元空间无限膨胀 |
| `-Xss512k` | 线程栈减半，同内存下可支撑更多线程 |
| `-Djava.security.egd=file:/dev/./urandom` | 避免容器启动时 `/dev/random` 熵不足阻塞（老问题，容器里很常见） |

配套的连接池精简也是对的（`application-prod.yml:24-27`）：`initial-size: 2, min-idle: 2, max-active: 10`。默认 Druid 配置在 512MB 容器里会浪费大量内存。

**`--server.port=${PORT}`** 让 Render 注入动态端口，这是 PaaS 部署的正确写法。

### 亮点 4：7×24 保活体系 ⚠️ 有效，但文档与实现有偏差

**机制**：
- `.github/workflows/keepalive.yml`：cron `*/12 * * * *`，curl 根路径
- Cron-Job.org：每 10 分钟一次外部探测（需手动在站外配置）

**效果**：两个心跳都在 15 分钟休眠窗口内，容器保持热机。

⚠️ **文档偏差**：`PROJECT_ARCHIVE.md:177` 声称"部署轻量级健康探测端点 `/api/system/health`，仅返回毫秒级状态，不查询重型业务表"。

**但全项目 grep `health` / `actuator` 零命中**（唯一提及是 `ApiAccessCollectInterceptor.java:78` 的路径排除）。GitHub Actions 实际 ping 的是根路径 `/`，返回的是完整的 1.5 KB index.html。

这不算功能缺陷（ping 根路径同样能防休眠），但**"专用健康端点"这个说法在代码里不存在**。而且按项目自己的逻辑，返回 1.5KB HTML 比返回几十字节状态要"重"—— 与文档宣称的轻量化目标相反。

⚠️ **架构脆弱点**：GitHub Actions 的 `schedule` 在仓库 60 天无活动后会被自动禁用；且 `schedule` 排队本身可能有 5~15 分钟延迟。所以真正可靠的是 Cron-Job.org 那一路，属于"双保险中只有一重是真保险"。

---

## 七、需要注意的风险清单

按严重度排序。**这些不影响"项目能不能跑"，但面试被追问时是加分项 —— 能自己指出问题比被问出来强得多。**

### 🔴 高：WebSocket 终端存在越权

`SysServerController` 的每个 REST 接口都有 `@SaCheckPermission("monitor:server:*")`。

但 `SshWebSocketHandler.handleConnect()` **只按 `serverId` 从库里取服务器记录，然后直接拿库里的明文密码去 SSH 认证** —— 全程没有任何权限校验。

`WebSocketConfig.java:37-39` 还配了 `.setAllowedOrigins("*")`。

而 `WebSocketHandshakeInterceptor` 只做了 `StpUtil.getLoginIdByToken(token)`（验证 token 有效），检查的是**登录状态**而非**权限**。

**结论**：任何能登录的用户（哪怕是最低权限角色）都能通过 `/ws/ssh?token=xxx` 连上 `sys_server` 表里的任意服务器，拿到 shell。且 `SysServer.password`（`SysServer.java:46`）是明文存储。

**修复方向**：`handleConnect` 里补 `StpUtil.checkPermission("monitor:server:ssh")`，密码改为 AES 加密存储，`setAllowedOrigins` 收敛到实际域名。

### 🔴 高：验证码后门

```java
// PasswordLoginStrategy.java:88-90
if ("demo".equalsIgnoreCase(request.getCode()) || "1234".equalsIgnoreCase(request.getCode())) {
    return;   // 直接跳过验证码
}
// :96
if (!"slider_verified".equals(request.getCode())) { ... }   // 滑块只校验字符串
```

滑块验证码的"校验"就是比对前端传来的固定字符串 `"slider_verified"` —— 任何 HTTP 客户端都能伪造。`demo` / `1234` 更是硬编码后门。

**修复方向**：滑块必须在后端用 Redis 存 challenge 并校验轨迹；后门用配置项控制且生产环境强制关闭。

### 🔴 高：文件下载/预览越权

`SaTokenConfig.java:39-40` 把 `/api/sys/file/preview/**`、`/api/sys/file/download/**` 放进了登录白名单（完全不校验身份），而 `SysFileController` 的这两个接口（`:93`、`:114`）**恰好也没有 `@SaCheckPermission`**（对比同文件的 `/text/{id}` 是有权限注解的）。

接口只按 `@PathVariable Long id` 取库取字节，无归属校验 → **遍历 id 即可拖取任意文件**。

更麻烦的是 `:124` 用 `sysFile.getFileType()` 作为响应 `Content-Type` 回显。如果上传目录里存在 HTML 文件，同源下可构成存储型 XSS，能窃取 localStorage 里的 token。

**修复方向**：移出白名单，补 `@SaCheckPermission`；`Content-Type` 用白名单映射，别信库里的值；敏感文件走签名 URL。

### 🟠 中：数据权限可被绕过

`DataPermissionInterceptor.java:126` —— 只要用户拥有的**任意一个**角色 `dataScope == 1`（全部数据），就直接 `return ""`，把过滤条件整体清空。多角色用户可能因此突破部门隔离。

同文件 `:141-143` 的 `catch (Exception e) { return ""; }` 更危险：**异常时静默返回不过滤**，即"出错就放行全量"。安全逻辑的默认分支应该是拒绝，不是放行。

拼接 `deptAlias + " IN (SELECT ... role_id = " + roleId + ")"` 是字符串拼接 SQL。当前 `roleId` 来自 SaSession 的 Long，实际可利用性低，但模式危险。

**修复方向**：按角色逐个求并集而非短路；catch 分支返回 `1=0`（拒绝）；参数化或至少对别名做白名单校验。

### 🟠 中：操作日志明文记录密码

`LogAspect.setRequestValue()` 把方法入参整体序列化后存入 `sys_oper_log.oper_param`（varchar 2000）。而用户新增/改密接口带 `@Log` → **密码明文进审计表**。

**修复方向**：`@Log` 加 `excludeParamNames` 属性，序列化时剔除 password 类字段。

### 🟠 中：XSS/SQL 注入防护开关未落地

`SystemConfigHelper.java:459-468` 定义了 `isXssFilterEnabled()` / `isSqlInjectEnabled()`，**但全项目零处调用** —— 没有对应的 `Filter` 或 `HttpServletRequestWrapper`。

即：系统配置页面里有两个"安全开关"，打开关闭都没有任何效果。这是典型的"设计意图未实现"。

### 🟠 中：CORS 与 `@Async` 线程池

- `SaTokenConfig.java:54-57`：`allowedOriginPatterns("*")` + `allowCredentials(true)` 并存。
  **缓解因素**：token 走 `Authorization` 头而非 Cookie（`request.ts:158`），浏览器不会自动携带，所以不构成 CSRF。但如果将来改用 Cookie 会话，这个配置会立刻变成严重漏洞。
- `AsyncConfig` 只有 `@EnableAsync`，未自定义线程池 → 走 Spring 默认 `applicationTaskExecutor`。高并发写操作日志时队列/线程可能耗尽。

### 🟡 低：其它

| 问题 | 位置 |
| :--- | :--- |
| 短信验证码用 `Math.random()` 而非 `SecureRandom` | `AdminAuthController.java:114` |
| 短信登录首次自动建号写死 `123456` 密码 | `SmsCodeLoginStrategy.java:80-87` |
| 演示模式返回 HTTP 200 + body code 403，网关层误判 | `DemoModeInterceptor.java:73-76` |
| 白名单用 `startsWith` 前缀匹配，`/api/auth/loginXxx` 也会放行 | `DemoModeInterceptor.java:58-61` |
| WebSocket `/ws/message` 用 `static Map<Long, WebSocketSession>` 存在线连接，多实例部署会失效 | `MessageWebSocketHandler.java:28` |
| 前端 10+ 页面重复声明 `const hasPermission = (p) => userStore.hasPermission(p)`，应收敛为 `v-permission` 指令 | 各业务页面 |
| 面包屑硬编码只处理 `/dashboard` 与 `/system` 两个分支 | `layout/index.vue:228-243` |
| 路由守卫不校验 `meta.permission`，手输 URL 可进入无权页面 | `router/index.ts:369-399` |
| 无 ESLint / Prettier / Vitest，`vue-tsc` 无 CI 门禁 | `package.json` |
| 巨型 SFC：`login/index.vue` 2282 行（三套登录模板近乎逐行复制）、`message/chat` 2046 行 | `src/views/` |
| 生产环境残留大量 `console.log`（动态路由、WebSocket 全流程） | `router/index.ts`、`utils/websocket.ts` |
| `PROJECT_ARCHIVE.md` 多处数据与代码不符（见下） | 文档 |

### 文档与代码不符处汇总

| 文档声称 | 代码实际 |
| :--- | :--- |
| `/api/system/health` 轻量健康端点（`PROJECT_ARCHIVE.md:177`） | 不存在，心跳 ping 的是根路径 |
| 微信 `dvh` 动态视口修正（`:171`） | 零 `dvh`，仍是 `height: 100vh` |
| 构建脚本生成 `.gz`（`:147`） | 是 Dockerfile 构建期 `gzip -9`，前端项目内无压缩脚本 |
| 表数量 44 张（`:191`） | 实际 52 张 |
| Warm-Flow 版本 1.2.6（`:70`） | `pom.xml:31` 是 1.8.5 |

**建议**：这些偏差在面试中被追问到会减分。要么改文档对齐代码，要么把缺的功能补上（`dvh` 修正和健康端点都是几行代码的事）。

---

## 八、如果要向面试官讲这个项目

**30 秒版本**：

> 一个 Spring Boot 3 + Vue 3 的企业级中后台脚手架，22 个 Maven 模块分层，52 张表，RBAC 细粒度权限 + Warm-Flow 工作流 + 代码生成器 + 即时通讯 + Web SSH 终端。最花心思的地方是**部署形态** —— 我把整套系统压进 Render 免费层的 0.1 核 / 512MB 容器里 7×24 跑着，为此做了 JVM 参数收敛（SerialGC + Xmx300m）、构建期 Gzip 预压缩（体积 −70%，运行时零 CPU）、Service Worker 缓存和双心跳保活。

**最能体现深度的三个点**（按推荐顺序）：

1. **Gzip 预压缩的完整闭环** —— 讲清楚"0.1 CPU 下动态压缩会打满 CPU"这个约束是怎么推导出来的，然后用构建期 `gzip -9` + `EncodedResourceResolver` 解决，并且能说清为什么它和 `server.compression` 不冲突（`Content-Encoding` 已存在则跳过）。**有实测数据、有产物验证、有原理分析。**

2. **JVM 参数的取舍依据** —— 尤其是 `-XX:+UseSerialGC`。"为什么不用 G1"这个问题很能区分背答案和理解原理：单核下 G1 的并发标记线程会和应用线程抢 CPU，反而更慢；SerialGC 内存占用最小、单线程无额外开销。

3. **登录策略工厂的双维度分发** —— `List<LoginStrategy>` 注入 + `EnumMap` + `supportedClients()`，讲清"为什么需要客户端维度"（防止小程序登录方式拿到后台会话）。

**主动暴露问题的加分点**（比被问出来强）：

> "这个项目是求职作品，我在做的时候更关注把云原生部署链路走通，**安全这块有几处我知道的欠债**：WebSocket 终端只校验了登录态没校验权限、文件下载接口在白名单里且没有归属校验、数据权限拦截器异常时默认放行全量。如果继续迭代，优先级最高的是把这几处收紧，因为它们是能拿到实际权限的路径，不是理论风险。"

主动、具体、分优先级地讲出已知问题，传递的信号是"我能做安全评审"，而不是"我代码有 bug"。

---

## 九、快速上手命令

```bash
# 后端
mvn clean install -DskipTests
cd jiejie-starter && mvn spring-boot:run     # http://localhost:8080

# 前端（独立开发，代理 /api → 8080）
cd jiejie-ui && npm install && npm run dev    # http://localhost:3000

# 生产构建（产物自动输出到后端 static/，本地不会生成 .gz）
cd jiejie-ui && npm run build

# 完整镜像构建（含 gzip 预压缩，等价于线上）
docker build -t jiejie-admin .
```

默认账号：`admin / admin123`（README）或 `admin / 123456`（`PROJECT_ARCHIVE.md`）—— **两处文档不一致，以 `sql/jiejie-system.sql` 里的实际密码哈希为准**。

---

*本文档由源码实读整理，覆盖 `pom.xml`、`Dockerfile`、`application-prod.yml`、`WebMvcConfig`、`SaTokenConfig`、`DemoModeInterceptor`、`SshWebSocketHandler`、`router/index.ts`、`request.ts`、`sw.js` 等核心文件，以及 `static/assets` 下 121 个 `.gz` 构建产物的实测数据。*
