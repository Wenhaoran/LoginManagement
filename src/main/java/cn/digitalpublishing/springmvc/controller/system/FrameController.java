package cn.digitalpublishing.springmvc.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.digitalpublishing.base.bean.IndexHtmlList;
import cn.digitalpublishing.base.bean.IndexModuleList;
import cn.digitalpublishing.base.bean.LoginInfo;
import cn.digitalpublishing.base.bean.MenuHtmlList;
import cn.digitalpublishing.base.bean.MenuResourceList;
import cn.digitalpublishing.base.bean.RoleHtmlList;
import cn.digitalpublishing.base.bean.RoleListByAccount;
import cn.digitalpublishing.base.bean.SessionIdMap;
import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleAccountRelationship;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.AccountForm;
import cn.digitalpublishing.util.Log;
import cn.digitalpublishing.util.SystemConstants;
import cn.digitalpublishing.util.exception.WebgateException;

/**
 * 
 * @author Administrator
 *
 * @see	属于框架级别操作的方法。
 * 1、index 登录验证通过后的默认首页。
 */
@Controller
@RequestMapping("/pages")
public class FrameController extends BaseController {
	
	/**
	 * @see 账户登录后，跳转主页的方法
	 * @param request
	 * @param response
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, AccountForm form) throws Exception {
		String forwardString = "/index";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			//从session 中获取 ticket+账户+角色+系统 信息。
			SysAccount sessionAccount = (SysAccount) request.getSession().getAttribute("ccsfw_account");
			String ticket = (String) request.getSession().getAttribute("ticket");
			SysRole sessionRole = (SysRole) request.getSession().getAttribute("ccsfw_role");
			SysSystem sessionSystem = (SysSystem) request.getSession().getAttribute("ccsfw_sys");
			
			LoginInfo loginInfo = SessionIdMap.get(ticket);
			
			//如果 session 不存在，强制跳转登录页面
			if (loginInfo == null||ticket == null||sessionAccount == null) {
				throw new WebgateException("系统错误，请联系管理员处理。");
			}
			form.setAccountId(sessionAccount.getId());
			form.setSysId(sessionSystem.getId());
			form.setRoleId(sessionRole.getId());
			form.setUsername(sessionAccount.getName());
			
			//判断当前账户 密码是否加密，如果密码没加密，提示更改密码
			if(sessionAccount.getEncryption() == 1){
				form.setChangepwd(true);
			}
			
		} catch (Exception e) {
			forwardString = "/login";
			Log.printError("错误信息："+e.getMessage());
		}
		model.put("form", form);
		return new ModelAndView(forwardString,model);
	}
	
	/**
	 * @param request
	 * @param response
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frame/getRoleListByAccountId", method = RequestMethod.POST)
	@ResponseBody
	public AccountForm getRoleListByAccountId(HttpServletRequest request,HttpServletResponse response, AccountForm form) throws Exception{
		try {
			Map<String,Object> accountCondition = new HashMap<String,Object>();
			accountCondition.put("accountId", form.getId());
			List<SysRole> roleList = new ArrayList<SysRole>();
			List<SysRoleAccountRelationship> roleAccountRelationshipList = this.sysRARSService.getRoleAccountRelationshipListByAccountId(accountCondition);
			for (SysRoleAccountRelationship sysRoleAccountRelationship : roleAccountRelationshipList) {
				SysRole role = this.sysRoleService.getRoleById(sysRoleAccountRelationship.getRoleId());
				roleList.add(role);
			}
			form.setRoleList(roleList);
			form.setIsSuccess(SUCCESS);
		} catch (Exception e) {
			Log.printError("错误信息："+e.getMessage());
			e.printStackTrace();
			form.setIsSuccess(FAILURE);
			form.setMsg((e instanceof WebgateException) ? "" : e.getMessage());
		}
		return form;
	}

	@RequestMapping(value="/frame/switchRole", headers="Accept=application/json")
	@ResponseBody
	public AccountForm switchRole(HttpServletRequest request, HttpServletResponse response, AccountForm form) throws Exception {
		try {
			String roleId = form.getRoleId();
			SysRole role = this.sysRoleService.getRoleById(roleId);
			SysSystem system = this.sysSystemService.getSystemById(role.getSystemId());
			
			HttpSession session = request.getSession();
			String oldKey = session.getAttribute("ticket").toString();
			
			//获取 切换之前，当前 ticket 对应 的 账户+角色
			LoginInfo loginInfo = SessionIdMap.get(oldKey);
			
			//删除sessionIDMap 中 旧 的 key + loginInfo 
			SessionIdMap.remove(oldKey);
			//切换角色html 代码
			RoleListByAccount.remove(oldKey);//角色集合
			RoleHtmlList.remove(oldKey);
			//菜单 html 代码
			MenuResourceList.remove(oldKey);
			MenuHtmlList.remove(oldKey);
			//首页加载的 模块 html 代码
			IndexHtmlList.remove(oldKey);
			IndexModuleList.remove(oldKey);
			//删除 session 中的 角色 ，系统 信息。
			session.removeAttribute("ccsfw_role");
			session.removeAttribute("ccsfw_sys");
			
			//map 中保存切换后的 角色 
			loginInfo.setRole(role);
			//session 中，保存切换后的角色 ，以及 当前角色 对应的系统
			session.setAttribute("ccsfw_role", role);
			session.setAttribute("ccsfw_sys",system);
			
			
			String random = new Date().getTime() +"_"+ Math.random();
			session.setAttribute("ticket", random);
			//map 保存 切换角色后的 ticket ： 账户+角色
			SessionIdMap.put(random,loginInfo);
			
			/*********************************** 以下代码，为 更新 首页 所需的 集合信息 ，加载首页，需要 后台拼接  1、菜单资源，2、角色信息，3、模块信息 的html。  ******************************************************/
			// 根据最新  的  角色，来获取 当前角色 ，对应的资源的集合
			Map<String,Object> resourceCondition = new HashMap<String,Object>();
			resourceCondition.put("systemId",system.getId());
			resourceCondition.put("roleId", role.getId());
			List<SysResource> resourceList = sysResourceService.findResourceByCondition(resourceCondition);//根据角色，获取 资源集合
			for(SysResource resource : resourceList){
				resource.setComponent(this.sysComponentService.getComponentById(resource.getComponentId()));//当前资源所属组件（project)
				resource.setSystem(this.sysSystemService.getSystemById(resource.getSystemId()));//当前资源所属系统
			}
			//存储 新角色的 菜单资源集合
			MenuResourceList.put(random, resourceList);//map 存储  新的key - 资源列表
			
