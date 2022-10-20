package com.billy.system.controller;


import com.billy.common.annotation.LoginUser;
import com.billy.common.auth.annotation.HasPermissions;
import com.billy.common.core.page.PageDomain;
import com.billy.common.core.web.controller.BaseController;
import com.billy.common.core.web.domain.AjaxResult;
import com.billy.common.log.annotation.OperLog;
import com.billy.common.log.enums.BusinessType;
import com.billy.common.objmap.BeanMapper;
import com.billy.system.domain.SysPost;
import com.billy.system.service.ISysPostService;
import com.billy.system.vo.SysPostEditVO;
import com.billy.system.vo.SysPostInsertVO;
import com.billy.system.vo.SysPostFilterVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 岗位 提供者
 * 
 * @author zmr
 * @date 2019-05-20
 */
@Validated
@RestController
@RequestMapping("/sys/sysPost")
@Api(value = "SysPostController",tags = "岗位管理")
@Slf4j
public class SysPostController extends BaseController
{
	@Autowired
	private ISysPostService sysPostService;
	
	/**
	 * 查询岗位
	 */
	@GetMapping("get")
	@ApiOperation(value = "根据岗位id查询岗位",notes = "根据岗位id查询岗位")
	public AjaxResult get(@RequestParam @Validated
		@ApiParam(name = "postId",type = "Integer",value = "岗位id,必须是一个整数",example = "")
		@Min(value = 1,message = "最小值需大于0")
		@Max(value = 2147483647,message = "超出最大值")
		@NotNull(message = "岗位id不允许空值")
	Long postId)
	{
		SysPost post = sysPostService.selectPostById(postId);
		if (post==null || post.getPostId() == 0){
			return AjaxResult.error("岗位不存在");
		}
		return AjaxResult.success(post);
		
	}
	
	/**
	 * 查询岗位列表
	 */
	@PostMapping("list")
	@ApiOperation(value = "查询岗位列表",notes = "查询岗位列表")
	public AjaxResult list(@Validated SysPostFilterVO vo, PageDomain page)
	{
		startPage();
		return AjaxResult.pageSuccess(sysPostService.selectPostList(vo));
	}
	
	
	/**
	 * 新增岗位
	 */
	@HasPermissions("system:post:add")
	@PostMapping("save")
	@OperLog(title = "岗位管理", businessType = BusinessType.INSERT)
	@ApiOperation(value = "新增岗位",notes = "新增岗位")
	public AjaxResult addSave(@RequestBody @Validated SysPostInsertVO vo)
	{
		SysPost sysPost = BeanMapper.map(vo, SysPost.class);
		sysPost.setCreateBy(getLoginName());
		int result = sysPostService.insertPost(sysPost);
		if (result==0) {
			AjaxResult.error("影响行数为0，操作失败");
		}
		return AjaxResult.success(result);
	}

	/**
	 * 修改岗位
	 */
	@HasPermissions("system:post:edit")
	@PostMapping("update")
	@OperLog(title = "岗位管理", businessType = BusinessType.UPDATE)
	@ApiOperation(value = "修改岗位",notes = "修改岗位")
	public AjaxResult editSave(@RequestBody @Validated SysPostEditVO vo)
	{
		SysPost sysPost = BeanMapper.map(vo, SysPost.class);
		sysPost.setUpdateBy(getLoginName());
		int result = sysPostService.updatePost(sysPost);
		if (result==0) {
			AjaxResult.error("影响行数为0，操作失败");
		}
		return AjaxResult.success(result);
	}
	
	/**
	 * 删除岗位
	 * @throws Exception 
	 */
	@HasPermissions("system:post:remove")
	@PostMapping("remove")
	@OperLog(title = "岗位管理", businessType = BusinessType.DELETE)
	@ApiOperation(value = "删除岗位",notes = "删除岗位")
	public AjaxResult remove(@RequestParam @Validated
	@ApiParam(name = "ids",type = "String",value = "岗位id字符串,如7,8,9",example = "")
	@NotBlank(message = "不允许空值")
 	String ids) throws Exception
	{
		int result = sysPostService.deletePostByIds(ids);
		if (result==0) {
			AjaxResult.error("影响行数为0，操作失败");
		}
		return AjaxResult.success(result);

	}
	
}
