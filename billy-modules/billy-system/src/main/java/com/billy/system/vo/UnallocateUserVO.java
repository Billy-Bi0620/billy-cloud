package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("角色已分配用户请求")
public class UnallocateUserVO {

    @ApiModelProperty(required = false, value = "登录名",example = "admin")
    private String loginName;

    @ApiModelProperty(value = "用户手机")
    private String phoneNumber;

}
