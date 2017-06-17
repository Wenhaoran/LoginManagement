package cn.digitalpublishing.springmvc.controller.system;

import java.util.ArrayList;
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

import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.po.system.SysPage;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleFunctionRelationship;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.FunctionForm;
import cn.digitalpublishing.util.exception.WebgateException;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

/**
 * 
 * @author Administrator
 * @see 模块管理controller ，用来配置页面按钮权限
 */
@Controller
@RequestMapping("/pages/function")
public class FunctionController extends BaseController {

	@RequestMapping(value="/form/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, FunctionForm form) throws Exception {
		String forwardString="sys/function/list";
		Map<String,Object> model = new HashMap<String,Object>();
		try{
			List<SysPage> pageList = new ArrayList<SysPage>();
			Map<String, Object> condition = new HashMap<String, Object>();
			
			pageList = sysPageService.findListByCondition(condition);
			form.setIsSuccess(SUCCESS);
			model.put("pageList", pageList);
		}catch(Exception e){
			form.setIsSuccess(FAILURE);
			form.setMsg("");
		}
		model.put("form", form);
		return new ModelAndView(forwardString, model);
	}
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(HttpServletRequest request,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			//查询条件： 功能编码，功能名称，所属页面

			pageInfo.setCondition(condition);
			
			sysFunctionService.findDataGrid(pageInfo);
			
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysFunction function)
			throws Exception {
		String forward = "sys/function/add";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			List<SysPage> pageList = sysPageService.findListByCondition(condition);
			model.put("pageList", pageList);
		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(SysFunction function) throws Exception {
		try {
			//创建新的功能。
			SysPage page = sysPageService.findById(function.getPageId());
			
			// page.path + function.code = function.path
			if(page!=null){
//				String path = "";
//				String special = page.getSpecial();
//				if(Strings.isNullOrEmpty(special)){
//					path = page.getPath()+"#"+function.getCode();
//				}else{
//					path = page.getPath()+"#"+page.getSpecial()+"#"+function.getCode();
//				}
//				function.setPath(path);
			}else{
				throw new WebgateException("页面选择出错");
			}
			sysFunctionService.insertFunction(function);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request, String functionId) throws Exception {
		String forward = "sys/function/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			SysFunction function = sysFunctionService.getFunctionById(functionId);
			
			Map<String, Object> condition = new HashMap<String, Object>();
			List<SysPage> pageList = sysPageService.findListByCondition(condition);
			model.put("pageList", pageList);
			
			model.put("function", function);
			
		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(HttpServletRequest request, SysFunction function) throws Exception {
		try {
			sysFunctionService.updateFunction(function);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Object delete(HttpServletRequest request, SysFunction function) throws Exception {
		try {
			String functionId = function.getId();
			Map<String, Object> condition = new HashMap<String, Object>();
			if(!Strings.isNullOrEmpty(functionId)){
				condition.put("functionId", functionId);
			}
			List<SysRoleFunctionRelationship> rfrsList = sysRFRSService.getRoleFunctionRelationshipListByCondition(condition);
			if(rfrsList.size()>0){
				return renderError("当前功能 已经关联 角色，请解除关联后 再尝试删除！");
			}
			sysFunctionService.deleteFunctionById(functionId);
		} catch (Exception e) {
			logger.error("删除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("删除成功！");
	}
	
	
	
	
	//*********************************** 功能 - 角色 关联 ******************************
	//当前账户关联 角色信息
	@RequestMapping(value = "/functionListManagerByRoleId", method = RequestMethod.GET)
    public ModelAndView detailListManager(HttpServletRequest request, SysFunction function) throws Exception {
        String forward = "/sys/rfrs/detailListFunction";
        String roleId = request.getParameter("roleId");
        Map<String, Object> model = new HashMap<String, Object>();
        try {
        	SysRole role = sysRoleService.getRoleById(roleId);
        	
			model.put("role", role);
        } catch(Exception e) {
    		logger.error("查询列表出现异常，",e);
    		e.printStackTrace();
    	}
        
    	return new ModelAndView(forward, model);
    }
	
	@RequestMapping(value = "/dataGridByRoleId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByRoleId(HttpServletRequest request,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String roleId = request.getParameter("roleId");
		String funName = request.getParameter("name");
		String funCode = request.getParameter("code");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			//当前登录账户ID
			if(!Strings.isNullOrEmpty(roleId)){
				condition.put("roleId", roleId);
			}
			if(!Strings.isNullOrEmpty(funName)){
				condition.put("name", funName);
			}
			if(!Strings.isNullOrEmpty(funCode)){
				condition.put("code", funCode);
			}
			pageInfo.setCondition(condition);
			sysFunctionService.findDataGrid(pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/roleGiveFunction", method = RequestMethod.GET)
    public ModelAndView roleGiveFunction(HttpServletRequest request, SysFunction function) throws Exception {
    	String forward = "/sys/rfrs/giveFunction";
    	Map<String, Object> model = new HashMap<String, Object>();
    	String roleId = request.getParameter("roleId");
    	try{
    		SysRole role = sysRoleService.getRoleById(roleId);
    		model.put("function", function);
    		model.put("role", role);
    	} catch(Exception e) {
    		logger.error("跳转添加页面出现异常，",e);
    	}
    	return new ModelAndView(forward, model);
    }
	
	@RequestMapping(value = "/addRFRS", method = RequestMethod.POST)
	@ResponseBody
	public Object addRFRS(FunctionForm functionForm) throws Exception {
		try {
			String[] functionIds = functionForm.getIds();
			String roleId = functionForm.getRoleId();
			
			sysRFRSService.batchSaveRoleFunctionRelationshipByRoleId(functionIds, roleId);
		} catch (Exception e) {
			logger.error("关联出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("关联成功！");
	}
	
	@RequestMapping(value = "/deleteRFRS") 
	@ResponseBody
	public Object deleteRFRS(HttpServletRequest request,String[] ids,String roleId) throws Exception {//null
		try {
			
			sysRFRSService.batchDelRoleFunctionRelationshipByRoleId(roleId, ids);
		} catch (Exception e) {
			logger.error("解除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("解除成功！");
	}
//************************************** 功能 - 角色 关联 end **********************************************	
	
	
}