			//查询当前账户 关联 的所有 角色（可用状态）
			Map<String, Object> accountCondition = new HashMap<String, Object>();
			accountCondition.put("accountId", loginInfo.getAccount().getId());
			accountCondition.put("status", SystemConstants.ROLE_STATUS_USED);
			List<SysRole> roleList = sysRoleService.findListByCondition(accountCondition);//当前账户，所有的角色集合
			//存储 角色集合
			RoleListByAccount.put(random, roleList);//map 存储  新的key - 角色列表
			
			//查询当前账户 关联的所有 模块 集合
			Map<String, Object> moduleCondition = new HashMap<String, Object>();
			moduleCondition.put("accountId", loginInfo.getAccount().getId());
			List<SysModule> moduleList = sysModuleService.findModuleByCondition(moduleCondition);
			//存储 模块集合
			IndexModuleList.put(random, moduleList);
			
			/********************************************** end ********************************/
			
			form.setSysId(role.getSystemId());
			form.setRoleId(role.getId());
			form.setMsg("" + role.getName());
			form.setIsSuccess(SUCCESS);
			
		} catch (Exception e) {
			Log.printError("错误信息："+e.getMessage());
			e.printStackTrace();
			form.setMsg((e instanceof WebgateException) ? ((WebgateException) e).getPrompt() : e.getMessage());
			form.setIsSuccess(FAILURE);
		}
		return form;
	}
	
	
	
	

	/**
	 * @see 当前方法已废弃 
	 * 	废弃原因：easyui 不支持 前段页面 js 拼接html 生成tree 。	
	 * 	方法描述： 根据当前 登录账户 对应的 角色，来获取 角色 对应的 资源信息集合。
	 * @param request
	 * @param response
	 * @param form
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping(value = "/frame/getResourceZTreeByRoleId", method = RequestMethod.POST)
	@ResponseBody
	public ResourceForm getResourceZTreeByRoleId(HttpServletRequest request,HttpServletResponse response, ResourceForm form) throws Exception{
		try {
			String ticket = (String) request.getSession().getAttribute("ticket");
			Map<String,Object> resourceCondition = new HashMap<String,Object>();
			resourceCondition.put("sysId", form.getSysId());
			resourceCondition.put("roleId", form.getRoleId());
			List<SysResource> resourceList = sysResourceService.findResourceByCondition(resourceCondition);
			for(SysResource list : resourceList){
				list.setComponent(this.sysComponentService.getComponentById(list.getComponentId()));
				list.setSystem(this.sysSystemService.getSystemById(list.getSystemId()));
			}
			MenuResourceList.put(ticket, resourceList);
			form.setIsSuccess(SUCCESS);
		} catch (Exception e) {
			form.setIsSuccess(FAILURE);
			form.setMsg((e instanceof WebgateException) ? "" : e.getMessage());
		}
		return form;
	}*/
}
