package com.billy.system.controller;

import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysDictData;
import com.billy.system.service.ISysDictDataService;
import com.billy.system.vo.SysDictDataInsertVO;
import com.billy.system.vo.SysDictDataFilterVO;
import com.billy.system.vo.SysDictDataUpdateVO;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

/**
 * 字典数据 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("dict/data")
@Api(value = "SysDictDataController",tags = "字典管理")
public class SysDictDataController extends BaseController
{
	
	@Autowired
	private ISysDictDataService sysDictDataService;
	
	/**
	 * 查询字典数据
	 */
	@GetMapping("get")
	@ApiOperation(value = "查询字典数据",notes = "查询字典数据")
	public SysDictData get(@RequestParam @Validated
		@ApiParam(name = "dictCode",type = "Integer",value = "字典code", example = "1")
		@Min(value = 1,message = "最小值必须大于0") Long dictCode)
	{
		return sysDictDataService.selectDictDataById(dictCode);
	}
	
	/**
	 * 查询字典数据列表
	 */
	@GetMapping("list")
	@HasPermissions("system:dict:list")
	@ApiOperation(value = "查询字典数据列表",notes = "查询字典数据列表")
	public AjaxResult list(@Validated SysDictDataFilterVO sysDictDataFilterVo,@Validated PageDomain pageDomain)
	{
		startPage();
		SysDictData sysDictData = BeanMapper.map(sysDictDataFilterVo, SysDictData.class);
        return AjaxResult.pageSuccess(sysDictDataService.selectDictDataList(sysDictData));
	}
	
	/**
     * 根据字典类型查询字典数据信息
     * 
     * @param dictType 字典类型
     * @return 参数键值
     */
	@GetMapping("type")
	@ApiOperation(value = "根据字典类型查询字典数据信息",notes = "根据字典类型查询字典数据信息")
    public List<SysDictData> getType(@RequestParam @Validated
		@ApiParam(name = "dictType",type = "String",value = "字典类型",example = "sys_user_sex")
		@Size(max = 100,message = "长度不超过100个字符") String dictType)
    {
        return sysDictDataService.selectDictDataByType(dictType);
    }

    /**
     * 根据字典类型和字典键值查询字典数据信息
     * 
     * @param dictType 字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
	@GetMapping("label")
	@ApiOperation(value = "根据字典类型和字典键值查询字典数据信息",notes = "根据字典类型和字典键值查询字典数据信息")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType = "query", name = "dictType", dataType = "String", value = "字典类型", example = "sys_user_sex"),
		@ApiImplicitParam(paramType = "query", name = "dictValue", dataType = "String", value = "字典键值", example = "0")
	})
    public String getLabel(@RequestParam @Validated @Size(max = 100,message = "长度不超过100个字符") String dictType
		, @RequestParam @Validated @Size(max = 100,message = "长度不超过100个字符") String dictValue)
    {
        return sysDictDataService.selectDictLabel(dictType, dictValue);
    }
	
	/**
	 * 新增保存字典数据
	 */
	@OperLog(title = "字典数据", businessType = BusinessType.INSERT)
    @HasPermissions("system:dict:add")
	@PostMapping("save")
	@ApiOperation(value = "新增保存字典数据",notes = "新增保存字典数据")
	public AjaxResult addSave(@RequestBody @Validated SysDictDataInsertVO sysDictDataInsertVo)
	{
		SysDictData sysDictData = BeanMapper.map(sysDictDataInsertVo, SysDictData.class);
		sysDictData.setStatus("0");
		sysDictData.setCreateTime(new Date());
		sysDictData.setCreateBy(getLoginName());
		return toAjax(sysDictDataService.insertDictData(sysDictData));
	}

	/**
	 * 修改保存字典数据
	 */
	@OperLog(title = "字典数据", businessType = BusinessType.UPDATE)
    @HasPermissions("system:dict:edit")
	@PostMapping("update")
	@ApiOperation(value = "修改保存字典数据",notes = "修改保存字典数据")
	public AjaxResult editSave(@RequestBody @Validated SysDictDataUpdateVO sysDictDataUpdateVo)
	{
		SysDictData sysDictData = BeanMapper.map(sysDictDataUpdateVo, SysDictData.class);
		sysDictData.setUpdateTime(new Date());
		sysDictData.setUpdateBy(getLoginName());
		return toAjax(sysDictDataService.updateDictData(sysDictData));
	}
	
	/**
	 * 删除字典数据
	 */
	@ApiOperation(value = "删除字典数据",notes = "删除字典数据")
	@OperLog(title = "字典数据", businessType = BusinessType.DELETE)
    @HasPermissions("system:dict:remove")
	@PostMapping("remove")
	public AjaxResult remove(@RequestParam @Validated
		@ApiParam(name = "ids",type = "String",value = "id字符串,如7,8,9",example = "")
		@NotBlank(message = "不允许空值") String ids)
	{		
		return toAjax(sysDictDataService.deleteDictDataByIds(ids));
	}
	
}
