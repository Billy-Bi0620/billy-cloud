package com.billy.system.controller;


import com.billy.common.annotation.LoginUser;
import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysMenu;
import com.billy.system.domain.SysUser;
import com.billy.system.service.ISysMenuService;
import com.billy.system.vo.SysMenuCreateVO;
import com.billy.system.vo.SysMenuFilterVO;
import com.billy.system.vo.SysMenuRelateVO;
import com.billy.system.vo.SysMenuUpdateVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Set;

/**
 * 菜单权限 
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("menu")
@Api(value = "SysMeLnuController",tags = "菜单权限")
@Validated
public class SysMenuController extends BaseController
{
    @Autowired
    private ISysMenuService sysMenuService;

    /**
     * 查询菜单权限
     */
    @GetMapping("get")
    @ApiOperation(value = "查询菜单权限",notes = "查询菜单权限")
    public AjaxResult get(@RequestParam @NotNull @Range(min = 1, max = Integer.MAX_VALUE, message = "非法Id") Long menuId)
    {
        return AjaxResult.success(sysMenuService.selectMenuById(menuId));
    }

    /**
     * @description: rpc调用 查询某人的权限列表
     * @author: 毕苗苗
     * @date: 2022/10/14 13:45
     * @param: [userId]
     * @return: java.util.Set<java.lang.String>
     **/
    @GetMapping("perms")
    public Set<String> perms(@RequestParam @Validated @ApiParam(name = "userId",type = "",value = "用户id") @Min(value = 1,message = "最小值必须大于0") Long userId)
    {
        return sysMenuService.selectPermsByUserId(userId);
    }

    /**
     * 查询菜单权限
     */
    @GetMapping("user")
    @ApiOperation(value = "查询菜单清单",notes = "查询菜单清单", response = SysMenu.class)
    public AjaxResult user(@ApiIgnore @LoginUser SysUser sysUser)
    {
        return AjaxResult.success(sysMenuService.selectMenusByUser(sysUser));
    }

    /**
     * 根据角色编号查询菜单编号（用于勾选）
     * @param roleId
     * @return
     * @author zmr
     */
    @GetMapping("role/{roleId}")
    @ApiOperation(value = "根据角色编号查询菜单编号",notes = "根据角色编号查询菜单编号", response = SysMenuRelateVO.class)
    public AjaxResult role(@PathVariable("roleId") @NotNull @Range(min = 1, max = Integer.MAX_VALUE, message = "非法Id") Long roleId)
    {
        List<SysMenu> list = sysMenuService.selectMenuIdsByRoleId(roleId);
        return AjaxResult.success(BeanMapper.mapAsList(list, SysMenuRelateVO.class));
    }

    /**
     * 查询菜单权限列表
     */
    @HasPermissions("system:menu:view")
    @GetMapping("list")
    @ApiOperation(value = "查询菜单权限列表",notes = "查询菜单权限列表", response = SysMenu.class)
    public AjaxResult list(@Validated SysMenuFilterVO sysMenu)
    {
        return AjaxResult.pageSuccess(sysMenuService.selectMenuList(sysMenu));
    }
    /**
     * 查询所有菜单权限列表
     */
    @HasPermissions("system:menu:view")
    @GetMapping("all")
    @ApiOperation(value = "查询所有菜单权限列表",notes = "查询所有菜单权限列表", response = SysMenu.class)
    public AjaxResult all(@Validated SysMenuFilterVO sysMenu)
    {
        return AjaxResult.pageSuccess(sysMenuService.selectMenuList(sysMenu));
    }


    /**
     * 新增保存菜单权限
     */
    @PostMapping("save")
    @OperLog(title = "菜单管理", businessType = BusinessType.INSERT)
    @ApiOperation(value = "新增保存菜单权限",notes = "新增保存菜单权限")
    public AjaxResult addSave(@RequestBody @Validated SysMenuCreateVO sysMenu)
    {
        SysMenu entity = BeanMapper.map(sysMenu, SysMenu.class);
        entity.setCreateBy(getLoginName());
        return toAjax(sysMenuService.insertMenu(entity));
    }

    /**
     * 修改保存菜单权限
     */
    @OperLog(title = "菜单管理", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    @ApiOperation(value = "修改保存菜单权限",notes = "修改保存菜单权限")
    public AjaxResult editSave(@RequestBody @Validated SysMenuUpdateVO sysMenu)
    {
        SysMenu entity = BeanMapper.map(sysMenu, SysMenu.class);
        entity.setUpdateBy(getLoginName());
        return toAjax(sysMenuService.updateMenu(entity));
    }

    /**
     * 删除菜单权限
     */
    @OperLog(title = "菜单管理", businessType = BusinessType.DELETE)
    @PostMapping("remove/{menuId}")
    @ApiOperation(value = "删除菜单权限",notes = "删除菜单权限")
    public AjaxResult remove(@ApiParam(required = true, value = "根据主键字符串进行删除。如 1,2,3,4") @NotEmpty(message = "不能为空")  @PathVariable("menuId") Long menuId)
    {
        return toAjax(sysMenuService.deleteMenuById(menuId));
    }
}
