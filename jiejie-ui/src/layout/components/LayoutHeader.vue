<template>
  <n-layout-header
    bordered
    class="layout-header"
    :class="[`theme-${themeStore.mode}`, { 'header-primary': themeStore.headerUsePrimaryColor }]"
    :style="headerStyle"
  >
    <!-- 移动端汉堡菜单按钮 + 网站简标 -->
    <div v-if="isMobile" class="header-mobile-left">
      <div class="header-icon" @click="$emit('toggleMobileMenu')" title="展开菜单">
        <n-icon size="22"><MenuOutline /></n-icon>
      </div>
      <span class="mobile-logo-title">{{ siteName }}</span>
    </div>

    <!-- 顶部菜单模式下的Logo -->
    <div v-else-if="themeStore.siderPosition === 'top'" class="header-logo">
      <img v-if="siteLogo" :src="siteLogo" class="logo-img" alt="Logo" />
      <div
        v-else
        class="logo-icon"
        :style="{
          background: themeStore.headerUsePrimaryColor ? '#fff' : themeStore.primaryColor,
          color: themeStore.headerUsePrimaryColor ? themeStore.primaryColor : '#fff'
        }"
      >
        {{ siteName.charAt(0) }}
      </div>
      <span class="logo-text">{{ siteName }}</span>
    </div>

    <!-- 顶部菜单模式下的菜单 -->
    <div v-else-if="themeStore.siderPosition === 'top'" class="header-menu">
      <n-menu
        mode="horizontal"
        :options="menuOptions"
        :value="activeMenu"
        @update:value="(key) => $emit('menuClick', key)"
      />
    </div>

    <!-- 侧边栏模式下的面包屑 -->
    <div v-else class="header-left">
      <n-breadcrumb>
        <n-breadcrumb-item v-for="item in breadcrumbs" :key="item.path">
          {{ item.title }}
        </n-breadcrumb-item>
      </n-breadcrumb>
    </div>

    <!-- 顶栏右侧功能区 -->
    <div class="header-right">
      <!-- 菜单搜索 (移动端隐藏) -->
      <MenuSearch v-if="!isMobile" :menu-options="menuOptions" />

      <!-- 全屏切换 (移动端隐藏) -->
      <div v-if="!isMobile" class="header-icon" @click="toggleFullscreen" :title="isFullscreen ? '退出全屏' : '全屏'">
        <n-icon size="20">
          <ContractOutline v-if="isFullscreen" />
          <ExpandOutline v-else />
        </n-icon>
      </div>

      <!-- 换肤设置 -->
      <ThemeDrawer />

      <!-- 消息通知 -->
      <n-popover trigger="click" placement="bottom-end" :width="360" @update:show="handleMessagePopoverShow">
        <template #trigger>
          <n-badge :value="messageStore.totalUnread()" :max="99" :show-zero="false">
            <div class="header-icon" title="消息通知">
              <n-icon size="20"><NotificationsOutline /></n-icon>
            </div>
          </n-badge>
        </template>
        <div class="message-popover">
          <div class="message-tabs">
            <n-tabs v-model:value="messageTab" type="line" size="small" @update:value="handleTabChange" class="message-tabs-inner">
              <n-tab-pane name="notice" tab="通知">
                <template #tab>
                  <n-badge :value="messageStore.noticeCount" :max="99" :show-zero="false" :offset="[8, -2]">
                    <span class="tab-text">通知</span>
                  </n-badge>
                </template>
              </n-tab-pane>
              <n-tab-pane name="chat" tab="消息">
                <template #tab>
                  <n-badge :value="messageStore.chatCount" :max="99" :show-zero="false" :offset="[8, -2]">
                    <span class="tab-text">消息</span>
                  </n-badge>
                </template>
              </n-tab-pane>
            </n-tabs>
          </div>
          <div class="message-list" ref="messageListRef" @scroll="handleMessageScroll">
            <n-spin :show="messageLoading && messagePage === 1">
              <!-- 通知列表 -->
              <template v-if="messageTab === 'notice'">
                <div v-for="item in recentNotices" :key="item.id" class="message-item" @click="handleNoticeClick(item)">
                  <div class="message-item-header">
                    <n-tag :type="item.noticeType === 1 ? 'info' : 'warning'" size="small">
                      {{ item.noticeType === 1 ? '通知' : '公告' }}
                    </n-tag>
                    <span class="message-time">{{ formatMessageTime(item.createTime) }}</span>
                  </div>
                  <div class="message-title">{{ item.title }}</div>
                  <div class="message-content">{{ stripHtml(item.content) }}</div>
                </div>
                <n-empty v-if="recentNotices.length === 0 && !messageLoading" description="暂无通知" size="small" style="padding: 30px 0" />
              </template>
              <!-- 聊天消息列表 -->
              <template v-else>
                <div v-for="item in recentChats" :key="item.senderId || item.id" class="message-item" @click="handleChatClick(item)">
                  <div class="message-item-row">
                    <n-avatar round size="small" :src="item.senderAvatar">
                      {{ item.senderName?.charAt(0) || 'U' }}
                    </n-avatar>
                    <div class="message-item-content">
                      <div class="message-item-header">
                        <span class="message-sender">{{ item.senderName || '用户' }}</span>
                        <span class="message-time">{{ formatMessageTime(item.sendTime) }}</span>
                      </div>
                      <div class="message-content">{{ item.content }}</div>
                    </div>
                  </div>
                </div>
                <n-empty v-if="recentChats.length === 0 && !messageLoading" description="暂无消息" size="small" style="padding: 30px 0" />
              </template>
            </n-spin>
            <!-- 加载更多 -->
            <div v-if="messageLoading && messagePage > 1" class="message-loading">
              <n-spin size="small" />
            </div>
            <div v-if="!hasMoreMessages && (recentNotices.length > 0 || recentChats.length > 0)" class="message-no-more">
              没有更多了
            </div>
          </div>
          <div class="message-footer">
            <n-button v-if="messageStore.noticeCount > 0 && messageTab === 'notice'" text size="small" @click="handleMarkAllRead">
              全部已读
            </n-button>
            <n-button text type="primary" @click="goToMessage">查看全部</n-button>
          </div>
        </div>
      </n-popover>

      <!-- 用户下拉 -->
      <n-dropdown :options="userOptions" @select="handleUserAction">
        <div class="user-info">
          <n-avatar round size="small" :src="userStore.avatar || undefined">
            {{ userStore.nickname?.charAt(0) || 'U' }}
          </n-avatar>
          <span class="user-name">{{ userStore.nickname }}</span>
          <n-icon size="16"><ChevronDownOutline /></n-icon>
        </div>
      </n-dropdown>
    </div>
  </n-layout-header>
