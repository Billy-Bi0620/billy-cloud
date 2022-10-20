package com.billy.system.controller;

import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.objmap.BeanMapper;
import com.billy.common.utils.DateUtils;
import com.billy.system.domain.SysConfig;
import com.billy.system.service.ISysConfigService;
import com.billy.system.vo.config.SysConfigAddVO;
import com.billy.system.vo.config.SysConfigEditVO;
import com.billy.system.vo.config.SysConfigListVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;

/**
 * 参数配置 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("config")
@Api(value = "SysConfigController",tags = "系统配置")
public class SysConfigController extends BaseController
{
	
	@Autowired
	private ISysConfigService sysConfigService;
	
	/**
	 * 查询参数配置
	 */
	@GetMapping("get")
	@ApiOperation(value = "获取指定系统配置",notes = "系统配置")

	public SysConfig get(@RequestParam @Validated @ApiParam(name = "configId",type = "",value = "配置id") @Min(value = 1,message = "最小值必须大于0") Long configId)
	{
		return sysConfigService.selectConfigById(configId);
	}
	
	/**
	 * 查询参数配置列表
	 */
	@GetMapping("list")
	@ApiOperation(value = "系统配置列表",notes = "系统配置列表")
	public AjaxResult list(@Validated SysConfigListVO configListVO,@Validated PageDomain pageDomain)
	{
		startPage();
        return AjaxResult.pageSuccess(sysConfigService.selectConfigList(configListVO));
	}
	
	
	/**
	 * 新增保存参数配置
	 */
	@PostMapping("save")
	@ApiOperation(value = "添加系统配置",notes = "添加系统配置")
	public AjaxResult addSave(@RequestBody @Validated SysConfigAddVO sysConfig)
	{
		SysConfig config = BeanMapper.map(sysConfig, SysConfig.class);
		config.setCreateBy(String.valueOf(this.getCurrentUserId()));
		config.setCreateTime(DateUtils.getNowDate());
		return toAjax(sysConfigService.insertConfig(config));

	}

	/**
	 * 修改保存参数配置
	 */
	@PostMapping("update")
	@ApiOperation(value = "修改配置",notes = "修改配置")
	public AjaxResult editSave(@RequestBody @Validated SysConfigEditVO sysEditConfig)
	{
		SysConfig config = BeanMapper.map(sysEditConfig, SysConfig.class);
		config.setUpdateBy(String.valueOf(this.getCurrentUserId()));
		config.setUpdateTime(DateUtils.getNowDate());
		return toAjax(sysConfigService.updateConfig(config));
	}
	
	/**
	 * 删除参数配置
	 */
	@PostMapping("remove")
	@ApiOperation(value = "删除配置",notes = "删除配置")
	public AjaxResult remove(String ids)
	{		
		return toAjax(sysConfigService.deleteConfigByIds(ids));
	}
	
}
