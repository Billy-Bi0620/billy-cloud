package com.billy.retail.domain;

import com.billy.common.annotation.Excel;
import com.billy.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 【请填写功能名称】对象 retail_order
 * 
 * @author sprout
 * @date 2022-09-15
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RetailOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;



    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 订单id */
    private Long orderId;

    /** 备注*/
    private String remark;

    @Excel(name = "邮箱")
    private String email;

    private String createdTime;

    /** 订单明细集合*/
    private List<RetailOrderItem> orderItems;

}

