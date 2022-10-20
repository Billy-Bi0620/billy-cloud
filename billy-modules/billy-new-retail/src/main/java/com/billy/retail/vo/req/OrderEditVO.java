package com.billy.retail.vo.req;

import lombok.Data;

@Data
public class OrderEditVO {
    /** 姓名 */
    private String name;

    /** 订单id */
    private long id;
}
