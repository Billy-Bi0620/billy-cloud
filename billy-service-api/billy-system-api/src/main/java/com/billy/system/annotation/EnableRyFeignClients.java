package com.billy.system.annotation;

import org.springframework.cloud.openfeign.EnableFeignClients;

import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@EnableFeignClients
public @interface EnableRyFeignClients
{
    String[] value() default {};

    String[] basePackages() default {"com.billy"};

    Class<?>[] basePackageClasses() default {};

    Class<?>[] defaultConfiguration() default {};

    Class<?>[] clients() default {};
}