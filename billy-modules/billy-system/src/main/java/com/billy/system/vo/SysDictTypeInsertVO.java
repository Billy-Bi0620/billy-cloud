package com.billy.system.vo;

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
@ApiModel("新增字典类型视图")
public class SysDictTypeInsertVO {
    @ApiModelProperty(required = false, value = "字典名称",example = "用户性别")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictName;

    @ApiModelProperty(required = false, value = "字典类型",example = "sys_user_sex")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictType;

    @ApiModelProperty(required = false, value = "备注",example = "用户性别列表")
    @Size(max = 500,message = "长度不超过500个字符")
    private String remark;

}
