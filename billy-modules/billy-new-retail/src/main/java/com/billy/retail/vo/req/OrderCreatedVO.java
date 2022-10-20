package com.billy.retail.vo.req;

import com.billy.common.annotation.Excel;
import com.billy.common.core.web.validate.DateTimeFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;
import java.util.List;

//@AllArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Data
@ApiModel("创建订单请求参数")
public class OrderCreatedVO  {
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(required = true, value = "标题",example = "标题")
    @NotBlank(message = "标题不能为空")
    @Size(max = 50,message = "标题长度不能超过50个字符")
    private String title;

    @ApiModelProperty(required = true, value = "姓名",example = "张三")
    @NotBlank(message = "姓名不能为空")
    @Size(max = 10,message = "姓名长度不能超过10个字符")
    private String name;

    @ApiModelProperty(value = "邮箱",example = "bmm123123@163.com")

    @Email(message = "邮箱格式不对")
    private String email;
//
    @ApiModelProperty(required = true,value = "创建时间",example = "2022-10-13 08:30:21")
    @NotBlank(message="创建时间不能为空")
    @DateTimeFormat(format ="yyyy-MM-dd HH:mm:ss", message = "创建时间格式错误，正确格式为：yyyy-MM-dd HH:mm:ss")
    private String createdTime;

    /*订单明细*/

    @ApiModelProperty(required = true,value = "订单明细")
    @NotEmpty(message = "订单明细必须有值")
    private List<OrderCreateItemVO> orderItems;

}

/*
* 订单明细
* */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("创建订单明细")
class OrderCreateItemVO{
    private static final long serialVersionUID = 1L;

    /** 商品id */
    @Excel(name = "商品id")
    @ApiModelProperty(required = true,value = "商品id",example = "1325234")
    private Long skuId;

    /** 价格 */
    @Excel(name = "价格")
    @ApiModelProperty(required = true,value = "商品价格",example = "298.22")
    @DecimalMin(value = "0.01",message = "价格最小必须大于0.01")
    @DecimalMax(value = "9999999",message = "价格最大不能超过9999999")
    @Digits(integer = 7,fraction = 3,message = "价格金额格式不对,整数位不能超7位,小数位不能超过3位")
    private Double price;

}
