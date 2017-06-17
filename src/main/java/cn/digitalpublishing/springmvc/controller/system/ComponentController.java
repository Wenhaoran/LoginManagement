package cn.digitalpublishing.springmvc.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.ComponentForm;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

/**
 * 
 * @author Administrator
 *
 * @see	组件管理controller ，组件：可以理解为project ，生成组件需要选择系统。该controller 主要用来 进行 组件 的一系列操作。 
 */
@Controller
@RequestMapping("/pages/component")
public class ComponentController extends BaseController {

	@RequestMapping(value="/form/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ComponentForm form) throws Exception {
		String forwardString="sys/component/list";
		
		Map<String,Object> model = new HashMap<String,Object>();
		try{
			Map<String, Object> condition = new HashMap<String, Object>();
			// 查询所有系统状态为“在用”状态的系统列表
			condition.put("status", 1);
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			form.setIsSuccess(SUCCESS);
			model.put("systemList", systemList);
			
		}catch(Exception e){
			form.setIsSuccess(FAILURE);
			form.setMsg("");
		}
		model.put("form", form);
		return new ModelAndView(forwardString, model);
	}
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(HttpServletRequest request, SysComponent sysComponent,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//查询条件： 组件编码，组件名称，组件状态，所属系统。
			if(!Strings.isNullOrEmpty(sysComponent.getCode())){
				condition.put("code", sysComponent.getCode());
			}
			if(!Strings.isNullOrEmpty(sysComponent.getName())){
				condition.put("name", sysComponent.getName());
			}
			if(sysComponent.getStatus()!=null){
				condition.put("status", sysComponent.getStatus());
			}
			if(!Strings.isNullOrEmpty(sysComponent.getSystemId())){
				condition.put("systemId", sysComponent.getSystemId());
			}
			
			pageInfo.setCondition(condition);
			
			sysComponentService.findDataGrid(pageInfo);
			
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysComponent component)
			throws Exception {
		String forward = "sys/component/add";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			model.put("systemList", systemList);
		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(SysComponent component) throws Exception {
		try {
			
			sysComponentService.insertComponent(component);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/editPage")
	public ModelAndView editPage(HttpServletRequest request, SysComponent component)throws Exception {
		String forward = "sys/component/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			component = sysComponentService.getComponentById(id);
			
			Map<String, Object> condition = new HashMap<String, Object>();
			List<SysSystem> systemList = sysSystemService.getSystemList(condition);
			model.put("systemList", systemList);
			
			model.put("component", component);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("跳转编辑页面出现异常，", e);
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(SysComponent component) throws Exception {
		try {
			sysComponentService.updateComponent(component);
		} catch (Exception e) {
			logger.error("编辑出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("编辑成功！");
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Object delete(SysComponent component) throws Exception {
		try {
			String componentId = component.getId();
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("componentId", componentId);
			List<SysResource> resourceList = sysResourceService.findResourceByCondition(condition);
			if(resourceList.size()>0){
				return renderError("当前 组件，已被 其他资源使用，删除失败");
			}
			sysComponentService.deleteComponentById(componentId);
		} catch (Exception e) {
			logger.error("删除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("删除成功！");
	}
}