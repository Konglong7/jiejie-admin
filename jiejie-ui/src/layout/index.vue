<template>
  <n-layout
    :has-sider="themeStore.siderPosition !== 'top' && !isMobile"
    class="layout"
    :class="themeStore.siderPosition === 'top' && !isMobile ? 'layout-top' : ''"
  >
    <!-- 侧边栏（左侧/右侧模式，移动端自动隐藏并使用抽屉） -->
    <LayoutSider
      v-if="themeStore.siderPosition !== 'top' && !isMobile"
      v-model:collapsed="collapsed"
      :menu-options="menuOptions"
      :active-menu="activeMenu"
      @menu-click="handleMenuClick"
    />

    <!-- 主内容区 -->
    <n-layout>
      <!-- 顶部导航 -->
      <LayoutHeader
        :is-mobile="isMobile"
        :menu-options="menuOptions"
        :active-menu="activeMenu"
        :breadcrumbs="breadcrumbs"
        @toggle-mobile-menu="showMobileDrawer = !showMobileDrawer"
        @menu-click="handleMenuClick"
        @open-profile="showProfileModal = true"
        @open-password="showPasswordModal = true"
      />

      <!-- 页签栏 (PC端展示，移动端隐藏提升内容区域) -->
      <TabBar v-if="themeStore.showTabs && !isMobile" />

      <!-- 内容区 -->
      <n-layout-content class="layout-content">
        <router-view v-slot="{ Component }">
          <transition name="fade" mode="out-in">
            <component :is="Component" />
          </transition>
        </router-view>
      </n-layout-content>
    </n-layout>

    <!-- 移动端侧边抽屉菜单 (通过顶栏汉堡按钮呼出) -->
    <n-drawer v-model:show="showMobileDrawer" placement="left" :width="260">
      <n-drawer-content :body-content-style="{ padding: 0 }">
        <div class="mobile-drawer-header">
          <div class="mobile-drawer-logo">
            <img v-if="siteLogo" :src="siteLogo" class="logo-img" alt="Logo" />
            <div v-else class="logo-icon">{{ siteName.charAt(0) }}</div>
            <span class="logo-text">{{ siteName }}</span>
          </div>
        </div>
        <n-menu
          :options="menuOptions"
          :value="activeMenu"
          @update:value="handleMobileMenuClick"
        />
      </n-drawer-content>
    </n-drawer>

    <!-- 个人信息弹窗 -->
    <ProfileModal v-model:show="showProfileModal" />

    <!-- 修改密码弹窗 -->
    <PasswordModal v-model:show="showPasswordModal" />

    <!-- 消息通知浮窗 -->
    <MessageNotification />
  </n-layout>
</template>

