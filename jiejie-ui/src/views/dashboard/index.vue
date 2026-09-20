<template>
  <div class="dashboard-container">
    <!-- 欢迎栏 -->
    <div class="welcome-card">
      <div class="welcome-left">
        <n-avatar round :size="56" :src="userStore.avatar || undefined" class="user-avatar">
          {{ userStore.nickname?.charAt(0) || 'U' }}
        </n-avatar>
        <div class="welcome-text">
          <h2 class="welcome-title">{{ getGreeting() }}，{{ userStore.nickname }} 👋</h2>
          <p class="welcome-desc">欢迎使用管理控制台，系统运行一切正常。</p>
        </div>
      </div>
      <div class="welcome-right">
        <div class="time-box">
          <div class="time-val">{{ currentTime }}</div>
          <div class="date-val">{{ currentDate }}</div>
        </div>
      </div>
    </div>

    <!-- 面试官 / HR 导览与项目解决痛点说明展板 -->
    <n-card class="project-overview-card" :bordered="false" size="small">
      <div class="overview-header">
        <div class="overview-title-group">
          <div class="overview-badge">PROJECT HIGHLIGHTS</div>
          <h3 class="overview-title">🎯 项目定位与解决痛点说明（HR / 面试官参考）</h3>
        </div>
        <div class="overview-actions">
          <n-button text type="primary" size="small" @click="toggleOverviewCollapse">
            {{ overviewCollapsed ? '展开详细说明 ↓' : '收起详细说明 ↑' }}
          </n-button>
        </div>
      </div>

      <div class="overview-summary">
        本项目是一套基于 <strong>Spring Boot 3.2</strong> 与 <strong>Vue 3.4</strong> 构建的企业级通用中后台全栈解决方案。旨在为企业信息化与 SaaS 系统提供一套<strong>高安全性、高扩展性、零重复造轮子</strong>的开箱即用工程底座，并在生产端实现<strong>极端微内存（512MB RAM）云原生环境下的长期稳定运行</strong>。
      </div>

      <n-collapse-transition :show="!overviewCollapsed">
        <div class="problem-solution-grid">
          <div class="problem-card">
            <div class="problem-tag tag-orange">痛点 1 · 开发效率</div>
            <div class="problem-title">重复编写 CRUD，基础模块割裂</div>
            <div class="solution-content">
              <strong>解决之道：</strong>开箱即用封装 12+ 企业级高频模块（组织架构、字典、配置、审计、定时任务等），内置基于 Velocity 的<strong>代码生成器</strong>，从数据表一键逆向生成前后端全套代码，缩减 70% 基础开发周期。
            </div>
            <div class="quick-link" @click="router.push('/tool/gen')">前往体验代码生成 →</div>
          </div>

          <div class="problem-card">
            <div class="problem-tag tag-blue">痛点 2 · 权限管理</div>
            <div class="problem-title">权限粗放、无动态路由与越权隐患</div>
            <div class="solution-content">
              <strong>解决之道：</strong>集成 <strong>Sa-Token</strong> 建立 5 级细粒度 RBAC 权限控制（用户-角色-岗位-部门-菜单/按钮），前端联动后端权限树<strong>动态注册与过滤路由</strong>，关键请求全局校验，支持 RSA 非对称加密防窃听。
            </div>
            <div class="quick-link" @click="router.push('/system/role')">前往查看角色权限体系 →</div>
          </div>

          <div class="problem-card">
            <div class="problem-tag tag-green">痛点 3 · 业务协同</div>
            <div class="problem-title">审批流程代码硬编码，变更改造成本高</div>
            <div class="solution-content">
              <strong>解决之道：</strong>深度融合国产高性能工作流 <strong>Warm-Flow</strong>，支持可视化流程定义绘制、多分支条件跳转、历史流转跟踪及办理/委托/转办，无缝支撑企业 OA 审批业务闭环。
            </div>
            <div class="quick-link" @click="router.push('/workflow/definition')">前往体验流程设计器 →</div>
          </div>

          <div class="problem-card">
            <div class="problem-tag tag-purple">痛点 4 · 生产运维</div>
            <div class="problem-title">云端轻量容器（512MB RAM）频繁 OOM 宕机</div>
            <div class="solution-content">
              <strong>解决之道：</strong>深入实施 <strong>JVM 堆内存精细化调优</strong>（-Xms128m -Xmx300m -XX:+UseSerialGC），搭配 TiDB Serverless 数据库与 Upstash Redis 缓存，结合 GitHub Actions + Cron-Job 双心跳机制，达成<strong>永久零成本 7×24h 常驻秒开</strong>。
            </div>
            <div class="quick-link" @click="router.push('/monitor/server')">前往查看服务器监控 →</div>
          </div>
        </div>

        <div class="tech-stack-row">
          <span class="tech-label">核心技术矩阵：</span>
          <div class="tech-tags">
            <n-tag size="small" type="primary" :bordered="false">Vue 3.4 + Vite 5</n-tag>
            <n-tag size="small" type="primary" :bordered="false">Naive UI</n-tag>
            <n-tag size="small" type="info" :bordered="false">Spring Boot 3.2</n-tag>
            <n-tag size="small" type="info" :bordered="false">Sa-Token 权限体系</n-tag>
            <n-tag size="small" type="success" :bordered="false">Warm-Flow 工作流</n-tag>
            <n-tag size="small" type="success" :bordered="false">MyBatis-Plus</n-tag>
            <n-tag size="small" type="warning" :bordered="false">TiDB Cloud (MySQL)</n-tag>
            <n-tag size="small" type="warning" :bordered="false">Upstash Redis</n-tag>
            <n-tag size="small" :bordered="false">Docker 512MB JVM 调优</n-tag>
            <n-tag size="small" :bordered="false">Demo Mode 只读安全保护</n-tag>
          </div>
        </div>
      </n-collapse-transition>
    </n-card>

    <!-- 统计指标卡片 -->
    <div class="stat-grid">
      <div v-for="stat in stats" :key="stat.title" class="stat-card">
        <div class="stat-icon-wrapper" :style="{ background: stat.bgColor }">
          <n-icon size="24" :color="stat.color">
            <component :is="stat.icon" />
          </n-icon>
        </div>
        <div class="stat-info">
          <div class="stat-title">{{ stat.title }}</div>
          <n-skeleton v-if="loading" :width="60" :height="28" />
          <div v-else class="stat-num">{{ stat.value }}</div>
        </div>
      </div>
    </div>

    <!-- 图表与快捷入口区域 -->
    <n-grid :x-gap="16" :y-gap="16" :cols="12" class="section-grid">
      <!-- 访问趋势图表 (8 列) -->
      <n-gi :span="8">
        <n-card title="近 7 日系统活跃与访问趋势" class="chart-card">
          <div ref="trendChartRef" style="height: 320px; width: 100%"></div>
        </n-card>
      </n-gi>

      <!-- 快捷入口 (4 列) -->
      <n-gi :span="4">
        <n-card title="常用功能导航" class="shortcuts-card">
          <div class="shortcuts-grid">
            <div
              v-for="shortcut in shortcuts"
              :key="shortcut.path"
              class="shortcut-item"
              @click="router.push(shortcut.path)"
            >
              <div class="shortcut-icon" :style="{ background: shortcut.bgColor }">
                <n-icon size="22" :color="shortcut.color">
                  <component :is="shortcut.icon" />
                </n-icon>
              </div>
              <div class="shortcut-title">{{ shortcut.name }}</div>
            </div>
          </div>
        </n-card>
      </n-gi>
    </n-grid>

    <!-- 底部区域：系统环境 + 版本动态 -->
    <n-grid :x-gap="16" :y-gap="16" :cols="12" class="section-grid" style="margin-top: 16px">
      <!-- 系统环境 -->
      <n-gi :span="6">
        <n-card title="系统环境概览">
          <n-descriptions :column="2" label-placement="left">
            <n-descriptions-item label="系统名称">Jiejie Admin</n-descriptions-item>
            <n-descriptions-item label="系统版本">v1.3.0</n-descriptions-item>
            <n-descriptions-item label="前端技术">Vue 3.4 + Vite + Naive UI</n-descriptions-item>
            <n-descriptions-item label="后端技术">Spring Boot 3.2 + Sa-Token</n-descriptions-item>
            <n-descriptions-item label="数据库">MySQL 8.0</n-descriptions-item>
            <n-descriptions-item label="缓存服务">Redis 7.0</n-descriptions-item>
          </n-descriptions>
        </n-card>
      </n-gi>

      <!-- 版本更新记录 -->
      <n-gi :span="6">
        <n-card title="更新动态">
          <n-timeline>
            <n-timeline-item
              v-for="log in changelog"
              :key="log.version"
              :type="log.type"
              :title="log.version"
              :time="log.date"
            >
              <ul class="changelog-list">
                <li v-for="(item, idx) in log.changes" :key="idx">{{ item }}</li>
              </ul>
            </n-timeline-item>
          </n-timeline>
        </n-card>
      </n-gi>
    </n-grid>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, markRaw } from 'vue'
