package com.billy.retail.feign.factory;

import com.billy.common.core.web.domain.AjaxResult;
import com.billy.retail.feign.RemoteOrderService;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @BelongsProject: sprout-cloud
 * @BelongsPackage: com.billy.retail.feign.factory
 * @Author: 毕苗苗
 * @CreateTime: 2022-10-13  18:02
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@Component
public class RemoteOrderFallbackFactory implements FallbackFactory<RemoteOrderService> {

    @Override
    public RemoteOrderService create(Throwable throwable) {

        return new RemoteOrderService() {
            @Override
            public AjaxResult getRetailInfo(Long orderId) {
                return null;
            }
        };

    }
}
