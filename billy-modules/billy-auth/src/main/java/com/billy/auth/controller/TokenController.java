package com.billy.auth.controller;

import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.billy.auth.form.CheckForm;
import com.billy.auth.form.LoginForm;
import com.billy.auth.service.AccessTokenService;
import com.billy.auth.service.SysLoginService;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.system.domain.SysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
@Api(value = "TokenController",tags = "登录接口",position = 6)
public class TokenController
{
    @Autowired
    private AccessTokenService tokenService;

    @Autowired
    private SysLoginService sysLoginService;

    @Autowired
    private CaptchaService     captchaService;

    @PostMapping("login")
    @ApiOperation("登录")
    public AjaxResult login(@RequestBody LoginForm form)
    {
        // 用户登录
        SysUser user = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        return AjaxResult.success(tokenService.createToken(user));
    }

    @PostMapping("check")
    @ApiOperation(("验证码验证"))
    public AjaxResult check(@RequestBody CheckForm cf) {
        CaptchaVO captchaVO = new CaptchaVO();
        captchaVO.setCaptchaType(cf.getCaptchaType());
        captchaVO.setPointJson(cf.getPointJson());
        captchaVO.setToken(cf.getToken());
        ResponseModel check = captchaService.check(captchaVO);
        if (check.isSuccess()) {
            return AjaxResult.success().put("checkResult", check);
        } else {
            return AjaxResult.error().put("checkResult",check);
        }
    }

    @PostMapping("login/slide")
    @ApiOperation("滑动登录")
    public AjaxResult loginSilde(@RequestBody LoginForm form)
    {
        ResponseModel response = captchaService.verification(form.getCaptchaVO());

        // 用户登录
        SysUser user = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        AjaxResult aa = AjaxResult.success(tokenService.createToken(user));
        return aa;

     /*   if (response.isSuccess())
        {
            // 用户登录
            SysUser user = sysLoginService.login(form.getUsername(), form.getPassword());
            // 获取登录token
            AjaxResult aa = AjaxResult.success(tokenService.createToken(user));
            return aa;
        }
        return AjaxResult.error("repCode",response.getRepCode());*/
    }

    @PostMapping("logout")
    @ApiOperation("登出")
    public AjaxResult logout(HttpServletRequest request)
    {
        String token = request.getHeader("token");
        SysUser user = tokenService.queryByToken(token);
        if (null != user)
        {
            sysLoginService.logout(user.getLoginName());
            tokenService.expireToken(user.getUserId());
        }
        return AjaxResult.success();
    }
}
