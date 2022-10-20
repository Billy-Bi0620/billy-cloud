package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("角色已分配用户请求")
public class AllocateUserVO {

    @ApiModelProperty(required = true, value = "角色id")
    private int roleId;

    @ApiModelProperty(value = "登录名")
    private String loginName;

    @ApiModelProperty(value = "手机号")
    private String phoneNumber;



}
