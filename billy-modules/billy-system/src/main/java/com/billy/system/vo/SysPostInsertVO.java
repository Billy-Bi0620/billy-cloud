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
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("创建岗位视图")
public class SysPostInsertVO {

    @Excel(name = "岗位编码")
    @ApiModelProperty(required = true, value = "岗位编码")
    @NotBlank(message = "岗位编码不能为空")
    @Size(max = 64,message = "岗位编码长度不能超过64个字符")
    private String postCode;

    /** 岗位名称 */
    @Excel(name = "岗位名称")
    @ApiModelProperty(required = true, value = "岗位名称")
    @NotBlank(message = "岗位名称不能为空")
    @Size(max = 50,message = "岗位名称长度不能超过50个字符")
    private String postName;

    /** 岗位排序 */
    @Excel(name = "岗位排序")
    @ApiModelProperty(required = true, value = "排序")
    @NotBlank(message = "排序必须有值")
    private String postSort;


}
