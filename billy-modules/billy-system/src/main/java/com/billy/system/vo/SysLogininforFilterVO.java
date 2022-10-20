package com.billy.system.vo;


import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@ApiModel("登录日志过滤")
public class SysLogininforFilterVO implements Serializable {

    private static final long serialVersionUID = -6423283811654716553L;

    /** 用户账号 */
    @ApiModelProperty(value = "用户账号")
    private String loginName;
    
    /** 登录状态 0成功 1失败 */
    @ApiModelProperty(value = "登录状态 0成功 1失败")
    private String status;
    
    /** 登录IP地址 */
    @ApiModelProperty(value = "登录IP地址")
    private String ipaddr;

    /**
     * 操作时间 开始
     */
    @ApiModelProperty(value = "访问时间 开始",example = "2015-01-01")
    private String beginTime;

    /**
     * 操作时间 结束
     */
    @ApiModelProperty(value = "访问时间 结束",example = "2022-12-31")
    private String endTime;

}