package com.billy.retail.mapper;

import com.billy.retail.domain.RetailOrder;

/**
 * @BelongsProject: sprout-cloud
 * @BelongsPackage: com.billy.retail.mapper
 * @Author: 毕苗苗
 * @CreateTime: 2022-10-10  09:40
 * @Description: 测试
 * @Version: 1.0
 */
public interface SproutMapper {

    /**
     * @description:根据订单id获取订单详情
     * @author: 毕苗苗 
     * @date: 2022/10/10 9:54
     * @param: [orderId]
     * @return: com.billy.retail.domain.RetailOrder
     **/
    public RetailOrder getRetailOrderByid(long orderId);

//    /**
//     * @description:获取零售订单集合
//     * @author: 毕苗苗
//     * @date: 2022/10/10 13:22
//     * @param: [retailOrder]
//     * @return: java.util.List<com.billy.retail.domain.RetailOrder>
//     **/
//    public List<RetailOrder> getRestailOrders(RetailOrder retailOrder);

}
