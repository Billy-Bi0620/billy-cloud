package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("修改角色权限视图数据")
public class SysRoleDataScopeVO {

    @ApiModelProperty(required = true, value = "角色ID,编辑时必传",example = "1")
    @NotNull(message = "角色ID,编辑时必传")
    private Long roleId;

    @ApiModelProperty(required = false, value = "数据范围(1全部|2自定义)",example = "")
    @Size(max = 1,message = "不超过1个字符")
    private String dataScope;

    @ApiModelProperty(required = false, value = "拥有的菜单")
    private List<Long> menuIds;

    @ApiModelProperty(required = false, value = "拥有的部门")
    private Long[] deptIds;

}
