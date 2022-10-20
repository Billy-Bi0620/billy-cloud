package com.billy.system.controller;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.exception.file.OssException;
import com.billy.common.utils.StringUtils;
import com.billy.common.utils.ValidatorUtils;
import com.billy.system.domain.SysOss;
import com.billy.system.oss.CloudConstant;
import com.billy.system.oss.CloudStorageConfig;
import com.billy.system.oss.CloudStorageService;
import com.billy.system.oss.OSSFactory;
import com.billy.system.oss.valdator.AliyunGroup;
import com.billy.system.oss.valdator.QcloudGroup;
import com.billy.system.oss.valdator.QiniuGroup;
import com.billy.system.service.ISysConfigService;
import com.billy.system.service.ISysOssService;
import com.billy.system.vo.SysOssUpdateVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.util.Date;

/**
 * 文件上传 提供者
 *
 * @author zmr
 * @date 2019-05-16
 */
@RestController
@RequestMapping("oss")
@Validated
@Api(value = "SysOssController", tags = "文件上传")
public class SysOssController extends BaseController {
    private final static String KEY = CloudConstant.CLOUD_STORAGE_CONFIG_KEY;

    @Autowired
    private ISysOssService sysOssService;

    @Autowired
    private ISysConfigService sysConfigService;

    /**
     * 查询云存储配置信息
     */
    @GetMapping("config")
    @HasPermissions("sys:oss:config")
    @ApiOperation(value = "查询云存储配置信息", notes = "查询云存储配置信息", response = CloudStorageConfig.class)
    public AjaxResult config() {
        // 获取云存储配置信息
        String sysConfig = sysConfigService.selectConfigByKey(KEY);
        return AjaxResult.success(JSON.parseObject(sysConfig, CloudStorageConfig.class));
    }

    /**
     * 保存云存储配置信息
     */
    @PostMapping("saveConfig")
    @HasPermissions("sys:oss:config")
    @ApiOperation(value = "保存云存储配置信息", notes = "保存云存储配置信息")
    public AjaxResult saveConfig(@RequestBody CloudStorageConfig config) {
        // 校验类型
        ValidatorUtils.validateEntity(config);
        if (config.getType() == CloudConstant.CloudService.QINIU.getValue()) {
            // 校验七牛数据
            ValidatorUtils.validateEntity(config, QiniuGroup.class);
        } else if (config.getType() == CloudConstant.CloudService.ALIYUN.getValue()) {
            // 校验阿里云数据
            ValidatorUtils.validateEntity(config, AliyunGroup.class);
        } else if (config.getType() == CloudConstant.CloudService.QCLOUD.getValue()) {
            // 校验腾讯云数据
            ValidatorUtils.validateEntity(config, QcloudGroup.class);
        }
        return toAjax(sysConfigService.updateValueByKey(KEY, new Gson().toJson(config)));
    }

    /**
     * 查询文件属性
     */
    @GetMapping("get")
    @ApiOperation(value = "查询文件上传", notes = "查询文件上传", response = SysOss.class)
    public AjaxResult get(@RequestParam @ApiParam(name = "id", type = "Integer", value = "id,必须是一个整数", example = "31")
                      @Min(value = 1, message = "最小值必须大于0")
                      @Max(value = Integer.MAX_VALUE, message = "超出最大值")
                      Long id) {
        return AjaxResult.success(sysOssService.selectSysOssById(id));
    }

    /**
     * 查询文件属性列表
     */
    @GetMapping("list")
    @ApiOperation(value = "查询文件属性列表", notes = "查询文件属性列表", response = SysOss.class)
    public AjaxResult list(SysOss sysOss) {
        startPage();
        return AjaxResult.pageSuccess(sysOssService.selectSysOssList(sysOss));
    }

    /**
     * 修改文件属性
     */
    @PostMapping("update")
    @HasPermissions("sys:oss:edit")
    @ApiOperation(value = "修改文件属性", notes = "修改文件属性")
    public AjaxResult editSave(@RequestBody @Validated SysOssUpdateVO sysOss) {
        return toAjax(sysOssService.updateSysOss(sysOss));
    }

    /**
     * 上传文件
     *
     * @throws IOException
     */
    @PostMapping("upload")
    @HasPermissions("sys:oss:add")
    @ApiOperation(value = "上传文件", notes = "上传文件")
    public AjaxResult editSave(@RequestParam("file") MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new OssException("上传文件不能为空");
        }
        // 上传文件
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        CloudStorageService storage = OSSFactory.build();
        String url = storage.uploadSuffix(file.getBytes(), suffix);
        // 保存文件信息
        SysOss ossEntity = new SysOss();
        ossEntity.setUrl(url);
        ossEntity.setFileSuffix(suffix);
        ossEntity.setCreateBy(getLoginName());
        ossEntity.setFileName(fileName);
        ossEntity.setCreateTime(new Date());
        ossEntity.setService(storage.getService());
        return toAjax(sysOssService.insertSysOss(ossEntity));
    }

    /**
     * 删除文件上传
     */
    @PostMapping("remove")
    @HasPermissions("sys:oss:remove")
    @ApiOperation(value = "删除文件上传", notes = "删除文件上传")
    public AjaxResult remove(@RequestParam @ApiParam(required = true, value = "根据主键字符串进行删除。如 1,2,3,4") @NotEmpty(message = "不能为空") String ids) {
        return toAjax(sysOssService.deleteSysOssByIds(ids));
    }
}
