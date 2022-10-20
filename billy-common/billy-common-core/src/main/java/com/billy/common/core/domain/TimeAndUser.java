package com.billy.common.core.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.billy.common.annotation.Excel;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class TimeAndUser implements Serializable {
    private static final long   serialVersionUID = 1L;

    @Excel(name = "创建人")
    private String              createBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建实际")
    private Date                createTime;


    @Excel(name = "修改人")
    /** 更新者 */
    private String              updateBy;
    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")


    @Excel(name = "修改实际")
    private Date                updateTime;

}
