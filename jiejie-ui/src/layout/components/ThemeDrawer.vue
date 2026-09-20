<template>
  <n-popover trigger="click" placement="bottom-end" :width="300">
    <template #trigger>
      <div class="header-icon" title="主题设置">
        <n-icon size="20"><ColorPaletteOutline /></n-icon>
      </div>
    </template>
    <div class="theme-panel">
      <div class="theme-section">
        <div class="theme-title">菜单位置</div>
        <div class="layout-options">
          <div
            class="layout-option"
            :class="{ active: themeStore.siderPosition === 'left' }"
            @click="themeStore.setSiderPosition('left')"
          >
            <div class="layout-preview layout-left">
              <div class="preview-sider"></div>
              <div class="preview-main"></div>
            </div>
            <span>左侧菜单</span>
          </div>
          <div
            class="layout-option"
            :class="{ active: themeStore.siderPosition === 'right' }"
            @click="themeStore.setSiderPosition('right')"
          >
            <div class="layout-preview layout-right">
              <div class="preview-main"></div>
              <div class="preview-sider"></div>
            </div>
            <span>右侧菜单</span>
          </div>
          <div
            class="layout-option"
            :class="{ active: themeStore.siderPosition === 'top' }"
            @click="themeStore.setSiderPosition('top')"
          >
            <div class="layout-preview layout-top">
              <div class="preview-header"></div>
              <div class="preview-content"></div>
            </div>
            <span>顶部菜单</span>
          </div>
        </div>
      </div>
      <div class="theme-section">
        <div class="theme-title">主题风格</div>
        <div class="theme-modes">
          <div
            v-for="theme in themeOptions"
            :key="theme.value"
            class="theme-mode"
            :class="{ active: themeStore.mode === theme.value }"
            @click="themeStore.setMode(theme.value)"
          >
            <div class="theme-mode-preview" :style="{ background: theme.color }">
              <n-icon v-if="themeStore.mode === theme.value" :color="theme.value === 'light' ? '#18a058' : '#fff'"><CheckmarkOutline /></n-icon>
            </div>
            <span>{{ theme.label }}</span>
          </div>
        </div>
      </div>
      <div class="theme-section">
        <div class="theme-title">主题色</div>
        <div class="color-options">
          <div
            v-for="item in themeColors"
            :key="item.color"
            class="color-option"
            :class="{ active: themeStore.primaryColor === item.color }"
            :style="{ backgroundColor: item.color }"
            :title="item.name"
            @click="themeStore.setPrimaryColor(item.color)"
          >
            <n-icon v-if="themeStore.primaryColor === item.color" color="#fff"><CheckmarkOutline /></n-icon>
          </div>
        </div>
      </div>
      <div class="theme-section">
        <div class="theme-switch-row">
          <span class="theme-title" style="margin-bottom: 0">顶栏应用主题色</span>
          <n-switch :value="themeStore.headerUsePrimaryColor" @update:value="themeStore.setHeaderUsePrimaryColor" size="small" />
        </div>
      </div>
      <div class="theme-section">
        <div class="theme-switch-row">
          <span class="theme-title" style="margin-bottom: 0">显示页签</span>
          <n-switch :value="themeStore.showTabs" @update:value="themeStore.setShowTabs" size="small" />
        </div>
      </div>
    </div>
  </n-popover>
</template>

<script setup lang="ts">
import { ColorPaletteOutline, CheckmarkOutline } from '@vicons/ionicons5'
import { useThemeStore, themeColors } from '@/stores/theme'

const themeStore = useThemeStore()

const themeOptions = [
  { value: 'dark' as const, color: '#001529', label: '暗色主题' },
  { value: 'light' as const, color: '#ffffff', label: '亮色主题' }
]
</script>

<style lang="scss" scoped>
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

.theme-panel {
  padding: 8px 0;
}

.theme-section {
  padding: 12px 0;
  border-bottom: 1px solid #E5E7EB;

  &:last-child {
    border-bottom: none;
    padding-bottom: 0;
  }

  &:first-child {
    padding-top: 0;
  }
}

body.dark-theme .theme-section {
  border-bottom-color: #3f3f46;
}

.theme-title {
  font-size: 13px;
  font-weight: 600;
  color: #374151;
  margin-bottom: 10px;
}

body.dark-theme .theme-title {
  color: #d1d5db;
}

.layout-options {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 12px;
}

.layout-option {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  cursor: pointer;

  span {
    font-size: 12px;
    color: #6B7280;
  }

  &.active {
    span {
      color: var(--primary-color, #18a058);
      font-weight: 600;
    }

    .layout-preview {
      border-color: var(--primary-color, #18a058);
      box-shadow: 0 0 0 1px var(--primary-color, #18a058);
    }
  }
}

.layout-preview {
  width: 60px;
  height: 44px;
  border-radius: 6px;
  border: 1px solid #E5E7EB;
  background: #F9FAFB;
  overflow: hidden;
  display: flex;
  transition: all 0.2s;

  &.layout-left {
    .preview-sider {
      width: 16px;
      height: 100%;
      background: #111827;
    }
    .preview-main {
      flex: 1;
      height: 100%;
      background: #fff;
    }
  }

  &.layout-right {
    .preview-main {
      flex: 1;
      height: 100%;
      background: #fff;
    }
    .preview-sider {
      width: 16px;
      height: 100%;
      background: #111827;
    }
  }

  &.layout-top {
    flex-direction: column;
    .preview-header {
      height: 12px;
      width: 100%;
      background: #111827;
    }
    .preview-content {
      flex: 1;
      width: 100%;
      background: #fff;
    }
  }
}

.theme-modes {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12px;
}

.theme-mode {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  cursor: pointer;

  span {
    font-size: 12px;
    color: #6B7280;
  }

  &.active {
    span {
      color: var(--primary-color, #18a058);
      font-weight: 600;
    }

    .theme-mode-preview {
      border-color: var(--primary-color, #18a058);
      box-shadow: 0 0 0 1px var(--primary-color, #18a058);
    }
  }
}

.theme-mode-preview {
  width: 60px;
  height: 40px;
  border-radius: 6px;
  border: 1px solid #E5E7EB;
  display: flex;
  align-items: center;
  justify-content: center;
}

.color-options {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.color-option {
  width: 24px;
  height: 24px;
  border-radius: 4px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.2s;

  &:hover {
    transform: scale(1.1);
  }

  &.active {
    box-shadow: 0 0 0 2px #fff, 0 0 0 4px var(--primary-color, #18a058);
  }
}

.theme-switch-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>
