package com.billy.system.feign;


import com.billy.common.constant.ServiceNameConstants;
import com.billy.system.domain.SysUser;
import com.billy.system.feign.factory.RemoteUserFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 用户 Feign服务层
 *
 * @author zmr
 * @date 2019-05-20
 */
@FeignClient(name = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService
{
/*    @GetMapping("user/get")
    public SysUser selectSysUserByUserId(@RequestParam("userId") long userId);*/

    @GetMapping("user/find")
    public SysUser selectSysUserByUsername(@RequestParam("loginName") String loginName);

    @PostMapping("user/update/login")
    public int updateUserLoginRecord(@RequestBody SysUser user);

/*    @GetMapping("user/hasRoles")
    public Set<Long> selectUserIdsHasRoles(@RequestParam("roleIds") String roleIds);

    @GetMapping("user/inDepts")
    public Set<Long> selectUserIdsInDepts(@RequestParam("deptIds") String deptIds);*/
}
