package com.billy.common.core.web.validate.imp;

import com.billy.common.core.web.validate.IsMobile;
import com.billy.common.utils.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @BelongsProject: sprout-cloud
 * @BelongsPackage: com.billy.common.core.web.validate.imp
 * @Author: 毕苗苗
 * @CreateTime: 2022-10-19  08:58
 * @Description: TODO
 * @Version: 1.0
 */
public class IsMobileValidator implements ConstraintValidator<IsMobile,String> {

    private final Pattern mobile_pattern = Pattern.compile("[1]([3-9])[0-9]{9}$");
    private boolean required = false;
    @Override
    public void initialize(IsMobile constraintAnnotation) {
        required = constraintAnnotation.required();//设置参数不能为空
    }
    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        if (required){//如果参数不为空则判断电话号是否正确
            return isMobile(value);
        }else {
            if (StringUtils.isEmpty(value)){
                return true;
            }else {
                return isMobile(value);
            }
        }
    }

    /**
     * @description: 手机号规则验证逻辑
     * @author: 毕苗苗
     * @date: 2022/10/19 9:00
     * @param: [mobile]
     * @return: java.lang.Boolean
     **/
    private  Boolean isMobile(String mobile){
        if (StringUtils.isEmpty(mobile)){//判断电话号是否为空
            return false;
        }
        Matcher matcher = mobile_pattern.matcher(mobile);//使用正则判断
        return matcher.matches();
    }

}
