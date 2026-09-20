// Jiejie Admin 高性能 Service Worker 缓存层
const CACHE_NAME = 'jiejie-cache-v1'

// 核心预缓存列表
const PRECACHE_URLS = [
  '/',
  '/index.html',
  '/vite.svg'
]

self.addEventListener('install', (event) => {
  self.skipWaiting()
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(PRECACHE_URLS).catch(() => {})
    })
  )
})

self.addEventListener('activate', (event) => {
  event.waitUntil(
    Promise.all([
      self.clients.claim(),
      caches.keys().then((keys) => {
        return Promise.all(
          keys.map((key) => {
            if (key !== CACHE_NAME) {
              return caches.delete(key)
            }
          })
        )
      })
    ])
  )
})

self.addEventListener('fetch', (event) => {
  const req = event.request
  const url = new URL(req.url)

  // 只处理 GET 请求
  if (req.method !== 'GET') {
    return
  }

  // 1. 静态资源（/assets/**）：带指纹哈希，采用 Cache-First 极速秒开策略
  if (url.pathname.startsWith('/assets/') || url.pathname.endsWith('.js') || url.pathname.endsWith('.css') || url.pathname.endsWith('.svg') || url.pathname.endsWith('.png')) {
    event.respondWith(
      caches.match(req).then((cachedResponse) => {
        if (cachedResponse) {
          // 命中缓存直接返回，异步后台静默更新
          fetch(req).then((networkResponse) => {
            if (networkResponse && networkResponse.status === 200) {
              caches.open(CACHE_NAME).then((cache) => cache.put(req, networkResponse))
            }
          }).catch(() => {})
          return cachedResponse
        }
        // 未命中则走网络并写入缓存
        return fetch(req).then((networkResponse) => {
          if (networkResponse && networkResponse.status === 200) {
            const responseClone = networkResponse.clone()
            caches.open(CACHE_NAME).then((cache) => cache.put(req, responseClone))
          }
          return networkResponse
        })
      })
    )
    return
  }

  // 2. 公共配置 API（加密配置、站点配置）：Stale-While-Revalidate
  if (url.pathname.includes('/api/crypto/config') || url.pathname.includes('/api/system/config/public')) {
    event.respondWith(
      caches.open(CACHE_NAME).then((cache) => {
        return cache.match(req).then((cachedResponse) => {
          const fetchPromise = fetch(req).then((networkResponse) => {
            if (networkResponse && networkResponse.status === 200) {
              cache.put(req, networkResponse.clone())
            }
            return networkResponse
          }).catch(() => cachedResponse)

          return cachedResponse || fetchPromise
        })
      })
    )
    return
  }
})
