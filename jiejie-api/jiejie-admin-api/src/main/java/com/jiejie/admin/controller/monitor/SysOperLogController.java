package com.jiejie.admin.controller.monitor;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.jiejie.common.result.PageResult;
import com.jiejie.common.result.Result;
import com.jiejie.system.entity.SysOperLog;
import com.jiejie.system.service.SysOperLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 操作日志控制器
 */
@RestController
@RequestMapping("/monitor/operlog")
@RequiredArgsConstructor
public class SysOperLogController {

    private final SysOperLogService operLogService;

    /**
     * 分页查询
     */
    @GetMapping("/page")
    @SaCheckPermission("monitor:operlog:list")
    public Result<PageResult<SysOperLog>> page(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String title,
            @RequestParam(required = false) String operName,
            @RequestParam(required = false) Integer status) {
        return Result.ok(operLogService.page(page, pageSize, title, operName, status));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    @SaCheckPermission("monitor:operlog:delete")
    public Result<Void> delete(@PathVariable Long id) {
        operLogService.removeById(id);
        return Result.ok();
    }

    /**
     * 清空日志
     */
    @DeleteMapping("/clean")
    @SaCheckPermission("monitor:operlog:delete")
    public Result<Void> clean() {
        operLogService.clean();
        return Result.ok();
    }
}
