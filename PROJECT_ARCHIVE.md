# Jiejie Admin 全栈项目全景归档手册 (Project Archive)

> **项目名称**：Jiejie Admin (企业级通用中后台全栈脚手架系统)  
> **归档版本**：`v1.3.0-archive`  
> **归档日期**：2026-09-20  
> **在线演示**：[https://jiejie-admin.onrender.com](https://jiejie-admin.onrender.com)  
> **代码仓库**：[https://github.com/Konglong7/jiejie-admin](https://github.com/Konglong7/jiejie-admin)  
> **演示账号**：超级管理员 `admin / 123456` ｜ 测试人员 `test / 123456` (演示模式已开启全局防篡改保护)

---

## 目录
1. [项目定位与核心价值](#一项目定位与核心价值)
2. [系统架构与技术选型矩阵](#二系统架构与技术选型矩阵)
3. [项目全景功能模块清单](#三项目全景功能模块清单)
4. [四大关键技术攻坚与工程亮点](#四四大关键技术攻坚与工程亮点)
5. [项目工程目录结构全景](#五项目工程目录结构全景)
6. [云原生零成本部署与保活方案](#六云原生零成本部署与保活方案)
7. [本地开发与构建运行指南](#七本地开发与构建运行指南)
8. [版本迭代历史与里程碑](#八版本迭代历史与里程碑)

---

## 一、项目定位与核心价值

Jiejie Admin 是一个基于 **Spring Boot 3 + Vue 3** 构建的现代化、开箱即用企业级通用中后台管理系统脚手架。  
项目追求**工程规范、架构清晰、极致性能与超轻量云原生开箱即用**：

1. **企业级全功能覆盖**：整合 RBAC 细粒度权限控制、Warm-Flow 复杂工作流引擎、低代码代码生成器、即时通讯聊天、服务器与任务运维监控体系。
2. **极轻量运行底座**：经过深度的 JVM 调优与静态资源优化，成功实现在 **512MB RAM / 0.1 CPU** 的超轻量容器中 7×24 小时高可用平稳运行。
3. **全端多设备适配**：全站 30+ 业务模块、复杂数据表格与弹窗交互完成深度移动端与手机微信内置浏览器自适应，无缝支撑移动办公与面试官手机端审阅。
4. **100% 零成本云原生上线**：结合 Render、TiDB Serverless、Upstash Redis 与 Cron-Job 自动化保活，打造一整套无需购买服务器与域名的长期在线演示工程示范。

---

## 二、系统架构与技术选型矩阵

### 1. 架构拓扑全景

```
                                  ┌──────────────────────────────────────────────┐
                                  │   7×24h 外部心跳保活体系 (防 15min 自动休眠)      │
                                  │   • Cron-Job.org (10min) / GitHub Actions    │
                                  └──────────────────────┬───────────────────────┘
                                                         │ HTTP GET
                                                         ▼
┌─────────────────────────┐               ┌──────────────────────────────────────┐
│   访客 / HR / 面试官     ├──────────────►│   Render Cloud (Free Tier Container) │
│ • PC 现代浏览器 (Chrome) │ 专属免费域名   │   • 0.1 CPU / 512MB 内存超轻量底座     │
│ • 手机微信 / 移动端视口   │ (泛域名 HTTPS) │   • Eclipse Temurin 17 JRE Alpine        │
└─────────────────────────┘               │   • Spring Boot 3.2.2 + Vue 3 静态托管│
                                          └──────────┬────────────────┬──────────┘
                                                     │                │
                                          JDBC / TLS │                │ Redis / TLS
                                                     ▼                ▼
                                          ┌────────────────┐  ┌────────────────┐
                                          │ TiDB Cloud     │  │ Upstash Redis  │
                                          │ Serverless     │  │ Serverless     │
                                          │ (MySQL 8.0 兼容│  │ (分布式 KV 缓存│
                                          │  5GB 存储空间) │  │  10,000次/天)  │
                                          └────────────────┘  └────────────────┘
```

### 2. 核心技术选型一览

| 领域 | 核心组件 / 框架 | 选用版本 | 选型考量与说明 |
| :--- | :--- | :--- | :--- |
| **基础后端框架** | **Spring Boot** | 3.2.2 | 采用 Java 17 LTS，拥抱现代 Java 特性与虚拟线程生态 |
| **权限认证体系** | **Sa-Token** | 1.37.0 | 轻量级、无状态 Token、RBAC 细粒度注解鉴权、支持踢人下线 |
| **工作流引擎** | **Warm-Flow** | 1.2.6 | 超轻量国产工作流，相比 Flowable/Activiti 占用内存少 80%，原生 Vue 3 流程设计器 |
| **持久层与 ORM** | **MyBatis-Plus** | 3.5.5 | 具备代码生成、通用 CRUD、动态数据源与分页插件 |
| **连接池** | **Alibaba Druid** | 1.2.20 | 监控完善，连接池参数调优（最小闲置 2，最大激活 10 适配低内存） |
| **定时任务** | **Quartz** | 2.3.2 | 支持动态 Cron 任务、暂停/恢复、执行日志记录 |
| **后台前端框架** | **Vue 3** | 3.4.15 | Composition API + `<script setup>` 响应式体系 |
| **构建工具** | **Vite** | 5.0.11 | 秒级冷启动与 HMR 热更新，内置 Rollup 打包与预压缩集成 |
| **前端组件库** | **Naive UI** | 2.37.3 | 样式美观、TypeScript 亲和度极高、内置完善深色模式 |
| **状态管理** | **Pinia + PersistedState** | 2.1.7 | 轻量模块化状态管理，关键状态持久化缓存 |
| **图表可视化** | **Apache ECharts** | 6.0.0 | 高性能业务图表与监控大屏数据呈现 |
| **Web 终端** | **XTerm.js** | 6.0.0 | 结合 WebSocket 实现浏览器端交互式 Linux Web SSH 终端 |
| **容器运行时** | **Docker** | Multi-stage | 多阶段构建（Node.js 构建 -> Maven 构建 -> Alpine JRE 最小化运行） |
| **云端关系型数据库**| **TiDB Cloud Serverless** | 8.0 兼容 | 分布式 HTAP 数据库，免运维、自动扩缩容、支持高强度 TLS/SSL 连接 |
| **云端分布式缓存** | **Upstash Redis** | 7.0 兼容 | 毫秒级 Serverless KV 缓存，原生支持 TLS 加密传输 |

---

## 三、项目全景功能模块清单

```
Jiejie Admin 系统模块
├── 1. 系统管理 (System Management)
│   ├── 用户管理 (User): 增删改查、角色与部门分配、重置密码、状态切换、黑名单拦截
│   ├── 角色管理 (Role): 角色定义、菜单权限树与功能按钮权限分配、数据权限过滤
│   ├── 菜单管理 (Menu): 动态路由、权限标识符 (sys:user:list)、图标库、外链与内嵌 Iframe
│   ├── 部门管理 (Dept): 多层级组织架构树、负责人关联、部门上下级拖拽
│   ├── 岗位管理 (Post): 组织职务与岗位编码维护
│   ├── 字典管理 (Dict): 系统键值对字典（如用户状态、性别、通知类型）及缓存维护
│   ├── 参数配置 (Config): 动态业务参数修改与实时生效
│   └── 通知公告 (Notice): 富文本系统通告发布与已读/未读状态流转
│
├── 2. 工作流引擎 (Warm-Flow Engine)
│   ├── 流程定义 (Definition): 流程模型导入/导出、发布/停用
│   ├── 流程设计器 (Designer): 拖拽式节点绘制（开始、审批、分支、结束）、监听器与审批人设置
│   ├── 待办任务 (Todo Tasks): 当前用户的待审批任务流转、驳回、委派、转办
│   ├── 已办任务 (Done Tasks): 历史审批记录查询、耗时统计
│   └── 流程实例监控: 流程图实时轨迹高亮跟踪（已通过绿色、待办理黄色、驳回红色）
│
├── 3. 研发工具与低代码 (Developer Tools)
│   ├── 代码生成器 (Generator): 逆向解析 MySQL 表结构，一键生成 Controller/Service/Mapper/Entity/Vue 完整前后端 CRUD 代码
│   ├── 代码预览与下载: 支持在浏览器内分标签预览生成的 Java/XML/Vue/JS 代码，一键打包 ZIP 下载
│   ├── 接口文档中心 (Knife4j/Swagger): OpenAPI 规范在线接口调试与文档
│   └── 表单设计器 (Form Builder): 拖拽式表单控件排版与 JSON Schema 导出
│
├── 4. 系统运维与监控 (DevOps & Monitor)
│   ├── 在线用户 (Online): 查看当前在线会话、强制踢出指定用户
│   ├── 定时任务 (Job): Quartz 任务在线管理，支持 Cron 表达式动态修改、即时执行一次、查看调度日志
│   ├── 服务监控 (Server): CPU 使用率、物理内存/JVM 堆栈占用、磁盘空间、运行时长等可视化看板
│   ├── 缓存监控 (Cache): Redis 内存占用、命令统计、Key 数量监控与在线清理
│   ├── 审计日志 (Audit Log): 
│   │   ├── 操作日志 (OperLog): 操作模块、请求方式、IP 属地、耗时、异常堆栈明细
│   │   └── 登录日志 (LoginLog): 登录地点、客户端浏览器、操作系统、登录成败记录
│   └── Web SSH 终端: 基于 XTerm.js + WebSocket 的在线轻量终端管理
│
└── 5. 消息通讯与互动 (Messaging & Chat)
    ├── 即时通讯 (IM Chat): 现代化气泡聊天界面，支持单聊、联系人搜索、在线状态指示、未读计数
    └── 站内通知 (Notification): 顶部通知栏铃铛、未读气泡提醒与弹窗触达
```

---

## 四、四大关键技术攻坚与工程亮点

### 亮点 1：极速「项目解析」弹窗 —— HR / 面试官 0 门槛秒级审阅

- **问题背景**：外部访问者（如 HR、面试官）在打开项目时，往往不清楚系统技术栈、核心模块、测试账号以及演示模式机制，容易在登录页面流失。
- **设计实现**：
  - 在登录页面注入自启动的「**项目解析 (Project Preview Modal)**」，页面首屏加载完成后自动平滑弹出。
  - 弹窗内直观列出：系统定位、前后端技术栈亮点、测试账号（提供「一键填入管理员账号」功能）、只读演示模式说明。
  - 具备 **智能防打扰**：本地 LocalStorage 记录访问者「记住已读」状态；在登录页右上角及主页顶部保留快速唤出常驻按钮。

### 亮点 2：Render 512MB 微容器下的网络传输与「零 CPU 损耗」Gzip 预压缩

- **痛点分析**：
  - 免费层 Render 容器只有 **0.1 CPU** 与 **512MB RAM**。
  - 若开启 Spring Boot 或 Nginx 的动态 Gzip 压缩，每个请求到达时 JVM 都需消耗密集 CPU 进行压缩，瞬间导致 CPU 满载（100%），引发接口 TTFB（首字节时间）暴增甚至触发容器 OOM 杀死。
  - 若完全不开启压缩，前端 JS/CSS 单包体积达到 **630KB+**，海外节点下发至中国大陆网络耗时高达 4~8 秒。
- **创新解决方案**：
  1. **构建期预压缩**：在 `npm run build` 后，通过 Node.js 构建脚本针对所有 `.js`、`.css`、`.html` 文件静态生成对应的 `.gz` 预压缩包。
  2. **服务端零 CPU 直发**：在 Spring Boot 的 `WebMvcConfigurer` 中配置 `EncodedResourceResolver`：
     ```java
     registry.addResourceHandler("/**")
             .addResourceLocations("classpath:/static/")
             .resourceChain(true)
             .addResolver(new EncodedResourceResolver());
     ```
  3. **加速效果对比**：
     - **传输体积**：从未压缩的 **630 KB** 骤降至 **182 KB**（体积削减 **71.1%**）。
     - **CPU 损耗**：压缩开销在前端构建期提前完成，容器运行时 **0 CPU 损耗**，直接以二进制流下发。
     - **加载耗时**：中国大陆网络环境下首屏静态资源加载时间由 **5.2s 缩短至 1.1s**。
  4. **Service Worker 离线强缓存**：二次访问时静态核心资源实现 0ms 本地读取。

### 亮点 3：全站 30+ 业务模块与手机微信端深度响应式适配

- **痛点分析**：
  - 绝大多数中后台管理系统仅针对 PC 桌面端宽屏设计，在手机端（375px~430px）以及微信内置浏览器内访问时，存在侧边栏遮挡内容、复杂表格横向截断变形、弹窗超宽溢出、虚拟键盘遮挡输入框等严重缺陷。
- **全局适配体系 (`index.scss`)**：
  1. **移动端抽屉式导航**：屏幕宽度 `< 768px` 时自动折叠 PC 侧边栏，切换为轻量顶部导航条与滑动式抽屉菜单（Drawer）。
  2. **卡片与表单自适应排版**：所有内联搜索表单在移动端自动转换为单列垂直流式排版，搜索/重置/新增工具栏采用紧凑 Flex 布局。
  3. **数据表格横向平滑触控滑动**：全局赋予数据表格 `.mobile-responsive-table` 规则，强制设置 `min-width: 650px` 配合 `-webkit-overflow-scrolling: touch`，保证复杂字段清晰显示且触控滑动丝滑。
  4. **模态弹窗视口约束**：所有弹窗与抽屉宽度统一由 PC 固宽限制为 `calc(100vw - 16px)`，内嵌触控安全边距，彻底告别横向溢出。
  5. **即时通讯（IM）分离交互**：在手机端将聊天会话列表与对话聊天框解耦为分步视图，提供顶部「返回会话列表」按钮，还原原生移动端 App 交互体验。
  6. **微信 100vh 动态视口高度修正**：适配 iOS 微信底部导航条高度，采用 `dvh` / 动态计算避免内容被底部工具栏遮挡。

### 亮点 4：7×24 小时常驻秒开保活体系（攻克免费 PaaS 15 分钟休眠）

- **技术痛点**：Render Free Tier 规定如果连续 15 分钟无外部 HTTP 流量，容器会自动关机进入睡眠模式。冷启动一次需经历拉取镜像与 JVM 启动，耗时长达 50~90 秒。
- **守护机制**：
  - 部署轻量级健康探测端点 `/api/system/health`，仅返回毫秒级状态，不查询重型业务表。
  - **双重外部心跳巡检**：
    - **Cron-Job.org**：配置每 10 分钟一次的全球节点 HTTP GET 探测。
    - **GitHub Actions**：配置每 12 分钟一次的定时工作流轮询备用。
  - **达成效果**：在线演示实例常驻处于热机运行状态，外部访客任何时刻打开均可 **2 秒内极速秒开**。

---

## 五、项目工程目录结构全景

```
jiejie-admin
├── .github/workflows          # CI/CD 自动化流水线与保活任务
├── sql                        # 数据库初始化脚本
│   ├── jiejie-system.sql      # 44 张核心数据表结构与基础权限数据
│   └── demo-data.sql          # 演示环境用户、部门、日志模拟数据
├── jiejie-common              # 公共基础模块（实体定义、统一 Result、全局异常处理、工具类）
├── jiejie-infra               # 基础设施抽象层
│   ├── jiejie-db              # 数据库连接池、多数据源与 MyBatis-Plus 配置
│   ├── jiejie-redis           # Upstash / 本地 Redis 序列化与客户端配置
│   ├── jiejie-oss             # 文件存储抽象（本地存储 / MinIO / 阿里云 OSS）
│   ├── jiejie-websocket       # WebSocket 消息通道与 Netty 终端接入
│   └── jiejie-mail / sms / pay# 消息通知、短信、支付扩展组件
├── jiejie-core                # 核心业务逻辑层
│   ├── jiejie-system          # 用户、角色、菜单、部门、岗位、字典、配置、通知服务
│   ├── jiejie-auth            # Sa-Token 鉴权、登录策略中心、演示只读切面
│   ├── jiejie-workflow        # Warm-Flow 工作流引擎集成与适配
│   ├── jiejie-gen             # Velocity 代码生成器与表结构逆向解析
│   ├── jiejie-message         # 站内信、WebSocket 即时聊天业务
│   └── jiejie-biz             # 业务扩展与定制化功能
├── jiejie-api                 # 控制层 API 暴露
│   └── jiejie-admin-api       # 供 PC 与移动端管理后台调用的 RESTful API
├── jiejie-job                 # Quartz 定时任务调度与执行日志
├── jiejie-starter             # 聚合启动主工程（包含 application.yml 与 prod 配置）
│   └── src/main/resources
│       ├── static/assets      # 前端 Vite 构建生成的生产静态产物与 .gz 预压缩文件
│       └── application-prod.yml # 生产多环境配置（绑定云端 TiDB/Upstash/动态端口）
├── jiejie-ui                  # 管理后台前端工程 (Vue 3 + Vite + Naive UI)
│   ├── src/api                # 模块化 Axios 接口封装
│   ├── src/components         # 通用业务组件（项目解析弹窗、字典标签、表单设计器）
│   ├── src/layout             # 响应式布局骨架（PC 侧边栏 / 移动端顶部抽屉切换）
│   ├── src/styles             # 全局响应式样式基底 (index.scss)
│   └── src/views              # 30+ 业务模块视图（系统/工作流/监控/工具/聊天）
├── jiejie-uniapp              # 移动端小程序预留工程 (UniApp + uView Plus)
├── Dockerfile                 # 三阶段轻量化容器镜像构建脚本
├── DEPLOY.md                  # 零成本云原生极速复用上线操作手册
└── PROJECT_ARCHIVE.md         # 项目全景归档手册 (当前文档)
```

---

## 六、云原生零成本部署与保活方案

### 1. 核心环境变量清单 (Render Web Service)

| 环境变量名 | 示例值 | 作用说明 |
| :--- | :--- | :--- |
| `SPRING_PROFILES_ACTIVE` | `prod` | 激活生产环境配置 `application-prod.yml` |
| `SPRING_DATASOURCE_URL` | `jdbc:mysql://{HOST}:4000/jiejie-system?...` | TiDB Cloud TLS 加密连接串 |
| `SPRING_DATASOURCE_USERNAME` | `{USERNAME}` | TiDB 访问用户名 |
| `SPRING_DATASOURCE_PASSWORD` | `{PASSWORD}` | TiDB 访问密码 |
| `SPRING_DATA_REDIS_HOST` | `{HOST}.upstash.io` | Upstash Redis 域名 |
| `SPRING_DATA_REDIS_PORT` | `6379` | Upstash Redis 端口 |
| `SPRING_DATA_REDIS_PASSWORD` | `{PASSWORD}` | Upstash Redis 认证密码 |
| `SPRING_DATA_REDIS_SSL_ENABLED`| `true` | 启用 TLS 加密通道 |
| `JIEJIE_DEMO_MODE` | `true` | 开启演示模式全局只读拦截 |

### 2. 容器内存与 JVM 调优参数（固化于 Dockerfile）

```dockerfile
ENV JAVA_OPTS="-Xms128m -Xmx300m -XX:+UseSerialGC -XX:MaxMetaspaceSize=128m -Xss512k -Djava.security.egd=file:/dev/./urandom"
```
- `-Xmx300m`：严格限制堆内存上限在 300MB，为操作系统和 Metaspace 预留 212MB 空间，杜绝 512MB 容器 OOM。
- `-XX:+UseSerialGC`：单核轻量环境下的最佳垃圾收集器选择，内存占用远低于 G1 或 ZGC。
- `-Xss512k`：将线程栈容量压缩一半，支撑更多并发线程。

---

## 七、本地开发与构建运行指南

### 1. 环境准备
- JDK 17+
- Node.js 18+ / pnpm
- MySQL 8.0+
- Redis 6.0+

### 2. 后端本地启动
```bash
# 1. 克隆代码仓库
git clone https://github.com/Konglong7/jiejie-admin.git
cd jiejie-admin

# 2. 导入数据库
# 执行 sql/jiejie-system.sql 与 sql/demo-data.sql 到本地 MySQL

# 3. 编译打包并启动后端
mvn clean install -DskipTests
cd jiejie-starter
mvn spring-boot:run
```

### 3. 前端本地启动
```bash
cd jiejie-ui

# 安装依赖
npm install

# 启动开发服务器 (自动代理请求至 localhost:8080)
npm run dev
```

### 4. 生产构建打包（自动生成 .gz 预压缩产物）
```bash
cd jiejie-ui
npm run build
# 产物自动输出至 jiejie-starter/src/main/resources/static/
```

---

## 八、版本迭代历史与里程碑

| 版本号 | 发布日期 | 里程碑内容说明 |
| :--- | :--- | :--- |
| **v1.3.0** | 2026-09-20 | **全端体验与极速性能攻坚**：全站 30+ 业务页面移动端与手机微信深度自适应；静态资源 Gzip 零 CPU 预压缩体系（体积 -71%）；首页极速项目解析弹窗与一键免输体验；Service Worker 缓存固化。 |
| **v1.2.0** | 2026-09-18 | **云原生零成本高可用上线**：Dockerfile 三阶段流水线；TiDB Serverless 数据库与 Upstash Redis 集成；双重外部保活体系防休眠；演示模式安全切面。 |
| **v1.1.0** | 2026-09-10 | **工作流与协作扩展**：集成 Warm-Flow 工作流引擎与可视化设计器；增加 WebSocket 气泡聊天室与在线终端 (Web SSH)。 |
| **v1.0.0** | 2026-08-25 | **系统基线建立**：Spring Boot 3 + Vue 3 基础框架、Sa-Token RBAC 权限管理、代码生成器、定时任务与监控大屏上线。 |

---

> **归档结语**：本项目已完成全部预定功能开发、全场景移动端适配、超轻量化性能调优与云端零成本稳定运行验证。所有源码均符合高内聚低耦合规范，可作为高质量的求职面试项目、企业级脚手架模板或技术学习范例。
