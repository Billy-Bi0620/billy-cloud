package com.billy.system.vo;

import com.billy.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("新增角色视图数据")
public class SysRoleInsertVO {
    @ApiModelProperty(required = true, value = "角色名称,创建后禁止修改",example = "管理员")
    @Size(max = 30,message = "长度不超过30个字符")
    @NotBlank(message = "登录账号不允许空值")
    private String roleName;

    @ApiModelProperty(required = true, value = "角色代码",example = "super")
    @Size(max = 100,message = "长度不超过100个字符")
    @NotBlank(message = "不允许空值")
    private String roleKey;

    @ApiModelProperty(required = false, value = "显示顺序",example = "1")
    private Long roleSort;

    @ApiModelProperty(required = false, value = "数据范围(1全部|2自定义)",example = "")
    @Size(max = 1,message = "不超过1个字符")
    private String dataScope;

    @ApiModelProperty(required = false, value = "备注",example = "备注")
    @Size(max = 500,message = "长度不超过500个字符")
    private String remark;

    @ApiModelProperty(required = false, value = "拥有的菜单")
    private List<Long> menuIds;

    @ApiModelProperty(required = false, value = "拥有的部门")
    private Long[] deptIds;

}
