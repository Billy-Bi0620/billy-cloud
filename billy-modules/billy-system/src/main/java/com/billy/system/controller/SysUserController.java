package com.billy.system.controller;


import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.constant.UserConstants;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.text.Convert;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.common.utils.RandomUtil;
import com.billy.system.domain.SysUser;
import com.billy.system.service.ISysMenuService;
import com.billy.system.service.ISysUserService;
import com.billy.system.util.PasswordUtil;
import com.billy.system.vo.SysUserEditVO;
import com.billy.system.vo.SysUserFilterVO;
import com.billy.system.vo.SysUserInsertVO;
import com.billy.system.vo.UnallocateUserVO;
import io.swagger.annotations.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Set;

/**
 * 用户 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@Validated
@RequestMapping("user")
@Api(value = "SysUserController",tags = "用户管理")
@Slf4j
public class SysUserController extends BaseController
{
    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysMenuService sysMenuService;

    /**
     * 查询用户
     */
    @GetMapping("get")
    @ApiOperation(value = "根据用户id查询用户",notes = "根据用户id查询用户")
    public SysUser selectSysUserByUserId(@RequestParam @Validated
        @ApiParam(name = "userId",type = "Integer",value = "用户id,必须是一个整数",example = "123")
        @Min(value = 1,message = "最小值需大于0")
        @Max(value = 2147483647,message = "超出最大值")
        @NotNull(message = "不允许空值")
    Long userId)
    {
        SysUser user = sysUserService.selectUserById(userId);
        user.setPassword("");
//        if (user==null || user.getUserId() == 0){
//            return AjaxResult.error("用户不存在");
//        }
        return user;
    }

    @GetMapping("info")
    @ApiOperation(value = "根据用户id查询权限",notes = "根据用户id查询权限")
    public AjaxResult info(@RequestParam
        @ApiParam(required = true, name = "userId",type = "Integer",value = "传0代表取当前用户信息",example = "0")
        @Min(value = 0,message = "最小值需大于0")
        @Max(value = 2147483647,message = "超出最大值")
    Long userId)
    {
        SysUser user = null;
        if( userId!=null && userId!=0 )
        {
            user = sysUserService.selectUserById(userId);

        } else {
            userId = this.getCurrentUserId();
            user = sysUserService.selectUserById(userId);
        }

        if (user==null || user.getUserId() == 0){
            return AjaxResult.error("用户不存在");
        }
        user.setButtons(sysMenuService.selectPermsByUserId(userId));
        user.setPassword("");
        return AjaxResult.success(user);
    }


    /**
     * 查询用户
     */
    /**
     * @description: rpc等陆调用
     * @author: 毕苗苗
     * @date: 2022/10/14 15:14
     * @param: [loginName]
     * @return: com.billy.system.domain.SysUser
     **/