import { useRouter } from 'vue-router'
import {
  PersonOutline,
  PeopleOutline,
  MenuOutline,
  ShieldCheckmarkOutline,
  SettingsOutline,
  TimerOutline,
  ServerOutline,
  PulseOutline,
  FolderOpenOutline,
  DocumentTextOutline
} from '@vicons/ionicons5'
import { useUserStore } from '@/stores/user'
import { dashboardApi } from '@/api/system'
import { useECharts } from '@/composables/useECharts'

const router = useRouter()
const userStore = useUserStore()

const currentTime = ref('')
const currentDate = ref('')
const loading = ref(true)
const overviewCollapsed = ref(false)

function toggleOverviewCollapse() {
  overviewCollapsed.value = !overviewCollapsed.value
}

const trendChartRef = ref<HTMLElement | null>(null)
const trendChart = useECharts(trendChartRef)

function getGreeting() {
  const hour = new Date().getHours()
  if (hour < 6) return '夜深了'
  if (hour < 9) return '早上好'
  if (hour < 12) return '上午好'
  if (hour < 14) return '中午好'
  if (hour < 18) return '下午好'
  if (hour < 22) return '晚上好'
  return '夜深了'
}

// 统计数据
const stats = ref([
  {
    title: '用户总数',
    value: 0,
    icon: markRaw(PersonOutline),
    color: '#4F46E5',
    bgColor: 'rgba(79, 70, 229, 0.12)'
  },
  {
    title: '角色总数',
    value: 0,
    icon: markRaw(PeopleOutline),
    color: '#10B981',
    bgColor: 'rgba(16, 185, 129, 0.12)'
  },
  {
    title: '菜单总数',
    value: 0,
    icon: markRaw(MenuOutline),
    color: '#8B5CF6',
    bgColor: 'rgba(139, 92, 246, 0.12)'
  },
  {
    title: '权限总数',
    value: 0,
    icon: markRaw(ShieldCheckmarkOutline),
    color: '#F59E0B',
    bgColor: 'rgba(245, 158, 11, 0.12)'
  }
])

