package com.billy.auth.service;

import cn.hutool.core.util.IdUtil;
import com.billy.common.constant.Constants;
import com.billy.common.redis.annotation.RedisEvict;
import com.billy.common.redis.util.RedisUtils;
import com.billy.system.domain.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

import static cn.hutool.core.lang.Console.print;


@Service("accessTokenService")
public class AccessTokenService
{
    @Autowired
    private RedisUtils redis;

    /**
     * 12小时后过期
     */
    private final static long   EXPIRE        = 12 * 60 * 60;

    private final static String ACCESS_TOKEN  = Constants.ACCESS_TOKEN;

    private final static String ACCESS_USERID = Constants.ACCESS_USERID;

    public SysUser queryByToken(String token)
    {
        return redis.get(ACCESS_TOKEN + token, SysUser.class);
    }

    @RedisEvict(key = "user_perms", fieldKey = "#sysUser.userId")
    public Map<String, Object> createToken(SysUser sysUser)
    {
        // 生成token
        String token = IdUtil.fastSimpleUUID();
        // 保存或更新用户token
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", sysUser.getUserId());
        map.put("token", token);
        map.put("expire", EXPIRE);
        // expireToken(userId);
        redis.set(ACCESS_TOKEN + token, sysUser, EXPIRE);
        redis.set(ACCESS_USERID + sysUser.getUserId(), token, EXPIRE);
        print("写入缓存");
        print("\n\n");
        print(ACCESS_TOKEN + token);
        print("\n\n");
        return map;



    }

    public void expireToken(long userId)
    {
        String token = redis.get(ACCESS_USERID + userId);
        if (StringUtils.isNotBlank(token))
        {
            redis.delete(ACCESS_USERID + userId);
            redis.delete(ACCESS_TOKEN + token);
        }
    }
}