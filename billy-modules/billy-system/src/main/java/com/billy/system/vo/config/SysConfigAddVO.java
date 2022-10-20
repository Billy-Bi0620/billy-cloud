package com.billy.system.vo.config;

import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @BelongsProject: sprout-cloud
 * @BelongsPackage: com.billy.system.vo.config
 * @Author: 毕苗苗
 * @CreateTime: 2022-10-17  10:02
 * @Description: TODO
 * @Version: 1.0
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@ApiModel("系统配置新建vo")
public class SysConfigAddVO {

    /** 参数名称 */
    @Excel(name = "参数名称")
    @ApiModelProperty(required = false, value = "配置名称",example = "xxx配置")
    private String configName;

    /** 参数键名 */
    @Excel(name = "参数键名")
    @ApiModelProperty(required = false, value = "配置键",example = "aaa.bbb.cloudStorage")
    private String configKey;

    /** 参数键值 */
    @Excel(name = "参数键值")
    @ApiModelProperty(required = false, value = "配置值",example = "")
    private String configValue;

    /** 系统内置（Y是 N否） */
    @ApiModelProperty(required = false, value = "系统内置",example = "N")
    @Excel(name = "系统内置", readConverterExp = "Y=是,N=否")
    private String configType;

    @ApiModelProperty(required = false, value = "备注",example = "")
    @Excel(name = "备注")
    private String remark;

}
