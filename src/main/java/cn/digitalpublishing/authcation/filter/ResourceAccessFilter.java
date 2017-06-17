package cn.digitalpublishing.authcation.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import cn.digitalpublishing.authcation.bean.ConstantsSession;
import cn.digitalpublishing.base.bean.SessionIdMap;

import com.google.common.base.Strings;

public class ResourceAccessFilter implements Filter{
	
	/**
	 * 登录链接
	 */
	private String webgateURL="http://127.0.0.1:8080/webgate";
	
	/**
	 * 获取资源权限信息
	 */
	private String resourceURL="/pages/rest/getPermissions";
	
	/**
	 * 获取功能权限信息
	 */
	private String functionURL="/pages/rest/getFunctions";
	
	/**
	 * 提示链接
	 */
	private String promptURL="/common/prompt";
	
	/**
	 * 功能权限Map
	 */
	private String functionMapName="functionMap";
	
	/**
	 * 禁止访问
	 */
	private final static String DENY_ACCESS="Global.DenyAccess";
	
	/**
	 * Session中票据变量名
	 */
	private String pt_ticket = "ticket";
	
	/**
	 * Session中账户信息中的角色变量名
	 */
	private String pt_role_id = "roleId";
	
	/**
	 * 提示消息变量名
	 */
	private String pt_msg = "pt_msg";
	
	/**
	 * 提示消息编号名
	 */
	private String pt_msg_code = "pt_msg_code";
	
	/**
	 * 不过滤的后缀
	 */
	private String noFilterSuffix = "xml,json,js,jpg,png,bmp,ico,jsp,xls,xlsx,doc";
	
	/**
	 * 资源过滤参数
	 */
	private String resourceFilterParam = "pt_rtype";
	
	/**
	 * 资源过滤类型
	 */
	private String resourceFilterType = "";
	

	public void destroy() {
		
	}

	public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse,FilterChain filterchain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletrequest;
		HttpSession session = request.getSession();
		HttpServletResponse response = (HttpServletResponse)servletresponse;
		/**1.请求URL 和 组件名 以便系统可以获取某一个组件下的请求的权限 —— Start **/
		String resource = request.getRequestURI();
		String component = request.getContextPath();
		resource = resource.replace(component,"");
		component = component.replace("/","");
		component = Strings.isNullOrEmpty(component)?ConstantsSession.DEFAULT_COMPONENT:component;
		
