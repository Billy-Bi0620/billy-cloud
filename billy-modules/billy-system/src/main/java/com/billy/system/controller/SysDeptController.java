package com.billy.system.controller;

import com.billy.common.annotation.LoginUser;
import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysDept;
import com.billy.system.service.ISysDeptService;
import com.billy.system.vo.SysDeptEditVO;
import com.billy.system.vo.SysDeptFilterVO;
import com.billy.system.vo.SysDeptInsertVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Set;

/**
 * 部门 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@Validated
@RestController
@RequestMapping("dept")
@Api(value = "SysDeptController",tags = "部门管理")
@Slf4j
public class SysDeptController extends BaseController
{
    @Autowired
    private ISysDeptService sysDeptService;

    /**
     * 查询部门
     */
    @GetMapping("get")
    @ApiOperation(value = "根据部门id查询部门",notes = "根据部门id查询部门")
    public SysDept selectSysDeptByDeptId(@RequestParam @Validated
        @ApiParam(name = "deptId",type = "Integer",value = "部门id,必须是一个整数",example = "100")
        @Min(value = 1,message = "最小值需大于0")
        @Max(value = 2147483647,message = "超出最大值")
        @NotNull(message = "不允许空值")
    Long deptId)
    {
        SysDept dept = sysDeptService.selectDeptById(deptId);
//        if (dept==null || dept.getDeptId() == 0){
//            return AjaxResult.error("部门不存在");
//        }
        return dept;

    }

    /**
     * 查询部门列表
     */
    @GetMapping("list")
    @ApiOperation(value = "部门列表",notes = "部门列表")
    public AjaxResult list(@Validated SysDeptFilterVO deptVo, PageDomain pageDomain)
    {
        startPage();
        return AjaxResult.pageSuccess(sysDeptService.selectDeptList(deptVo));
    }

    /**
     * 查询所有可用部门
     */
    @GetMapping("list/enable")
    @ApiOperation(value = "查询所有可用部门",notes = "查询所有可用部门")
    public AjaxResult listEnable()
    {
        SysDeptFilterVO vo = new SysDeptFilterVO();
        vo.setStatus("0");
        return AjaxResult.pageSuccess(sysDeptService.selectDeptList(vo));
    }

    /**
     * 新增保存部门
     */
    @HasPermissions("system:dept:add")
    @PostMapping("save")
    @OperLog(title = "部门管理", businessType = BusinessType.INSERT)
    @ApiOperation(value = "新增部门",notes = "新增部门")
    public AjaxResult addSave(@RequestBody @Validated SysDeptInsertVO deptVo)
    {
        SysDept sysDept = BeanMapper.map(deptVo, SysDept.class);
        sysDept.setStatus("0");
        sysDept.setDelFlag("0");
        sysDept.setCreateBy(this.getLoginName());
        int result = sysDeptService.insertDept(sysDept);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 修改保存部门
     */
    @HasPermissions("system:dept:edit")
    @PostMapping("update")
    @OperLog(title = "部门管理", businessType = BusinessType.UPDATE)
    @ApiOperation(value = "修改部门",notes = "修改部门")
    public AjaxResult editSave(@RequestBody @Validated SysDeptEditVO deptVo)
    {
        SysDept sysDept = BeanMapper.map(deptVo, SysDept.class);
        sysDept.setUpdateBy(this.getLoginName());
        int result = sysDeptService.updateDept(sysDept);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 删除部门
     */
    @HasPermissions("system:dept:remove")
    @ApiOperation(value = "删除部门",notes = "删除部门")
    @OperLog(title = "部门管理", businessType = BusinessType.DELETE)
    @PostMapping("remove")
    public AjaxResult remove(@RequestParam @Validated
        @ApiParam(name = "deptId",type = "Integer",value = "部门id",example = "")
        @Min(value = 1,message = "最小值需大于0")
        @Max(value = 2147483647,message = "超出最大值")
        @NotNull(message = "不允许空值") Long deptId)
    {
        int result = sysDeptService.deleteDeptById(deptId);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 加载角色部门（数据权限）列表树
     */
    @ApiOperation(value = "加载角色部门",notes = "加载角色部门")
    @GetMapping("/roleInDepts")
    public AjaxResult deptTreeData(@RequestParam @Validated
        @ApiParam(name = "roleId",type = "Integer",value = "角色id",example = "")
        @Min(value = 1,message = "最小值需大于0")
        @Max(value = 2147483647,message = "超出最大值")
        @NotNull(message = "不允许空值") Long roleId)
    {
        Set<String> result = sysDeptService.roleDeptIds(roleId);

        if (result==null || result.size() == 0){
            return AjaxResult.error("角色的部门是空列表");
        }

        return AjaxResult.success(result);
    }
}
