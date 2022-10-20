package com.billy.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("过滤角色视图")
public class SysRoleFilterVO {

    @ApiModelProperty(required = false, value = "角色名称",example = "管理员")
    @Size(max = 30,message = "不超过30个字符")
    private String roleName;

    @ApiModelProperty(required = false, value = "角色状态,如0正常1停用",example = "0")
    @Size(max = 1,message = "不超过1个字符")
    private String status;

    @ApiModelProperty(required = false, value = "开始时间",example = "2015-01-01")
    private String beginTime;

    @ApiModelProperty(required = false, value = "结束时间",example = "2022-12-31")
    private String endTime;

    //模糊搜索过滤
    @ApiModelProperty(required = false, value = "角色编码模糊搜索")
    private String roleKey;

    //数据权限查询过滤,前端无需传递
    private String dataScope;

}
