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

import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleAccountRelationship;
import cn.digitalpublishing.po.system.SysRoleFunctionRelationship;
import cn.digitalpublishing.po.system.SysRoleResourceRelationship;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.RoleForm;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;


@Controller
@RequestMapping("/pages/role")
public class RoleController extends BaseController {
	
	@RequestMapping(value="/form/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, RoleForm form) throws Exception {
		String forwardString = "sys/role/list";
		Map<String,Object> model = new HashMap<String,Object>();
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", 1);
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			model.put("systemList", systemList);
			form.setIsSuccess(SUCCESS);
		} catch (Exception e) {
			form.setIsSuccess(FAILURE);
			form.setMsg("");
		}
		model.put("form", form);
		
		return new ModelAndView(forwardString,model);
	}
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(HttpServletRequest request, SysRole role,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//查询条件： 角色名称，所属系统，角色状态
			if(!Strings.isNullOrEmpty(role.getName())){
				condition.put("name", role.getName());
			}
			if(!Strings.isNullOrEmpty(role.getSystemId())){
				condition.put("systemId", role.getSystemId());
			}
			if(role.getStatus()!=null){
				condition.put("status", role.getStatus());
			}
			pageInfo.setCondition(condition);
			
			sysRoleService.findDataGrid(pageInfo);
			
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysRole role)
			throws Exception {
		String forward = "sys/role/add";
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
	public Object add(SysRole role) throws Exception {
		try {
			//创建新的账户。
			
			sysRoleService.insertRole(role);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request, String roleId) throws Exception {
		String forward = "sys/role/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			SysRole role = sysRoleService.getRoleById(roleId);
			
			Map<String, Object> condition = new HashMap<String, Object>();
			List<SysSystem> systemList = sysSystemService.getSystemList(condition);
			model.put("systemList", systemList);
			
			model.put("role", role);
			
			model.put("systemId", role.getSystemId());
		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(HttpServletRequest request, SysRole role) throws Exception {
		try {
			sysRoleService.updateRole(role);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Object delete(HttpServletRequest request, SysRole role) throws Exception {
		try {
			String roleId = role.getId();
			Map<String, Object> condition = new HashMap<String, Object>();
			if(!Strings.isNullOrEmpty(roleId)){
				condition.put("roleId", roleId);
			}
			List<SysRoleResourceRelationship> rrrsList = sysRRRSService.findListByCondition(condition);
			if(rrrsList.size()>0){
				return renderError("当前角色 已经关联 资源，请解除关联后 再尝试删除！");
			}
			List<SysRoleAccountRelationship> rarsList = sysRARSService.getRoleAccountRelationshipListByAccountId(condition);
			if(rarsList.size()>0){
				return renderError("当前角色 已经关联 账户，请解除关联后 再尝试删除！");
			}
			List<SysRoleFunctionRelationship> rfrsList = sysRFRSService.getRoleFunctionRelationshipListByCondition(condition);
			if(rfrsList.size()>0){
				return renderError("当前角色 已经关联 功能，请解除关联后 再尝试删除！");
			}
			System.out.println();
			sysRoleService.deleteRoleById(roleId);
		} catch (Exception e) {
			logger.error("删除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("删除成功！");
	}
	
	
	
//************************************************* 角色 + 账户 关联 *****************************************************
	//当前账户关联 角色信息
	@RequestMapping(value = "/roleListManagerBySystemId", method = RequestMethod.GET)
    public ModelAndView detailListManager(HttpServletRequest request, SysRole role) throws Exception {
        String forward = "/sys/rars/detailList";
        String accountId = request.getParameter("accountId");
        Map<String, Object> model = new HashMap<String, Object>();
        try {
        	SysAccount account = sysAccountService.findById(accountId);
        	Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", 1);
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			
			model.put("systemList", systemList);
			model.put("account", account);
        } catch(Exception e) {
    		logger.error("查询列表出现异常，",e);
    		e.printStackTrace();
    	}
    	return new ModelAndView(forward, model);
    }
	
	@RequestMapping(value = "/dataGridByAccountId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByAccountId(HttpServletRequest request,SysRole role,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String accountId = request.getParameter("accountId");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			//当前登录账户ID
			if(!Strings.isNullOrEmpty(accountId)){
				condition.put("accountId", accountId);
			}
			//查询条件： 角色名称，所属系统，角色状态
			if(!Strings.isNullOrEmpty(role.getName())){
				condition.put("name", role.getName());
			}
			if(!Strings.isNullOrEmpty(role.getSystemId())){
				condition.put("systemId", role.getSystemId());
			}
			if(role.getStatus()!=null){
				condition.put("status", role.getStatus());
			}
			pageInfo.setCondition(condition);
			sysRoleService.findDataGridByAccount(pageInfo);
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/accountGiveRole", method = RequestMethod.GET)
    public ModelAndView accountGiveRole(HttpServletRequest request, SysRole role) throws Exception {
    	String forward = "/sys/rars/giveRole";
    	Map<String, Object> model = new HashMap<String, Object>();
    	String accountId = request.getParameter("accountId");
    	try{
    		SysAccount account = sysAccountService.findById(accountId);
    		
    		model.put("role", role);
    		model.put("account", account);
    	} catch(Exception e) {
    		logger.error("跳转添加页面出现异常，",e);
    	}
    	return new ModelAndView(forward, model);
    }
	
	@RequestMapping(value = "/addRARS", method = RequestMethod.POST)
	@ResponseBody
	public Object addRARS(RoleForm roleform) throws Exception {
		try {
			String[] roleIds = roleform.getIds();
			String accountId = roleform.getAccountId();
			
			sysRARSService.batchSaveRoleAccountRelationshipByAccountId(accountId, roleIds);
		} catch (Exception e) {
			logger.error("关联出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("关联成功！");
	}
	
	@RequestMapping(value = "/deleteRARS")//, method = RequestMethod.POST 
	@ResponseBody
	public Object deleteRARS(HttpServletRequest request,String[] ids,String accountId) throws Exception {//null
		try {
//			String[] roleIds = roleform.getIds();
//			String accountId = roleform.getAccountId();
			
			sysRARSService.batchDelRoleAccountRelationshipByAccountId(accountId, ids);
		} catch (Exception e) {
			logger.error("解除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("解除成功！");
	}
	
//************************************************* 角色 + 账户 关联 end  *****************************************************  
	
	
	
	
	
	
	
	
	
	
	
	//************************************************* 角色 + 资源 关联 *****************************************************
	//当前 资源 关联 角色信息
	@RequestMapping(value = "/roleListManagerByResourceId", method = RequestMethod.GET)
    public ModelAndView roleListManagerByResourceId(HttpServletRequest request, SysRole role) throws Exception {
        String forward = "/sys/rrrs/detailList";
        String resourceId = request.getParameter("resourceId");
        Map<String, Object> model = new HashMap<String, Object>();
        try {
        	SysResource resource = sysResourceService.findById(resourceId);
        	String systemId = resource.getSystemId();
        	Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", 1);
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			
			model.put("systemList", systemList);
			model.put("resource", resource);
			model.put("systemId", systemId);
        } catch(Exception e) {
    		logger.error("查询列表出现异常，",e);
    		e.printStackTrace();
    	}
    	return new ModelAndView(forward, model);
    }
	
	
	//根据 资源 ID ，查询当前 资源 所关联的 角色列表信息
	@RequestMapping(value = "/dataGridByResourceId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByResourceId(HttpServletRequest request,SysRole role,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String resourceId = request.getParameter("resourceId");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//当前登录账户ID
			if(!Strings.isNullOrEmpty(resourceId)){
				condition.put("resourceId", resourceId);
			}
			//查询条件： 角色名称，所属系统，角色状态
			if(!Strings.isNullOrEmpty(role.getName())){
				condition.put("name", role.getName());
			}
			if(!Strings.isNullOrEmpty(role.getSystemId())){
				condition.put("systemId", role.getSystemId());
			}
			if(role.getStatus()!=null){
				condition.put("status", role.getStatus());
			}
			
			pageInfo.setCondition(condition);
			
			sysRoleService.findDataGridByResource(pageInfo);
			
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/resourceGiveRole", method = RequestMethod.GET)
    public ModelAndView resourceGiveRole(HttpServletRequest request, SysRole role) throws Exception {
    	String forward = "/sys/rrrs/giveRole";
    	Map<String, Object> model = new HashMap<String, Object>();
    	String resourceId = request.getParameter("resourceId");
    	String systemId = role.getSystemId();
    	try{
    		SysResource resource = sysResourceService.findById(resourceId);
    		
    		model.put("role", role);
    		model.put("resource", resource);
    		model.put("systemId", systemId);
    	} catch(Exception e) {
    		logger.error("跳转添加页面出现异常，",e);
    	}
    	return new ModelAndView(forward, model);
    }
	
	@RequestMapping(value = "/addRRRS", method = RequestMethod.POST)
	@ResponseBody
	public Object addRRRS(RoleForm roleform) throws Exception {
		try {
			//创建新的账户。
//				sysRoleService.insertRole(role.getObj());
			String[] roleIds = roleform.getIds();
			String resourceId = roleform.getResourceId();
			
			sysRRRSService.batchSaveRoleResourceRelationship(resourceId, roleIds);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/deleteRRRS")//, method = RequestMethod.POST 
	@ResponseBody
	public Object deleteRRRS(HttpServletRequest request,String[] ids,String resourceId) throws Exception {
		try {
			//创建新的账户。
//				sysRoleService.insertRole(role.getObj());
//				String[] roleIds = roleform.getIds();
//				String accountId = roleform.getAccountId();
			
			sysRRRSService.batchDelRoleResourceRelationship(resourceId, ids);
		} catch (Exception e) {
			logger.error("解除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("解除成功！");
	}
	
	//************************************************* 角色 + 资源 关联 end *****************************************************
	
	
	
	//************************************************* 角色 + 功能 关联 *****************************************************
	//当前 资源 关联 角色信息
	@RequestMapping(value = "/roleListManagerByFunctionId", method = RequestMethod.GET)
    public ModelAndView roleListManagerByFunctionId(HttpServletRequest request, SysRole role) throws Exception {
        String forward = "/sys/rfrs/detailList";
        String functionId = request.getParameter("functionId");
        Map<String, Object> model = new HashMap<String, Object>();
        try {
        	SysFunction function = sysFunctionService.getFunctionById(functionId);
        	
			model.put("function", function);
        } catch(Exception e) {
    		logger.error("查询列表出现异常，",e);
    		e.printStackTrace();
    	}
    	return new ModelAndView(forward, model);
    }
	
	//根据 资源 ID ，查询当前 资源 所关联的 角色列表信息
	@RequestMapping(value = "/dataGridByFunctionId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByFunctionId(HttpServletRequest request,SysRole role,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String functionId = request.getParameter("functionId");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//当前登录账户ID
			if(!Strings.isNullOrEmpty(functionId)){
				condition.put("functionId", functionId);
			}
			//查询条件： 角色名称，所属系统，角色状态
			if(!Strings.isNullOrEmpty(role.getName())){
				condition.put("name", role.getName());
			}
			if(!Strings.isNullOrEmpty(role.getSystemId())){
				condition.put("systemId", role.getSystemId());
			}
			if(role.getStatus()!=null){
				condition.put("status", role.getStatus());
			}
			
			pageInfo.setCondition(condition);
			
			sysRoleService.findDataGridByResource(pageInfo);
			
//				DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/functionGiveRole", method = RequestMethod.GET)
    public ModelAndView functionGiveRole(HttpServletRequest request, SysRole role) throws Exception {
    	String forward = "/sys/rfrs/giveRole";
    	Map<String, Object> model = new HashMap<String, Object>();
    	String functionId = request.getParameter("functionId");
    	try{
    		SysFunction function = sysFunctionService.getFunctionById(functionId);
    		
    		model.put("role", role);
    		model.put("function", function);
    	} catch(Exception e) {
    		logger.error("跳转添加页面出现异常，",e);
    	}
    	return new ModelAndView(forward, model);
    }
	
	@RequestMapping(value = "/addRFRS", method = RequestMethod.POST)
	@ResponseBody
	public Object addRFRS(RoleForm roleform) throws Exception {
		try {
			//创建新的账户。
//					sysRoleService.insertRole(role.getObj());
			String[] roleIds = roleform.getIds();
			String functionId = roleform.getFunctionId();
			
			sysRFRSService.batchSaveRoleFunctionRelationshipByFunctionId(functionId, roleIds);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/deleteRFRS")//, method = RequestMethod.POST 
	@ResponseBody
	public Object deleteRFRS(HttpServletRequest request,String[] ids,String functionId) throws Exception {
		try {
			//创建新的账户。
//			sysRoleService.insertRole(role.getObj());
//			String[] roleIds = roleform.getIds();
//			String accountId = roleform.getAccountId();
			
			sysRFRSService.batchDelRoleFunctionRelationshipByFunctionId(functionId, ids);
		} catch (Exception e) {
			logger.error("解除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("解除成功！");
	}
	
	//************************************************* 角色 + 资源 关联 end *****************************************************
	
	
	
	
	
	
	
	
	
	
	
}
