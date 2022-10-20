package com.billy.retail.controller;


import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.objmap.BeanMapper;
import com.billy.common.utils.DateUtils;
import com.billy.retail.domain.RetailOrder;
import com.billy.retail.feign.RemoteOrderService;
import com.billy.retail.service.IRetailOrderService;
import com.billy.retail.vo.req.GetOrderListVO;
import com.billy.retail.vo.req.OrderCreatedVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/orika")
@Api(tags = "2.新零售订单")
@Slf4j
@Validated
public class RetailOrderController extends BaseController {

    @Autowired
    private IRetailOrderService orderService;


    @Autowired
    private RemoteOrderService  remoteOrderService;

    @PostMapping("/createdRetailOrder")
    @ApiOperation(value = "1.创建零售订单",notes = "1")
    public AjaxResult createdRetailOrder(@RequestBody @Validated OrderCreatedVO vo) {
//        log.info("测试info日志输出");
//        log.error("测试error日志输出");

        GetOrderListVO vo11 = new GetOrderListVO("asd", "cc");
        Object obj = vo11;
        GetOrderListVO v2 = (GetOrderListVO)obj;


     /*   AjaxResult success = AjaxResult.success(vo11);
        GetOrderListVO object = success.getObject(GetOrderListVO.class);


        RetailOrder retailOrder = orderService.getRetailInfo(32L);
        AjaxResult success1 = AjaxResult.success(retailOrder);
        RetailOrder object1 = success1.getObject(RetailOrder.class);*/

        //远端调用
        AjaxResult re_retailInfo = remoteOrderService.getRetailInfo(32L);
        RetailOrder object2 = re_retailInfo.getObject(RetailOrder.class);



//        SysUser user = bmm2.getObject(SysUser.class);
//        AjaxResult bmm2 = userService.selectSysUserByUserId(10);


        RetailOrder order = BeanMapper.map(vo, RetailOrder.class);

        //当前登录的一些信息
        long currentUserId = this.getCurrentUserId();
        String loginName = this.getLoginName();
        Date nowDate = DateUtils.getNowDate();

        orderService.insertRetailOrder(order);

//        return AjaxResult.success(order);

        return AjaxResult.success(order);
    }

    @GetMapping("/getOrderList")
    @ApiOperation(value = "2.分页获取订单列表",notes = "2")
    public AjaxResult getOrderList(@Validated GetOrderListVO vo, @Validated PageDomain pageDomain) {
        RetailOrder retailOrder = BeanMapper.map(vo, RetailOrder.class);
        startPage();
        List<RetailOrder> retailOrders = orderService.selectRetailOrderList(retailOrder);

        return AjaxResult.pageSuccess(retailOrders);
    }

    @GetMapping("/getRetailOrderItems")
    @ApiOperation(value = "3.分页获取订单明细列表",notes = "3")
    public AjaxResult getRetailOrderItems() {
        return AjaxResult.success();
    }

    @GetMapping("/getRetailDetail")
    @ApiOperation(value = "4.获取订单及订单详情",notes = "4")
    public AjaxResult getRetailDetail(@RequestParam @Validated @ApiParam(name = "orderId",type = "",value = "订单id") Long orderId) {
        RetailOrder retailOrder = orderService.selectRetailOrderById(orderId);
        return AjaxResult.success(retailOrder);
    }

    /**
     * @description:根据orderId获取详情
     * @author: 毕苗苗
     * @date: 2022/10/10 13:58
     * @param: [orderId]
     * @return: com.billy.common.core.web.domain.AjaxResult
     **/
    @GetMapping("getRetailInfo")
    @ApiOperation(value = "根据订单id获取订单详情",notes = "根据订单id获取订单详情")
    public AjaxResult getRetailInfo(@RequestParam @Validated @Min(value = 1,message = "订单id必须大于0") @ApiParam(name = "orderId",type = "",value = "订单id") Long orderId){
        RetailOrder retailInfo = orderService.getRetailInfo(orderId);
        return AjaxResult.success(retailInfo);
    }

}
