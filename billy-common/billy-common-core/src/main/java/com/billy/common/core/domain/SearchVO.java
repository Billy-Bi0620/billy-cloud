package com.billy.common.core.domain;

import lombok.Data;

import java.util.Map;
/*
* 搜索VO
* */
@Data
public class SearchVO {
    /** 搜索值 */
    private String searchValue;

    private Map<String, Object> params;
}
