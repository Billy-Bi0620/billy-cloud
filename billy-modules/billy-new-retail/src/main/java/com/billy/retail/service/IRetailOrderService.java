package com.billy.retail.service;

import com.billy.retail.domain.RetailOrder;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author sprout
 * @date 2022-09-15
 */
public interface IRetailOrderService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public RetailOrder selectRetailOrderById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param retailOrder 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<RetailOrder> selectRetailOrderList(RetailOrder retailOrder);

    /**
     * 新增【请填写功能名称】
     * 
     * @param retailOrder 【请填写功能名称】
     * @return 结果
     */
    public int insertRetailOrder(RetailOrder retailOrder);

    /**
     * 修改【请填写功能名称】
     * 
     * @param retailOrder 【请填写功能名称】
     * @return 结果
     */
    public int updateRetailOrder(RetailOrder retailOrder);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRetailOrderByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteRetailOrderById(Long id);

    /**
     * @description: 根据订单id获取订单详情
     * @author: 毕苗苗
     * @date: 2022/10/10 13:59
     * @param: [orderId]
     * @return: com.billy.retail.domain.RetailOrder
     **/
    public RetailOrder getRetailInfo(Long orderId);
}
