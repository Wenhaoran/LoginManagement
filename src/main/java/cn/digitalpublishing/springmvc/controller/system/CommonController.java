package cn.digitalpublishing.springmvc.controller.system;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.digitalpublishing.authcation.bean.ConstantsSession;
import cn.digitalpublishing.base.bean.IndexHtmlList;
import cn.digitalpublishing.base.bean.IndexModuleList;
import cn.digitalpublishing.base.bean.LoginInfo;
import cn.digitalpublishing.base.bean.MenuHtmlList;
import cn.digitalpublishing.base.bean.MenuResourceList;
import cn.digitalpublishing.base.bean.RoleListByAccount;
import cn.digitalpublishing.base.bean.SessionIdMap;
import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.AccountForm;
import cn.digitalpublishing.springmvc.form.system.CommonForm;
import cn.digitalpublishing.springmvc.form.system.RoleForm;
import cn.digitalpublishing.util.Log;
import cn.digitalpublishing.util.SystemConstants;
import cn.digitalpublishing.util.exception.WebgateException;

/**
 * 
 * @author Administrator
 * @see	登录验证的controller 
 *	1、登录验证	login
 *	2、退出登录	logout
 *	3、错误提示页面	prompt
 *
 */
@Controller
@RequestMapping("/pages/common")
public class CommonController extends BaseController {
	
	private final static String NO_LOGIN="Global.NoLogin";
	
	private final static String LOGIN_FAIL="Global.LoginFail";
	

