package com.billy.retail.controller;

import com.billy.common.exception.CustomException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;

/**
 * @BelongsProject: sprout-cloud
 * @BelongsPackage: com.billy.retail.controller
 * @Author: 毕苗苗
 * @CreateTime: 2022-10-10  16:00
 * @Description: 消息消费控制器
 * @Version: 1.0
 */
@Component
@RestController
@Api(tags = "消费")
public class ConsumerController {

    @RabbitHandler
    @RabbitListener(bindings = @QueueBinding(value = @Queue("orderCreatedConsumeHandler"),exchange = @Exchange(name = "amq.topic",type = ExchangeTypes.TOPIC),key = "order_created"))
    @ApiOperation(value = "用户通知消费",notes = "用户通知消费")
    public void userNoticeConsumeHandler(String message) {

        System.out.println(String.format("用户通知:主人你好,您的订单:%s已支付成功,即可为您发货!",message));
    }

    @RabbitHandler
    @RabbitListener(bindings = @QueueBinding(value = @Queue("inventoryConsumeHandler"), exchange = @Exchange(name = "amq.topic", type = ExchangeTypes.TOPIC), key = "order_created")
    ,ackMode = "NONE"
    )
    @ApiOperation(value = "库存扣减消费",notes = "库存扣减消费")
    public void inventoryConsumeHandler(String message) {

        System.out.println(String.format("库存扣减服务:订单%s锁仓,即将扣减库存!","inventoryConsumeHandler",message));
        throw new CustomException("ccc");
    }
}
