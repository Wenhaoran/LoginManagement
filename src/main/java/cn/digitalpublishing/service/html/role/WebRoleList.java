package cn.digitalpublishing.service.html.role;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.digitalpublishing.base.bean.RoleHtmlList;
import cn.digitalpublishing.base.bean.RoleListByAccount;
import cn.digitalpublishing.po.system.SysRole;

import com.google.common.base.Strings;

public class WebRoleList {

	public String getRoleList(HttpServletRequest request) {
		String ticket = (String) request.getSession().getAttribute("ticket");
		SysRole role = (SysRole) request.getSession().getAttribute("ccsfw_role");
		String nowName = "";
		if(role !=null ){
			nowName = role.getName();
		}
		
		if(!"".equals(ticket)&&ticket!=null){
			List<SysRole> roleList = RoleListByAccount.get(ticket);
			if(roleList!=null&&roleList.size()>0){
				if("".equals(RoleHtmlList.get(ticket))||RoleHtmlList.get(ticket) == null){
					String html = createRoleHtml(roleList,nowName);
					RoleHtmlList.put(ticket, html);
					return html;
				}else{
					return RoleHtmlList.get(ticket);
				}
			}
		}
		return "";
		
	}
	
	public String createRoleHtml(List<SysRole> roleList,String nowName){
		StringBuffer sb = new StringBuffer();
		
		sb.append("<div>其他角色</div>");
		sb.append("<div class=\"menu-sep\"></div>");
		for (SysRole role : roleList) {
			sb.append("<div data-options=\"id:'"+role.getId()+"'\">"+role.getName()+"</div>");
		}
		
		if(!Strings.isNullOrEmpty(nowName)){
			sb.append("<div class=\"menu-sep\"></div>");
			sb.append("<div>当前角色：<b style=\"color: red;\">"+nowName+"</b></div>");
		}

		return sb.toString();
	}
	/* <div>其他角色</div>   
	<div class="menu-sep"></div>
    <div data-options="name:'new'">editorial</div>   
    <div>管理员</div>
    <div>主任</div>   
    <div>印刷厂厂长</div>   
    <div>admin</div>   
    <div class="menu-sep"></div>   
    <div>当前角色：</div> */
	
}

 