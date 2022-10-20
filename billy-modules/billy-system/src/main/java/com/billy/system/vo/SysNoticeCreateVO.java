package com.billy.system.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("新增公告请求")
public class SysNoticeCreateVO {
    @ApiModelProperty(required = true, value = "公告标题")
    @NotBlank(message = "公告标题不能为空")
    @Size(max = 50,message = "岗公告标题码长度不能超过64个字符")
    private String noticeTitle;

    @ApiModelProperty(required = true, value = "公告类型（1通知 2公告）")
    @NotBlank(message = "公告类型不能为空")
    @Size(max = 1,message = "公告类型长度不能超过1个字符")
    /** 公告类型（1通知 2公告） */
    private String noticeType;

    /** 公告内容 */
    @ApiModelProperty(required = true, value = "公告内容")
    @NotBlank(message = "公告内容不能为空")
    @Size(max = 2000,message = "公告内容长度不能超过2000个字符")
    private String noticeContent;


    /** 公告状态（0正常 1关闭） */
    @ApiModelProperty(required = true, value = "公告状态（0正常 1关闭）")
    @NotBlank(message = "公告状态不能为空")
    @Size(max = 1,message = "公告状态长度不能超过1个字符")
    private String status;
}
