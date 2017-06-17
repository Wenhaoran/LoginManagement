package design.digitalpublishing.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.controller.BaseController;
import cn.digitalpublishing.springmvc.form.system.SystemForm;
import cn.digitalpublishing.util.exception.WebgateException;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

@Controller
@RequestMapping("/pages/system")
public class SystemController extends BaseController {

	@RequestMapping(value = "/form/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response, SystemForm form) throws Exception {
		String forwardString = "sys/system/list";
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			form.setIsSuccess(SUCCESS);
		} catch (Exception e) {
			form.setIsSuccess(FAILURE);
			form.setMsg((e instanceof WebgateException) ? ((WebgateException) e)
					.getMessage() : e.getMessage());
		}
		model.put("form", form);
		return new ModelAndView(forwardString, model);
	}

	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(HttpServletRequest request, SysSystem system,Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		try {
			Map<String, Object> condition = new HashMap<String, Object>();
			
			//查询条件： 系统编号，系统名称，系统状态
			if(!Strings.isNullOrEmpty(system.getCode())){
				condition.put("code", system.getCode());
			}
			if(!Strings.isNullOrEmpty(system.getName())){
				condition.put("name", system.getName());
			}
			if(system.getStatus()!=null){
				condition.put("status", system.getStatus());
			}
			
			pageInfo.setCondition(condition);
			sysSystemService.findDataGrid(pageInfo);
//			DicCache.match(pageInfo.getRows(), "DATA_STATUS:areaStatus");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询列表出现异常，", e);
		}
		return pageInfo;
	}
	
	/**
	 * @see 
	 * @param request
	 * @param system
	 * @return add 页面 
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
    public ModelAndView addPage(HttpServletRequest request, SysSystem system) throws Exception {
    	String forward = "sys/system/add";
    	Map<String, Object> model = new HashMap<String, Object>();
    	try{
    		
    	} catch(Exception e) {
    		logger.error("跳转添加页面出现异常，",e);
    		e.printStackTrace();
    	}
    	return new ModelAndView(forward, model);
    }

	
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(SysSystem system) throws Exception {
    	try {
    		sysSystemService.insertSystem(system);
   		} catch(Exception e) {
			logger.error("添加出现异常，",e);
			e.printStackTrace();
		}
        return renderSuccess("添加成功！");
    }
    
    @RequestMapping("/editPage")
    public ModelAndView editPage(HttpServletRequest request, SysSystem sysSystem) throws Exception {
    	String forward = "sys/system/edit";
    	Map<String, Object> model = new HashMap<String, Object>();
    	try {
    		String id = request.getParameter("id");
    		sysSystem = sysSystemService.findById(id);
        	model.put("system", sysSystem);
        } catch(Exception e) {
			logger.error("跳转编辑页面出现异常，",e);
		}
        return new ModelAndView(forward, model);
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(SysSystem system) throws Exception {
    	try {
    		sysSystemService.changeStatus(system);
   		} catch(Exception e) {
			logger.error("添加出现异常，",e);
			e.printStackTrace();
		}
        return renderSuccess("添加成功！");
    }
}