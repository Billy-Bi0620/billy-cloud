package com.billy.system.vo;


import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;


//todo rfc有调用operLog/save方法，担心结构序列化不一致，暂时弃用此结构
@Data
@ApiModel("新增或修改操作日志")
public class SysOperLogCreateVO implements Serializable {

    private static final long serialVersionUID = 2139702724406728492L;

    /**
     * 模块标题
     */
    @ApiModelProperty(value = "模块标题")
    @Size(max = 50, message = "模块标题长度不能超过50个字符")
    private String title;

    /**
     * 业务类型（0其它 1新增 2修改 3删除）
     */
    @ApiModelProperty(value = "业务类型")
    private Integer businessType;

    /**
     * 请求方法
     */
    @ApiModelProperty(value = "请求方法")
    @Size(max = 100, message = "请求方法长度不能超过100个字符")
    private String method;

    /**
     * 请求方式
     */
    @ApiModelProperty(value = "请求方式")
    @Size(max = 10, message = "请求方式长度不能超过10个字符")
    private String requestMethod;

    /**
     * 操作类别（0其它 1后台用户 2手机端用户）
     */
    @ApiModelProperty(value = "操作类别")
    private Integer operatorType;

    /**
     * 操作人员
     */
    @ApiModelProperty(value = "操作人员")
    @Size(max = 50, message = "操作人员长度不能超过50个字符")
    private String operName;

    /**
     * 部门名称
     */
    @ApiModelProperty(value = "部门名称")
    @Size(max = 50, message = "部门名称长度不能超过50个字符")
    private String deptName;

    /**
     * 请求url
     */
    @ApiModelProperty(value = "请求地址")
    @Size(max = 255, message = "请求地址长度不能超过255个字符")
    private String operUrl;

    /**
     * 操作地址
     */
    @ApiModelProperty(value = "操作地址")
    @Size(max = 50, message = "操作地址长度不能超过50个字符")
    private String operIp;

    /**
     * 操作地点
     */
    @ApiModelProperty(value = "操作地点")
    @Size(max = 255, message = "操作地点长度不能超过255个字符")
    private String operLocation;

    /**
     * 请求参数
     */
    @ApiModelProperty(value = "请求参数")
    private String operParam;

    /**
     * 操作状态（0正常 1异常）
     */
    @ApiModelProperty(value = "状态")
    private Integer status;

    /**
     * 错误消息
     */
    @ApiModelProperty(value = "错误消息")
    private String errorMsg;

    /**
     * 操作时间
     */
    @ApiModelProperty(value = "操作时间")
    private Date operTime;
}
