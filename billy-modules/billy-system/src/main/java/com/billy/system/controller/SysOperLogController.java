package com.billy.system.controller;


import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.utils.poi.ExcelUtil;
import com.billy.system.domain.SysOperLog;
import com.billy.system.service.ISysOperLogService;
import com.billy.system.vo.SysOperLogFilterVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 操作日志记录 提供者
 *
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("operLog")
@Validated
@Api(value = "SysOperLogController", tags = "操作日志记录")
public class SysOperLogController extends BaseController {
    @Autowired
    private ISysOperLogService sysOperLogService;

    /**
     * 查询操作日志记录
     */
    @GetMapping("get")
    @ApiOperation(value = "查询操作日志记录", notes = "查询操作日志记录", response = SysOperLog.class)
    public AjaxResult get(@RequestParam @NotNull @Range(min = 1, max = Integer.MAX_VALUE, message = "非法Id") Long operId) {
        return AjaxResult.success(sysOperLogService.selectOperLogById(operId));
    }

    /**
     * 查询操作日志记录列表
     */
    @HasPermissions("monitor:operlog:list")
    @PostMapping("list")
    @ApiOperation(value = "查询操作日志记录列表", notes = "查询操作日志记录列表", response = SysOperLog.class)
    public AjaxResult list(@Validated SysOperLogFilterVO sysOperLog) {
        startPage();
        List<SysOperLog> list = sysOperLogService.selectOperLogList(sysOperLog);
        return AjaxResult.pageSuccess(list);
    }

    /**
     * 导出操作日志
     */
    @OperLog(title = "导出操作日志", businessType = BusinessType.EXPORT)
    @HasPermissions("monitor:operlog:export")
    @PostMapping("/export")
    @ApiOperation(value = "导出操作日志", notes = "导出操作日志", response = SysOperLog.class)
    public AjaxResult export(SysOperLogFilterVO operLog) {
        List<SysOperLog> list = sysOperLogService.selectOperLogList(operLog);
        ExcelUtil<SysOperLog> util = new ExcelUtil<>(SysOperLog.class);
        return util.exportExcel(list, "操作日志");
    }

    /**
     * @description: rpc调用 新增保存操作日志记录
     * @author: 毕苗苗
     * @date: 2022/10/14 13:46
     * @param: [sysOperLog]
     * @return: void
     **/
    @PostMapping("save")
    public void addSave(@RequestBody SysOperLog sysOperLog) {
        sysOperLogService.insertOperlog(sysOperLog);
    }

    /**
     * 删除操作日志记录
     */
    @HasPermissions("monitor:operlog:remove")
    @PostMapping("remove")
    @ApiOperation(value = "删除操作日志记录", notes = "删除操作日志记录")
    public AjaxResult remove(@RequestParam @ApiParam(required = true, value = "根据主键字符串进行删除。如 1,2,3,4") @NotEmpty(message = "不能为空") String ids) {
        return toAjax(sysOperLogService.deleteOperLogByIds(ids));
    }

    @OperLog(title = "清空操作日志", businessType = BusinessType.CLEAN)
    @HasPermissions("monitor:operlog:remove")
    @PostMapping("/clean")
    @ApiOperation(value = "清空操作日志", notes = "清空操作日志")
    public AjaxResult clean() {
        sysOperLogService.cleanOperLog();
        return AjaxResult.success();
    }
}
