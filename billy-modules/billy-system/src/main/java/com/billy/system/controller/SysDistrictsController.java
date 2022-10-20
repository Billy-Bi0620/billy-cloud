package com.billy.system.controller;

import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.common.utils.poi.ExcelUtil;
import com.billy.system.domain.Districts;
import com.billy.system.service.IDistrictsService;
import com.billy.system.vo.DistrictsInsertVO;
import com.billy.system.vo.DistrictsFilterVO;
import com.billy.system.vo.DistrictsUpdateVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;

/**
 * 地区 信息操作处理
 * 
 * @author sprout
 * @date 2018-12-19
 */
@RestController
@Validated
@RequestMapping("districts")
@Api(value = "SysDistrictsController",tags = "地区信息操作处理")
public class SysDistrictsController extends BaseController
{
    @Autowired
    private IDistrictsService districtsService;

    /**
     * 查询地区列表
     */
    @HasPermissions("system:districts:list")
    @PostMapping("/list")
    @ApiOperation(value = "查询地区列表",notes = "查询地区列表")
    public AjaxResult list(@RequestBody @Validated DistrictsFilterVO districtsFilterVo)
    {
        startPage();
        Districts districts = BeanMapper.map(districtsFilterVo, Districts.class);
        return AjaxResult.pageSuccess(districtsService.selectDistrictsList(districts));
    }

    /**
     * 导出地区列表
     */
    @HasPermissions("system:districts:export")
    @OperLog(title = "地区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation(value = "导出地区列表",notes = "导出地区列表")
    public AjaxResult export(@RequestBody @Validated DistrictsFilterVO districtsFilterVo)
    {
        Districts districts = BeanMapper.map(districtsFilterVo, Districts.class);
        List<Districts> list = districtsService.selectDistrictsList(districts);
        ExcelUtil<Districts> util = new ExcelUtil<Districts>(Districts.class);
        return util.exportExcel(list, "districts");
    }

    /**
     * 新增保存地区
     */
    @HasPermissions("system:districts:add")
    @OperLog(title = "地区", businessType = BusinessType.INSERT)
    @PostMapping("save")
    @ApiOperation(value = "新增保存地区",notes = "新增保存地区")
    public AjaxResult addSave(@RequestBody @Validated DistrictsInsertVO districtsInsertVo)
    {
        Districts districts = BeanMapper.map(districtsInsertVo, Districts.class);

        districts.setPid(districts.getId() / 100);
        districts.setCreateTime(new Date());
        districts.setUpdateTime(new Date());
        districts.setOperator(getLoginName());
        return toAjax(districtsService.insertDistricts(districts));
    }

    /**
    
    /**
     * 修改保存地区
     */
    @HasPermissions("system:districts:edit")
    @OperLog(title = "地区", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    @ApiOperation(value = "修改保存地区",notes = "修改保存地区")
    public AjaxResult editSave(@RequestBody @Validated DistrictsUpdateVO districtsUpdateVo)
    {
        Districts districts = BeanMapper.map(districtsUpdateVo, Districts.class);

        districts.setPid(districts.getId() / 100);
        districts.setOperator(getLoginName());
        districts.setUpdateTime(new Date());
        return toAjax(districtsService.updateDistricts(districts));
    }

    /**
     * 删除地区
     */
    @HasPermissions("system:districts:remove")
    @OperLog(title = "地区", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ApiOperation(value = "删除地区",notes = "删除地区")
    public AjaxResult remove(@RequestParam @Validated
        @ApiParam(name = "ids",type = "String",value = "id字符串,如7,8,9",example = "")
        @NotBlank(message = "不允许空值") String ids)
    {
        return toAjax(districtsService.deleteDistrictsByIds(ids));
    }
}