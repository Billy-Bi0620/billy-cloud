package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("过滤字典数据视图")
public class SysDictDataFilterVO {
    @ApiModelProperty(required = false, value = "字典类型",example = "sys_user_sex")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictType;

    @ApiModelProperty(required = false, value = "字典标签",example = "男")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictLabel;

    @ApiModelProperty(required = false, value = "状态（0正常 1停用）",example = "0")
    @Pattern(regexp = "^0|1$", message = "状态值只能是0或1")
    private String status;
}
