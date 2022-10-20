package com.billy.system.vo;

import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("过滤岗位视图")
public class SysPostFilterVO {

    @ApiModelProperty(required = false, value = "岗位编码",example = "CEO")
    @Size(max = 64,message = "岗位编码不超过64个字符")
    private String postCode;

    @ApiModelProperty(required = false, value = "岗位名称",example = "董事长")
    @Size(max = 50,message = "岗位名称不超过50个字符")
    private String postName;

    @ApiModelProperty(required = false, value = "状态,如0正常1停用",example = "0")
    @Size(max = 1,message = "不超过1个字符")
    private String status;

}
