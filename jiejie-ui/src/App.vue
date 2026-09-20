<template>
  <n-config-provider :theme="themeStore.naiveTheme" :theme-overrides="currentThemeOverrides">
    <n-loading-bar-provider>
      <n-message-provider>
        <n-dialog-provider>
          <GlobalApiProvider />
          <router-view />
          <Watermark />
        </n-dialog-provider>
      </n-message-provider>
    </n-loading-bar-provider>
  </n-config-provider>
</template>

<script setup lang="ts">
import { defineComponent, computed, onMounted } from 'vue'
import { useMessage, useDialog, useLoadingBar } from 'naive-ui'
import { useThemeStore } from '@/stores/theme'
import Watermark from '@/components/Watermark/index.vue'
import { getLightThemeOverrides, getDarkThemeOverrides } from '@/styles/themeOverrides'

const themeStore = useThemeStore()

// 确保主题状态正确应用到 body
onMounted(() => {
  themeStore.updateBodyClass()
})

// 立即更新 body 类名（确保在渲染前应用）
themeStore.updateBodyClass()

// 注入全局API
const GlobalApiProvider = defineComponent({
  setup() {
    window.$message = useMessage()
    window.$dialog = useDialog()
    window.$loadingBar = useLoadingBar()
    return () => null
  }
})

// 根据当前主题动态计算配置
const currentThemeOverrides = computed(() => {
  return themeStore.isDark
    ? getDarkThemeOverrides(themeStore.primaryColor)
    : getLightThemeOverrides(themeStore.primaryColor)
})
</script>