//    @ApiOperation(value = "根据用户名查询用户",notes = "根据用户名查询用户")
    @ApiResponses({@ApiResponse(code=400,message="请填写请求参数")})
    @GetMapping("/find")
    @ApiImplicitParam(paramType = "query", name = "loginName", dataType = "String", required = true, value = "登陆用户名")
    public SysUser selectSysUserByUsername(@RequestParam @Validated  String loginName)
    {
        SysUser result = sysUserService.selectUserByLoginName(loginName);

//        if (result==null || result.size() == 0){
//            return AjaxResult.error("用户不存在");
//        }
        return result;
    }

    /**
     * 查询拥有当前角色的所有用户
     */
    @GetMapping("hasRoles")
    @ApiOperation(value = "查询拥有当前角色的所有用户",notes = "查询拥有当前角色的所有用户")
    public Set<Long> selectUserIdsHasRoles(
            @RequestParam @Validated
            @ApiParam(name = "roleIds",type = "String",value = "角色Id字符串,如1,2",example = "")
            @NotNull(message = "不允许空值")
            @NotBlank(message = "不允许空值")
            String roleIds)
    {
        Long[] arr= Convert.toLongArray(roleIds);
        Set<Long> result = sysUserService.selectUserIdsHasRoles(arr);
        return result;
    }

    /**
     * 查询所有当前部门中的用户
     */
    @GetMapping("inDepts")
    @ApiOperation(value = "查询所有当前部门中的用户",notes = "查询所有当前部门中的用户")
    public Set<Long> selectUserIdsInDepts(@RequestParam @Validated
        @ApiParam(name = "deptIds",type = "String",value = "部门Id字符串，如100,101",example = "")
        @NotNull(message = "不允许空值")
        @NotBlank(message = "不允许空值")
        String  deptIds)
    {
        Long[] arr=Convert.toLongArray(deptIds);
        Set<Long> result = sysUserService.selectUserIdsInDepts(arr);
        return result;
    }

    /**
     * 查询用户列表
     */
    @GetMapping("list")
    @ApiOperation(value = "查询用户列表",notes = "查询用户列表")
    public AjaxResult list(@Validated SysUserFilterVO userFilter, PageDomain pageDomain)
    {
        startPage();
        return AjaxResult.pageSuccess(sysUserService.selectUserList(userFilter));
    }

    /**
     * 新增保存用户
     */
    @HasPermissions("system:user:add")
    @PostMapping("save")
    @OperLog(title = "用户管理", businessType = BusinessType.INSERT)
    @ApiOperation(value = "新增用户",notes = "新增用户")
    public AjaxResult addSave(@RequestBody @Validated SysUserInsertVO userVo)
    {
        SysUser sysUser = BeanMapper.map(userVo, SysUser.class);

        if (UserConstants.USER_NAME_NOT_UNIQUE.equals(sysUserService.checkLoginNameUnique(sysUser.getLoginName())))
        {
            return AjaxResult.error("新增用户'" + sysUser.getLoginName() + "'失败，登录账号已存在");
        }
        else if (UserConstants.USER_PHONE_NOT_UNIQUE.equals(sysUserService.checkPhoneUnique(sysUser.getPhoneNumber())))
        {
            return AjaxResult.error("新增用户'" + sysUser.getLoginName() + "'失败，手机号码已存在");
        }
        else if (UserConstants.USER_EMAIL_NOT_UNIQUE.equals(sysUserService.checkEmailUnique(sysUser.getEmail())))
        {
            return AjaxResult.error("新增用户'" + sysUser.getLoginName() + "'失败，邮箱账号已存在");
        }
        //密码默认和用户名相等
        sysUser.setPassword(sysUser.getUserName());
        sysUser.setStatus("0");
        sysUser.setDelFlag("0");
        sysUser.setSalt(RandomUtil.randomStr(6));
        sysUser.setPassword(
                PasswordUtil.encryptPassword(sysUser.getLoginName(), sysUser.getPassword(), sysUser.getSalt()));
        sysUser.setCreateBy(getLoginName());
        int result = sysUserService.insertUser(sysUser);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 修改用户
     */
    @HasPermissions("system:user:edit")
    @OperLog(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    @ApiOperation(value = "修改用户",notes = "修改用户-包含角色&岗位")
    public AjaxResult editSave(@RequestBody @Validated SysUserEditVO userVo)
    {
        SysUser sysUser = BeanMapper.map(userVo, SysUser.class);

        //验证值场景
        if (null == sysUser.getUserId() || sysUser.getUserId()==0)
        {
            return AjaxResult.error("用户ID,编辑时必传");
        }
        //禁止修改场景
        if (SysUser.isAdmin(sysUser.getUserId()))
        {
            return AjaxResult.error("不允许修改超级管理员用户");
        }

        SysUser sysUserOld = sysUserService.selectUserById(sysUser.getUserId());
        //传入用户手机无变更
        if (sysUserOld.getPhoneNumber().equals(sysUser.getPhoneNumber())){
            sysUser.setPhoneNumber("");
        }
        //传入用户邮箱无变更
        if (sysUserOld.getEmail().equals(sysUser.getEmail())){
            sysUser.setEmail("");
        }
        //禁止修改为与其他人相同的信息
        if (!StringUtils.isEmpty(sysUser.getPhoneNumber()) && UserConstants.USER_PHONE_NOT_UNIQUE.equals(sysUserService.checkPhoneUnique(sysUser.getPhoneNumber())))
        {
            return AjaxResult.error("修改用户'" + sysUser.getLoginName() + "'失败，手机号码已存在");
        }
        //禁止修改为与其他人相同的信息
        if (!StringUtils.isEmpty(sysUser.getEmail()) && UserConstants.USER_EMAIL_NOT_UNIQUE.equals(sysUserService.checkEmailUnique(sysUser.getEmail())))
        {
            return AjaxResult.error("修改用户'" + sysUser.getLoginName() + "'失败，邮箱账号已存在");
        }
        //密码可以设置，也可以空白不设置
//        if(!StringUtils.isEmpty(sysUser.getPassword())){
//            sysUser.setSalt(RandomUtil.randomStr(6));
//            sysUser.setPassword(
//                    PasswordUtil.encryptPassword(sysUser.getLoginName(), sysUser.getPassword(), sysUser.getSalt()));
//
//        }
        sysUser.setUpdateBy(getLoginName());
        int result = sysUserService.updateUser(sysUser);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 修改用户信息
     * @param userVo
     * @return
     * @author zmr
     */
    @HasPermissions("system:user:edit")
    @PostMapping("update/info")
    @OperLog(title = "用户管理", businessType = BusinessType.UPDATE)
    @ApiOperation(value = "修改用户详情",notes = "修改用户详情-不包含角色&岗位")
    public AjaxResult updateInfo(@RequestBody @Validated SysUserEditVO userVo)
    {
        SysUser sysUser = BeanMapper.map(userVo, SysUser.class);
        //验证值场景
        if (null == sysUser.getUserId() || sysUser.getUserId()==0)
        {
            return AjaxResult.error("用户ID,编辑时必传");
        }
        //禁止修改场景
        if (SysUser.isAdmin(sysUser.getUserId()))
        {
            return AjaxResult.error("不允许修改超级管理员用户");
        }

        SysUser sysUserOld = sysUserService.selectUserById(sysUser.getUserId());
        //传入用户手机无变更
        if (sysUserOld.getPhoneNumber().equals(sysUser.getPhoneNumber())){
            sysUser.setPhoneNumber("");
        }
        //传入用户邮箱无变更
        if (sysUserOld.getEmail().equals(sysUser.getEmail())){
            sysUser.setEmail("");
        }
        //禁止修改为与其他人相同的信息
        if (!StringUtils.isEmpty(sysUser.getPhoneNumber()) && UserConstants.USER_PHONE_NOT_UNIQUE.equals(sysUserService.checkPhoneUnique(sysUser.getPhoneNumber())))
        {
            return AjaxResult.error("修改用户'" + sysUser.getLoginName() + "'失败，手机号码已存在");
        }
        //禁止修改为与其他人相同的信息
        if (!StringUtils.isEmpty(sysUser.getEmail()) && UserConstants.USER_EMAIL_NOT_UNIQUE.equals(sysUserService.checkEmailUnique(sysUser.getEmail())))
        {
            return AjaxResult.error("修改用户'" + sysUser.getLoginName() + "'失败，邮箱账号已存在");
        }
        //密码可以设置，也可以空白不设置
//        if(!StringUtils.isEmpty(sysUser.getPassword())){
//            sysUser.setSalt(RandomUtil.randomStr(6));
//            sysUser.setPassword(
//                    PasswordUtil.encryptPassword(sysUser.getLoginName(), sysUser.getPassword(), sysUser.getSalt()));
//        }

        sysUser.setUpdateBy(this.getLoginName());
        int result = sysUserService.updateUserInfo(sysUser);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * rpc调用 记录登陆信息
     * @param sysUser
     * @return
     * @author zmr
     */
    @PostMapping("update/login")
    public int updateUserLoginRecord(@RequestBody SysUser sysUser)
    {
        int result = sysUserService.updateUser(sysUser);
//        if (result==0) {
//            AjaxResult.error("影响行数为0，操作失败");
//        }
        return result;
    }

    @HasPermissions("system:user:resetPwd")
    @OperLog(title = "重置密码", businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ApiOperation(value = "重置密码",notes = "重置密码")
    @ApiImplicitParams({
        @ApiImplicitParam(paramType = "query", name = "userId", dataType = "Long", required = true, value = "用户id(必须是一个整数)"),
        @ApiImplicitParam(paramType = "query", name = "userPassword", dataType = "String", required = true, value = "密码")
    })
    public AjaxResult resetPwd(@RequestParam @Validated Long userId,String userPassword)
    {
        //验证值场景
        if (null == userId || userId==0)
        {
            return AjaxResult.error("用户ID,编辑时必传");
        }
        //禁止修改场景
        if (SysUser.isAdmin(userId))
        {
            return AjaxResult.error("不允许修改超级管理员用户");
        }

        //密码可以设置，也可以空白不设置
        if(StringUtils.isEmpty(userPassword)){
            return AjaxResult.error("密码不可为空");
        }
        SysUser user = new SysUser();
        user.setUserId(userId);
        user.setSalt(RandomUtil.randomStr(6));
        user.setPassword(PasswordUtil.encryptPassword(user.getLoginName(), userPassword, user.getSalt()));
        user.setUpdateBy(this.getLoginName());

        int result = sysUserService.resetUserPwd(user);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }


    @HasPermissions("system:user:edit")
    @OperLog(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/changeStatus")
    @ApiOperation(value = "修改状态",notes = "修改状态")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "userId", dataType = "Long", required = true, value = "用户id(必须是一个整数)"),
            @ApiImplicitParam(paramType = "query", name = "userStatus", dataType = "String", required = true, value = "帐号状态(0正常|1停用)")
    })
    public AjaxResult changeStatus(@RequestParam @Validated Long userId,String userStatus)
    {
        //验证值场景
        if (null == userId || userId==0)
        {
            return AjaxResult.error("用户ID,编辑时必传");
        }
        //禁止修改场景
        if (SysUser.isAdmin(userId))
        {
            return AjaxResult.error("不允许修改超级管理员用户");
        }

        //密码可以设置，也可以空白不设置
        if(StringUtils.isEmpty(userStatus)){
            return AjaxResult.error("状态不可为空");
        }
        SysUser user = new SysUser();
        user.setUserId(userId);
        user.setStatus(userStatus);
        user.setUpdateBy(this.getLoginName());

        int result = sysUserService.changeStatus(user);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);
    }

    /**
     * 删除用户
     * @throws Exception 
     */
    @HasPermissions("system:user:remove")
    @OperLog(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping("remove")
    @ApiOperation(value = "删除用户",notes = "删除用户")
    public AjaxResult remove(@RequestParam @Validated
         @ApiParam(name = "ids",type = "String",value = "id字符串,如7,8,9",example = "")
         @NotBlank(message = "不允许空值")
    String ids) throws Exception
    {
        int result = sysUserService.deleteUserByIds(ids);
        if (result==0) {
            AjaxResult.error("影响行数为0，操作失败");
        }
        return AjaxResult.success(result);

    }


    @GetMapping("roleUnallocated")
    @ApiOperation(value = "查询未分配角色的用户列表",notes = "查询未分配角色的用户列表")
    public AjaxResult selectUnallocatedList(@Validated  UnallocateUserVO vo, PageDomain pageDomain) {
        startPage();
        return AjaxResult.pageSuccess(sysUserService.selectUnallocatedList(vo));
    }

}
