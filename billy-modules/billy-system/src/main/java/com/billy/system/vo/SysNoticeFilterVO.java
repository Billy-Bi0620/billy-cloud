package com.billy.system.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@ApiModel("通知过滤")
public class SysNoticeFilterVO implements Serializable {

    private static final long serialVersionUID = -2309739031765767289L;
    
    /** 公告标题 */
    @ApiModelProperty(value = "公告标题")
    private String noticeTitle;
    
    /** 公告类型（1通知 2公告） */
    @ApiModelProperty(value = "公告类型（1通知 2公告）")
    private String noticeType;
    
    /** 创建人 */
    @ApiModelProperty(value = "创建人")
    private String createBy;

}
