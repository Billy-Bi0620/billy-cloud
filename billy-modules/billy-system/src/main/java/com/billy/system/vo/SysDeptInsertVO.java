package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("新增部门视图数据")
public class SysDeptInsertVO {
    @ApiModelProperty(required = true, value = "部门名称",example = "")
    @Size(max = 30,message = "长度不超过30个字符")
    @NotBlank(message = "部门名称不允许空值")
    private String deptName;

    @ApiModelProperty(required = false, value = "父部门ID",example = "")
    private Long parentId;

    @ApiModelProperty(required = false, value = "显示顺序",example = "99")
    private Long orderNum;

    @ApiModelProperty(required = false, value = "负责人",example = "")
    @Size(max = 20,message = "长度不超过20个字符")
    private String leader;

    @ApiModelProperty(required = false, value = "负责人ID",example = "")
    private Long leaderId;

    @ApiModelProperty(required = false, value = "用户邮箱",example = "admin@qq.com")
    @Size(max = 50,message = "长度不超过50个字符")
    @Email(message = "电子邮箱格式不正确")
    private String email;

    @ApiModelProperty(required = false, value = "联系电话",example = "13900012345")
    @Size(max = 11,message = "长度不超过11个字符")
    private String phone;

}
