package com.billy.system.feign;


import com.billy.common.constant.ServiceNameConstants;
import com.billy.system.feign.factory.RemoteRoleFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * 角色 Feign服务层
 * 
 * @author zmr
 * @date 2019-05-20
 */
@FeignClient(name = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteRoleFallbackFactory.class)
public interface RemoteRoleService
{
/*    @GetMapping("role/get")
    public SysRole selectSysRoleByRoleId(@RequestParam("roleId") long roleId);*/
}
