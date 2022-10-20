package com.billy.system.vo;


import com.billy.common.core.domain.BaseEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Data
@ApiModel("创建菜单权限")
public class SysMenuCreateVO {
    /** 菜单名称 */
    @ApiModelProperty(value = "菜单名称", required = true, example = "流程定义测试")
    @NotBlank(message = "菜单名称不能为空")
    @Size(max = 50,message = "菜单名称长度不能超过50个字符")
    private String            menuName;

    /** 菜单URL */
    @ApiModelProperty(value = "菜单URL", required = true, example = "procDef测试")
    @NotBlank(message = "菜单URL不能为空")
    @Size(max = 50,message = "菜单URL长度不能超过50个字符")
    private String            menuKey;

    /** 父菜单ID */
    @ApiModelProperty(value = "父菜单ID", example = "")
    @Range(max = Integer.MAX_VALUE, message = "非法父菜单ID")
    private Long              parentId;

    /** 打开方式 (_blank新窗口) */
    @ApiModelProperty(value = "打开方式 (_blank新窗口)", example = "")
    @Size(max = 20,message = "打开方式长度不能超过20个字符")
    private String            target;

    /** 显示顺序 */
    @ApiModelProperty(value = "显示顺序", example = "")
    @Range(max = Integer.MAX_VALUE, message = "非法显示顺序")
    private String            orderNum;

    /** 类型:0目录,1菜单,2按钮 */
    @ApiModelProperty(value = "类型:0目录,1菜单,2按钮", example = "")
    @Size(max = 1,message = "类型长度不能超过1个字符")
    private String            menuType;



    /** 组件 */
    @ApiModelProperty(value = "组件", example = "")
    @Size(max = 50,message = "组件长度不能超过50个字符")
    private String            component;

    /** 菜单状态:0显示,1隐藏 */
    @ApiModelProperty(value = "菜单状态:0显示,1隐藏", example = "")
    @Size(max = 1,message = "菜单状态长度不能超过1个字符")
    private String            visible;

    /** 权限字符串 */
    @ApiModelProperty(value = "权限字符串", example = "")
    @Size(max = 100,message = "权限标识长度不能超过100个字符")
    private String            perms;

    /** 菜单图标 */
    @ApiModelProperty(value = "菜单图标", example = "")
    @Size(max = 100,message = "菜单图标长度不能超过100个字符")
    private String            icon;

    /** 链接地址 */
    @ApiModelProperty(value = "链接地址", example = "")
    @Size(max = 255,message = "链接地址长度不能超过255个字符")
    private String            path;

    /** 重定向地址 */
    @ApiModelProperty(value = "重定向地址", example = "")
    @Size(max = 255,message = "重定向地址长度不能超过255个字符")
    private String            redirect;

    /** 隐藏子菜单 */
    @ApiModelProperty(value = "隐藏子菜单", example = "")
    private Boolean           hiddenChildren;

    /** 隐藏 PageHeader 组件中的页面带的 面包屑和页面标题栏 */
    @ApiModelProperty(value = "隐藏 PageHeader 组件中的页面带的 面包屑和页面标题栏", example = "")
    private Boolean           hiddenHeader;

    /** 备注 */
    @ApiModelProperty(value = "备注", example = "测试的备注")
    @Size(max = 500,message = "备注长度不能超过500个字符")
    private String              remark;
}
