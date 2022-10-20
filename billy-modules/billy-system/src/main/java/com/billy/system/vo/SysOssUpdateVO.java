package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 更新文件属性
 */
@Data
@ApiModel("更新文件属性")
public class SysOssUpdateVO implements Serializable {

    private static final long serialVersionUID = -6027759210075882256L;

    /**
     * Id
     */
    @ApiModelProperty(value = "id",example = "31")
    @Range(min = 1, max = Integer.MAX_VALUE, message = "非法Id")
    @NotNull(message = "Id不能为空")
    private Long id;

    /**
     * 文件名
     */
    @ApiModelProperty(value = "文件名")
    @Size(max = 64, message = "文件名长度不能超过64个字符")
    @NotEmpty(message = "文件名不能为空")
    private String fileName;

    /**
     * 文件后缀
     */
    @ApiModelProperty(value = "文件后缀")
    @Size(max = 10, message = "文件后缀长度不能超过10个字符")
    @NotEmpty(message = "文件后缀不能为空")
    private String fileSuffix;

    /**
     * URL地址
     */
    @ApiModelProperty(value = "URL地址")
    @Size(max = 200, message = "URL地址长度不能超过200个字符")
    @NotEmpty(message = "URL地址不能为空")
    private String url;

    /**
     * 服务商
     */
    @ApiModelProperty(value = "服务商 类型 1：七牛 2：阿里云 3：腾讯云")
    @Range(min = 1, max = 3, message = "服务商值在1-3之间")
    @NotNull(message = "服务商不能为空")
    private Integer service;


}
