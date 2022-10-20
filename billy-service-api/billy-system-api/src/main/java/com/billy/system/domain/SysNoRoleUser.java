package com.billy.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.billy.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysNoRoleUser {
    @Excel(name = "用户序号", prompt = "用户编号")
    private Long              userId;

    /** 登录名称 */
    @Excel(name = "登录名称")
    private String            loginName;

    /** 用户名称 */
    @Excel(name = "用户名称")
    private String            userName;

    /** 用户邮箱 */
    @Excel(name = "用户邮箱")
    private String            email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String            phonenumber;


    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private String            status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
