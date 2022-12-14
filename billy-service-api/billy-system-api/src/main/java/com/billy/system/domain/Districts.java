package com.billy.system.domain;

import com.billy.common.annotation.Excel;
import com.billy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 地区表 districts
 * 
 * @author sprout
 * @date 2018-12-19
 */
public class Districts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @Excel(name = "编号")
    private Integer           id;

    /** 上级编号 */
    @Excel(name = "上级编号")
    private Integer           pid;

    /** 层级 */
    @Excel(name = "层级")
    private Integer           deep;

    /** 名称 */
    @Excel(name = "名称")
    private String            name;

    /** 上级名称 */
    @Excel(name = "上级名称")
    private String            pname;

    /** 拼音 */
    @Excel(name = "拼音")
    private String            pinyin;

    /** 拼音缩写 */
    @Excel(name = "拼音缩写")
    private String            pinyinShor;

    /** 扩展名 */
    @Excel(name = "扩展名")
    private String            extName;

    /** 操作人 */
    @Excel(name = "操作人")
    private String            operator;

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }

    public void setPid(Integer pid)
    {
        this.pid = pid;
    }

    public Integer getPid()
    {
        return pid;
    }

    public void setDeep(Integer deep)
    {
        this.deep = deep;
    }

    public Integer getDeep()
    {
        return deep;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public String getPname()
    {
        return pname;
    }

    public void setPname(String pname)
    {
        this.pname = pname;
    }

    public void setPinyin(String pinyin)
    {
        this.pinyin = pinyin;
    }

    public String getPinyin()
    {
        return pinyin;
    }

    public void setPinyinShor(String pinyinShor)
    {
        this.pinyinShor = pinyinShor;
    }

    public String getPinyinShor()
    {
        return pinyinShor;
    }

    public void setExtName(String extName)
    {
        this.extName = extName;
    }

    public String getExtName()
    {
        return extName;
    }

    public void setOperator(String operator)
    {
        this.operator = operator;
    }

    public String getOperator()
    {
        return operator;
    }

    public String toString()
    {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId()).append("pid", getPid())
                .append("deep", getDeep()).append("name", getName()).append("pinyin", getPinyin())
                .append("pinyinShor", getPinyinShor()).append("extName", getExtName())
                .append("createTime", getCreateTime()).append("updateTime", getUpdateTime())
                .append("operator", getOperator()).toString();
    }
}
