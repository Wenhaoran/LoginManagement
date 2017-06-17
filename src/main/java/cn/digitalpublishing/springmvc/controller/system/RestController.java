package cn.digitalpublishing.springmvc.controller.system;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.digitalpublishing.authcation.bean.ResultObject;
import cn.digitalpublishing.base.bean.LoginInfo;
import cn.digitalpublishing.base.bean.SessionIdMap;
import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.util.Map2Object;
import cn.digitalpublishing.util.ObjectUtil;
import cn.digitalpublishing.util.authen.StringUtil;
import cn.digitalpublishing.util.authen.vo.Resource;

import com.google.common.base.Strings;

/**
 * 
 * @author Administrator
 *	认证接口controller ， 
 *	1、通过Filter拦截 后，在当前controller 中进行 权限认证。
 *	2、调用其他接口，查询 webgate 数据。
 */
@Controller
@RequestMapping("/pages/rest")
public class RestController extends BaseController {

	public final static String REST_OPERATOR_ADD = "1";

	public final static String REST_OPERATOR_MOD = "2";

	/**
	 * 获取账户信息
	 * 
	 * @param id
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAccount/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResultObject<SysAccount> getAccount(@PathVariable String id) throws Exception {

		ResultObject<SysAccount> result = null;
		try {
			if ("0".equals(id)) {
				result = new ResultObject<SysAccount>(2, "Rest.Get.Account.Success");// "获取用户信息成功！");
			} else {
				SysAccount account = this.sysAccountService.getAccountByEmpId(id);
				if (account != null) {
					ObjectUtil<SysAccount> util = new ObjectUtil<SysAccount>();
					account = util.setNull(account, new String[] { Set.class.getName(), List.class.getName() });
					result = new ResultObject<SysAccount>(1, account, "Rest.Get.Account.Success");// "获取用户信息成功！");
				} else {
					result = new ResultObject<SysAccount>(1, "Rest.Get.Account.Success");// "获取用户信息成功！");
				}
			}
		} catch (Exception e) {
			result = new ResultObject<SysAccount>(2, "Rest.Get.Account.Failure");// "获取用户信息失败！");
		}
		return result;
	}


	/**
	 * 获取权限信息
	 * 
	 * @param id
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPermissions/{id}", method = RequestMethod.POST)
	@ResponseBody
	public ResultObject<Resource> getPermissions(@PathVariable String id, @RequestBody Map<String, Object> params) throws Exception {

		ResultObject<Resource> result = null;
		try {
			String sid = id;
			if (sid != null && !"".equals(sid)) {
				LoginInfo loginInfo = SessionIdMap.get(sid);
				@SuppressWarnings({ "unchecked", "rawtypes" })
				Resource obj = (Resource) Map2Object.convert((LinkedHashMap) params.get("resource"), Resource.class.getName());
				if (loginInfo != null) {// 如果登录ID存在，说明已经登录了
					// 根据 ID 资源链接 和 资源参数 ,确定资源是否有访问权限
					// 如果有再加载功能权限

					result = new ResultObject<Resource>(1, obj, "Rest.Operation.Verify.Login.Success");
				} else {
					result = new ResultObject<Resource>(2, "Rest.Operation.Verify.Login.Fail");
				}
			} else {
				result = new ResultObject<Resource>(2, "Rest.Operation.Verify.Login.Fail");
			}
		} catch (Exception e) {
			result = new ResultObject<Resource>(2,e.getMessage());
		}
		return result;
	}

	/**
	 * 获取登录信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAccountInfo/{id}", method = RequestMethod.GET)
	public void getLoginInfo(@PathVariable String id,Model model)throws Exception {
		ResultObject<Map<String, Object>> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String sid = id;
			if (sid != null && !"".equals(sid)) {
				LoginInfo loginInfo = SessionIdMap.get(sid);
				if (loginInfo != null) {
					SysAccount account = loginInfo.getAccount();
					SysRole role = loginInfo.getRole();
					map.put("accountId", account.getId().toString());
					map.put("accountName", account.getName().toString());
					map.put("employeeId", account.getEmployeeId());
					map.put("roleId", role.getId().toString());
					map.put("roleStatus", String.valueOf(role.getStatus()));
					map.put("lang", loginInfo.getLang());
					map.put("success", "true");
					result = new ResultObject<Map<String, Object>>(1, map, "webgate.httpclient.login.success");
				} else {
					result = new ResultObject<Map<String, Object>>(2, "webgate.httpclient.no.login");
				}
			} else {
				result = new ResultObject<Map<String, Object>>(2, "webgate.httpclient.ticket.error");
			}
		} catch (Exception e) {
			result = new ResultObject<Map<String, Object>>(2,e.getMessage());
		}
		model.addAttribute("target",result);
	}

	/**
	 * 获取访问权限信息
	 * @param componentCode
	 * @param url
	 * @param roleId
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPermissionsBak/{componentCode}/{url}/{roleId}", method = RequestMethod.GET)
	public void getPermissionsBak(@PathVariable String componentCode, @PathVariable String url, @PathVariable String roleId,Model model) throws Exception {

		ResultObject<String> result = null;
		Map<String, Object> condition = new HashMap<String, Object>();
		try {
			condition.put("componentCode", componentCode);
			condition.put("url",StringUtil.removeDuplicate(url.replace("_","/"),'/'));
			condition.put("roleId", roleId);
			int count = this.sysRRRSService.findListByCondition(condition).size();
			result = new ResultObject<String>(1,count==1?"y":"n", "webgate.getPermissions.success");
		} catch (Exception e) {
			result = new ResultObject<String>(2, e.getMessage());
		}
		model.addAttribute("target",result);
	}
	
	/**
	 * 获取访问权限信息
	 * @param componentCode
	 * @param url
	 * @param roleId
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPermissions/{componentCode}/{url}/{roleId}", method = RequestMethod.GET)
	public void getPermissions(@PathVariable String componentCode, @PathVariable String url, @PathVariable String roleId,Model model) throws Exception {
		ResultObject<String> result = null;
		Map<String, Object> condition = new HashMap<String, Object>();
		try {
			condition.put("componentCode", componentCode);
			condition.put("link",StringUtil.removeDuplicate(url.replace("_","/"),'/'));
			condition.put("roleId", roleId);
			int count = this.sysRRRSService.getPermissions(condition);
			result = new ResultObject<String>(1,count==1?"y":"n", "webgate.getPermissions.success");
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResultObject<String>(2, e.getMessage());
		}
		model.addAttribute("target",result);
	}
	
	/**
	 * 获取功能权限信息
	 * 当在 某个资源路径上，配置页面，并 配置对应的功能，最后并赋予某角色 对此 功能有权限查看。
	 * 则返回值不为空。
	 * @param componentCode
	 * @param url
	 * @param roleId
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/getFunctions/{componentCode}/{url}/{roleId}", method = RequestMethod.GET)
	public void getFunctions(@PathVariable String componentCode, @PathVariable String url, @PathVariable String roleId,Model model) throws Exception {

		ResultObject<Map<String,String>> result = null;
		Map<String, Object> condition = new HashMap<String, Object>();
		Map<String,String> map = new HashMap<String,String>();
		try {
			condition.put("componentCode", componentCode);
			condition.put("url", url.replace("_","/"));
			condition.put("roleId", roleId);
			
			map = sysRFRSService.getFunctionMap(condition);
			
//			List<SysRoleFunctionRelationship> list = sysRFRSService.getRoleFunctionRelationshipListByConditionAll(condition);
//			for(SysRoleFunctionRelationship obj : list){
//				SysFunction function = sysFunctionService.getFunctionById(obj.getFunctionId());
//				SysPage page = sysPageService.findById(function.getPageId());
//				SysResource resource = sysResourceService.findById(page.getResourceId());
//				SysComponent component = sysComponentService.getComponentById(resource.getComponentId());
//				map.put("/"+component.getCode()+	//组件编号 
//							page.getPath()+			//页面
//							((page.getSpecial()!=null&&!"".equals(page.getSpecial()))//当页面特殊标识不为空  true:false
//							//不为空，加特殊标识；为空，加空字符串	页面特殊标识 默认为空
//							?("#"+page.getSpecial()):"") 				
//							+ "#"+function.getCode()//功能编码  功能编码意思：页面路径上的，增删改查
//							,
//							"true");
////				map.put("/组件编码+页面地址+ # + 功能编码","true");
//			}
			result = new ResultObject<Map<String,String>>(1,map, "webgate.getFunctions.success");
		} catch (Exception e) {
			result = new ResultObject<Map<String,String>>(2, e.getMessage());
		}
		model.addAttribute("target",result);
	}
	
	/**
	 * 获取所有角色信息
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/getRoles", method = RequestMethod.GET)
	public void getRoles(Model model)throws Exception {
		ResultObject<Map<String,String>> result = null;
		Map<String, Object> condition = new HashMap<String, Object>();
		Map<String,String> map = new HashMap<String,String>();
		try {
			List<SysRole> list = this.sysRoleService.findListByCondition(condition);
			for(SysRole obj : list){
				map.put(obj.getId(),obj.getName());
			}
			result = new ResultObject<Map<String,String>>(1,map, "webgate.getRoles.success");
		} catch (Exception e) {
			result = new ResultObject<Map<String,String>>(2, e.getMessage());
		}
		model.addAttribute("target",result);
	}
	
	/**
	 * 获取账户角色
	 * @param model
	 * @throws Exception
	 * Creator:ruixue.cheng
	 * LastEditor:
	 * LastDate:27 Oct 2016
	 */
	@RequestMapping(value = "/getAccountRoles/{empId}", method = RequestMethod.GET)
	@ResponseBody
	public ResultObject<SysRole> getAccountRoles(@PathVariable String empId,Model model)throws Exception {
		ResultObject<SysRole> result = null;
		Map<String, Object> condition = new HashMap<String, Object>();
		try {
			if (Strings.isNullOrEmpty(empId)||"0".equals(empId)) {
				result = new ResultObject<SysRole>(2, "Rest.Get.Account.Role.Fail");// "获取用户角色信息失败！");
			} else {
				condition.put("empId", empId);
				List<SysRole> list = this.sysRoleService.findListByCondition(condition);
				if(list!=null&&!list.isEmpty()){
					ObjectUtil<SysRole> util = new ObjectUtil<SysRole>();
					for(int i = 0;i<list.size();i++){
						util.setNull(list.get(i), new String[] { Set.class.getName(), List.class.getName() });
					}
				}
				result = new ResultObject<SysRole>(1,list, "Rest.Get.Account.Role.Success");
			}
		} catch (Exception e) {
			result = new ResultObject<SysRole>(2, e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> pay() throws Exception {
		Map<String,Object> result = null;
		result = new HashMap<String,Object>();
		//"ret":0,"msg":"OK"
		result.put("ret", 0);
		result.put("msg","OK");
		return result;
	}

}
