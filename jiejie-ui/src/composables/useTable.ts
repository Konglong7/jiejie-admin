import { ref, reactive } from 'vue'

export interface TablePagination {
  page: number
  pageSize: number
  itemCount: number
  showSizePicker?: boolean
  pageSizes?: number[]
  showQuickJumper?: boolean
}

export interface UseTableOptions<T, S extends Record<string, any>> {
  fetchData: (params: S & { pageNum: number; pageSize: number }) => Promise<{
    list?: T[]
    records?: T[]
    total?: number
  } | T[]>
  defaultSearchForm?: S
  defaultPageSize?: number
  immediate?: boolean
}

export function useTable<T = any, S extends Record<string, any> = Record<string, any>>(
  options: UseTableOptions<T, S>
) {
  const {
    fetchData,
    defaultSearchForm = {} as S,
    defaultPageSize = 10,
    immediate = true
  } = options

  const loading = ref(false)
  const tableData = ref<T[]>([])
  const checkedRowKeys = ref<(string | number)[]>([])

  const pagination = reactive<TablePagination>({
    page: 1,
    pageSize: defaultPageSize,
    itemCount: 0,
    showSizePicker: true,
    pageSizes: [10, 20, 50, 100],
    showQuickJumper: true
  })

  const searchForm = reactive<S>({ ...defaultSearchForm })

  // 加载数据
  async function loadData() {
    loading.value = true
    try {
      const params = {
        ...searchForm,
        pageNum: pagination.page,
        pageSize: pagination.pageSize
      }
      const res = await fetchData(params)
      if (Array.isArray(res)) {
        tableData.value = res
        pagination.itemCount = res.length
      } else if (res) {
        tableData.value = res.records || res.list || []
        pagination.itemCount = res.total || 0
      }
    } catch (error) {
      console.error('加载表格数据失败:', error)
    } finally {
      loading.value = false
    }
  }

  // 搜索（重置页码为1）
  function handleSearch() {
    pagination.page = 1
    loadData()
  }

  // 重置表单并刷新
  function handleReset() {
    Object.keys(searchForm).forEach((key) => {
      searchForm[key as keyof S] = (defaultSearchForm as any)[key] ?? undefined
    })
    pagination.page = 1
    checkedRowKeys.value = []
    loadData()
  }

  // 页码改变
  function handlePageChange(page: number) {
    pagination.page = page
    loadData()
  }

  // 每页条数改变
  function handlePageSizeChange(pageSize: number) {
    pagination.pageSize = pageSize
    pagination.page = 1
    loadData()
  }

  // 清空选中行
  function clearSelection() {
    checkedRowKeys.value = []
  }

  if (immediate) {
    loadData()
  }

  return {
    loading,
    tableData,
    pagination,
    searchForm,
    checkedRowKeys,
    loadData,
    handleSearch,
    handleReset,
    handlePageChange,
    handlePageSizeChange,
    clearSelection
  }
}
