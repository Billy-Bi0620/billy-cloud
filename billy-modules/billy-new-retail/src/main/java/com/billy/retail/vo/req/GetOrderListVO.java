package com.billy.retail.vo.req;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/*
* 获取订单列表
* */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("获取订单列表请求")
public class GetOrderListVO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(required = true, value = "姓名")
    @NotBlank(message = "姓名不能为空")
    @Size(max = 10,message = "姓名长度不能超过10个字符")
    private String name;

}
