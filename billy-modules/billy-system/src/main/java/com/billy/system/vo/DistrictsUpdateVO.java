package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("更新地区视图数据")
public class DistrictsUpdateVO {
    @ApiModelProperty(required = false, value = "编号,编辑时必传",example = "1101")
    @NotNull(message = "编号不允许空值")
    @Range(min = 11, max = 999999, message = "长度不小于2位数字，且不超过6位数字")
    private Integer id;

    @ApiModelProperty(required = false, value = "层级",example = "1")
    @Range(min = 0, max = 9, message = "长度为1位数字")
    private Integer deep;

    @ApiModelProperty(required = false, value = "名称",example = "北京")
    @Size(max = 32,message = "长度不超过32个字符")
    private String name;

    @ApiModelProperty(required = false, value = "拼音",example = "bei jing")
    @Size(max = 64,message = "长度不超过64个字符")
    private String pinyin;

    @ApiModelProperty(required = false, value = "拼音缩写",example = "bej")
    @Size(max = 64,message = "长度不超过64个字符")
    private String pinyinShor;

    @ApiModelProperty(required = false, value = "扩展名",example = "市辖区")
    @Size(max = 64,message = "长度不超过64个字符")
    private String extName;

}
