package com.billy.retail.service;


import com.billy.retail.domain.RetailOrderItem;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author sprout
 * @date 2022-09-26
 */
public interface IRetailOrderItemService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param orderItmId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public RetailOrderItem selectRetailOrderItemById(Long orderItmId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param retailOrderItem 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<RetailOrderItem> selectRetailOrderItemList(RetailOrderItem retailOrderItem);

    /**
     * 新增【请填写功能名称】
     * 
     * @param retailOrderItem 【请填写功能名称】
     * @return 结果
     */
    public int insertRetailOrderItem(RetailOrderItem retailOrderItem);

    public int insertRetailOrderItemBatch(List<RetailOrderItem> orderItems);

    /**
     * 修改【请填写功能名称】
     * 
     * @param retailOrderItem 【请填写功能名称】
     * @return 结果
     */
    public int updateRetailOrderItem(RetailOrderItem retailOrderItem);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRetailOrderItemByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param orderItmId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteRetailOrderItemById(Long orderItmId);
}
