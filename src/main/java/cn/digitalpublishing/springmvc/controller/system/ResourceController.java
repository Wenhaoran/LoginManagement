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

import cn.digitalpublishing.po.base.Tree;
import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleResourceRelationship;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.ResourceForm;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

@Controller
@RequestMapping(value = "/pages/resource")
public class ResourceController extends BaseController {
	
	@RequestMapping(value = "/form/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ResourceForm form) throws Exception{
		String forwardString = "sys/resource/resource";
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("status", 1);
		List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
		
		Map<String,Object> model = new HashMap<String,Object>();
		try {
			SysResource resource = new SysResource();
			resource.setSystem(systemList.get(0));
			form.setObj(resource);
			
			model.put("form", form);
			model.put("systemList", systemList);
		} catch (Exception e) {
			e.printStackTrace();
			form.setIsSuccess(FAILURE);
			form.setMsg("");
			forwardString = "msg";
		}
		return new ModelAndView(forwardString, model);
	}
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(HttpServletRequest request,String systemId,int page,int rows,String sort,String order) {
		PageInfo pageInfo = new PageInfo((int)page, (int)rows, (String)sort, (String)order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			if(!Strings.isNullOrEmpty(systemId)){
				condition.put("systemId", systemId);
			}
			pageInfo.setCondition(condition);
			sysResourceService.findDataGrid(pageInfo);
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/tree", method = RequestMethod.POST)
    @ResponseBody
    public Object tree(HttpServletRequest request, HttpServletResponse response,String systemId, SysResource resource) {
		
		List<Tree> tree = sysResourceService.findTreeBySystemId(systemId);
		
		return tree;
    }
	
	@RequestMapping(value = "/treeByRoleId", method = RequestMethod.POST)
    @ResponseBody
    public Object treeByRoleId(HttpServletRequest request, HttpServletResponse response,String systemId, String roleId) {
		HashMap<String,Object> condition = new HashMap<String,Object>();
		if(!Strings.isNullOrEmpty(roleId)){
			condition.put("roleId", roleId);
		}
		if(!Strings.isNullOrEmpty(systemId)){
			condition.put("systemId", systemId);
		}
		
		List<Tree> tree = sysResourceService.findTreeByCondition(condition);
		
		return tree;
    }
	
	
    @RequestMapping(value = "/findResourceByPid", method = RequestMethod.POST)
    @ResponseBody
    public Object findResourceByPid(String id,String systemId) throws Exception {
    	HashMap<String,Object> condition = new HashMap<String,Object>();
    	if(id!= null && !id.equals("")){
    		condition.put("parentId", id);
    	}else{
    		condition.put("parentIdIsNull", "true");
    	}
    	if(!Strings.isNullOrEmpty(systemId)){
    		condition.put("systemId", systemId);
    	}
    	List<SysResource> resourcesList = sysResourceService.findResourceByCondition(condition);
        return resourcesList;
    }
    
    @RequestMapping(value = "/findResourceBySystemId", method = RequestMethod.POST)
    @ResponseBody
    public Object findResourceBySystemId(String systemId) throws Exception {
    	HashMap<String,Object> condition = new HashMap<String,Object>();
    	if(!Strings.isNullOrEmpty(systemId)){
    		condition.put("systemId", systemId);
    	}
    	List<SysResource> resourcesList = sysResourceService.findResourceByCondition(condition);
        return resourcesList;
    }
	
    
    @RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysResource resource)
			throws Exception {
		String forward = "sys/resource/add";
		Map<String, Object> model = new HashMap<String, Object>();
		String systemId = request.getParameter("systemId");
		
		try {
			List<SysComponent> componentList = sysComponentService.findListBySystemId(systemId);
			model.put("componentList", componentList);
			model.put("systemId", systemId);
		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(HttpServletRequest request, SysResource resource) throws Exception {
		try {
			//如果 parentId 为 " " ，则改为null
			if(Strings.isNullOrEmpty(resource.getParentResourceId().trim())){
				resource.setParentResourceId(null);
			}
			if(Strings.isNullOrEmpty(resource.getComponentId().trim())){
				resource.setComponentId(null);
			}
			if(Strings.isNullOrEmpty(resource.getSystemId())){
				return renderError("请在左侧 选择系统后，再添加资源！");
			}
			sysResourceService.insertResource(resource);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/deleteResource")//, method = RequestMethod.POST 
	@ResponseBody
	public Object deleteResource(HttpServletRequest request,SysResource resource) throws Exception {
		Map<String, Object> condition = new HashMap<String, Object>();
		
		try {
			String msg = "";
			String resourceId = resource.getId();
			
			condition.put("parentId", resourceId);
			List<SysResource> resourceList = sysResourceService.findResourceByCondition(condition);
			if(resourceList.size()>0){
				msg = "当前节点，存在子节点，不能直接删除";
				return renderError(msg);
			}
			condition.clear();
			condition.put("resourceId", resourceId);
			List<SysRoleResourceRelationship> rrrsList = sysRRRSService.findListByCondition(condition);
			if(rrrsList.size()>0){
				msg = "当前资源 已关联 角色，请 解除关联后删除 ";
				return renderError(msg);
			}
			
			sysResourceService.deleteById(resourceId);
		} catch (Exception e) {
			logger.error("删除资源出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("删除资源成功！");
	}
	
	
	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request, String resourceId) throws Exception {
		String forward = "sys/resource/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			SysResource resource = sysResourceService.findById(resourceId);
			
			List<SysComponent> componentList = sysComponentService.findListBySystemId(resource.getSystemId());
			model.put("componentList", componentList);
			
			model.put("resource", resource);
			
			model.put("systemId", resource.getSystemId());
		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(HttpServletRequest request, SysResource resource) throws Exception {
		try {
			if(Strings.isNullOrEmpty(resource.getParentResourceId().trim())){
				resource.setParentResourceId(null);
			}
			sysResourceService.updateResource(resource);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//当前 角色 关联 资源集合
	@RequestMapping(value = "/resourceListManagerByRoleId", method = RequestMethod.GET)
    public ModelAndView resourceListManagerByRoleId(HttpServletRequest request, SysResource resource) throws Exception {
        String forward = "/sys/rrrs/detailListResource";
        String roleId = request.getParameter("roleId");
        Map<String, Object> model = new HashMap<String, Object>();
        try {
        	SysRole role = sysRoleService.getRoleById(roleId);
        	String systemId = role.getSystemId();
        	Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("status", 1);
			List<SysSystem> systemList = this.sysSystemService.getSystemList(condition);
			
			model.put("systemList", systemList);
			model.put("role", role);
			model.put("systemId", systemId);
        } catch(Exception e) {
    		logger.error("查询列表出现异常，",e);
    		e.printStackTrace();
    	}
    	return new ModelAndView(forward, model);
    }
	
	
	//根据 资源 ID ，查询当前 资源 所关联的 角色列表信息
	@RequestMapping(value = "/dataGridByRoleId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByRoleId(HttpServletRequest request,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String roleId = request.getParameter("roleId");
		String name = request.getParameter("name");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//当前登录账户ID
			if(!Strings.isNullOrEmpty(roleId)){
				condition.put("roleId", roleId);
			}
			if(!Strings.isNullOrEmpty(name)){
				condition.put("name", name);
			}
			pageInfo.setCondition(condition);
			
			sysResourceService.findDataGridByRole(pageInfo);
			
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/roleGiveResource", method = RequestMethod.GET)
    public ModelAndView roleGiveResource(HttpServletRequest request, SysResource resource) throws Exception {
    	String forward = "/sys/rrrs/giveResource";
    	Map<String, Object> model = new HashMap<String, Object>();
    	String roleId = request.getParameter("roleId");
    	String systemId = resource.getSystemId();
    	try{
    		SysRole role = sysRoleService.getRoleById(roleId);
    		
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
	public Object addRRRS(ResourceForm resourceform) throws Exception {
		try {
			//创建新的账户。
//					sysRoleService.insertRole(role.getObj());
			String[] resourceIds = resourceform.getIds();
			String roleId = resourceform.getRoleId();
			
			sysRRRSService.batchSaveRoleResourceRelationshipByRoleId(roleId, resourceIds);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/deleteRRRS")//, method = RequestMethod.POST 
	@ResponseBody
	public Object deleteRRRS(HttpServletRequest request,String[] ids,String roleId) throws Exception {
		try {
			//创建新的账户。
//					sysRoleService.insertRole(role.getObj());
//					String[] roleIds = roleform.getIds();
//					String accountId = roleform.getAccountId();
			
			sysRRRSService.batchDelRoleResourceRelationshipByRoleId(roleId, ids);
		} catch (Exception e) {
			logger.error("解除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("解除成功！");
	}
}