	@RequestMapping(value="login", headers="Accept=application/json", method = RequestMethod.POST)
	@ResponseBody
	public AccountForm login(HttpServletRequest request, HttpServletResponse response, AccountForm form) throws Exception {
		try {
			if (!request.getMethod().equals("POST")) {
				throw new WebgateException("登录超时，请重新登录。");
			}
			Log.printInfo("");
            //检测验证码
//          checkValidateCode(request, form);
//			Map<String, Object> accountInfo = (Map<String, Object>) session.getAttribute("pt_accountInfo");
			
            String username = form.getUsername() == null ? "" : form.getUsername();
            String password = form.getPassword() == null ? "" : form.getPassword();
            
            Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("username", username);
			condition.put("password", password);
            condition.put("status", SystemConstants.ACCOUNT_STATUS_USING);
            
			SysAccount account = this.sysAccountService.login(condition);
			
			if (account == null) {
				form.setMsg("用户名或密码错误，登录验证失败。");
				form.setIsSuccess(FAILURE);
			} else {
//				if(account.getEncryption()==1){
//					form.setChangepwd(true);
//				}
				
				Map<String, Object> accountCondition = new HashMap<String, Object>();
				
				accountCondition.put("accountId", account.getId());
				accountCondition.put("status", SystemConstants.ROLE_STATUS_USED);
				
				List<SysRole> roleList = sysRoleService.findListByCondition(accountCondition);//当前账户，所有的角色集合
				
				if (roleList != null && !roleList.isEmpty()) {
					
					//获取所有角色，并默认选择第一个角色
					SysRole defaultRole = roleList.get(0);//默认角色
					SysSystem defaultSystem = sysSystemService.getSystemById(defaultRole.getSystemId());//默认角色所属系统
					//session 中 存储 用户+系统+角色信息。
					HttpSession session = request.getSession();
					session.setAttribute("ccsfw_account", account);
					session.setAttribute("ccsfw_sys", defaultSystem);
					session.setAttribute("ccsfw_role", defaultRole);
					session.setAttribute(ConstantsSession.SESSION_USER, account.getId());
					String random = new Date().getTime() +"_"+ Math.random();
					session.setAttribute(ConstantsSession.SESSION_TICKET, random);//生成随机数，并 保存到
					
					//根据 random 保存当前登录 账户，以及 账户默认角色
					SessionIdMap.put(random, new LoginInfo(account,defaultRole));//全局缓存 根据 随机数，保存 （账户，默认角色）信息。
					
					Map<String,Object> resourceCondition = new HashMap<String,Object>();
					resourceCondition.put("systemId", defaultSystem.getId());
					resourceCondition.put("roleId", defaultRole.getId());
//					resourceCondition.put("orderBy", form.getRoleId());
					
					List<SysResource> resourceList = sysResourceService.findResourceByCondition(resourceCondition);//根据角色，获取 资源集合
					for(SysResource resource : resourceList){
						resource.setComponent(this.sysComponentService.getComponentById(resource.getComponentId()));//当前资源所属组件（project)
						resource.setSystem(this.sysSystemService.getSystemById(resource.getSystemId()));//当前资源所属系统
					}
					
					Map<String, Object> moduleCondition = new HashMap<String, Object>();
					moduleCondition.put("accountId", account.getId());
					
					List<SysModule> moduleList = sysModuleService.findModuleByCondition(moduleCondition);
					
					IndexModuleList.put(random, moduleList);
					
					MenuResourceList.put(random, resourceList);//全局缓存  根据  随机数，保存 （当前角色 有权限 的    资源 ） 信息。
					
					RoleListByAccount.put(random, roleList);
                    //保存Cookie状态
                    if (form.getRemember() != null && !"".equals(form.getRemember())) {
                        Cookie cookie = new Cookie("username", username);
                        // cookie保存一个月
                        cookie.setMaxAge(30*60*60*24);
                        cookie.setPath("/");
                        response.addCookie(cookie);
                    }

					form.setMsg("登录验证通过");
					form.setIsSuccess(SUCCESS);
					form.setUrl("");
				}else{
					form.setMsg("授权失败，登录账户没有角色权限");
					form.setIsSuccess(FAILURE);
					form.setUrl("");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			form.setMsg(e.getMessage());
			form.setIsSuccess(FAILURE);
		}
		return form;
	}
	
	protected void checkValidateCode(HttpServletRequest request, AccountForm form) throws WebgateException{
		HttpSession session = request.getSession();
		String sessionValidateCode = null;
		Object obj = session.getAttribute(VALIDATE_CODE);
		if (obj == null) {
			sessionValidateCode = "";
		} else {
			sessionValidateCode = obj.toString();
		}
		//让上一次的验证码失效
		session.setAttribute(VALIDATE_CODE, null);

		String validateCode = form.getValidateCode();
		if (validateCode==null || validateCode.trim().equals("") || !sessionValidateCode.equalsIgnoreCase(validateCode)) {
			throw new WebgateException("");
		}
	}
	
	@RequestMapping(value="logout", headers="Accept=application/json")
	@ResponseBody
	public Object logout(HttpServletRequest request, HttpServletResponse response, AccountForm form) throws Exception{
		HttpSession session = request.getSession();
		session.removeAttribute("ccsfw_account");
		session.removeAttribute("ccsfw_sys");
		session.removeAttribute("ccsfw_role");
		session.removeAttribute(ConstantsSession.SESSION_USER);
		String sessionId = session.getAttribute(ConstantsSession.SESSION_TICKET)!=null?session.getAttribute(ConstantsSession.SESSION_TICKET).toString():"";
		if(!"".equals(sessionId)){
			SessionIdMap.remove(sessionId);
			session.removeAttribute(ConstantsSession.SESSION_TICKET);
			MenuHtmlList.remove(sessionId);
			MenuResourceList.remove(sessionId);
			IndexHtmlList.remove(sessionId);
			IndexModuleList.remove(sessionId);
			RoleListByAccount.remove(sessionId);
		}
		form.setIsSuccess(SUCCESS);
		form.setUrl("/pages/login.jsp");
		return  renderSuccess("关联成功！");
	}
	
	@RequestMapping(value="/index")
	public void index(HttpServletRequest request, HttpServletResponse response, RoleForm form) throws Exception {
		request.setAttribute("pt_msg","权限限制");
		request.setAttribute("pt_msg_code","405");
		RequestDispatcher rd = request.getRequestDispatcher("prompt");
		rd.forward(request,response);
		return;
	}
	
	@RequestMapping(value = "/prompt")
	public ModelAndView prompt(HttpServletRequest request, HttpServletResponse response, CommonForm form) throws Exception {
		String forwardString = "prompt";
		Map<String,Object> model = new HashMap<String,Object>();
		form.setMsg(request.getParameter("pt_msg")!=null?request.getParameter("pt_msg").toString():"Global.Msg.Error");
		if(NO_LOGIN.equals(form.getMsg())||LOGIN_FAIL.equals(form.getMsg())){
			form.setUrl(GLOBAL_LOGIN_URL);
		}
		form.setCode(request.getParameter("pt_msg_code")!=null?request.getParameter("pt_msg_code").toString():"Global.Code.Error");
		model.put("form", form);
		return new ModelAndView(forwardString,model);
	}
}
