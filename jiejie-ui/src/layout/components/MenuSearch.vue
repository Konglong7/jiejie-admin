<template>
  <n-popover trigger="click" placement="bottom" :width="400" v-model:show="searchVisible">
    <template #trigger>
      <div class="header-icon" title="搜索菜单">
        <n-icon size="20"><SearchOutline /></n-icon>
      </div>
    </template>
    <div class="search-panel">
      <n-input
        v-model:value="searchKeyword"
        placeholder="搜索菜单..."
        clearable
        autofocus
        @input="handleSearch"
      >
        <template #prefix>
          <n-icon><SearchOutline /></n-icon>
        </template>
      </n-input>
      <div class="search-results" v-if="searchResults.length > 0">
        <div
          v-for="item in searchResults"
          :key="item.key"
          class="search-result-item"
          @click="goToMenu(item)"
        >
          <n-icon size="16" class="result-icon">
            <component :is="iconMap[item.iconName] || MenuOutline" />
          </n-icon>
          <span class="result-label">{{ item.label }}</span>
          <span class="result-path">{{ item.path }}</span>
        </div>
      </div>
      <n-empty v-else-if="searchKeyword" description="未找到匹配菜单" size="small" style="padding: 20px 0" />
    </div>
  </n-popover>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import {
  SearchOutline,
  MenuOutline,
  HomeOutline,
  SettingsOutline,
  PersonOutline,
  PeopleOutline,
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
import { iconMap as externalIconMap } from '@/utils/icons'
import type { MenuOption } from 'naive-ui'

const props = defineProps<{
  menuOptions: MenuOption[]
}>()

const router = useRouter()
const searchVisible = ref(false)
const searchKeyword = ref('')
const searchResults = ref<Array<{ key: string; label: string; path: string; iconName: string }>>([])

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

function getIconName(key: string): string {
  const iconMapping: Record<string, string> = {
    '/dashboard': 'HomeOutline',
    '/system/user': 'PersonOutline',
    '/system/role': 'PeopleOutline',
    '/system/menu': 'MenuOutline',
    '/system/dict': 'BookOutline',
    '/system/config': 'SettingsSharp',
    '/org/dept': 'GitNetworkOutline',
    '/org/post': 'IdCardOutline',
    '/log/operlog': 'ListOutline',
    '/log/loginlog': 'LogInOutline',
    '/system/file': 'DocumentOutline',
    '/message/notice': 'NotificationsOutline',
    '/message/chat': 'ChatbubbleOutline',
    '/monitor/online': 'PeopleCircleOutline',
    '/monitor/job': 'TimerOutline',
    '/monitor/cache': 'ServerOutline',
    '/monitor/server': 'DesktopOutline'
  }
  return iconMapping[key] || 'MenuOutline'
}

function handleSearch() {
  if (!searchKeyword.value.trim()) {
    searchResults.value = []
    return
  }

  const keyword = searchKeyword.value.toLowerCase()
  const results: Array<{ key: string; label: string; path: string; iconName: string }> = []

  function searchMenu(options: any[], parentPath: string = '') {
    for (const item of options) {
      const label = item.label as string
      if (label && label.toLowerCase().includes(keyword)) {
        if (!item.children) {
          results.push({
            key: item.key,
            label: label,
            path: parentPath ? `${parentPath} / ${label}` : label,
            iconName: getIconName(item.key)
          })
        }
      }
      if (item.children) {
        searchMenu(item.children, parentPath ? `${parentPath} / ${label}` : label)
      }
    }
  }

  searchMenu(props.menuOptions)
  searchResults.value = results.slice(0, 10)
}

function goToMenu(item: { key: string }) {
  router.push(item.key)
  searchVisible.value = false
  searchKeyword.value = ''
  searchResults.value = []
}
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

.search-panel {
  padding: 4px;
}

.search-results {
  margin-top: 8px;
  max-height: 280px;
  overflow-y: auto;
}

.search-result-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  border-radius: 6px;
  cursor: pointer;
  transition: background 0.2s;

  &:hover {
    background: #F3F4F6;
  }

  .result-icon {
    color: #6B7280;
    flex-shrink: 0;
  }

  .result-label {
    font-size: 14px;
    color: #111827;
    font-weight: 500;
  }

  .result-path {
    font-size: 12px;
    color: #9CA3AF;
    margin-left: auto;
  }
}

body.dark-theme .search-result-item {
  &:hover {
    background: #27272a;
  }

  .result-label {
    color: #fff;
  }
}
</style>
