import { shallowRef, onMounted, onUnmounted, watch, type Ref } from 'vue'
import { useThemeStore } from '@/stores/theme'

export function useECharts(elRef: Ref<HTMLElement | null | undefined>) {
  const themeStore = useThemeStore()
  const chartInstance = shallowRef<any>(null)
  let resizeObserver: ResizeObserver | null = null
  let resizeTimer: number | null = null

  // 初始化图表
  async function initChart() {
    if (!elRef.value) return
    const echarts = await import('echarts')
    if (!elRef.value) return

    // 如果已存在实例，先销毁
    if (chartInstance.value) {
      chartInstance.value.dispose()
    }

    // 根据暗黑模式初始化
    const theme = themeStore.isDark ? 'dark' : undefined
    chartInstance.value = echarts.init(elRef.value, theme)

    // 绑定 ResizeObserver
    setupResizeObserver()
  }

  // 设置图表配置
  async function setOption(option: Record<string, any>, notMerge = false) {
    if (!chartInstance.value) {
      await initChart()
    }
    if (chartInstance.value) {
      chartInstance.value.setOption(option, notMerge)
    }
  }

  // 尺寸调整
  function resize() {
    if (chartInstance.value) {
      chartInstance.value.resize()
    }
  }

  function handleResize() {
    if (resizeTimer) clearTimeout(resizeTimer)
    resizeTimer = window.setTimeout(() => {
      resize()
    }, 100)
  }

  function setupResizeObserver() {
    if (resizeObserver || !elRef.value) return
    if (typeof ResizeObserver !== 'undefined') {
      resizeObserver = new ResizeObserver(() => {
        handleResize()
      })
      resizeObserver.observe(elRef.value)
    }
  }

  function cleanupResizeObserver() {
    if (resizeObserver) {
      resizeObserver.disconnect()
      resizeObserver = null
    }
    if (resizeTimer) {
      clearTimeout(resizeTimer)
      resizeTimer = null
    }
  }

  // 监听暗黑主题变化，平滑切换图表主题
  watch(
    () => themeStore.isDark,
    async () => {
      if (chartInstance.value && elRef.value) {
        const currentOption = chartInstance.value.getOption()
        chartInstance.value.dispose()
        chartInstance.value = null
        await initChart()
        if (currentOption && chartInstance.value) {
          chartInstance.value.setOption(currentOption)
        }
      }
    }
  )

  onMounted(() => {
    window.addEventListener('resize', handleResize)
  })

  onUnmounted(() => {
    window.removeEventListener('resize', handleResize)
    cleanupResizeObserver()
    if (chartInstance.value) {
      chartInstance.value.dispose()
      chartInstance.value = null
    }
  })

  return {
    chartInstance,
    initChart,
    setOption,
    resize,
    getInstance: () => chartInstance.value
  }
}
