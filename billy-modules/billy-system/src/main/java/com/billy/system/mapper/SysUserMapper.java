package com.billy.system.mapper;

import com.billy.system.domain.SysNoRoleUser;
import com.billy.system.domain.SysUser;
import com.billy.system.vo.UnallocateUserVO;
import com.billy.system.vo.SysUserFilterVO;

import java.util.List;
import java.util.Set;

/**
 * 用户表 数据层
 * 
 * @author sprout
 */
public interface SysUserMapper
{
    /**
     * 根据条件分页查询用户列表
     * 
     * @param userVo 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectUserList(SysUserFilterVO userVo);

//    /**
//     * 根据条件分页查询已配用户角色列表
//     *
//     * @param user 用户信息
//     * @return 用户信息集合信息
//     */
//    public List<SysUser> selectAllocatedList(SysUser user);





    /**
     * 根据条件分页查询未分配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysNoRoleUser> selectUnallocatedList(UnallocateUserVO user);

    /**
     * 通过用户名查询用户
     * 
     * @param loginName 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByLoginName(String loginName);

    /**
     * 通过手机号码查询用户
     * 
     * @param phoneNumber 手机号码
     * @return 用户对象信息
     */
    public SysUser selectUserByPhoneNumber(String phoneNumber);

    /**
     * 通过邮箱查询用户
     * 
     * @param email 邮箱
     * @return 用户对象信息
     */
    public SysUser selectUserByEmail(String email);

    /**
     * 通过用户ID查询用户
     * 
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(Long userId);

    /**
     * 通过用户ID删除用户
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserById(Long userId);

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserByIds(Long[] ids);

    /**
     * 修改用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int updateUser(SysUser user);

    /**
     * 新增用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int insertUser(SysUser user);

    /**
     * 校验用户名称是否唯一
     * 
     * @param loginName 登录名称
     * @return 结果
     */
    public int checkLoginNameUnique(String loginName);

    /**
     * 校验手机号码是否唯一
     *
     * @param phoneNumber 手机号码
     * @return 结果
     */
    public int checkPhoneUnique(String phoneNumber);

    /**
     * 校验email是否唯一
     *
     * @param email 用户邮箱
     * @return 结果
     */
    public int checkEmailUnique(String email);

    /**
     * 查询拥有当前角色的所有用户编号
     * @param roleIds 角色编号
     * @return
     * @author zmr
     */
    public Set<Long> selectUserIdsHasRoles(Long[] roleIds);
    /**
     * 查询拥有当前角色的所有用户编号
     * @param deptIds 部门编号
     * @return
     * @author zmr
     */
    public Set<Long> selectUserIdsInDepts(Long[] deptIds);
}
