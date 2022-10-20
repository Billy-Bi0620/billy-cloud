package com.billy.retail.feign;

import com.billy.common.constant.ServiceNameConstants;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.retail.feign.factory.RemoteOrderFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @BelongsProject: sprout-cloud
 * @BelongsPackage: com.billy.retail.feign
 * @Author: 毕苗苗
 * @CreateTime: 2022-10-13  18:01
 * @Description: TODO
 * @Version: 1.0
 */
@FeignClient(name = ServiceNameConstants.NEW_ORDER, fallbackFactory = RemoteOrderFallbackFactory.class)
public interface RemoteOrderService {

    @GetMapping(value = "orika/getRetailInfo", headers = {"content-type=application/json;utf-8"})
    public AjaxResult getRetailInfo(@RequestParam("orderId") Long orderId);
}
