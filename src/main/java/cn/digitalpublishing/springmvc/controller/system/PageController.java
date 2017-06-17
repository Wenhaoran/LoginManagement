package cn.digitalpublishing.springmvc.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.po.system.SysPage;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.PageForm;
import cn.digitalpublishing.util.Log;
import cn.digitalpublishing.util.exception.WebgateException;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.alibaba.fastjson.JSONArray;
import com.google.common.base.Strings;

@Controller
@RequestMapping("/pages/page")
public class PageController extends BaseController {
	
	//当前 资源 关联 角色信息
	@RequestMapping(value = "/pageListManagerByResourceId", method = RequestMethod.GET)
    public ModelAndView pageListManagerByResourceId(HttpServletRequest request, SysPage page) throws Exception {
        String forward = "/sys/page/detailList";
        String resourceId = request.getParameter("resourceId");
        Map<String, Object> model = new HashMap<String, Object>();
        try {
        	SysResource resource = sysResourceService.findById(resourceId);
        	Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", 1);
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			
			model.put("systemList", systemList);
			model.put("resource", resource);
        } catch(Exception e) {
    		logger.error("查询列表出现异常，",e);
    		e.printStackTrace();
    	}
    	return new ModelAndView(forward, model);
    }
	
	
	//根据 资源 ID ，查询当前 资源 所关联的 角色列表信息
	@RequestMapping(value = "/dataGridByResourceId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByResourceId(HttpServletRequest request,SysPage sysPage,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String resourceId = request.getParameter("resourceId");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//当前资源Id
			if(!Strings.isNullOrEmpty(resourceId)){
				condition.put("resourceId", resourceId);
			}
			//查询条件： 页面编号，页面名称
			if(!Strings.isNullOrEmpty(sysPage.getCode())){
				condition.put("code", sysPage.getCode());
			}
			if(!Strings.isNullOrEmpty(sysPage.getName())){
				condition.put("name", sysPage.getName());
			}
			
			pageInfo.setCondition(condition);
			
			sysPageService.findDataGridByResource(pageInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysPage page)
			throws Exception {
		String forward = "sys/page/add";
		String resourceId = request.getParameter("resourceId");
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			SysResource resource = sysResourceService.findById(resourceId);
			model.put("resource", resource);
		} catch (Exception e) {
			Log.printError(e.getMessage());
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(SysPage page) throws Exception {
		try {
			//创建新的账户。
			sysPageService.insertPage(page);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request, PageForm pageForm)
			throws Exception {
		String forward = "sys/page/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			SysPage page = sysPageService.findById(pageForm.getPageId());
			SysResource resource = sysResourceService.findById(page.getResourceId());
			model.put("resource", resource);
			model.put("page", page);
		} catch (Exception e) {
			Log.printError(e.getMessage());
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(SysPage page) throws Exception {
		try {
			sysPageService.update(page);
		} catch (Exception e) {
			logger.error("更新出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("更新成功！");
	}
	
	@RequestMapping(value = "/deletePage") 
	@ResponseBody
	public Object deletePage(HttpServletRequest request,String[] ids,String resourceId) throws Exception {
		try {
			for(String id : ids){
				SysPage page = sysPageService.findById(id);
				List<SysFunction> functionList = sysFunctionService.findListByPageId(page.getId());
				if(functionList.size()>0){
					throw new WebgateException("当前页面已 被添加到 功能，请到 功能管理中，删除关联关系后，再删除页面。");
				}
			}
			sysPageService.deleteByIds(ids);
		} catch (Exception e) {
			Log.printError(e.getMessage());
			e.printStackTrace();
			return renderError("当前页面已 被添加到 功能，请到 功能管理中，删除 当前页面 配置的功能 后，再删除页面。");
		}
		return renderSuccess("删除成功！");
	}
	
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	@ResponseBody
	public String getList(HttpServletRequest request,SysPage sysPage) throws Exception {
		String jsonarray = "";
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			List<SysPage> pageList = sysPageService.findListByCondition(condition);
			jsonarray = JSONArray.toJSONString(pageList);
//			System.out.println(jsonarray);
		} catch (Exception e) {
			logger.error("更新出现异常，", e);
			e.printStackTrace();
		}
		return jsonarray;
	}
	
//	@RequestMapping(value="/form/edit")
//	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, PageForm form)throws Exception {
//		String forwardString = "resource/page_edit";
//		Map<String,Object> model = new HashMap<String,Object>();
//		try{
//			Map<String, Object> condition = new HashMap<String, Object>();
//			form.setResourceList(sysPageService.getResourceList(condition, null));
//			if(!Strings.isNullOrEmpty(request.getParameter("eid"))){
//				form.setObj(sysPageService.getPageById(request.getParameter("eid")));
//				form.setId(request.getParameter("eid"));
//			} else {
//				SysPage page = new SysPage();
//				SysResource resource = new SysResource();
//				resource.setId(request.getParameter("resourceId"));
//				page.setResource(resource);
//				form.setObj(page);
//			}
//			form.setIsSuccess(SUCCESS);
//		}catch(Exception e){
//			form.setIsSuccess(FAILURE);
//			form.setMsg(e.getMessage());
//		}
//		model.put("form", form);
//		return new ModelAndView(forwardString, model);
//	}
//	
//	@RequestMapping(value="/form/editSubmit")
//	@ResponseBody
//	public PageForm editSubmit(HttpServletRequest request, HttpServletResponse response, PageForm form)throws Exception {
//		try{
//			if(!Strings.isNullOrEmpty(form.getId())){
//				//修改
//				sysPageService.updatePage(form.getObj(), form.getId(), null);
//				form.setMsg("");
//			}else{
//				//新增
//				SysPage page = new SysPage();
//				page.setName(form.getObj().getName());
//				page.setCode(form.getObj().getCode());
//				page.setPath(form.getObj().getPath());
//				page.setResource(form.getObj().getResource());
//				sysPageService.insertPage(page);
//				form.setMsg("");
//			}
//			form.setIsSuccess(SUCCESS);
//		}catch(Exception e){
//			form.setIsSuccess(FAILURE);
//			form.setMsg(e.getMessage());
//		}
//		return form;
//	}
//	
//	@RequestMapping(value="/form/delete")
//	@ResponseBody
//	public PageForm delete(HttpServletRequest request, HttpServletResponse response, PageForm form) throws Exception {
//		try{
//			
//			Map<String, Object> condition = new HashMap<String, Object>();
//			condition.put("pageId", request.getParameter("id"));
//			Integer functionCount = sysPageService.getFunctionCount(condition);
//			if (functionCount > 0) {
//				form.setMsg("");
//				form.setIsSuccess(FAILURE);
//			} else {
//				sysPageService.deletePageById(request.getParameter("id"));
//				form.setMsg("");
//				form.setIsSuccess(SUCCESS);
//			}
//		}catch(Exception e){
//			form.setIsSuccess(FAILURE);
//			form.setMsg(e.getMessage());
//		}
//		return form;
//	}
//	
//	@RequestMapping(value="/form/validateCodeUnique")
//	@ResponseBody
//	public PageForm validateCodeUnique(HttpServletRequest request, HttpServletResponse response, PageForm form) throws Exception {
//		Map<String,Object> model = new HashMap<String,Object>(); 
//		try{
//			Map<String, Object> condition = new HashMap<String, Object>();
//			condition.put("code", form.getCode());
//			condition.put("resourceId", form.getResourceId());
//			if(!Strings.isNullOrEmpty(form.getId())){
//				condition.put("uniqueId", form.getId());
//			}
//			form.setiTotalRecords(sysPageService.getPageCount(condition));
//			if(form.getiTotalRecords()>0) {
//				form.setIsSuccess(FAILURE);
//				form.setMsg("");
//			} else {
//				form.setIsSuccess(SUCCESS);
//				form.setMsg("");
//			}
//		}catch(Exception e){
//			form.setIsSuccess(FAILURE);
//			form.setMsg(e.getMessage());
//		}
//		model.put("form", form);
//		return form;
//	}
//	
//	@RequestMapping(value="/form/validateNameUnique")
//	@ResponseBody
//	public PageForm validateNameUnique(HttpServletRequest request, HttpServletResponse response, PageForm form) throws Exception {
//		Map<String,Object> model = new HashMap<String,Object>(); 
//		try{
//			Map<String, Object> condition = new HashMap<String, Object>();
//			condition.put("name", form.getName());
//			condition.put("resourceId", form.getResourceId());
//			if(!Strings.isNullOrEmpty(form.getId())){
//				condition.put("uniqueId", form.getId());
//			}
//			form.setiTotalRecords(sysPageService.getPageCount(condition));
//			if(form.getiTotalRecords()>0) {
//				form.setIsSuccess(FAILURE);
//				form.setMsg("");
//			} else {
//				form.setIsSuccess(SUCCESS);
//				form.setMsg("");
//			}
//		}catch(Exception e){
//			form.setIsSuccess(FAILURE);
//			form.setMsg(e.getMessage());
//		}
//		model.put("form", form);
//		return form;
//	}
	
}