package com.billy.system.vo;

import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("编辑岗位视图")
public class SysPostEditVO {
    @ApiModelProperty(required = true, value = "岗位ID,编辑时必传",example = "")
    @NotNull(message = "岗位ID,编辑时必传")
    private Long postId;

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

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    @ApiModelProperty(required = true, value = "状态（0正常 1停用）")
    @NotBlank(message = "状态不能为空")
    @Size(max = 1,message = "状态长度字符不能超过1")
    private String status;


}