// 快捷入口
const shortcuts = [
  { name: '用户管理', path: '/system/user', icon: markRaw(PersonOutline), color: '#4F46E5', bgColor: 'rgba(79, 70, 229, 0.12)' },
  { name: '角色管理', path: '/system/role', icon: markRaw(PeopleOutline), color: '#10B981', bgColor: 'rgba(16, 185, 129, 0.12)' },
  { name: '菜单管理', path: '/system/menu', icon: markRaw(MenuOutline), color: '#8B5CF6', bgColor: 'rgba(139, 92, 246, 0.12)' },
  { name: '系统配置', path: '/system/config', icon: markRaw(SettingsOutline), color: '#EC4899', bgColor: 'rgba(236, 72, 153, 0.12)' },
  { name: '服务监控', path: '/monitor/server', icon: markRaw(ServerOutline), color: '#06B6D4', bgColor: 'rgba(6, 182, 212, 0.12)' },
  { name: '定时任务', path: '/monitor/job', icon: markRaw(TimerOutline), color: '#EF4444', bgColor: 'rgba(239, 68, 68, 0.12)' }
]

// 更新动态
const changelog = [
  {
    version: 'v1.3.0',
    date: '2026-06-20',
    type: 'success' as const,
    changes: [
      '全面优化 Web 端架构：完成 Vite 生产构建分包与按需异步加载',
      '重构 Layout 巨石组件为模块化子组件，大幅降低代码复杂度',
      '统一 ECharts 图表自适应响应与暗黑模式深度联动',
      '网络层增加 Promise 单例去重机制，杜绝首屏并发请求冲突'
    ]
  },
  {
    version: 'v1.2.0',
    date: '2026-05-18',
    type: 'info' as const,
    changes: [
      '系统通知：重构消息推送中心，统一飞书/钉钉/企业微信 Webhook 发送逻辑',
      '用户管理：集成数据批量导入导出与自定义模板',
      '日志审计：优化 AOP 操作日志记录与慢请求分析'
    ]
  }
]

