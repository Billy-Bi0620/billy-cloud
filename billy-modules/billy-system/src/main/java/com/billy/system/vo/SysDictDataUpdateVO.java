package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("更新字典数据视图")
public class SysDictDataUpdateVO {
    @ApiModelProperty(required = true, value = "字典编码,编辑时必传",example = "1")
    @NotNull(message = "字典编码,编辑时必传")
    private Long dictCode;

    @ApiModelProperty(required = false, value = "字典排序",example = "1")
    @Min(value = 1, message = "长度不小于1位数字")
    private String dictSort;

    @ApiModelProperty(required = false, value = "字典标签",example = "男")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictLabel;

    @ApiModelProperty(required = false, value = "字典键值",example = "0")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictValue;

    @ApiModelProperty(required = false, value = "字典类型",example = "sys_user_sex")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictType;

    @ApiModelProperty(required = false, value = "样式属性（其他样式扩展）",example = "")
    @Size(max = 100,message = "长度不超过100个字符")
    private String cssClass;

    @ApiModelProperty(required = false, value = "表格回显样式",example = "primary")
    @Size(max = 100,message = "长度不超过100个字符")
    private String listClass;

    @ApiModelProperty(required = false, value = "是否默认（Y是 N否）",example = "Y")
    @Pattern(regexp = "^Y|N$", message = "是否默认只能是 Y 或 N")
    private String isDefault;

    @ApiModelProperty(required = false, value = "状态（0正常 1停用）",example = "0")
    @Pattern(regexp = "^0|1$", message = "状态值只能是 0 或 1")
    private String status;

    @ApiModelProperty(required = false, value = "备注",example = "")
    @Size(max = 500,message = "长度不超过500个字符")
    private String remark;
}
