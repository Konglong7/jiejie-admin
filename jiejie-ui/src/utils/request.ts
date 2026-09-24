import axios, { type AxiosInstance, type AxiosRequestConfig, type AxiosResponse } from 'axios'
import { useUserStore } from '@/stores/user'

// API响应结构
interface ApiResponse<T = any> {
  code: number
  message: string
  data: T
}

// 加密配置
interface CryptoConfig {
  enabled: boolean
  publicKey: string
  aesKey: string // AES密钥的Base64编码
}

// 加密配置缓存与并发请求 Promise 缓存
let cryptoConfigCache: CryptoConfig | null = null
let cryptoConfigPromise: Promise<CryptoConfig> | null = null
const CRYPTO_CACHE_KEY = 'jiejie_crypto_config_cache'

// 获取加密配置（带本地持久化、并发去重与单例缓存）
export async function fetchCryptoConfig(): Promise<CryptoConfig> {
  if (cryptoConfigCache) {
    return cryptoConfigCache
  }
  // 优先读取本地会话缓存（有效周期 4 小时），实现 0ms 本地直出
  if (typeof window !== 'undefined') {
    try {
      const cached = sessionStorage.getItem(CRYPTO_CACHE_KEY)
      if (cached) {
        const item = JSON.parse(cached)
        if (item && item.data && Date.now() - item.ts < 4 * 3600 * 1000) {
          cryptoConfigCache = item.data
          return cryptoConfigCache!
        }
      }
    } catch (e) {}
  }
  if (cryptoConfigPromise) {
    return cryptoConfigPromise
  }
  cryptoConfigPromise = (async () => {
    try {
      const response = await axios.get('/api/crypto/config')
      if (response.data?.code === 200) {
        cryptoConfigCache = response.data.data
        if (typeof window !== 'undefined') {
          try {
            sessionStorage.setItem(CRYPTO_CACHE_KEY, JSON.stringify({ ts: Date.now(), data: cryptoConfigCache }))
          } catch (e) {}
        }
        return cryptoConfigCache!
      }
    } catch (error) {
      console.error('获取加密配置失败', error)
    } finally {
      cryptoConfigPromise = null
    }
    return { enabled: false, publicKey: '', aesKey: '' }
  })()
  return cryptoConfigPromise
}

// 清除加密配置缓存
export function clearCryptoConfigCache() {
  cryptoConfigCache = null
  cryptoConfigPromise = null
  if (typeof window !== 'undefined') {
    try {
      sessionStorage.removeItem(CRYPTO_CACHE_KEY)
    } catch (e) {}
  }
}

// 判断是否是AES加密的响应数据（格式：iv.encryptedData）
function isAesEncryptedData(data: any): boolean {
  if (typeof data !== 'string') {
    return false
  }
  const parts = data.split('.')
  if (parts.length !== 2) {
    return false
  }
  // 检查两部分是否都是有效的Base64，且IV长度正确
  try {
    atob(parts[0])
    atob(parts[1])
    // IV是12字节，Base64后是16字符
    return parts[0].length === 16 && parts[1].length > 10
  } catch {
    return false
  }
}

// AES-GCM解密
async function aesDecrypt(encryptedData: string, aesKeyBase64: string): Promise<string> {
  const parts = encryptedData.split('.')
  if (parts.length !== 2) {
    throw new Error('加密数据格式错误')
  }
  
  const iv = Uint8Array.from(atob(parts[0]), c => c.charCodeAt(0))
  const data = Uint8Array.from(atob(parts[1]), c => c.charCodeAt(0))
  const keyBytes = Uint8Array.from(atob(aesKeyBase64), c => c.charCodeAt(0))
  
  // 导入AES密钥
  const aesKey = await crypto.subtle.importKey(
    'raw',
    keyBytes,
    { name: 'AES-GCM' },
    false,
    ['decrypt']
  )
  
  // 解密
  const decrypted = await crypto.subtle.decrypt(
    { name: 'AES-GCM', iv: iv },
    aesKey,
    data
  )
  
  return new TextDecoder().decode(decrypted)
}

// 解密响应数据
async function decryptResponseData(data: string): Promise<any> {
  const config = await fetchCryptoConfig()
  
  if (!config.aesKey) {
    return data
  }
  
  try {
    const decryptedStr = await aesDecrypt(data, config.aesKey)
    return JSON.parse(decryptedStr)
  } catch (error) {
    console.error('响应解密失败', error)
    // 解密失败可能是密钥过期，清除缓存
    cryptoConfigCache = null
    return data
  }
}

// 创建axios实例
// 后端 API 统一使用 /api 前缀
const service: AxiosInstance = axios.create({
  baseURL: '/api',
  // 云端免费实例休眠后冷启动需 40~50 秒，超时窗口必须长于冷启动，否则首访请求必然超时
  timeout: 60000
})

// 请求拦截器
service.interceptors.request.use(
  (config) => {
    const userStore = useUserStore()
    if (userStore.token) {
      config.headers['Authorization'] = userStore.token
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

// 防止重复 logout
let isLoggingOut = false

// 响应拦截器
service.interceptors.response.use(
  async (response: AxiosResponse<ApiResponse>) => {
    // 如果是 blob 类型响应（文件下载），直接返回
    if (response.config.responseType === 'blob') {
      return response.data
    }

    const res = response.data
    
    if (res.code !== 200) {
      // logout 接口返回 401 时不显示错误消息（避免干扰）
      const isLogoutRequest = response.config.url?.includes('/auth/logout')
      
      // 401 未授权，弹出明确提示并跳转登录（防止重复调用）
      if (res.code === 401 && !isLoggingOut && !isLogoutRequest) {
        isLoggingOut = true
        window.$message?.error('当前用户登录已过期，请重新登录')
        const userStore = useUserStore()
        await userStore.logout()
        isLoggingOut = false
        return Promise.reject(new Error('登录已过期'))
      }

      if (!isLogoutRequest) {
        window.$message?.error(res.message || '请求失败')
      }
      
      return Promise.reject(new Error(res.message || '请求失败'))
    }
    
    // 检查响应数据是否是AES加密的，自动解密
    if (isAesEncryptedData(res.data)) {
      try {
        return await decryptResponseData(res.data)
      } catch (error) {
        console.error('解密响应失败', error)
        return res.data
      }
    }
    
    return res.data
  },
  (error) => {
    const status = error.response?.status
    const isTimeout = error.code === 'ECONNABORTED' || /timeout/i.test(error.message || '')
    let message = error.response?.data?.message || error.message || '网络错误'
    // 冷启动期间抛出的 axios 英文原文对访客不可读，统一替换为可操作的引导文案
    if (isTimeout || !error.response) {
      message = '服务正在唤醒，网络响应较慢，请稍等几秒后重试'
    } else if (status === 502 || status === 503 || status === 504) {
      message = '云端实例正在启动中，请稍等片刻再试一次'
    }
    console.warn('[request]', error.config?.url, error.code || status, error.message)
    window.$message?.error(message)
    return Promise.reject(error)
  }
)

// 封装请求方法
export function request<T = any>(config: AxiosRequestConfig): Promise<T> {
  return service(config) as Promise<T>
}

export default service
