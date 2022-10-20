package com.billy.system.feign;


import com.billy.common.constant.ServiceNameConstants;
import com.billy.system.feign.factory.RemoteDeptFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * 用户 Feign服务层
 * 
 * @author zmr
 * @date 2019-05-20
 */
@FeignClient(name = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteDeptFallbackFactory.class)
public interface RemoteDeptService
{
/*    @GetMapping("dept/get")
    public SysDept selectSysDeptByDeptId(@RequestParam("deptId") long deptId);*/

}
