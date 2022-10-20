package com.billy.retail.vo.req;

import com.billy.common.core.domain.SearchVO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderSearchVO extends SearchVO {
    private long id;

    private String name;
}