async function loadStats() {
  try {
    loading.value = true
    const data = await dashboardApi.getStats()
    stats.value[0].value = data.userCount || 0
    stats.value[1].value = data.roleCount || 0
    stats.value[2].value = data.menuCount || 0
    stats.value[3].value = data.permissionCount || 0
  } catch (error) {
    // 忽略错误
  } finally {
    loading.value = false
  }
}

function initTrendChart() {
  const days = ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
  const pvData = [820, 932, 901, 934, 1290, 1330, 1320]
  const uvData = [320, 432, 401, 434, 590, 630, 610]

  trendChart.setOption({
    tooltip: { trigger: 'axis' },
    legend: { data: ['访问量 (PV)', '独立用户 (UV)'], top: 0 },
    grid: { left: '3%', right: '4%', bottom: '3%', top: '40px', containLabel: true },
    xAxis: { type: 'category', boundaryGap: false, data: days },
    yAxis: { type: 'value' },
    series: [
      {
        name: '访问量 (PV)',
        type: 'line',
        smooth: true,
        data: pvData,
        itemStyle: { color: '#4F46E5' },
        areaStyle: {
          color: 'rgba(79, 70, 229, 0.2)'
        }
      },
      {
        name: '独立用户 (UV)',
        type: 'line',
        smooth: true,
        data: uvData,
        itemStyle: { color: '#10B981' },
        areaStyle: {
          color: 'rgba(16, 185, 129, 0.2)'
        }
      }
    ]
  })
}

function updateTime() {
  const now = new Date()
  currentTime.value = now.toLocaleTimeString('zh-CN', { hour12: false })
  currentDate.value = now.toLocaleDateString('zh-CN', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    weekday: 'long'
  })
}

let timer: number
onMounted(() => {
  updateTime()
  timer = window.setInterval(updateTime, 1000)
  loadStats()
  initTrendChart()
})

onUnmounted(() => {
  clearInterval(timer)
})
</script>

<style lang="scss" scoped>
.dashboard-container {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.welcome-card {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px 24px;
  background: #FFFFFF;
  border-radius: 12px;
  border: 1px solid #E5E7EB;
  transition: all 0.3s;
}

body.dark-theme .welcome-card {
  background: #18181c;
  border-color: #3f3f46;
}

.welcome-left {
  display: flex;
  align-items: center;
  gap: 16px;
}

.welcome-title {
  font-size: 20px;
  font-weight: 700;
  margin: 0 0 4px 0;
  color: #111827;
}

body.dark-theme .welcome-title {
  color: #FFFFFF;
}

.welcome-desc {
  font-size: 13px;
  color: #6B7280;
  margin: 0;
}

body.dark-theme .welcome-desc {
  color: #9CA3AF;
}

.time-box {
  text-align: right;
}

.time-val {
  font-size: 28px;
  font-weight: 700;
  color: #111827;
  font-variant-numeric: tabular-nums;
}

body.dark-theme .time-val {
  color: #FFFFFF;
}

.date-val {
  font-size: 13px;
  color: #6B7280;
}

body.dark-theme .date-val {
  color: #9CA3AF;
}

.stat-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
}

.stat-card {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 18px 20px;
  background: #FFFFFF;
  border-radius: 12px;
  border: 1px solid #E5E7EB;
  transition: all 0.3s;

  &:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    transform: translateY(-2px);
  }
}

body.dark-theme .stat-card {
  background: #18181c;
  border-color: #3f3f46;
}

.stat-icon-wrapper {
  width: 48px;
  height: 48px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.stat-info {
  display: flex;
  flex-direction: column;
}

.stat-title {
  font-size: 13px;
  color: #6B7280;
  margin-bottom: 4px;
}

body.dark-theme .stat-title {
  color: #9CA3AF;
}

.stat-num {
  font-size: 24px;
  font-weight: 700;
  color: #111827;
  line-height: 1;
}

body.dark-theme .stat-num {
  color: #FFFFFF;
}

.shortcuts-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 12px;
}

