package com.billy.system.controller;


import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.system.domain.SysLogininfor;
import com.billy.system.service.ISysLogininforService;
import com.billy.system.vo.SysLogininforFilterVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * 系统访问记录 提供者
 *
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("logininfor")
@Validated
@Api(value = "SysLoginInfoController", tags = "系统访问记录")
public class SysLoginInforController extends BaseController {
    @Autowired
    private ISysLogininforService sysLogininforService;

    /**
     * 查询系统访问记录列表
     */
    @GetMapping("list")
    @ApiOperation(value = "查询系统访问记录列表", notes = "查询系统访问记录列表", response = SysLogininfor.class)
    public AjaxResult list(@Validated SysLogininforFilterVO sysLogininfor) {
        startPage();
        List<SysLogininfor> list = sysLogininforService.selectLogininforList(sysLogininfor);
        return AjaxResult.pageSuccess(list);
    }

    /**
     * @description: rpc调用 新增保存系统访问记录
     * @author: 毕苗苗
     * @date: 2022/10/14 13:46
     * @param: [sysLogininfor]
     * @return: void
     **/
    @PostMapping("save")
    public void addSave(@RequestBody SysLogininfor sysLogininfor) {
        sysLogininforService.insertLogininfor(sysLogininfor);
    }

    /**
     * 删除系统访问记录
     */
    @ApiOperation(value = "删除系统访问记录", notes = "删除系统访问记录")
    @OperLog(title = "访问日志", businessType = BusinessType.DELETE)
    @HasPermissions("monitor:loginlog:remove")
    @PostMapping("remove")
    public AjaxResult remove(@RequestParam @ApiParam(required = true, value = "根据主键字符串进行删除。如 1,2,3,4") @NotEmpty(message = "不能为空") String ids) {
        return toAjax(sysLogininforService.deleteLogininforByIds(ids));
    }

    @OperLog(title = "访问日志", businessType = BusinessType.CLEAN)
    @HasPermissions("monitor:loginlog:remove")
    @PostMapping("/clean")
    @ApiOperation(value = "清除所以访问记录", notes = "清除所以访问记录")
    public AjaxResult clean() {
        sysLogininforService.cleanLogininfor();
        return AjaxResult.success();
    }

}
