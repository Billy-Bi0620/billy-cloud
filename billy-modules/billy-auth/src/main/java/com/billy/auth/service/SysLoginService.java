package com.billy.auth.service;


import com.billy.common.constant.Constants;
import com.billy.common.constant.UserConstants;
import com.billy.common.enums.UserStatus;
import com.billy.common.exception.user.UserBlockedException;
import com.billy.common.exception.user.UserDeleteException;
import com.billy.common.exception.user.UserNotExistsException;
import com.billy.common.exception.user.UserPasswordNotMatchException;
import com.billy.common.log.publish.PublishFactory;
import com.billy.common.utils.DateUtils;
import com.billy.common.utils.IpUtils;
import com.billy.common.utils.MessageUtils;
import com.billy.common.utils.ServletUtils;
import com.billy.system.domain.SysUser;
import com.billy.system.feign.RemoteUserService;
import com.billy.system.util.PasswordUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SysLoginService
{

    @Autowired
    private RemoteUserService userService;

    /**
     * 登录
     */
    public SysUser login(String username, String password)
    {
        // 验证码校验
        // if
        // (!StringUtils.isEmpty(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA)))
        // {
        // AsyncManager.me().execute(AsyncFactory.recordLogininfor(username,
        // Constants.LOGIN_FAIL,
        // MessageUtils.message("user.jcaptcha.error")));
        // throw new CaptchaException();
        // }
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password))
        {
            PublishFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null"));
            throw new UserNotExistsException();
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            PublishFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
                    MessageUtils.message("user.password.not.match"));
            throw new UserPasswordNotMatchException();
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            PublishFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
                    MessageUtils.message("user.password.not.match"));
            throw new UserPasswordNotMatchException();
        }
        // 查询用户信息
        SysUser user = userService.selectSysUserByUsername(username);
 /*       SysUser user = result.getObject(SysUser.class);*/

        if (user == null)
        {
            PublishFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.not.exists"));
            throw new UserNotExistsException();
        }
        if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            PublishFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
                    MessageUtils.message("user.password.delete"));
            throw new UserDeleteException();
        }
        if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            PublishFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
                    MessageUtils.message("user.blocked", user.getRemark()));
            throw new UserBlockedException();
        }
        if (!PasswordUtil.matches(user, password))
        {
            throw new UserPasswordNotMatchException();
        }
        PublishFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
        recordLoginInfo(user);
        return user;
    }

    // private boolean maybeEmail(String username)
    // {
    // if (!username.matches(UserConstants.EMAIL_PATTERN))
    // {
    // return false;
    // }
    // return true;
    // }
    //
    // private boolean maybeMobilePhoneNumber(String username)
    // {
    // if (!username.matches(UserConstants.MOBILE_PHONE_NUMBER_PATTERN))
    // {
    // return false;
    // }
    // return true;
    // }
    /**
     * 记录登录信息
     */
    public void recordLoginInfo(SysUser user)
    {
        user.setLoginIp(IpUtils.getIpAddr(ServletUtils.getRequest()));
        user.setLoginDate(DateUtils.getNowDate());
        userService.updateUserLoginRecord(user);
    }

    public void logout(String loginName)
    {
        PublishFactory.recordLogininfor(loginName, Constants.LOGOUT, MessageUtils.message("user.logout.success"));
    }
}