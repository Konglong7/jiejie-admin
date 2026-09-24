# Jiejie Admin 全栈云原生零成本部署实战手册 (极速复用指南)

> **适用场景**：将 Spring Boot 3 + Vue 3 现代化通用后台管理系统，以 **100% 零成本（永久免费）**、**高可用**、**免备案独立域名** 方式完整上线部署，供简历项目展示与面试官实时在线访问。

---

## 目录
1. [架构全景与零成本选型](#一架构全景与零成本选型)
2. [代码与容器化配置（已在代码库固化）](#二代码与容器化配置)
3. [云端数据库与缓存准备（约 2 分钟）](#三云端数据库与缓存准备)
4. [推送代码至个人 GitHub 仓库](#四推送代码至个人-github-仓库)
5. [Render Web Service 容器化部署（约 3 分钟）](#五render-web-service-容器化部署)
6. [7×24 小时常驻秒开保活体系（防休眠）](#六724-小时常驻秒开保活体系防休眠)
7. [简历呈现与面试答辩亮点](#七简历呈现与面试答辩亮点)

---

## 一、架构全景与零成本选型

```
                      ┌───────────────────────────────────────────┐
                      │    双重保活体系 (防 15min 休眠)             │
                      │  • GitHub Actions (每 12 分钟心跳)          │
                      │  • Cron-Job.org   (每 10 分钟心跳)          │
                      └─────────────────────┬─────────────────────┘
                                            │ HTTP GET
                                            ▼
┌──────────────────┐               ┌─────────────────────────────────┐
│  访客 / 面试官    ├──────────────►│   Render Cloud (Free Tier)      │
│  Browser / HTTPS │ 专属免费域名    │   • 0.1 CPU / 512 MB RAM        │
└──────────────────┘               │   • Alpine JRE 17 容器          │
                                   │   • Vue 3 静态托管 + SpringBoot   │
                                   └────────┬───────────────┬────────┘
                                            │               │
                                 JDBC / TLS │               │ Redis / TLS
                                            ▼               ▼
                                 ┌────────────────┐ ┌────────────────┐
                                 │  TiDB Cloud    │ │ Upstash Redis  │
                                 │  Serverless    │ │ Serverless     │
                                 │  (免费 MySQL)  │ │ (免费 KV 缓存) │
                                 └────────────────┘ └────────────────┘
```

| 组件 | 选用服务 | 免费额度 / 成本 | 核心优势 |
| :--- | :--- | :--- | :--- |
| **代码托管** | **GitHub** | 永久免费 | 全球通用、集成 Actions CI/CD |
| **容器计算** | **Render Web Service** | 免费层（512MB RAM） | 支持多阶段 Dockerfile、自带泛域名 HTTPS |
| **关系型数据库** | **TiDB Cloud Serverless** | 免费层（5GB 存储） | 100% 兼容 MySQL 8.0 协议、高可用、免运维 |
| **内存缓存** | **Upstash Redis** | 免费层（10,000 请求/天） | 原生支持 TLS/SSL、Serverless 自动弹性伸缩 |
| **心跳保活** | **GitHub Actions + Cron-Job.org** | 永久免费 | 双重守护，解决 Render 免费容器 15 分钟休眠 |

---

## 二、代码与容器化配置

本项目已在代码仓库中完成了容器化与生产环境配置的全部固化改造，下次部署直接复用即可：

### 1. 多阶段构建 Dockerfile
根目录 [`Dockerfile`](./Dockerfile) 采用三阶段流水线：
- **Stage 1 (前端)**：`node:20-alpine` 自动执行 `npm install` 与 `npm run build`，产物自动输出至 Spring Boot 静态资源目录。
- **Stage 2 (后端)**：`maven:3.9-eclipse-temurin-17-alpine` 打包 Spring Boot fat jar。
- **Stage 3 (运行)**：`eclipse-temurin:17-jre-alpine` 超轻量底座。
- **关键 JVM 调优参数**（必须约束在 300MB 以内，防止 Render 512MB 容器 OOM）：
  ```dockerfile
  ENV JAVA_OPTS="-Xms128m -Xmx300m -XX:+UseSerialGC -XX:MaxMetaspaceSize=128m -Xss512k -Djava.security.egd=file:/dev/./urandom"
  ```
- **自适应端口绑定**：
  ```dockerfile
  ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --server.port=${PORT}"]
  ```

### 2. 生产配置文件 `application-prod.yml`
位于 [`jiejie-starter/src/main/resources/application-prod.yml`](./jiejie-starter/src/main/resources/application-prod.yml)：
- 端口监听：`${PORT:8080}`（自适应 Render 注入的动态端口，通常为 10000）。
- 数据库连接池：采用 Druid，将连接数精简至 `min-idle: 2`, `max-active: 10`，大幅节省内存。
- 演示模式：固定开启 `jiejie.demo-mode: true`，全局拦截增删改操作，保障演示数据安全。

---

## 三、云端数据库与缓存准备

### 1. TiDB Cloud Serverless MySQL (约 1 分钟)
1. 访问 [TiDB Cloud 控制台](https://tidbcloud.com/) 并登录（支持 GitHub 一键登录）。
2. 点击 **Create Cluster**：
   - Cluster Type：选择 **Serverless**（$0 Free）。
   - Region：推荐选择 **AWS / Tokyo (ap-northeast-1)** 或 **Singapore**（亚太延迟低）。
   - Cluster Name：填写 `jiejie-admin-db`。
   - 点击 **Create**。
3. 进入集群面板，点击 **Connect**：
   - 记录 **Host**、**Port (4000)**、**User** 和 **Password**。
4. 导入数据表与初始化数据：
   - 在控制台左侧菜单点击 **Chat2Query** 或 **SQL Editor**；
   - 先执行创建数据库：
     ```sql
     CREATE DATABASE IF NOT EXISTS `jiejie-system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
     USE `jiejie-system`;
     ```
   - 依次导入项目中的两个 SQL 文件：
     1. [`sql/jiejie-system.sql`](./sql/jiejie-system.sql)（44 张表结构与基础权限菜单）
     2. [`sql/demo-data.sql`](./sql/demo-data.sql)（演示用户、部门、审计日志）

---

### 2. Upstash Serverless Redis (约 1 分钟)
1. 访问 [Upstash 控制台](https://console.upstash.com/redis) 并登录（支持 GitHub 一键登录）。
2. 点击 **Create Database**：
   - Name：`jiejie-redis`
   - Type：Regional
   - Region：选择 `us-east-1` 或亚太区域
   - 点击 **Create**
3. 数据库创建后，在详情页 **Details** 面板复制以下连接参数：
   - **Endpoint**（Host，例如：`xxxx.upstash.io`）
   - **Port**（默认为 `6379`）
   - **Password**（REST Token 或连接密码）
   - **TLS / SSL**：已原生开启

---

## 四、推送代码至个人 GitHub 仓库

确保本地代码为最新，且大文件历史已清理：

```powershell
# 1. 切换到项目根目录
cd d:\Desktop\code\jiejie-admin

# 2. 在 GitHub 网页新建一个公开仓库，例如：https://github.com/<你的用户名>/jiejie-admin

# 3. 设置远端仓库地址并推送
git remote set-url origin https://github.com/<你的用户名>/jiejie-admin.git
git branch -M main
git push -u origin main
```

---

## 五、Render Web Service 容器化部署

1. 打开 [Render Dashboard](https://dashboard.render.com/)（GitHub 一键授权登录）。
2. 点击右上角 **New +** -> **Web Service**。
3. 选择 **Build and deploy from a Git repository**，选中刚刚推送的仓库 `jiejie-admin`。
4. 填写基本配置：
   - **Name**：`jiejie-admin`（**核心**：决定分配的免费域名为 `https://jiejie-admin.onrender.com`）
   - **Region**：选择与数据库最近的区域（如 `Singapore` 或 `Oregon`）
   - **Branch**：`main`
   - **Language / Runtime**：**Docker**（Render 会自动检测并使用项目根目录下的 Dockerfile）
   - **Instance Type**：**务必勾选 $0 / month Free 方案**（512 MB RAM, 0.1 CPU）

5. **配置环境变量（Environment Variables）**：
   点击 **Add from .env** 按钮，一次性粘贴以下内容（将对应参数替换为你自己的真实账号密码）：

   ```env
   SPRING_PROFILES_ACTIVE=prod
   SPRING_DATASOURCE_URL=jdbc:mysql://<你的TiDB主机>:4000/jiejie-system?useUnicode=true&characterEncoding=utf8&useSSL=true&serverTimezone=GMT%2B8
   SPRING_DATASOURCE_USERNAME=<你的TiDB用户名>
   SPRING_DATASOURCE_PASSWORD=<你的TiDB密码>
   SPRING_DATA_REDIS_HOST=<你的Upstash主机>
   SPRING_DATA_REDIS_PORT=6379
   SPRING_DATA_REDIS_PASSWORD=<你的Upstash密码>
   SPRING_DATA_REDIS_SSL=true
   ```

6. 点击 **Deploy web service** 按钮！
   - Render 将自动下载镜像底座、并行编译前端与后端代码。
   - 大约 2~3 分钟后，控制台出现日志：
     ```log
     Tomcat initialized with port 10000 (http)
     ==> Your service is live 🎉
     Available at your primary URL https://jiejie-admin.onrender.com
     ```
   - 打开分配的域名即可进入登录页！

---

## 六、7×24 小时常驻秒开保活体系（防休眠）

> **休眠原理**：Render Free 套餐在无入站网络流量 15 分钟后会自动挂起容器；下一次访客访问需要重新拉起容器，冷启动约 40~50 秒。
>
> **实测结论（关键，与直觉相反）**：真正撑住「秒开」的是**外部心跳，不是仓库里的 GitHub Actions**。对本仓库取样 25 次 GitHub 定时任务，相邻间隔中位数 **234 分钟**（最短 120 分钟、最长 353 分钟），配置的 12 分钟**一次都没有达标**——GitHub 会对低活跃仓库的 schedule 事件做大幅节流。而同一时间窗口内，静默 15 分钟后访问站点仍是 **1.8 秒**响应，说明外部心跳（Cron-Job.org）确实在稳定工作。

### 1. 主力层：外部独立心跳（必配，约 2 分钟）

1. 登录 [Cron-Job.org 控制台](https://console.cron-job.org/jobs)（免费注册）
2. 点击 **CREATE CRONJOB**，按下表填写：

   | 字段 | 值 |
   | :--- | :--- |
   | Title | `Jiejie-Admin-KeepAlive` |
   | URL | `https://jiejie-admin.onrender.com/api/system/config/public` |
   | Schedule | **Every 10 minutes**（`*/10 * * * *`） |
   | Enable job | 勾选 |

3. 点击 **CREATE** 保存。列表页会显示每次执行的状态码，可据此确认是否生效。

> - URL 刻意使用 API 而非首页：首页可能被 CDN 缓存命中，API 请求必然回源，才能真正唤醒实例。
> - **不要删除这个任务**。它一旦停摆，实例会在 15 分钟后休眠，演示站退回 30~60 秒冷启动。

### 2. 辅助层：GitHub Actions 云端心跳（已集成，但不可依赖）

[`.github/workflows/keepalive.yml`](./.github/workflows/keepalive.yml) 每 **10 分钟**尝试探测一次，并处理了两个容易被忽略的细节：

- **同时探测首页与 API**：静态资源可能被 Cloudflare 直接命中缓存而不回源，只打首页未必能重置容器休眠计时，因此额外打一个必然穿透到应用的接口。
- **失败自动重试 2 次**：冷启动时首个请求会挂住，单次超时不代表服务不可用。

受上文所述的节流影响，它实际每 2~6 小时才会触发一次，**只能算顺带唤醒，不能当作保活主力**。保留它的意义是：外部心跳万一失效时，它仍能压低冷启动的出现频次。

### 3. 防止 GitHub 心跳被自动禁用（已集成）

GitHub 还会在仓库「连续 60 天没有任何提交」时**自动禁用全部 schedule 触发的工作流**，这是一条与节流叠加、容易被忽略的失效路径。

[`.github/workflows/keepalive-activity.yml`](./.github/workflows/keepalive-activity.yml) 每月 1 日检查提交活跃度：若仓库已空闲超过 30 天，就补交一次空提交以重置这 60 天计时器；若你本人近期有正常提交，则不做任何额外操作。这是保住辅助层不被彻底关闭的最低成本手段。

### 4. 访客停留期间的自我保活（已集成）

真实的冷启动往往发生在「人还在页面上」的时候：HR 打开登录页后先去处理别的事，20 分钟后回来点登录——此时实例已经休眠。

前端已在页面可见时每 5 分钟回源一次，并在从后台标签页切回来的瞬间立即回源，让实例提前开始唤醒。相关代码见 `jiejie-ui/src/main.ts` 末尾的 HEARTBEAT 段。

### 5. 这套方案的边界

上述措施让「有流量时」始终保持秒开，但**如果整条保活链路同时断裂**（GitHub 长时间故障 + Cron-Job.org 停止服务），冷启动仍会发生。届时的表现是访客看到分阶段的唤醒进度提示，而不是一个卡死的白屏——这是当前零成本方案能做到的上限。

若要彻底消除冷启动，只能改变运行方式：

| 方案 | 成本 | 说明 |
| :--- | :--- | :--- |
| 升级 Render 付费实例 | 约 $7/月起 | 容器常驻，无需任何保活配置 |
| 迁移到不会休眠的容器平台 | 免费但需重建 | 如 Oracle Cloud Always Free，需重新搭建部署链路 |

---

## 七、简历呈现与面试答辩亮点

### 1. 简历项目描述推荐模板

```markdown
### Jiejie Admin 企业级通用后台管理平台 (全栈架构 & 云原生部署)
- **在线演示**：https://jiejie-admin.onrender.com (免密演示体验：内置 admin / 123456)
- **源码仓库**：https://github.com/Konglong7/jiejie-admin
- **核心架构**：Spring Boot 3.2 + Vue 3.4 + Vite + Naive UI + MyBatis-Plus + Sa-Token + TiDB + Redis + Docker
- **工程亮点**：
  1. 架构设计：采用前后端纯解耦设计，基于 Multi-stage Docker 实现前端静态化打包与 Spring Boot 自动化融合交付；
  2. 性能调优：针对云原生低配容器（512MB RAM）进行精准 JVM 堆内存与 GC 约束（SerialGC、Xmx300m），彻底消除小内存环境下的 OOM 隐患；
  3. 云端存储：接入 Serverless 分布式数据库 TiDB Cloud 与 TLS 加密云缓存 Upstash，完成生产级数据持久化与 Token 鉴权；
  4. 生产安全：实现 Demo 演示模式切面拦截，并设计 GitHub Actions + Cron-Job 双心跳机制，确保线上实例 7×24 小时常驻秒开。
```

### 2. 面试高频问题与答辩思路

**Q1：Render 免费实例只有 512MB 内存，Spring Boot 3 + JDK 17 通常内存占用较大，你是怎么解决 OOM 的？**
> **答辩思路**：
> 1. **JVM 堆内约束**：指定 `-Xms128m -Xmx300m`，严格把堆内存上限控制在 300MB；
> 2. **GC 策略优化**：单核/轻量容器下显式指定 `-XX:+UseSerialGC`，降低 G1/ZGC 复杂线程对内存和 CPU 的额外开销；
> 3. **元空间与栈深约束**：限制 `-XX:MaxMetaspaceSize=128m -Xss512k`，避免类加载膨胀；
> 4. **连接池精简**：优化 Druid 连接池参数，初始和最小空闲设为 2，最大活动连接 10，避免闲置连接占用过多内存。

**Q2：如何防止面试官或其他外部访客在演示网站上恶意修改或清空数据？**
> **答辩思路**：
> 1. 项目内置演示模式拦截器（`DemoModeInterceptor`），在 `application-prod.yml` 中开启 `jiejie.demo-mode: true`；
> 2. 对非查询类请求（POST/PUT/DELETE 中涉及核心系统配置、用户修改、菜单删除的操作）进行 AOP 切面拦截，并返回友好提示：“演示模式，禁止修改系统数据”；
> 3. 登录页提供“一键填入演示凭据”快捷按钮，提升面试官体验的同时隔离真实密码。