</template>

<script setup lang="ts">
import { ref, computed, h, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import {
  NIcon,
  useMessage,
  useDialog,
  type MenuOption,
  type DropdownOption
} from 'naive-ui'
import {
  MenuOutline,
  ExpandOutline,
  ContractOutline,
  NotificationsOutline,
  ChevronDownOutline,
  PersonOutline,
  KeyOutline,
  LogOutOutline
} from '@vicons/ionicons5'
import { useUserStore } from '@/stores/user'
import { useMessageStore } from '@/stores/message'
import { useSiteStore } from '@/stores/site'
import { useThemeStore } from '@/stores/theme'
import { noticeApi, chatApi, type SysNotice, type ChatMessage } from '@/api/message'
import MenuSearch from './MenuSearch.vue'
import ThemeDrawer from './ThemeDrawer.vue'

defineProps<{
  isMobile?: boolean
  menuOptions: MenuOption[]
  activeMenu: string
  breadcrumbs: Array<{ path: string; title: string }>
}>()

const emit = defineEmits<{
  (e: 'menuClick', key: string): void
  (e: 'toggleMobileMenu'): void
  (e: 'openProfile'): void
  (e: 'openPassword'): void
}>()

const router = useRouter()
const message = useMessage()
const dialog = useDialog()
const userStore = useUserStore()
const messageStore = useMessageStore()
const siteStore = useSiteStore()
const themeStore = useThemeStore()

const siteName = computed(() => siteStore.siteName || 'Jiejie Admin')
const siteLogo = computed(() => siteStore.siteLogo)

// 全屏状态
const isFullscreen = ref(false)

function toggleFullscreen() {
  if (!document.fullscreenElement) {
    document.documentElement.requestFullscreen()
  } else {
    document.exitFullscreen()
  }
}

function handleFullscreenChange() {
  isFullscreen.value = !!document.fullscreenElement
}

// 顶栏动态样式
const headerStyle = computed(() => {
  if (themeStore.headerUsePrimaryColor) {
    return {
      background: themeStore.primaryColor,
      borderBottomColor: themeStore.primaryColor
    }
  }
  return {}
})

// 消息面板状态
const messageTab = ref('notice')
const messageLoading = ref(false)
const recentNotices = ref<SysNotice[]>([])
const recentChats = ref<ChatMessage[]>([])
const messagePage = ref(1)
const hasMoreMessages = ref(true)
const messageListRef = ref<HTMLElement | null>(null)

// 用户下拉菜单
const userOptions: DropdownOption[] = [
  {
    label: '个人中心',
    key: 'profile',
    icon: () => h(NIcon, null, { default: () => h(PersonOutline) })
  },
  {
    label: '修改密码',
    key: 'password',
    icon: () => h(NIcon, null, { default: () => h(KeyOutline) })
  },
  {
    type: 'divider',
    key: 'd1'
  },
  {
    label: '退出登录',
    key: 'logout',
    icon: () => h(NIcon, null, { default: () => h(LogOutOutline) })
  }
]

function handleUserAction(key: string) {
  if (key === 'logout') {
    dialog.warning({
      title: '提示',
      content: '确定要退出登录吗？',
      positiveText: '确定',
      negativeText: '取消',
      onPositiveClick: () => {
        userStore.logout()
        message.success('已退出登录')
      }
    })
  } else if (key === 'profile') {
    emit('openProfile')
  } else if (key === 'password') {
    emit('openPassword')
  }
}

async function loadUnreadCount() {
  try {
    const [noticeCount, chatCount] = await Promise.all([
      noticeApi.getUnreadCount(),
      chatApi.getUnreadCount()
    ])
    messageStore.setUnreadCount(noticeCount, chatCount)
  } catch (error) {
    // 忽略错误
  }
}

function goToMessage() {
  if (messageTab.value === 'notice') {
    router.push('/message/notice')
  } else {
    router.push('/message/chat')
  }
}

async function handleMessagePopoverShow(show: boolean) {
  if (show) {
    loadUnreadCount()
    messagePage.value = 1
    hasMoreMessages.value = true
    if (messageTab.value === 'notice') {
      recentNotices.value = []
      await loadRecentNotices()
    } else {
      recentChats.value = []
      await loadRecentChats()
    }
  }
}

async function handleTabChange(tab: string) {
  messagePage.value = 1
  hasMoreMessages.value = true
  if (tab === 'notice') {
    recentNotices.value = []
    await loadRecentNotices()
  } else {
    recentChats.value = []
    await loadRecentChats()
  }
}

async function loadRecentNotices(append = false) {
  if (messageLoading.value) return
  try {
    messageLoading.value = true
    const res = await noticeApi.myNotices({ page: messagePage.value, pageSize: 10 })
    const list = res.list || []
    if (append) {
      recentNotices.value = [...recentNotices.value, ...list]
    } else {
      recentNotices.value = list
    }
    hasMoreMessages.value = list.length >= 10
  } catch (error) {
    // 忽略错误
  } finally {
    messageLoading.value = false
  }
}

async function loadRecentChats(append = false) {
  if (messageLoading.value) return
  try {
    messageLoading.value = true
    const res = await chatApi.getContacts()
    const list = res || []
    if (append) {
      recentChats.value = [...recentChats.value, ...list]
    } else {
      recentChats.value = list
    }
    hasMoreMessages.value = false
  } catch (error) {
    // 忽略错误
  } finally {
    messageLoading.value = false
  }
}

function handleMessageScroll(e: Event) {
  const target = e.target as HTMLElement
  const { scrollTop, scrollHeight, clientHeight } = target
  if (scrollHeight - scrollTop - clientHeight < 50 && hasMoreMessages.value && !messageLoading.value) {
    messagePage.value++
    if (messageTab.value === 'notice') {
      loadRecentNotices(true)
    }
  }
}

async function handleMarkAllRead() {
  try {
    await noticeApi.markAllAsRead()
    messageStore.clearNoticeCount()
    messagePage.value = 1
    await loadRecentNotices()
    message.success('已全部标记为已读')
  } catch (error) {
    // 忽略
  }
}

function formatMessageTime(time: string | undefined): string {
  if (!time) return ''
  const date = new Date(time)
  const now = new Date()
  const diff = now.getTime() - date.getTime()
  if (diff < 60000) return '刚刚'
  if (diff < 3600000) return Math.floor(diff / 60000) + '分钟前'
  if (diff < 86400000) return Math.floor(diff / 3600000) + '小时前'
  if (diff < 604800000) return Math.floor(diff / 86400000) + '天前'
  return `${date.getMonth() + 1}/${date.getDate()}`
}

function stripHtml(html: string | undefined): string {
  if (!html) return ''
  return html.replace(/<[^>]*>/g, '').substring(0, 50)
}

async function handleNoticeClick(item: SysNotice) {
  if (item.id) {
    try {
      await noticeApi.markAsRead(item.id)
      loadUnreadCount()
    } catch (error) {
      // 忽略
    }
  }
  router.push({ path: '/message/notice', query: { id: item.id?.toString() } })
}

async function handleChatClick(item: ChatMessage) {
  if (item.senderId) {
    try {
      await chatApi.markAsRead(item.senderId)
      loadUnreadCount()
    } catch (error) {
      // 忽略
    }
  }
  router.push({ path: '/message/chat', query: { userId: item.senderId?.toString() } })
}

onMounted(() => {
  messageStore.initWebSocket()
  loadUnreadCount()
  document.addEventListener('fullscreenchange', handleFullscreenChange)
})

onUnmounted(() => {
  document.removeEventListener('fullscreenchange', handleFullscreenChange)
})
</script>

<style lang="scss" scoped>
.layout-header {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  background: #FFFFFF;
  border-bottom: 1px solid #e8e8e8;
  transition: background-color 0.3s;

  @media (max-width: 768px) {
    padding: 0 10px;

    .header-right {
      gap: 4px;
    }

    .user-name {
      display: none;
    }
  }
}

.header-mobile-left {
  display: flex;
  align-items: center;
  gap: 8px;

  .mobile-logo-title {
    font-size: 16px;
    font-weight: 700;
    color: #111827;
    max-width: 140px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
}

body.dark-theme .header-mobile-left .mobile-logo-title {
  color: #fff;
}

body.dark-theme .layout-header {
  background: #18181c;
  border-bottom: 1px solid #3f3f46;
}

.layout-header.header-primary {
  background: var(--primary-color) !important;
  border-bottom-color: var(--primary-color) !important;

  .header-icon {
    color: #fff;
    &:hover { background: rgba(255, 255, 255, 0.15); }
  }

  .user-info:hover {
    background: rgba(255, 255, 255, 0.15);
  }

  .user-name {
    color: #fff;
  }
}

.header-logo {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-right: 24px;
}

.logo-img {
  width: 32px;
  height: 32px;
  object-fit: contain;
  border-radius: 8px;
}

.logo-icon {
  width: 32px;
  height: 32px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  font-weight: 700;
}

.logo-text {
  font-size: 18px;
  font-weight: 700;
  color: #111827;
  white-space: nowrap;
}

body.dark-theme .logo-text {
  color: #ffffffd1;
}

.header-menu {
  flex: 1;
  overflow: hidden;
}

.header-right {
  display: flex;
  align-items: center;
  gap: 8px;
}

.header-icon {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 8px;
  cursor: pointer;
  color: #6B7280;
  transition: all 0.2s;

  &:hover {
    background: #F3F4F6;
    color: #111827;
  }
}

body.dark-theme .header-icon {
  color: #9CA3AF;
  &:hover {
    background: #27272a;
    color: #fff;
  }
}

.user-info {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 4px 8px;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;

  &:hover {
    background: #F3F4F6;
  }
}

body.dark-theme .user-info:hover {
  background: #27272a;
}

.user-name {
  font-size: 14px;
  color: #374151;
  font-weight: 500;
}

body.dark-theme .user-name {
  color: #ffffffd1;
}

.message-popover {
  display: flex;
  flex-direction: column;
  height: 420px;
}

.message-tabs {
  padding: 0 16px;
  border-bottom: 1px solid #E5E7EB;
}

body.dark-theme .message-tabs {
  border-bottom-color: #3f3f46;
}

.message-list {
  flex: 1;
  overflow-y: auto;
  padding: 8px 12px;
}

.message-item {
  padding: 10px 12px;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.2s;

  &:hover {
    background: #F3F4F6;
  }
}

body.dark-theme .message-item:hover {
  background: #27272a;
}

.message-item-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 4px;
}

.message-time {
  font-size: 12px;
  color: #9CA3AF;
}

.message-title {
  font-size: 13px;
  font-weight: 600;
  color: #111827;
  margin-bottom: 2px;
}

body.dark-theme .message-title {
  color: #fff;
}

.message-content {
  font-size: 12px;
  color: #6B7280;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

body.dark-theme .message-content {
  color: #9CA3AF;
}

.message-item-row {
  display: flex;
  gap: 10px;
  align-items: center;
}

.message-item-content {
  flex: 1;
  overflow: hidden;
}

.message-sender {
  font-size: 13px;
  font-weight: 600;
  color: #111827;
}

body.dark-theme .message-sender {
  color: #fff;
}

.message-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 16px;
  border-top: 1px solid #E5E7EB;
}

body.dark-theme .message-footer {
  border-top-color: #3f3f46;
}

.message-loading, .message-no-more {
  text-align: center;
  padding: 8px 0;
  font-size: 12px;
  color: #9CA3AF;
}
</style>
