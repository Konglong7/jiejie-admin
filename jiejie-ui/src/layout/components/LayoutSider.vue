<template>
  <n-layout-sider
    bordered
    collapse-mode="width"
    :collapsed-width="64"
    :width="240"
    :collapsed="collapsed"
    show-trigger
    :position="themeStore.siderPosition === 'right' ? 'right' : 'left'"
    @collapse="$emit('update:collapsed', true)"
    @expand="$emit('update:collapsed', false)"
    class="layout-sider"
    :class="[`theme-${themeStore.mode}`, themeStore.siderPosition === 'right' ? 'sider-right' : '']"
  >
    <!-- Logo -->
    <div
      class="logo"
      :class="{ 'logo-collapsed': collapsed, 'logo-primary': themeStore.headerUsePrimaryColor }"
      :style="themeStore.headerUsePrimaryColor ? { background: themeStore.primaryColor, borderBottomColor: themeStore.primaryColor } : {}"
    >
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
      <transition name="fade">
        <span v-if="!collapsed" class="logo-text">{{ siteName }}</span>
      </transition>
    </div>

    <!-- 菜单 -->
    <n-menu
      :collapsed="collapsed"
      :collapsed-width="64"
      :collapsed-icon-size="22"
      :options="menuOptions"
      :value="activeMenu"
      @update:value="(key) => $emit('menuClick', key)"
      class="layout-menu"
    />
  </n-layout-sider>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import type { MenuOption } from 'naive-ui'
import { useSiteStore } from '@/stores/site'
import { useThemeStore } from '@/stores/theme'

defineProps<{
  collapsed: boolean
  menuOptions: MenuOption[]
  activeMenu: string
}>()

defineEmits<{
  (e: 'update:collapsed', val: boolean): void
  (e: 'menuClick', key: string): void
}>()

const siteStore = useSiteStore()
const themeStore = useThemeStore()

const siteName = computed(() => siteStore.siteName || 'Jiejie Admin')
const siteLogo = computed(() => siteStore.siteLogo)
</script>

<style lang="scss" scoped>
.layout-sider {
  background: #FFFFFF;
  transition: background-color 0.3s;

  :deep(.n-layout-sider-scroll-container) {
    display: flex;
    flex-direction: column;
    overflow: hidden;
  }
}

body.dark-theme .layout-sider {
  background: #18181c;
}

.logo {
  height: 60px;
  display: flex;
  align-items: center;
  padding: 0 20px;
  gap: 12px;
  border-bottom: 1px solid #E5E7EB;
  transition: all 0.3s;

  &.logo-collapsed {
    padding: 0 16px;
    justify-content: center;
  }
}

body.dark-theme .logo {
  border-bottom-color: #3f3f46;
}

.logo.logo-primary {
  .logo-text {
    color: #fff;
  }

  .logo-icon {
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  }
}

.logo-img {
  width: 32px;
  height: 32px;
  object-fit: contain;
  border-radius: 8px;
  flex-shrink: 0;
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
  flex-shrink: 0;
}

.logo-text {
  font-size: 18px;
  font-weight: 700;
  color: #111827;
  white-space: nowrap;
  transition: color 0.3s;
}

body.dark-theme .logo-text {
  color: #ffffffd1;
}

.layout-menu {
  flex: 1;
  padding: 12px 8px;
  overflow-y: auto;
}
</style>
