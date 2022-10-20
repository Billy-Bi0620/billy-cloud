package com.billy.system.vo;

import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("过滤用户视图")
public class SysUserFilterVO {

    @ApiModelProperty(required = false, value = "用户名",example = "admin")
    @Size(max = 30,message = "用户名不超过30个字符")
    private String loginName;

    @ApiModelProperty(required = false, value = "账号状态,如0正常1停用",example = "0")
    @Size(max = 1,message = "不超过1个字符")
    private String status;

    @ApiModelProperty(required = false, value = "手机号码",example = "")
    @Size(max = 11,message = "手机号码不超过11个字符")
    private String phoneNumber;

    @ApiModelProperty(required = false, value = "开始时间",example = "2015-01-01")
    private String beginTime;

    @ApiModelProperty(required = false, value = "结束时间",example = "2022-12-31")
    private String endTime;

    @ApiModelProperty(required = false, value = "部门Id",example = "100")
    private Integer deptId;

}