<script setup lang="ts">
import { ref, computed, h, onMounted, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { NIcon, type MenuOption } from 'naive-ui'
import {
  HomeOutline,
  SettingsOutline,
  PersonOutline,
  PeopleOutline,
  MenuOutline,
  BookOutline,
  BusinessOutline,
  GitNetworkOutline,
  IdCardOutline,
  DocumentTextOutline,
  ListOutline,
  LogInOutline,
  PulseOutline,
  PeopleCircleOutline,
  TimerOutline,
  ServerOutline,
  DesktopOutline,
  SettingsSharp,
  FolderOpenOutline,
  DocumentOutline,
  CloudOutline,
  NotificationsOutline,
  ChatbubbleOutline
} from '@vicons/ionicons5'
import { useUserStore } from '@/stores/user'
import { useThemeStore } from '@/stores/theme'
import { useSiteStore } from '@/stores/site'
import ProfileModal from '@/components/ProfileModal.vue'
import PasswordModal from '@/components/PasswordModal.vue'
import MessageNotification from '@/components/MessageNotification.vue'
import TabBar from '@/components/TabBar.vue'
import LayoutSider from './components/LayoutSider.vue'
import LayoutHeader from './components/LayoutHeader.vue'
import { iconMap as externalIconMap } from '@/utils/icons'

const route = useRoute()
const router = useRouter()
const userStore = useUserStore()
const themeStore = useThemeStore()
const siteStore = useSiteStore()

const siteName = computed(() => siteStore.siteName || 'Jiejie Admin')
const siteLogo = computed(() => siteStore.siteLogo)

const collapsed = ref(false)
const showProfileModal = ref(false)
const showPasswordModal = ref(false)

// 移动端响应式与抽屉状态
const isMobile = ref(false)
const showMobileDrawer = ref(false)

function checkMobile() {
  isMobile.value = window.innerWidth <= 768
}

onMounted(() => {
  checkMobile()
  window.addEventListener('resize', checkMobile)
})

onUnmounted(() => {
  window.removeEventListener('resize', checkMobile)
})

function handleMobileMenuClick(key: string) {
  showMobileDrawer.value = false
  handleMenuClick(key)
}

// 图标字典
const iconMap: Record<string, any> = {
  HomeOutline,
  SettingsOutline,
  PersonOutline,
  PeopleOutline,
  MenuOutline,
  BookOutline,
  BusinessOutline,
  GitNetworkOutline,
  IdCardOutline,
  DocumentTextOutline,
  ListOutline,
  LogInOutline,
  PulseOutline,
  PeopleCircleOutline,
  TimerOutline,
  ServerOutline,
  DesktopOutline,
  SettingsSharp,
  FolderOpenOutline,
  DocumentOutline,
  CloudOutline,
  NotificationsOutline,
  ChatbubbleOutline,
  ...externalIconMap
}

function renderIcon(iconName?: string) {
  if (!iconName) return undefined
  const icon = iconMap[iconName]
  if (!icon) return undefined
  return () => h(NIcon, null, { default: () => h(icon) })
}

// 转换菜单数据
function convertMenus(menus: typeof userStore.menus): MenuOption[] {
  if (!menus || !Array.isArray(menus)) {
    return []
  }
  return menus
    .filter(menu => menu.visible === 1 && menu.type !== 3)
    .sort((a, b) => a.sort - b.sort)
    .map(menu => {
      let menuPath = menu.path || `/menu-${menu.id}`
      if (menuPath && !menuPath.startsWith('/') && menu.type === 2) {
        menuPath = '/' + menuPath
      }
      const isExternal = menu.isFrame === 1 && menu.component
      const menuKey = isExternal ? `external:${menu.component}` : menuPath

      const option: MenuOption = {
        label: menu.name,
        key: menuKey,
        icon: renderIcon(menu.icon)
      }

      if (!isExternal && menu.children && menu.children.length > 0) {
        const children = convertMenus(menu.children)
        if (children.length > 0) {
          option.children = children
        }
      }
      return option
    })
}

// 动态菜单
const menuOptions = computed<MenuOption[]>(() => {
  const homeMenu: MenuOption = {
    label: '首页',
    key: '/dashboard',
    icon: renderIcon('HomeOutline')
  }
  return [homeMenu, ...convertMenus(userStore.menus)]
})

// 当前激活菜单
const activeMenu = computed(() => (route.meta.activeMenu as string) || route.path)

// 面包屑
const breadcrumbs = computed(() => {
  const items: Array<{ path: string; title: string }> = []
  if (route.path === '/dashboard') {
    items.push({ path: '/dashboard', title: '首页' })
  } else if (route.path.startsWith('/system')) {
    items.push({ path: '/system', title: '系统管理' })
    if (route.path === '/system/user') {
      items.push({ path: '/system/user', title: '用户管理' })
    } else if (route.path === '/system/role') {
      items.push({ path: '/system/role', title: '角色管理' })
    } else if (route.path === '/system/menu') {
      items.push({ path: '/system/menu', title: '菜单管理' })
    }
  }
  return items
})

function handleMenuClick(key: string) {
  if (key.startsWith('external:')) {
    const url = key.replace('external:', '')
    window.open(url, '_blank')
    return
  }
  router.push(key)
}
</script>

<style lang="scss" scoped>
.layout {
  height: 100vh;
}

.layout-content {
  flex: 1;
  padding: 16px;
  overflow-y: auto;
  background: #F3F4F6;
  transition: background-color 0.3s;
}

body.dark-theme .layout-content {
  background: #101014;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.mobile-drawer-header {
  height: 60px;
  display: flex;
  align-items: center;
  padding: 0 16px;
  border-bottom: 1px solid #e5e7eb;
}

body.dark-theme .mobile-drawer-header {
  border-bottom-color: #3f3f46;
}

.mobile-drawer-logo {
  display: flex;
  align-items: center;
  gap: 10px;

  .logo-img {
    width: 28px;
    height: 28px;
    border-radius: 6px;
    object-fit: contain;
  }

  .logo-icon {
    width: 28px;
    height: 28px;
    border-radius: 6px;
    background: #4f46e5;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 15px;
  }

  .logo-text {
    font-size: 16px;
    font-weight: 700;
    color: #111827;
  }
}

body.dark-theme .mobile-drawer-logo .logo-text {
  color: #fff;
}

@media (max-width: 768px) {
  .layout-content {
    padding: 10px;
  }
}
</style>
