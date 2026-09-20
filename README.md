<div align="center">

# Jiejie Admin

![Java](https://img.shields.io/badge/Java-17-orange?style=flat-square&logo=openjdk)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-green?style=flat-square&logo=springboot)
![Vue](https://img.shields.io/badge/Vue-3.4-brightgreen?style=flat-square&logo=vue.js)
![Naive UI](https://img.shields.io/badge/Naive%20UI-2.37-blue?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

**基于 Spring Boot 3 + Vue 3 的现代化后台管理系统**

[开发指南](#开发指南) | [功能特性](#功能特性) | [快速开始](#快速开始)

</div>

---

## 项目简介

Jiejie Admin 是一个开箱即用的企业级后台管理系统，采用前后端分离架构，提供完整的权限管理、系统监控、消息推送、即时通讯等功能。项目采用分层架构设计，代码规范、结构清晰，适合作为企业后台管理系统的基础框架。

## 技术栈

### 后端

| 技术 | 版本 | 说明 |
|------|------|------|
| Spring Boot | 3.2.2 | 基础框架 |
| MyBatis-Plus | 3.5.5 | ORM 框架 |
| Sa-Token | 1.37.0 | 权限认证框架 |
| Redis | 7.0+ | 缓存/会话存储 |
| MySQL | 8.0+ | 数据库 |
| Quartz | 2.3.2 | 定时任务框架 |
| Hutool | 5.8.25 | Java 工具类库 |
| MinIO | - | 对象存储（可选） |
| 阿里云 OSS | - | 对象存储（可选） |

### 前端（PC 管理后台）

| 技术 | 版本 | 说明 |
|------|------|------|
| Vue | 3.4.15 | 前端框架 |
| Vite | 5.0.11 | 构建工具 |
| TypeScript | 5.3.3 | 类型安全 |
| Naive UI | 2.37.3 | UI 组件库 |
| Pinia | 2.1.7 | 状态管理 |
| Vue Router | 4.2.5 | 路由管理 |
| Axios | 1.6.5 | HTTP 客户端 |
| ECharts | 6.0.0 | 图表库 |
| xterm.js | 6.0.0 | 终端模拟器 |

### 移动端（小程序）

| 技术 | 版本 | 说明 |
|------|------|------|
| UniApp | - | 跨平台框架 |
| uView Plus | 3.3.36 | UI 组件库 |
| crypto-js | 4.2.0 | 加密工具 |

## 项目结构

```
jiejie-admin
├── jiejie-common              # 公共基础模块
│   ├── entity                 # 基础实体类
│   ├── exception              # 全局异常处理
│   ├── result                 # 统一响应封装
│   └── util                   # 工具类
│
├── jiejie-infra               # 基础设施层
│   ├── jiejie-db              # 数据库配置
│   ├── jiejie-redis           # Redis 配置
│   ├── jiejie-oss             # 文件存储（本地/MinIO/阿里云OSS）
│   ├── jiejie-sms             # 短信服务（阿里云/腾讯云）
│   ├── jiejie-pay             # 支付服务（微信/支付宝）
│   ├── jiejie-push            # 推送服务（极光/友盟/个推）
│   ├── jiejie-social          # 社交登录（微信/支付宝/苹果）
│   ├── jiejie-wechat          # 微信公众号/小程序
│   ├── jiejie-websocket       # WebSocket 支持
│   ├── jiejie-crypto          # 加密解密
│   └── jiejie-mail            # 邮件发送服务
│
├── jiejie-core                # 业务核心层
│   ├── jiejie-system          # 系统管理
│   │   ├── entity             # 系统实体（用户、角色、菜单等）
│   │   ├── mapper             # MyBatis Mapper
│   │   ├── service            # 服务层
│   │   ├── annotation         # 自定义注解
│   │   └── aspect             # AOP 切面
│   ├── jiejie-auth            # 认证授权
│   │   ├── strategy           # 登录策略（密码/短信/社交/小程序）
│   │   └── enums              # 枚举定义
│   ├── jiejie-file            # 文件管理
│   ├── jiejie-gen             # 代码生成
│   ├── jiejie-message         # 消息中心（公告/聊天/群聊）
│   ├── jiejie-workflow        # Warm-Flow 工作流业务适配
│   └── jiejie-biz             # 业务扩展模块
│
├── jiejie-api                 # 接口层
│   ├── jiejie-admin-api       # 后台管理接口
│   ├── jiejie-app-api         # APP/小程序接口
│   └── jiejie-web-api         # 网页端接口
│
├── jiejie-job                 # 定时任务模块
├── jiejie-starter             # 启动入口
├── jiejie-ui                  # 后台管理前端 (Vue 3 + Vite + Naive UI)
├── jiejie-uniapp              # 移动端小程序 (UniApp)
└── sql                        # 数据库脚本 (jiejie-system.sql)
```

## 功能特性

### 系统管理
- **用户管理** - 用户的增删改查、角色分配、状态管理、用户黑名单
- **角色管理** - 角色的权限配置、菜单分配、数据权限
- **菜单管理** - 菜单的增删改查、权限标识配置
- **部门管理** - 组织架构管理、树形结构展示
- **岗位管理** - 岗位的增删改查
- **字典管理** - 数据字典维护、字典项管理
- **系统配置** - 系统参数的动态配置（分组管理）

### 系统监控
- **在线用户** - 当前在线用户查看、强制下线
- **定时任务** - Quartz 任务调度、执行日志
- **服务监控** - 服务器 CPU、内存、JVM 信息
- **缓存监控** - Redis 缓存信息、键值管理

### 日志管理
- **登录日志** - 用户登录记录、登录地点
- **操作日志** - 用户操作记录、AOP 切面自动记录

### 消息中心
- **系统公告** - 公告发布、已读未读状态
- **即时通讯** - WebSocket 实时消息
- **私聊** - 一对一聊天
- **群聊** - 群组创建、成员管理、群消息

### 文件管理
- **文件上传** - 支持本地/MinIO/阿里云OSS
- **文件管理** - 文件列表、预览、下载、删除

### 代码生成
- **代码生成器** - 根据数据库表生成前后端代码

### 安全特性
- **验证码** - 图片验证码、滑块验证码、短信验证码
- **接口加密** - RSA 非对称加密传输
- **登录安全** - 登录失败限制、账号锁定
- **权限控制** - 基于 RBAC 的细粒度权限控制
- **多种登录方式** - 密码登录、短信登录、社交登录、小程序登录

### 扩展服务（策略工厂模式）
- **文件存储** - 本地存储 / MinIO / 阿里云 OSS
- **短信服务** - 控制台 / 阿里云 / 腾讯云
- **支付服务** - 微信支付 / 支付宝
- **推送服务** - 控制台 / 极光 / 友盟 / 个推
- **社交登录** - 微信公众号 / 微信小程序 / 支付宝 / 苹果

## 快速开始

### 环境准备

- JDK 17+
- Maven 3.8+
- MySQL 8.0+
- Redis 7.0+
- Node.js 18+

### 后端启动

1. **导入数据库**
```sql
-- 创建数据库
CREATE DATABASE `jiejie-system` DEFAULT CHARACTER SET utf8mb4;

-- 导入 SQL
mysql -u root -p jiejie-system < sql/jiejie-system.sql
```

2. **修改配置**

修改 `jiejie-starter/src/main/resources/application-dev.yml` 中的数据库和 Redis 配置：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/jiejie-system
    username: root
    password: your_password
  data:
    redis:
      host: localhost
      port: 6379
      password: 
      database: 6
```

3. **启动项目**
```bash
mvn clean install
cd jiejie-starter
mvn spring-boot:run
```

后端默认运行在 `http://localhost:8080`

### 前端启动

```bash
cd jiejie-ui
npm install
npm run dev
```

前端默认运行在 `http://localhost:3000`

### 移动端启动

使用 HBuilderX 打开 `jiejie-uniapp` 目录，运行到微信开发者工具即可。

### 默认账号

| 账号 | 密码 | 说明 |
|------|------|------|
| admin | admin123 | 超级管理员 |

## 开源协议

本项目基于 [MIT License](LICENSE) 开源。
