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
 * @CreateTime: 2022-10-17  09:37
 * @Description: TODO
 * @Version: 1.0
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@ApiModel("系统配置列表请求")
public class SysConfigListVO {

    @ApiModelProperty(required = false, value = "参数名称",example = "")
    @Excel(name = "参数名称")
    private String configName;

    @ApiModelProperty(required = false, value = "参数键名",example = "")
    @Excel(name = "参数键名")
    private String configKey;

    /** 系统内置（Y是 N否） */
    @ApiModelProperty(required = false, value = "系统内置",example = "")
    @Excel(name = "系统内置", readConverterExp = "Y=是,N=否")
    private String configType;

    @ApiModelProperty(required = false, value = "开始时间",example = "2015-01-01")
    private String beginTime;

    @ApiModelProperty(required = false, value = "结束时间",example = "2022-11-11")
    private String endTime;

}
