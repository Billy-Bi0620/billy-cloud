package com.billy.common.core.page;


import com.billy.common.utils.StringUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
//import io.swagger.annotations.ApiModel;
//import io.swagger.annotations.ApiModelProperty;


/**
 * 分页数据
 * 
 * @author sprout
 */
//@ApiModel
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("分页参数")
public class PageDomain
{
    /** 每页显示记录数 */
    @ApiModelProperty(required = true, value = "每页条目",example = "100")
    @Min(value = 1,message = "每页条目必须大于1")
    @NotNull(message = "每页条目不允许空值")
    private Integer pageSize;

    /** 当前记录起始索引 */
    @ApiModelProperty(required = true, value = "第N页",example = "1")
    @Min(value = 1,message = "页码数必须大于0")
    @NotNull(message = "页码数不能为空")
    private Integer pageNum;

    /** 排序列 */
    @ApiModelProperty(required = false, value = "排序列",example = "")
    private String orderByColumn;

    /** 排序的方向desc或者asc */
    @ApiModelProperty(required = false, value = "排序方向(desc|asc)",example = "")
    private String isAsc = "asc";


    public String getOrderBy()
    {
        if (StringUtils.isEmpty(orderByColumn))
        {
            return "";
        }
        return StringUtils.toUnderScoreCase(orderByColumn) + " " + isAsc;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }

    public String getOrderByColumn()
    {
        return orderByColumn;
    }

    public void setOrderByColumn(String orderByColumn)
    {
        this.orderByColumn = orderByColumn;
    }

    public String getIsAsc()
    {
        return isAsc;
    }

    public void setIsAsc(String isAsc)
    {
        this.isAsc = isAsc;
    }
}
