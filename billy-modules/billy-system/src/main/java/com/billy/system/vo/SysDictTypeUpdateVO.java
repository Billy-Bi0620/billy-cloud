package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("更新字典类型视图")
public class SysDictTypeUpdateVO {
    @ApiModelProperty(required = true, value = "字典ID,编辑时必传",example = "1")
    @NotNull(message = "字典ID,编辑时必传")
    private Long dictId;

    @ApiModelProperty(required = false, value = "字典名称",example = "用户性别")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictName;

    @ApiModelProperty(required = false, value = "字典类型",example = "sys_user_sex")
    @Size(max = 100,message = "长度不超过100个字符")
    private String dictType;

    @ApiModelProperty(required = false, value = "状态（0正常 1停用）",example = "0")
    @Pattern(regexp = "^0|1$", message = "状态值只能是0或1")
    private String status;

    @ApiModelProperty(required = false, value = "备注",example = "用户性别列表")
    @Size(max = 500,message = "长度不超过500个字符")
    private String remark;
}
