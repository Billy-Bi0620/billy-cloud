package com.billy.system.controller;

import com.billy.common.annotation.LoginUser;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysNotice;
import com.billy.system.service.ISysNoticeService;
import com.billy.system.vo.SysNoticeCreateVO;
import com.billy.system.vo.SysNoticeFilterVO;
import com.billy.system.vo.SysNoticeUpdateVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 通知公告 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@RestController
@RequestMapping("notice")
@Api(value = "SysNoticeController",tags = "通知公告")
@Validated
public class SysNoticeController extends BaseController
{
	
	@Autowired
	private ISysNoticeService sysNoticeService;
	
	/**
	 * 查询通知公告
	 */
	@GetMapping("get")
	@ApiOperation(value = "查询通知公告",notes = "查询通知公告", response = SysNotice.class)
	public AjaxResult get(@RequestParam @NotNull @Range(min = 1, max = Integer.MAX_VALUE, message = "非法Id") Long noticeId)
	{
		return AjaxResult.success(sysNoticeService.selectNoticeById(noticeId));
	}
	
	/**
	 * 查询通知公告列表
	 */
	@PostMapping("list")
	@ApiOperation(value = "查询通知公告列表",notes = "查询通知公告列表", response = SysNotice.class)
	public AjaxResult list(SysNoticeFilterVO sysNotice, PageDomain page)
	{
		startPage();
		List<SysNotice> sysNotices = sysNoticeService.selectNoticeList(sysNotice);
		return AjaxResult.pageSuccess(sysNotices);

	}

	/**
	 * 新增保存通知公告
	 */
	@PostMapping("save")
	@ApiOperation(value = "新增保存通知公告",notes = "新增保存通知公告")
	public AjaxResult addSave(@RequestBody @Validated SysNoticeCreateVO sysNoticeCreatedVO)
	{
		SysNotice sysNotice = BeanMapper.map(sysNoticeCreatedVO, SysNotice.class);
		sysNotice.setCreateBy(getLoginName());
		return AjaxResult.resultAffect(sysNoticeService.insertNotice(sysNotice));
	}

	/**
	 * 修改保存通知公告
	 */
	@PostMapping("update")
	@ApiOperation(value = "修改保存通知公告",notes = "修改保存通知公告")
	public AjaxResult editSave(@RequestBody @Validated SysNoticeUpdateVO sysNoticeUpdateVO)
	{
		SysNotice sysNotice = BeanMapper.map(sysNoticeUpdateVO, SysNotice.class);
		sysNotice.setUpdateBy(getLoginName());
		return AjaxResult.resultAffect(sysNoticeService.updateNotice(sysNotice));
	}
	
	/**
	 * 删除通知公告
	 */
	@PostMapping("remove")
	@ApiOperation(value = "删除通知公告",notes = "删除通知公告")
	public AjaxResult remove(@RequestParam @ApiParam(required = true, value = "根据主键字符串进行删除。如 1,2,3,4") @NotEmpty(message = "不能为空") String ids)
	{
		return AjaxResult.resultAffect(sysNoticeService.deleteNoticeByIds(ids));
	}
}
