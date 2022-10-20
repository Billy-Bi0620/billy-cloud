package com.billy.generator.controller;

import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.page.TableDataInfo;
import com.billy.common.core.text.Convert;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.generator.domain.GenTable;
import com.billy.generator.domain.GenTableColumn;
import com.billy.generator.service.IGenTableColumnService;
import com.billy.generator.service.IGenTableService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Min;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 代码生成 操作处理
 * 
 * @author sprout
 */
@RestController
@RequestMapping("gen")
@Api("代码生成")
@Validated
public class GenController extends BaseController
{
    @Autowired
    private IGenTableService genTableService;

    @Autowired
    private IGenTableColumnService genTableColumnService;

    /**
     * 查询代码生成列表
     */
    @HasPermissions("tool:gen:list")
    @GetMapping("/list")
    @ApiOperation(value = "获取表生成列表 ~", notes = "获取表生成列表")
    public TableDataInfo genList(GenTable genTable)
    {
        startPage();
        List<GenTable> list = genTableService.selectGenTableList(genTable);
        return getDataTable(list);
    }
    
    /**
     * 修改代码生成业务
     */
    @ApiOperation(value = "获取指定表生成详情 ~", notes = "获取指定表生成详情")
    @GetMapping("get")
    @Validated
    public AjaxResult get(@RequestParam @Validated @ApiParam(name = "tableId",type = "",value = "表id") @Min(value = 1,message = "最小值必须大于0") Long tableId)
    {

        GenTable table = genTableService.selectGenTableById(tableId);

        return AjaxResult.data(table);
    }


    /**
     * 查询数据库列表
     */
    @HasPermissions("tool:gen:list")
    @GetMapping("/db/list")
    @ApiOperation(value = "查询数据库表集合 ~", notes = "查询数据库表集合")
    public AjaxResult dataList(GenTable genTable)
    {
        startPage();
        List<GenTable> list = genTableService.selectDbTableList(genTable);
        return AjaxResult.pageSuccess(list);
    }

    /**
     * 修改表列信息
     */
    @HasPermissions("tool:gen:edit")
    @GetMapping("edit")
    @ApiOperation(value = "修改生成表的列信息 ~", notes = "修改表列信息")
    public AjaxResult edit(GenTableColumn genTableColumn)
    {
        List<GenTableColumn> list = genTableColumnService.selectGenTableColumnListByTableId(genTableColumn);
        GenTable table = genTableService.selectGenTableById(genTableColumn.getTableId());
        return AjaxResult.data(table).put("rows",list).put("total", list.size());
    }




    /**
     * 导入表结构（保存）
     */
    @HasPermissions("tool:gen:list")
    @OperLog(title = "代码生成", businessType = BusinessType.IMPORT)
    @PostMapping("/importTable")
    @ApiOperation(value = "导入生成表 ~", notes = "导入生成表")
    public AjaxResult importTableSave(String tables)
    {
        String[] tableNames = Convert.toStrArray(tables);
        // 查询表信息
        List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
        String operName = getLoginName();
        genTableService.importGenTable(tableList, operName);
        return AjaxResult.success();
    }

    /**
     * 修改保存代码生成业务
     */
    @HasPermissions("tool:gen:edit")
    @OperLog(title = "代码生成", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ApiOperation(value = "修改生成表信息 ~", notes = "修改生成表信息")
    public AjaxResult editSave(@RequestBody @Validated GenTable genTable)
    {
        genTableService.validateEdit(genTable);
        genTableService.updateGenTable(genTable);
        return AjaxResult.success();
    }


    @HasPermissions("tool:gen:remove")
    @OperLog(title = "代码生成", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ApiOperation(value = "删除生成表 ~", notes = "删除生成表")
    public AjaxResult remove(String ids)
    {
        genTableService.deleteGenTableByIds(ids);
        return AjaxResult.success();
    }

    /**
     * 预览代码
     */
    @HasPermissions("tool:gen:preview")
    @GetMapping("/preview/{tableId}")
    @ApiOperation(value = "预览代码 ~", notes = "预览代码")
    public AjaxResult preview(@PathVariable("tableId") Long tableId) throws IOException
    {
        Map<String, String> dataMap = genTableService.previewCode(tableId);
        return AjaxResult.data(dataMap);
    }

    /**
     * 生成代码
     */
    @HasPermissions("tool:gen:code")
    @OperLog(title = "代码生成", businessType = BusinessType.GENCODE)
    @GetMapping("/genCode/{tableName}")
    @ApiOperation(value = "代码生成 ~", notes = "代码生成")
    public void genCode(HttpServletResponse response, @PathVariable("tableName") String tableName) throws IOException
    {
        byte[] data = genTableService.generatorCode(tableName);
        genCode(response, data);
    }

    /**
     * 批量生成代码
     */
    @HasPermissions("tool:gen:code")
    @OperLog(title = "代码生成", businessType = BusinessType.GENCODE)
    @GetMapping("/batchGenCode")
    @ApiOperation(value = "批量生成代码 ~", notes = "批量生成代码")
    public void batchGenCode(HttpServletResponse response, String tables) throws IOException
    {
        String[] tableNames = Convert.toStrArray(tables);
        byte[] data = genTableService.generatorCode(tableNames);
        genCode(response, data);
    }

    /**
     * 生成zip文件
     */
    private void genCode(HttpServletResponse response, byte[] data) throws IOException
    {
        response.reset();
        response.setHeader("Content-Disposition", "attachment; filename=sprout.zip");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IOUtils.write(data, response.getOutputStream());
    }
}