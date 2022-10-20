package com.billy.system.controller;

import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysDictType;
import com.billy.system.service.ISysDictTypeService;
import com.billy.system.vo.SysDictTypeFilterVO;
import com.billy.system.vo.SysDictTypeInsertVO;
import com.billy.system.vo.SysDictTypeUpdateVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.util.Date;

/**
 * 字典类型 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("dict/type")
@Api(value = "SysDictTypeController",tags = "字典类型")
public class SysDictTypeController extends BaseController
{
	
	@Autowired
	private ISysDictTypeService sysDictTypeService;
	
	/**
	 * 查询字典类型
	 */
	@GetMapping("get")
	@ApiOperation(value = "查询字典类型",notes = "查询字典类型")
	public SysDictType get(@RequestParam @Validated
		@ApiParam(name = "dictId",type = "Long",value = "字典类型id")
		@Min(value = 1,message = "最小值必须大于0") Long dictId)
	{
		return sysDictTypeService.selectDictTypeById(dictId);
		
	}
	
	/**
	 * 查询字典类型列表
	 */
	@GetMapping("list")
	@HasPermissions("system:dict:list")
	@ApiOperation(value = "查询字典类型列表",notes = "查询字典类型列表")
	public AjaxResult list(@Validated SysDictTypeFilterVO sysDictType,@Validated PageDomain page)
	{
		startPage();
        return AjaxResult.pageSuccess(sysDictTypeService.selectDictTypeList(sysDictType));
	}
	
	
	/**
	 * 新增保存字典类型
	 */
	@OperLog(title = "字典类型", businessType = BusinessType.INSERT)
    @HasPermissions("system:dict:add")
	@PostMapping("save")
	@ApiOperation(value = "新增保存字典类型",notes = "新增保存字典类型")
	public AjaxResult addSave(@RequestBody @Validated SysDictTypeInsertVO sysDictTypeInsertVo)
	{
		SysDictType sysDictType = BeanMapper.map(sysDictTypeInsertVo, SysDictType.class);
		sysDictType.setStatus("0");
		sysDictType.setCreateTime(new Date());
		sysDictType.setCreateBy(getLoginName());
		return toAjax(sysDictTypeService.insertDictType(sysDictType));
	}

	/**
	 * 修改保存字典类型
	 */
	@OperLog(title = "字典类型", businessType = BusinessType.UPDATE)
    @HasPermissions("system:dict:edit")
	@PostMapping("update")
	@ApiOperation(value = "修改保存字典类型",notes = "修改保存字典类型")
	public AjaxResult editSave(@RequestBody @Validated SysDictTypeUpdateVO sysDictTypeUpdateVo)
	{
		SysDictType sysDictType = BeanMapper.map(sysDictTypeUpdateVo, SysDictType.class);
		sysDictType.setUpdateTime(new Date());
		sysDictType.setUpdateBy(getLoginName());
		return toAjax(sysDictTypeService.updateDictType(sysDictType));
	}
	
	/**
	 * 删除字典类型
	 * @throws Exception 
	 */
	@OperLog(title = "字典类型", businessType = BusinessType.DELETE)
	@HasPermissions("system:dict:remove")
	@PostMapping("remove")
	@ApiOperation(value = "删除字典类型",notes = "删除字典类型")
	public AjaxResult remove(@RequestParam @Validated
		@ApiParam(name = "ids",type = "String",value = "id字符串,如7,8,9",example = "")
		@NotBlank(message = "不允许空值") String ids) throws Exception
	{		
		return toAjax(sysDictTypeService.deleteDictTypeByIds(ids));
	}
	
}
