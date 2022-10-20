package com.billy.retail.service.impl;

import com.billy.common.core.text.Convert;
import com.billy.retail.domain.RetailOrderItem;
import com.billy.retail.mapper.RetailOrderItemMapper;
import com.billy.retail.service.IRetailOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author sprout
 * @date 2022-09-26
 */
@Service
public class RetailOrderItemServiceImpl implements IRetailOrderItemService
{
    @Autowired
    private RetailOrderItemMapper retailOrderItemMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param orderItmId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public RetailOrderItem selectRetailOrderItemById(Long orderItmId)
    {
        return retailOrderItemMapper.selectRetailOrderItemById(orderItmId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param retailOrderItem 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<RetailOrderItem> selectRetailOrderItemList(RetailOrderItem retailOrderItem)
    {
        return retailOrderItemMapper.selectRetailOrderItemList(retailOrderItem);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param retailOrderItem 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertRetailOrderItem(RetailOrderItem retailOrderItem)
    {
        return retailOrderItemMapper.insertRetailOrderItem(retailOrderItem);
    }

    @Override
    public int insertRetailOrderItemBatch(List<RetailOrderItem> orderItems) {
        return retailOrderItemMapper.insertRetailOrderItemBatch(orderItems);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param retailOrderItem 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateRetailOrderItem(RetailOrderItem retailOrderItem)
    {
        return retailOrderItemMapper.updateRetailOrderItem(retailOrderItem);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteRetailOrderItemByIds(String ids)
    {
        return retailOrderItemMapper.deleteRetailOrderItemByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param orderItmId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteRetailOrderItemById(Long orderItmId)
    {
        return retailOrderItemMapper.deleteRetailOrderItemById(orderItmId);
    }
}
