package com.billy.system.controller;


import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysRole;
import com.billy.system.domain.SysUserRole;
import com.billy.system.service.ISysRoleService;
import com.billy.system.vo.*;
import io.swagger.annotations.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 角色 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("role")
@Validated
@Api(value = "SysRoleController",tags = "角色管理")
@Slf4j
public class SysRoleController extends BaseController
{
    @Autowired
    private ISysRoleService sysRoleService;

    /**
     * 查询角色
     */
    @GetMapping("get")
    @ApiOperation(value = "根据角色Id查询角色",notes = "根据角色Id查询角色")
    public SysRole selectSysRoleByRoleId(@RequestParam @Validated
        @ApiParam(name = "roleId",type = "Integer",value = "角色id,自然数",example = "1")
        @Min(value = 1,message = "最小值需大于0")
        @Max(value = 2147483647,message = "超出最大值")
        @NotNull(message = "不允许空值")
   Long roleId)
    {
        SysRole role = sysRoleService.selectRoleById(roleId);
//        if (role==null || role.getRoleId() == 0){
//            return AjaxResult.error("角色不存在");
//        }
        return role;

    }

    /**
     * 查询角色列表
     */
    @GetMapping("list")
    @ApiOperation(value = "查询角色列表",notes = "查询角色列表")
    public AjaxResult list(@Validated SysRoleFilterVO roleVo, PageDomain pageDomain)
    {
        startPage();
        return AjaxResult.pageSuccess(sysRoleService.selectRoleList(roleVo));
    }

    @GetMapping("all")
    @ApiOperation(value = "查询所有角色",notes = "查询所有角色")
    public AjaxResult all()
    {
        return AjaxResult.success(sysRoleService.selectRoleAll());
    }

    /**
     * 新增保存角色
     */
    @HasPermissions("system:role:add")
    @PostMapping("save")
    @OperLog(title = "角色管理", businessType = BusinessType.INSERT)
    @ApiOperation(value = "新增角色",notes = "新增角色")
    public AjaxResult addSave(@RequestBody @Validated SysRoleInsertVO roleVo)
    {
        SysRole sysRole = BeanMapper.map(roleVo, SysRole.class);
        int result = sysRoleService.insertRole(sysRole);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 修改保存角色
     */
    @OperLog(title = "角色管理", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    @ApiOperation(value = "修改保存角色",notes = "修改保存角色")
    public AjaxResult editSave(@RequestBody @Validated SysRoleEditVO roleVo)
    {
        SysRole sysRole = BeanMapper.map(roleVo, SysRole.class);
        int result = sysRoleService.updateRole(sysRole);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }

        return AjaxResult.success(result);
    }

    /**
     * 角色状态修改
     */
    @HasPermissions("system:role:edit")
    @OperLog(title = "角色管理", businessType = BusinessType.UPDATE)
    @PostMapping("/changeStatus")
    @ApiOperation(value = "修改角色状态",notes = "修改角色状态")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "roleId", dataType = "Long", required = true, value = "角色id(必须是一个整数)"),
            @ApiImplicitParam(paramType = "query", name = "roleStatus", dataType = "String", required = true, value = "状态(0正常|1停用)")
    })
    public AjaxResult changeStatus(@RequestParam @Validated Long roleId,String roleStatus)
    {
        SysRole role = new SysRole();
        role.setRoleId(roleId);
        role.setStatus(roleStatus);
        role.setUpdateBy(this.getLoginName());

        int result = sysRoleService.changeStatus(role);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }

        return AjaxResult.success(result);
    }
    
    /**
     * 保存角色分配数据权限
     */
    @HasPermissions("system:role:edit")
    @OperLog(title = "角色管理", businessType = BusinessType.UPDATE)
    @PostMapping("/authDataScope")
    @ApiOperation(value = "修改角色权限",notes = "修改角色权限")
    public AjaxResult authDataScopeSave(@RequestBody @Validated SysRoleDataScopeVO roleVo)
    {
        SysRole sysRole = BeanMapper.map(roleVo, SysRole.class);
        sysRole.setUpdateBy(getLoginName());
        if (sysRoleService.authDataScope(sysRole) > 0)
        {
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }

    /**
     * 删除角色
     * @throws Exception 
     */
    @HasPermissions("system:role:remove")
    @OperLog(title = "角色管理", businessType = BusinessType.DELETE)
    @PostMapping("remove")
    @ApiOperation(value = "删除角色",notes = "删除角色")
    public AjaxResult remove(@RequestParam @Validated
        @ApiParam(name = "ids",type = "String",value = "id字符串,如7,8,9",example = "")
        @NotBlank(message = "不允许空值")
    String ids) throws Exception
    {
        try{
            sysRoleService.deleteRoleByIds(ids);
        }catch (Exception e){
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();
    }

    @GetMapping("selectAllocatedUserList")
    @ApiOperation(value = "角色已分配的用户列表",notes = "角色已分配的用户列表")
    public AjaxResult selectAllocatedUserList(@Validated AllocateUserVO allocateUserVO, PageDomain pageDomain)
    {
        startPage();
        return AjaxResult.pageSuccess(sysRoleService.selectAllocatedUserList(allocateUserVO));
    }


    @PostMapping("allocateBatchUsers")
    @ApiOperation(value = "角色批量分配用户")
    public AjaxResult allocateBatchUsers(@RequestBody @Validated List<SysUserRole> userRoles) {
        int result = sysRoleService.allocateBatchUsers(userRoles);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }

        return AjaxResult.success(result);
    }


    @PostMapping("unallocateBatchUsers")
    @ApiOperation(value = "角色批量取消用户")
    public AjaxResult unallocateBatchUsers(@RequestBody @Validated List<SysUserRole> userRoles) {
        int result = sysRoleService.unallocateBatchUsers(userRoles);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }
}
