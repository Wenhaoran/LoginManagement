package cn.digitalpublishing.springmvc.controller.system;

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

import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleAccountRelationship;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.AccountForm;
import cn.digitalpublishing.util.Log;
import cn.digitalpublishing.util.Md5Util;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

/**
 * @author Administrator
 * @see 账户操作controller 用来加载账户页面，渲染数据等。
 */
@Controller
@RequestMapping("/pages/account")
public class AccountController extends BaseController {

	public static final Integer ENCRYPTION_NO = 1;

	public static final Integer ENCRYPTION_YES = 2;

	@RequestMapping(value = "/form/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, AccountForm form) throws Exception {
		String forwardString = "sys/account/list";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			HttpSession session = request.getSession();
			session.getAttribute("");
			form.setIsSuccess(SUCCESS);
		} catch (Exception e) {
			form.setIsSuccess(FAILURE);
			form.setMsg("");
		}
		model.put("form", form);
		return new ModelAndView(forwardString, model);
	}

	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(HttpServletRequest request, SysAccount account,
			Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();

			// 查询条件： 账户名称，账户状态，账户登记，账户类型。
			if (!Strings.isNullOrEmpty(account.getName())) {
				condition.put("name", account.getName());
			}
			if (account.getStatus() != null) {
				condition.put("status", account.getStatus());
			}
			if (account.getLevel() != null) {
				condition.put("level", account.getLevel());
			}
			if (account.getType() != null) {
				condition.put("type", account.getType());
			}

			pageInfo.setCondition(condition);
			sysAccountService.findDataGrid(pageInfo);
			// DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}

	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysAccount system)
			throws Exception {
		String forward = "sys/account/add";
		Map<String, Object> model = new HashMap<String, Object>();
		try {

		} catch (Exception e) {
			logger.error("跳转添加页面出现异常，", e);
			e.printStackTrace();
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(SysAccount account) throws Exception {
		try {
			//创建新的账户。
			account.setPass("123456");
			account.setEncryption(1);
			sysAccountService.insertAccount(account);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}

	@RequestMapping("/editPage")
	public ModelAndView editPage(HttpServletRequest request, SysAccount account)
			throws Exception {
		String forward = "sys/account/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			account = sysAccountService.findById(id);
			model.put("account", account);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("跳转编辑页面出现异常，", e);
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(SysAccount account) throws Exception {
		try {
			sysAccountService.update(account);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Object delete(SysAccount account) throws Exception {
		try {
			String accountId = account.getId();
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("accountId", accountId);
			List<SysRoleAccountRelationship> ralist = sysRARSService.getRoleAccountRelationshipListByAccountId(condition);
			if(ralist.size()>0){
				return renderError("当前账户 已关联 角色，请解除关联后 删除该账户。");
			}
			
			sysAccountService.deleteAccountById(account.getId());
		} catch (Exception e) {
			logger.error("删除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("删除成功！");
	}
	
	@RequestMapping("/giveRole")
    public ModelAndView giveRole(HttpServletRequest request, SysAccount account) throws Exception {
    	String forward = "sys/account/giveRole";
    	Map<String, Object> model = new HashMap<String, Object>();
    	try {
    		String id = request.getParameter("id");
    		account = sysAccountService.findById(id);
        	model.put("account", account);
        } catch(Exception e) {
			logger.error("跳转编辑页面出现异常，",e);
		}
        return new ModelAndView(forward, model);
    }
	
	@RequestMapping("/saveRole")
    public Object saveRole(HttpServletRequest request, SysAccount account,String roleIds) throws Exception {
		try {
			sysAccountService.deleteAccountById(account.getId());
		} catch (Exception e) {
			logger.error("赋予角色出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("赋予角色成功！");
	}

	
	
	
	
	
	//根据 角色 ID ，查询 当前角色关联的 账户 集合
	@RequestMapping(value = "/accountListManagerByRoleId", method = RequestMethod.GET)
    public ModelAndView accountListManagerByRoleId(HttpServletRequest request, SysAccount account) throws Exception {
        String forward = "/sys/rars/detailListAccount";
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
	
	//将 角色，赋予账户
	@RequestMapping(value = "/roleGiveAccount", method = RequestMethod.GET)
    public ModelAndView accountGiveRole(HttpServletRequest request, SysAccount account) throws Exception {
    	String forward = "/sys/rars/giveAccount";
    	Map<String, Object> model = new HashMap<String, Object>();
    	String roleId = request.getParameter("roleId");
    	try{
    		SysRole role = sysRoleService.getRoleById(roleId);
    		
    		model.put("role", role);
    		model.put("account", account);
    	} catch(Exception e) {
    		logger.error("跳转添加页面出现异常，",e);
    	}
    	return new ModelAndView(forward, model);
    }
	
	// 根据 角色ID ，查询 关联所有的账户信息
	@RequestMapping(value = "/dataGridByRoleId", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGridByAccountId(HttpServletRequest request,SysAccount account,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		String roleId = request.getParameter("roleId");
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			//当前 角色ID
			if(!Strings.isNullOrEmpty(roleId)){
				condition.put("roleId", roleId);
			}
			//查询条件：账户名称，账户类型，角色状态，账户等级
			if(!Strings.isNullOrEmpty(account.getName())){
				condition.put("name", account.getName());
			}
			if(account.getType()!=null){
				condition.put("type", account.getType());
			}
			if(account.getLevel()!=null){
				condition.put("level", account.getLevel());
			}
			if(account.getStatus()!=null){
				condition.put("status", account.getStatus());
			}
			pageInfo.setCondition(condition);
			sysAccountService.findDataGrid(pageInfo);
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/addRARS", method = RequestMethod.POST)
	@ResponseBody
	public Object addRARS(AccountForm accountform) throws Exception {
		try {
			String[] accountIds = accountform.getIds();
			String roleId = accountform.getRoleId();
			
			sysRARSService.batchSaveRoleAccountRelationshipByRoleId(roleId, accountIds);
		} catch (Exception e) {
			logger.error("关联出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("关联成功！");
	}
	
	@RequestMapping(value = "/deleteRARS")//, method = RequestMethod.POST 
	@ResponseBody
	public Object deleteRARS(HttpServletRequest request,String[] ids,String roleId) throws Exception {//null
		try {
//			String[] roleIds = roleform.getIds();
//			String accountId = roleform.getAccountId();
			
			sysRARSService.batchDelRoleAccountRelationshipByRoleId(roleId, ids);
		} catch (Exception e) {
			logger.error("解除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("解除成功！");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/editPwdPage", method = RequestMethod.GET)
    public ModelAndView editPwdPage(String accountId) {
		String forward = "userEditPwd";
    	SysAccount account = sysAccountService.findById(accountId);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("accountId", accountId);
		model.put("account", account);
        return new ModelAndView(forward, model);
    }
	
    @RequestMapping("/editUserPwd")
    @ResponseBody
    public Object editUserPwd(String accountId,String oldPwd, String pwd) {
    	try {

        	SysAccount account = sysAccountService.findById(accountId);
        	if(account==null){
        		return renderError("猥琐发育，别浪！");
        	}
        	if(account.getEncryption()==1){
        		if(!account.getPass().equals(oldPwd)){
        			return renderError("原密码不正确!");
        		}
        	}else{
        		if(!account.getPass().equals(Md5Util.md5(oldPwd))){
        			return renderError("原密码不正确!");
        		}
        	}
        	account.setEncryption(2);
        	account.setPass(Md5Util.md5(pwd));
        	sysAccountService.update(account);
		} catch (Exception e) {
			Log.printError(e.getMessage());
			e.printStackTrace();
			return renderError("系统错误！");
		}
    	return renderSuccess("密码修改成功！");
    }
    
    @RequestMapping("/rewPass")
    @ResponseBody
    public Object rewPass(String id) {
    	try {
        	SysAccount account = sysAccountService.findById(id);
        	account.setEncryption(1);
        	account.setPass("123456");
        	sysAccountService.update(account);
		} catch (Exception e) {
			Log.printError(e.getMessage());
			e.printStackTrace();
			return renderError("系统错误！");
		}
    	return renderSuccess("密码重置成功！");
    }
    
    
    //****************************** 账户关联 模块 ********************************************
  //根据 角色 ID ，查询 当前角色关联的 账户 集合
  	@RequestMapping(value = "/accountListManagerByModuleId", method = RequestMethod.GET)
      public ModelAndView accountListManagerByModuleId(HttpServletRequest request, SysAccount account) throws Exception {
          String forward = "/sys/amrs/detailListAccount";
          String moduleId = request.getParameter("moduleId");
          Map<String, Object> model = new HashMap<String, Object>();
          try {
        	SysModule module = sysModuleService.getModuleById(moduleId);
  			
  			model.put("module", module);
          } catch(Exception e) {
      		logger.error("查询列表出现异常，",e);
      		e.printStackTrace();
      	}
      	return new ModelAndView(forward, model);
      }
  	
  	//将 模块，赋予账户
  	@RequestMapping(value = "/moduleGiveAccount", method = RequestMethod.GET)
      public ModelAndView moduleGiveAccount(HttpServletRequest request, SysAccount account) throws Exception {
      	String forward = "/sys/amrs/giveAccount";
      	Map<String, Object> model = new HashMap<String, Object>();
      	String moduleId = request.getParameter("moduleId");
      	try{
      		SysModule module = sysModuleService.getModuleById(moduleId);
      		
      		model.put("module", module);
      		model.put("account", account);
      	} catch(Exception e) {
      		logger.error("跳转添加页面出现异常，",e);
      	}
      	return new ModelAndView(forward, model);
      }
  	
  	// 根据 角色ID ，查询 关联所有的账户信息
  	@RequestMapping(value = "/dataGridByModuleId", method = RequestMethod.POST)
  	@ResponseBody
  	public Object dataGridByModuleId(HttpServletRequest request,SysAccount account,Integer page, Integer rows, String sort, String order) {
  		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
  		String moduleId = request.getParameter("moduleId");
  		try {
  			Map<String, Object> condition = new HashMap<String, Object>();
  			//当前 角色ID
  			if(!Strings.isNullOrEmpty(moduleId)){
  				condition.put("moduleId", moduleId);
  			}
  			//查询条件：账户名称，账户类型，角色状态，账户等级
  			if(!Strings.isNullOrEmpty(account.getName())){
  				condition.put("name", account.getName());
  			}
  			if(account.getType()!=null){
  				condition.put("type", account.getType());
  			}
  			if(account.getLevel()!=null){
  				condition.put("level", account.getLevel());
  			}
  			if(account.getStatus()!=null){
  				condition.put("status", account.getStatus());
  			}
  			pageInfo.setCondition(condition);
  			sysAccountService.findDataGrid(pageInfo);
//  			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
  		} catch (Exception e) {
  			e.printStackTrace();
  			logger.error("查询列表出现异常，", e);
  		}
  		return pageInfo;
  	}
  	
  	@RequestMapping(value = "/addAMRS", method = RequestMethod.POST)
  	@ResponseBody
  	public Object addAMRS(AccountForm accountform) throws Exception {
  		try {
  			String[] accountIds = accountform.getIds();
  			String moduleId = accountform.getModuleId();
  			
  			sysAMRSService.batchSaveAccountModuleRelationshipByRoleId(moduleId, accountIds);
  		} catch (Exception e) {
  			logger.error("关联出现异常，", e);
  			e.printStackTrace();
  		}
  		return renderSuccess("关联成功！");
  	}
  	
  	@RequestMapping(value = "/deleteAMRS")//, method = RequestMethod.POST 
  	@ResponseBody
  	public Object deleteAMRS(HttpServletRequest request,String[] ids,String moduleId) throws Exception {//null
  		try {
//  			String[] roleIds = roleform.getIds();
//  			String accountId = roleform.getAccountId();
  			
  			sysAMRSService.batchDelAccountModuleRelationshipByModuleId(moduleId, ids);
  		} catch (Exception e) {
  			logger.error("解除出现异常，", e);
  			e.printStackTrace();
  		}
  		return renderSuccess("解除成功！");
  	}
}