		/**1.请求URL 和 组件名 以便系统可以获取某一个组件下的请求的权限 —— End **/
		try{
			if(resource.lastIndexOf(".")>-1){
				String suffix = resource.substring(resource.lastIndexOf(".")+1);
				if(ResourceAccessConfig.getInstance().get("noFilterSuffix").indexOf(suffix)>=0){//noFilterSuffix
					filterchain.doFilter(servletrequest, servletresponse);
					return;
				}
			}
			String roleId = "";
			String ticket = "";
//			String ticketet = request.getParameter("ticket")!=null?request.getParameter("ticket").toString():session.getAttribute("pt_ticket")!=null?session.getAttribute("pt_ticket").toString():null;
//			if(ticketet!=null){
//				ticket = ticketet;
//			}
			if(session.getAttribute(ResourceAccessConfig.getInstance().get("pt_ticket"))!=null){
				ticket = session.getAttribute(ResourceAccessConfig.getInstance().get("pt_ticket")).toString();
			}
			
			if(SessionIdMap.get(ticket)!=null){
				roleId = SessionIdMap.get(ticket).getRole().getId();
			}
			
			if("".equals(roleId)||"".equals(ticket)){
				filterchain.doFilter(servletrequest, servletresponse);
				return;
			}
			
			if(session.getAttribute(ResourceAccessConfig.getInstance().get("pt_role_id"))!=null&&!roleId.equals(session.getAttribute(ResourceAccessConfig.getInstance().get("pt_role_id")).toString())){
				session.removeAttribute(ResourceAccessConfig.getInstance().get("functionMapName"));
				session.removeAttribute("functionMapGroup");
			}
			
			session.setAttribute(ResourceAccessConfig.getInstance().get("pt_role_id"), roleId);
			
			if(isPermitted(component,resource,roleId)){//如果被允许访问
				//获取该请求下所有的function权限信息，并放入Session中
				if(ResourceAccessConfig.getInstance().get("resourceFilterParam")==null||	//false
						"".equals(ResourceAccessConfig.getInstance().get("resourceFilterParam"))||	//false
						request.getParameter(ResourceAccessConfig.getInstance().get("resourceFilterParam"))==null||	//
						ResourceAccessConfig.getInstance().get("resourceFilterType")==null||
						"".equals(ResourceAccessConfig.getInstance().get("resourceFilterType"))||
						!ResourceAccessConfig.getInstance().get("resourceFilterType").equals(request.getParameter(ResourceAccessConfig.getInstance().get("resourceFilterParam").toString()))){
					filterchain.doFilter(servletrequest, servletresponse);
					return;
				}
				
				//按钮权限 集合
				@SuppressWarnings("unchecked")
				Map<String,Map<String,String>> functionPermissionsGroup = session.getAttribute("functionMapGroup")==null?(new HashMap<String,Map<String,String>>()):(Map<String,Map<String,String>>)session.getAttribute("functionMapGroup");
				@SuppressWarnings("unchecked")
				Map<String,String> functionPermissions = session.getAttribute(ResourceAccessConfig.getInstance().get("functionMapName"))==null?(new HashMap<String,String>()):(Map<String,String>)session.getAttribute(ResourceAccessConfig.getInstance().get("functionMapName"));
				//请求 RestController获取权限集合
				functionPermissions = ResourceAccessTool.getFunctionPermission(component, resource, roleId,functionPermissions,functionPermissionsGroup);
				session.setAttribute(ResourceAccessConfig.getInstance().get("functionMapName"), functionPermissions);
				session.setAttribute("functionMapGroup",functionPermissionsGroup);
			}else{//如果被拒绝则返回405错误
				if(ResourceAccessConfig.getInstance().get("resourceFilterParam")==null||
						"".equals(ResourceAccessConfig.getInstance().get("resourceFilterParam"))||
						request.getParameter(ResourceAccessConfig.getInstance().get("resourceFilterParam"))==null||
						ResourceAccessConfig.getInstance().get("resourceFilterType")==null||
						"".equals(ResourceAccessConfig.getInstance().get("resourceFilterType"))||
						!ResourceAccessConfig.getInstance().get("resourceFilterType").equals(request.getParameter(ResourceAccessConfig.getInstance().get("resourceFilterParam").toString()))){
					filterchain.doFilter(servletrequest, servletresponse);
					return;
				}
	  			response.sendRedirect(ResourceAccessConfig.getInstance().get("promptURL")+"?"+ResourceAccessConfig.getInstance().get("pt_msg")+"="+DENY_ACCESS+"&"+ResourceAccessConfig.getInstance().get("pt_msg_code")+"=405");
	  			return;
			}
			filterchain.doFilter(servletrequest, servletresponse);
		}catch(Exception e){//如果出现异常则返回500错误
			e.printStackTrace();
			response.sendRedirect(ResourceAccessConfig.getInstance().get("promptURL")+"?"+ResourceAccessConfig.getInstance().get("pt_msg")+"="+e.getMessage()+"&"+ResourceAccessConfig.getInstance().get("pt_msg_code")+"=500");
  			return;
		}
	}

	public void init(FilterConfig filterconfig) throws ServletException {
		/***初始化访问URL***/
		if(filterconfig.getInitParameter ("webgateURL")!=null&&filterconfig.getInitParameter ("webgateURL").trim().length()>0)
			this.webgateURL = filterconfig.getInitParameter ("webgateURL");
		if(filterconfig.getInitParameter ("promptURL")!=null&&filterconfig.getInitParameter ("promptURL").trim().length()>0)
			this.promptURL = filterconfig.getInitParameter ("promptURL");
		if(filterconfig.getInitParameter ("resourceURL")!=null&&filterconfig.getInitParameter ("resourceURL").trim().length()>0)
			this.resourceURL = filterconfig.getInitParameter ("resourceURL");
		if(filterconfig.getInitParameter ("functionURL")!=null&&filterconfig.getInitParameter ("functionURL").trim().length()>0)
			this.functionURL = filterconfig.getInitParameter ("functionURL");
		
		/***初始化参数***/
		
		if(filterconfig.getInitParameter ("pt_ticket")!=null&&filterconfig.getInitParameter ("pt_ticket").trim().length()>0)
			this.pt_ticket = filterconfig.getInitParameter ("pt_ticket");
		
		if(filterconfig.getInitParameter ("pt_role_id")!=null&&filterconfig.getInitParameter ("pt_role_id").trim().length()>0)
			this.pt_role_id = filterconfig.getInitParameter ("pt_role_id");
		
		if(filterconfig.getInitParameter ("pt_msg")!=null&&filterconfig.getInitParameter ("pt_msg").trim().length()>0)
			this.pt_msg = filterconfig.getInitParameter ("pt_msg");
		
		if(filterconfig.getInitParameter ("pt_msg_code")!=null&&filterconfig.getInitParameter ("pt_msg_code").trim().length()>0)
			this.pt_msg_code = filterconfig.getInitParameter ("pt_msg_code");
		
		if(filterconfig.getInitParameter ("functionMapName")!=null&&filterconfig.getInitParameter ("functionMapName").trim().length()>0)
			this.functionMapName = filterconfig.getInitParameter ("functionMapName");
		
		if(filterconfig.getInitParameter ("noFilterSuffix")!=null&&filterconfig.getInitParameter ("noFilterSuffix").trim().length()>0)
			this.noFilterSuffix = filterconfig.getInitParameter ("noFilterSuffix");
		
		if(filterconfig.getInitParameter ("resourceFilterParam")!=null&&filterconfig.getInitParameter ("resourceFilterParam").trim().length()>0)
			this.resourceFilterParam = filterconfig.getInitParameter ("resourceFilterParam");
		
		if(filterconfig.getInitParameter ("resourceFilterType")!=null&&filterconfig.getInitParameter ("resourceFilterType").trim().length()>0)
			this.resourceFilterType = filterconfig.getInitParameter ("resourceFilterType");
		
		ResourceAccessConfig.getInstance().put("webgateURL", this.webgateURL);
		ResourceAccessConfig.getInstance().put("resourceURL", this.webgateURL+this.resourceURL);
		ResourceAccessConfig.getInstance().put("functionURL", this.webgateURL+this.functionURL);
		ResourceAccessConfig.getInstance().put("promptURL", this.webgateURL+this.promptURL);
		
		ResourceAccessConfig.getInstance().put("pt_ticket", this.pt_ticket);
		ResourceAccessConfig.getInstance().put("pt_role_id", this.pt_role_id);
		ResourceAccessConfig.getInstance().put("pt_msg", this.pt_msg);
		ResourceAccessConfig.getInstance().put("pt_msg_code", this.pt_msg_code);
		ResourceAccessConfig.getInstance().put("functionMapName", this.functionMapName);
		ResourceAccessConfig.getInstance().put("noFilterSuffix", this.noFilterSuffix);
		ResourceAccessConfig.getInstance().put("resourceFilterParam", this.resourceFilterParam);
		ResourceAccessConfig.getInstance().put("resourceFilterType", this.resourceFilterType);
		
	}
	
	private Boolean isPermitted(String component,String resource,String roleId)throws Exception{
		Boolean isPermitted = true;
		try{
			isPermitted=ResourceAccessTool.getResourcePermission(component,resource,roleId);
		}catch(Exception e){
			throw e;
		}
		return isPermitted;
	}

}
