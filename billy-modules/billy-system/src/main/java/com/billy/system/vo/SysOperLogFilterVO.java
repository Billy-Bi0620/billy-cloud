package com.billy.system.vo;


import com.billy.common.annotation.Excel;
import com.billy.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;

import java.io.Serializable;
import java.util.Date;

@Data
@ApiModel("过滤操作日志")
public class SysOperLogFilterVO implements Serializable {
    private static final long serialVersionUID = -6506974497510458336L;

    /**
     * 操作模块
     */
    @ApiModelProperty(value = "操作模块")
    private String title;

    /**
     * 业务类型（0其它 1新增 2修改 3删除）
     */
    @ApiModelProperty(value = "业务类型（0其它 1新增 2修改 3删除）")
    private Integer businessType;

    /**
     * 操作状态（0正常 1异常）
     */
    @ApiModelProperty(value = "操作状态（0正常 1异常）")
    private Integer status;

    /**
     * 操作人员
     */
    @ApiModelProperty(value = "操作人员")
    private String operName;

    /**
     * 操作时间 开始
     */
    @ApiModelProperty(value = "开始时间",example = "2015-01-01")
    private String beginTime;

    /**
     * 操作时间 结束
     */
    @ApiModelProperty(value = "结束时间",example = "2022-12-31")
    private String endTime;
}
