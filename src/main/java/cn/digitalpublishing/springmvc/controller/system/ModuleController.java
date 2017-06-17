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

import cn.digitalpublishing.po.system.SysAccountModuleRelationship;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.ModuleForm;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

@Controller
@RequestMapping("/pages/module")
public class ModuleController extends BaseController {

	@RequestMapping(value = "/form/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModuleForm form) throws Exception {
		String forwardString = "sys/module/list";
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
	public Object dataGrid(HttpServletRequest request, SysModule module,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();

			// 查询条件：模块名称，是否必须
			if (!Strings.isNullOrEmpty(module.getName())) {
				condition.put("name", module.getName());
			}

			pageInfo.setCondition(condition);
			sysModuleService.findDataGrid(pageInfo);
			// DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, SysModule module)
			throws Exception {
		String forward = "sys/module/add";
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
	public Object add(SysModule module) throws Exception {
		try {
			//创建新的模块
			sysModuleService.insertModule(module);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping("/editPage")
	public ModelAndView editPage(HttpServletRequest request, SysModule module)
			throws Exception {
		String forward = "sys/module/edit";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			module = sysModuleService.getModuleById(id);
			model.put("module", module);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("跳转编辑页面出现异常，", e);
		}
		return new ModelAndView(forward, model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Object edit(SysModule module) throws Exception {
		try {
			sysModuleService.updateModule(module);
		} catch (Exception e) {
			logger.error("添加出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("添加成功！");
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Object delete(SysModule module) throws Exception {
		try {
			String moduleId = module.getId();
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("moduleId", moduleId);
			List<SysAccountModuleRelationship> ralist = sysAMRSService.getAccountModuleRelationshipListByCondition(condition);
			if(ralist.size()>0){
				return renderError("当前 模块 已关联 账户，请解除关联后 删除该账户。");
			}
			
			sysModuleService.deleteModuleById(moduleId);
		} catch (Exception e) {
			logger.error("删除出现异常，", e);
			e.printStackTrace();
		}
		return renderSuccess("删除成功！");
	}
}