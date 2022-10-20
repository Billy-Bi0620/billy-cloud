package com.billy.common.objmap;
import ma.glasnost.orika.MapperFactory;

public interface BeanMapperRegistry {
    void registry(MapperFactory mapperFactory);
}