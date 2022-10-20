package com.billy.common.objmap;

import ma.glasnost.orika.MapperFacade;
import ma.glasnost.orika.MapperFactory;
import ma.glasnost.orika.impl.DefaultMapperFactory;

import java.util.List;
import java.util.ServiceLoader;

public class BeanMapper {
    private static MapperFactory mapperFactory;
    private static MapperFacade mapperFacade;

    static {
        mapperFactory = new DefaultMapperFactory.Builder().build();
        mapperFacade = mapperFactory.getMapperFacade();

        // 利用SPI,注册Bean的转换规则
        ServiceLoader<BeanMapperRegistry> serviceLoader = ServiceLoader.load(BeanMapperRegistry.class);
        for (BeanMapperRegistry beanMapperRegistry : serviceLoader) {
            beanMapperRegistry.registry(mapperFactory);
        }
    }

    public static MapperFactory getMapperFactory() {
        return mapperFactory;
    }

    public static <S, T> T map(S sourceObj, Class<T> targetClass) {
        return mapperFacade.map(sourceObj, targetClass);
    }

    public static <S, T> List<T> mapAsList(Iterable<S> sourceObj, Class<T> targetClass) {
        return mapperFacade.mapAsList(sourceObj, targetClass);
    }
}