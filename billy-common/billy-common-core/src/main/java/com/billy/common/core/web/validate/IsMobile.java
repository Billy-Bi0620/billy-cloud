package com.billy.common.core.web.validate;

import com.billy.common.core.web.validate.imp.IsMobileValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.PARAMETER, ElementType.TYPE_USE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = {IsMobileValidator.class})

/**
 * @description: 手机号验证注解
 * @author: 毕苗苗
 * @date: 2022/10/19 8:57
 * @param:
 * @return:
 **/
public @interface IsMobile {

    boolean required() default true;//默认参数为必填

    String message() default "手机号码格式错误!";//如果手机号格式不对则会抛异常

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
