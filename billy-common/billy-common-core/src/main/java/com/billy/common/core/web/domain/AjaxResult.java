package com.billy.common.core.web.domain;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.billy.common.core.constant.HttpStatus;
import com.billy.common.json.JSONObject;
import com.billy.common.utils.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 操作消息提醒
 *
 * @author sprout
 */
public class AjaxResult extends HashMap<String, Object>
{
    private static final long serialVersionUID = 1L;

    /** 状态码 */
    public static final String CODE_TAG = "code";

    /** 返回内容 */
    public static final String MSG_TAG = "msg";

    /** 数据对象 */
    public static final String DATA_TAG = "data";



    /**
     * 初始化一个新创建的 AjaxResult 对象，使其表示一个空消息。
     */
    public AjaxResult()
    {
    }

    /**
     * 初始化一个新创建的 AjaxResult 对象
     *
     * @param code 状态码
     * @param msg 返回内容
     */
    public AjaxResult(int code, String msg)
    {
        super.put(CODE_TAG,String.valueOf(code));
        super.put(MSG_TAG, msg);
    }

    /**
     * 初始化一个新创建的 AjaxResult 对象
     *
     * @param code 状态码
     * @param msg 返回内容
     * @param data 数据对象
     */
    public AjaxResult(int code, String msg, Object data)
    {
        super.put(CODE_TAG, String.valueOf(code));
        super.put(MSG_TAG, msg);
        if (StringUtils.isNotNull(data))
        {
//            String s = JSON.toJSONString(data);
            super.put(DATA_TAG, data);
        }
    }

    public <T> T  getObject(Class<T> t) {
        T t1 = null;
        Object obj = this.get(DATA_TAG);

        String o = JSON.toJSONString(obj);
        T t2 = JSON.parseObject(o, t);
        return t2;
    }

    /**
     * 返回成功消息
     *
     * @return 成功消息
     */
    public static AjaxResult success()
    {
        return AjaxResult.success("操作成功");
    }

    /*
     * 根据影响行数返回结果,如果大于0返回成功
     * */
    public static AjaxResult resultAffect(int affect) {
        if (affect > 0) {
            return success();
        } else {
            return error();
        }
    }

    /**
     * 返回成功数据
     *
     * @return 成功消息
     */
    public static AjaxResult success(Object data)
    {
        return AjaxResult.success("操作成功", data);
    }

    /*
     * 分页返回
     * */
    public static AjaxResult pageSuccess(List<?> list) {

        PageInfo<?> pageInfo = new PageInfo(list);
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("rows", list);
        m.put("pageNum", pageInfo.getPageNum());
        m.put("total", pageInfo.getTotal());
        return AjaxResult.success(m);
    }

    /**
     * 返回成功消息
     *
     * @param msg 返回内容
     * @return 成功消息
     */
    public static AjaxResult success(String msg)
    {
        return AjaxResult.success(msg, null);
    }

    /**
     * 返回成功消息
     *
     * @param msg 返回内容
     * @param data 数据对象
     * @return 成功消息
     */
    public static AjaxResult success(String msg, Object data)
    {
        return new AjaxResult(HttpStatus.SUCCESS, msg, data);
    }

    /**
     * 返回错误消息
     *
     * @return
     */
    public static AjaxResult error()
    {
        return AjaxResult.error("操作失败");
    }

    /**
     * 返回错误消息
     *
     * @param msg 返回内容
     * @return 警告消息
     */
    public static AjaxResult error(String msg)
    {
        return AjaxResult.error(msg, null);
    }

    /**
     * 返回错误消息
     *
     * @param msg 返回内容
     * @param data 数据对象
     * @return 警告消息
     */
    public static AjaxResult error(String msg, Object data)
    {
        return new AjaxResult(HttpStatus.ERROR, msg, data);
    }

    /**
     * 返回错误消息
     *
     * @param code 状态码
     * @param msg 返回内容
     * @return 警告消息
     */
    public static AjaxResult error(int code, String msg)
    {
        return new AjaxResult(code, msg, null);
    }

    /**
     * 是否为成功消息
     *
     * @return 结果
     */
    public boolean isSuccess()
    {
        return !isError();
    }

    /**
     * 是否为错误消息
     *
     * @return 结果
     */
    public boolean isError()
    {
        return !Objects.equals(HttpStatus.SUCCESS, this.get(CODE_TAG));
    }


    /**
     * 方便链式调用
     *
     * @param key
     * @param value
     * @return
     */
    public AjaxResult put(String key, Object value)
    {
        String s = JSONObject.valueAsStr(value);
        super.put(key, s);
        return this;
    }

    public static AjaxResult data(Object obj) {
        String s = JSONObject.valueAsStr(obj);
        AjaxResult ar = new AjaxResult();

        ar.put("data", s);
        return ar;
    }
}
