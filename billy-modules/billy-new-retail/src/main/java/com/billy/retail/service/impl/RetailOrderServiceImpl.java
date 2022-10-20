package com.billy.retail.service.impl;

import com.billy.common.core.text.Convert;
import com.billy.retail.domain.RetailOrder;
import com.billy.retail.domain.RetailOrderItem;
import com.billy.retail.mapper.RetailOrderItemMapper;
import com.billy.retail.mapper.RetailOrderMapper;
import com.billy.retail.mapper.SproutMapper;
import com.billy.retail.service.IRetailOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author sprout
 * @date 2022-09-15
 */
@Service
public class RetailOrderServiceImpl implements IRetailOrderService
{
    @Autowired
    private RetailOrderMapper retailOrderMapper;

    @Autowired
    private RetailOrderItemMapper retailOrderItemMapper;

    @Autowired
    private SproutMapper sproutMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public RetailOrder selectRetailOrderById(Long id)
    {
        return retailOrderMapper.selectRetailOrderById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param retailOrder 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<RetailOrder> selectRetailOrderList(RetailOrder retailOrder)
    {
        return retailOrderMapper.selectRetailOrderList(retailOrder);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param retailOrder 【请填写功能名称】
     * @return 结果
     */
    @Override
    @Transactional
    public int insertRetailOrder(RetailOrder retailOrder)
    {
        int i = retailOrderMapper.insertRetailOrder(retailOrder);
        Long orderId = retailOrder.getOrderId();
        List<RetailOrderItem> orderItems = retailOrder.getOrderItems();
        for (RetailOrderItem orderItem : orderItems) {
            orderItem.setOrderId(orderId);
        }
        retailOrderItemMapper.insertRetailOrderItemBatch(orderItems);
        return i;
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param retailOrder 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateRetailOrder(RetailOrder retailOrder)
    {
        return retailOrderMapper.updateRetailOrder(retailOrder);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteRetailOrderByIds(String ids)
    {
        return retailOrderMapper.deleteRetailOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteRetailOrderById(Long id)
    {
        return retailOrderMapper.deleteRetailOrderById(id);
    }

    @Override
    public RetailOrder getRetailInfo(Long orderId) {
        return sproutMapper.getRetailOrderByid(orderId);
    }
}
