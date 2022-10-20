package com.billy.system.vo;

import com.billy.system.domain.SysUserRole;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/*
* 批量分配用户VO对象
* */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("角色批量分配用户请求")
public class BatchUserRoleVO {

    @ApiModelProperty(value = "角色用户id集合")
    private List<SysUserRole> userRoles;
}
