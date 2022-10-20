package com.billy.system.vo;


import com.billy.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.List;

@Data
public class SysMenuFilterVO {

    /**
     * 菜单名称
     */
    @ApiModelProperty(value = "菜单名称")
    private String menuName;

    /**
     * 菜单URL
     */
    @ApiModelProperty(value = "菜单URL")
    private String menuKey;

    /**
     * 菜单状态:0显示,1隐藏
     */
    @ApiModelProperty(value = "菜单状态:0显示,1隐藏")
    private String visible;
}
