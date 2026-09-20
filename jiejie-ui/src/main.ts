import { createApp } from 'vue'
import { createPinia } from 'pinia'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
import {
  create,
  NConfigProvider,
  NLoadingBarProvider,
  NMessageProvider,
  NDialogProvider,
  NForm,
  NFormItem,
  NInput,
  NButton,
  NCheckbox,
  NIcon,
  NTag,
  NSpin,
  NModal,
  NDrawer,
  NDrawerContent,
  NCard,
  NAlert
} from 'naive-ui'
import App from './App.vue'
import router from './router'
import './styles/index.scss'
import { fetchCryptoConfig } from './utils/request'
import { useSiteStore } from './stores/site'

const app = createApp(App)

const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)

app.use(pinia)
app.use(router)

// 首屏关键路径：极速加载 App 和 登录页 必需的核心组件
const initialNaive = create({
  components: [
    NConfigProvider,
    NLoadingBarProvider,
    NMessageProvider,
    NDialogProvider,
    NForm,
    NFormItem,
    NInput,
    NButton,
    NCheckbox,
    NIcon,
    NTag,
    NSpin,
    NModal,
    NDrawer,
    NDrawerContent,
    NCard,
    NAlert
  ]
})
app.use(initialNaive)

// 后台异步加载全量 Naive UI 组件库，不阻塞首屏首包与渲染
let fullNaivePromise: Promise<any> | null = null
export const ensureFullNaive = () => {
  if (!fullNaivePromise) {
    fullNaivePromise = import('naive-ui').then((fullNaive) => {
      app.use(fullNaive.default)
      return fullNaive
    })
  }
  return fullNaivePromise
}

if (typeof window !== 'undefined') {
  const scheduleIdle = (window as any).requestIdleCallback || window.setTimeout
  scheduleIdle(() => {
    ensureFullNaive()
  }, 1000)
}

// 预加载加密配置
fetchCryptoConfig()

// 预加载站点配置
const siteStore = useSiteStore()
siteStore.loadConfig().then(() => {
  // 根据配置动态启用前端禁止调试
  if (siteStore.disableDevtool) {
    import('disable-devtool').then((DisableDevtool) => {
      DisableDevtool.default()
    })
  }
})

app.mount('#app')
