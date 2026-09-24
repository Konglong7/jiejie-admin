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
  NAlert,
  NTooltip
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
    NAlert,
    NTooltip
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
  try {
    if ('requestIdleCallback' in window) {
      (window as any).requestIdleCallback(() => {
        ensureFullNaive()
      }, { timeout: 2000 })
    } else {
      setTimeout(() => {
        ensureFullNaive()
      }, 1000)
    }
  } catch (e) {
    setTimeout(() => {
      ensureFullNaive()
    }, 1000)
  }
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
// 首屏渲染完成，通知 index.html 的冷启动加载动画停止计时
;(window as any).__jjBootDone?.()

// 注册 Service Worker 实现极速缓存与 0ms 二次呈现
if (typeof window !== 'undefined' && 'serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/sw.js').catch(() => {})
  })
}

// 访客停留期间保持云端实例唤醒
// Render 免费实例 15 分钟无入站请求即休眠。HR 打开页面后若先去处理别的事，
// 回来点「登录」就会撞上 30~60 秒冷启动；页面可见时定时回源一次可避免这种情况。
if (typeof window !== 'undefined') {
  const HEARTBEAT_URL = '/api/system/config/public'
  const HEARTBEAT_INTERVAL = 5 * 60 * 1000

  const heartbeat = () => {
    // 用原生 fetch 而非 axios 实例：绕开响应拦截器（该接口未登录时会返回 401）
    fetch(HEARTBEAT_URL, { method: 'GET', cache: 'no-store', credentials: 'omit' }).catch(() => {})
  }

  setInterval(() => {
    if (document.visibilityState === 'visible') heartbeat()
  }, HEARTBEAT_INTERVAL)

  // 从后台标签页切回来的瞬间就回源一次，让实例提前开始唤醒
  document.addEventListener('visibilitychange', () => {
    if (document.visibilityState === 'visible') heartbeat()
  })
}