.shortcut-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  padding: 16px 8px;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;

  &:hover {
    background: #F3F4F6;
  }
}

body.dark-theme .shortcut-item:hover {
  background: #27272a;
}

.shortcut-icon {
  width: 44px;
  height: 44px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.shortcut-title {
  font-size: 12px;
  color: #374151;
  font-weight: 500;
}

body.dark-theme .shortcut-title {
  color: #d1d5db;
}

.changelog-list {
  margin: 0;
  padding-left: 18px;
  font-size: 13px;
  color: #6B7280;

  li {
    margin-bottom: 4px;
  }
}

body.dark-theme .changelog-list {
  color: #9CA3AF;
}

/* ==================== 项目定位与解决痛点导览展板 ==================== */
.project-overview-card {
  margin-bottom: 20px;
  border-radius: 12px;
  background: linear-gradient(135deg, rgba(79, 70, 229, 0.04) 0%, rgba(99, 102, 241, 0.08) 100%);
  border: 1px solid rgba(79, 70, 229, 0.18) !important;
}

body.dark-theme .project-overview-card {
  background: linear-gradient(135deg, rgba(79, 70, 229, 0.1) 0%, rgba(30, 27, 75, 0.4) 100%);
  border-color: rgba(99, 102, 241, 0.3) !important;
}

.overview-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.overview-title-group {
  display: flex;
  align-items: center;
  gap: 10px;
}

.overview-badge {
  background: #4F46E5;
  color: #fff;
  font-size: 11px;
  font-weight: 700;
  padding: 2px 8px;
  border-radius: 4px;
  letter-spacing: 0.5px;
}

.overview-title {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
  color: #111827;
}

body.dark-theme .overview-title {
  color: #f3f4f6;
}

.overview-summary {
  font-size: 13.5px;
  line-height: 1.6;
  color: #4B5563;
  margin-bottom: 14px;
}

body.dark-theme .overview-summary {
  color: #d1d5db;
}

.problem-solution-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;
  margin-bottom: 14px;
}

@media (max-width: 1200px) {
  .problem-solution-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .problem-solution-grid {
    grid-template-columns: 1fr;
  }
}

.problem-card {
  background: #ffffff;
  padding: 14px;
  border-radius: 8px;
  border: 1px solid #E5E7EB;
  display: flex;
  flex-direction: column;
  transition: all 0.2s;
}

body.dark-theme .problem-card {
  background: #18181c;
  border-color: #3f3f46;
}

.problem-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.problem-tag {
  display: inline-block;
  font-size: 11px;
  font-weight: 600;
  padding: 2px 6px;
  border-radius: 4px;
  width: fit-content;
  margin-bottom: 8px;

  &.tag-orange {
    background: #FEF3C7;
    color: #D97706;
  }
  &.tag-blue {
    background: #DBEAFE;
    color: #2563EB;
  }
  &.tag-green {
    background: #D1FAE5;
    color: #059669;
  }
  &.tag-purple {
    background: #EDE9FE;
    color: #7C3AED;
  }
}

body.dark-theme .problem-tag {
  opacity: 0.9;
}

.problem-title {
  font-size: 13.5px;
  font-weight: 600;
  color: #1F2937;
  margin-bottom: 6px;
}

body.dark-theme .problem-title {
  color: #f3f4f6;
}

.solution-content {
  font-size: 12.5px;
  line-height: 1.5;
  color: #6B7280;
  flex: 1;
  margin-bottom: 8px;
}

body.dark-theme .solution-content {
  color: #9CA3AF;
}

.quick-link {
  font-size: 12px;
  color: #4F46E5;
  font-weight: 500;
  cursor: pointer;
  transition: color 0.2s;

  &:hover {
    color: #4338CA;
    text-decoration: underline;
  }
}

body.dark-theme .quick-link {
  color: #818CF8;
}

.tech-stack-row {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 8px;
  padding-top: 10px;
  border-top: 1px dashed rgba(79, 70, 229, 0.15);
}

.tech-label {
  font-size: 12.5px;
  font-weight: 600;
  color: #4B5563;
}

body.dark-theme .tech-label {
  color: #9CA3AF;
}

.tech-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}
</style>
