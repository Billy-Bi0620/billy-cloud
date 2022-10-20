package com.billy.common.core.web.validate;

import com.billy.common.core.web.validate.imp.DateTimeFormatValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = DateTimeFormatValidator.class)
public @interface DateTimeFormat {

    String message() default "{javax.validation.constraints.DateTimeFormat.message}";


    String format() default "yyyy-MM-dd HH:mm:ss";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
