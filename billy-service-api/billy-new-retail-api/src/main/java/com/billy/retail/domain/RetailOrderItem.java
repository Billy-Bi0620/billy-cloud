package com.billy.retail.domain;

import com.billy.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 【请填写功能名称】对象 retail_order_item
 * 
 * @author sprout
 * @date 2022-09-26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RetailOrderItem
{
    private static final long serialVersionUID = 1L;

    /** 创建时间 */
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    /** 价格 */
    @Excel(name = "价格")
    private Double price;

    /** 商品id */
    @Excel(name = "商品id")
    private Long skuId;

    /** 订单id */
    @Excel(name = "订单id")
    private Long orderId;

    /** 明细Id */
    private Long orderItmId;


}
