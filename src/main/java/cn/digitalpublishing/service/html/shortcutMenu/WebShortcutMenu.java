package cn.digitalpublishing.service.html.shortcutMenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.digitalpublishing.base.bean.MenuHtmlList;
import cn.digitalpublishing.base.bean.MenuResourceList;
import cn.digitalpublishing.po.system.SysResource;

public class WebShortcutMenu {

	public String getMenuList(HttpServletRequest request) {
		String ticket = (String) request.getSession().getAttribute("ticket");
		if(!"".equals(ticket)&&ticket!=null){
			List<SysResource> resourceList = MenuResourceList.get(ticket);
			if("".equals(MenuHtmlList.get(ticket))||MenuHtmlList.get(ticket) == null){
				String html = createMenuHtml(resourceList,ticket);
				MenuHtmlList.put(ticket, html);
				return html;
			}else{
				return MenuHtmlList.get(ticket);
			}
		}
		return "";
	}
	
	public String createMenuHtml(List<SysResource> resourceList,String ticket){
		StringBuffer sb = new StringBuffer();
		
		Map<String, SysResource> menuList = new HashMap<String, SysResource>();
		Map<String, SysResource> resourceData = new HashMap<String, SysResource>();
		
		if (resourceList != null) {
			for (int i = 0; i < resourceList.size(); i++) {
				SysResource resource = resourceList.get(i);
				menuList.put(resource.getId(), resource);
			}
		}
		
		if (resourceList != null) {
			for (int i = 0; i < resourceList.size(); i++) {
				SysResource resource = resourceList.get(i);
				//判断，是否属于根节点
				if (resource.getParentResourceId() == null || resource.getParentResourceId() == "") {
					//属于根节点
					//根节点集合，存值
					resourceData.put(resource.getId(), resource);
					
				}else{
					//不是根节点
					
//					SysResource parentResource = resourceData.get(resource.getParentResourceId());

					//判断当前 路径 的 父节点，是不是根节点。 
//					if (parentResource != null) {
//						if(parentResource.getChild() == null){
//							 List<SysResource> list = new ArrayList<SysResource>();
//							 parentResource.setChild(list);
//						 }
//						parentResource.getChild().add(resource);
//						
//					}else{
						SysResource parentResource2 = menuList.get(resource.getParentResourceId());
						 if(parentResource2.getChild() == null){
							 List<SysResource> list = new ArrayList<SysResource>();
							 parentResource2.setChild(list);
						 }
						parentResource2.getChild().add(resource);
//					}
				}
			}
		}
		resourceData.get("");
		
		if(resourceData.size() > 0){
			sb = createMenuListParent(resourceData,sb,ticket);
		}else{
			sb.append("<li iconCls=\"\">");
			sb.append("<span>无权限</span> ");
			sb.append("<ul>");
			sb.append("");
			sb.append("</ul>");
			sb.append("</li>");   
		}
		
		
		return sb.toString();
	}
	
	public StringBuffer createMenuListParent(Map<String, SysResource> resourceData,StringBuffer sb,String ticket){
		
		
		for (Map.Entry<String, SysResource> entry : resourceData.entrySet()) {  
			List<SysResource> list = entry.getValue().getChild();
			if(list!=null && entry.getValue().getChild().size()>0){
				sb.append("");
				sb.append("<li>");
				sb.append("<span>" + entry.getValue().getName() + "</span>");
				sb.append("<ul>");
				List<SysResource> childrenList = entry.getValue().getChild();
				for(SysResource  rs: childrenList){
					createMenuListChild(rs,sb,ticket);
				}
				sb.append("");
				sb.append("</ul>");
				sb.append("</li>");
			}else{
				sb.append("<li>");
				String url = assemblyUrl(entry.getValue().getLink(), ticket);
				sb.append("");
				sb.append("<a href='###' onclick='openContent(\""+ entry.getValue().getName() +"\", \""+ url +"\")'>");
				sb.append("<span style='cursor:pointer;'>" + entry.getValue().getName() + "</span>");
				sb.append("</a>");
				sb.append("");
				sb.append("");
				sb.append("</li>");
			}
			
			
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
		  
		}
		return sb;
	}
	
	
	public StringBuffer createMenuListChild(SysResource resourceData,StringBuffer sb,String ticket){
		if(resourceData.getChild() !=null && resourceData.getChild().size() > 0){
			sb.append("");
			sb.append("<li>");
			sb.append("<span>" + resourceData.getName() + "</span>");
			sb.append("<ul>");
			for(SysResource child: resourceData.getChild()){
				createMenuListChild(child,sb,ticket);
			}
			sb.append("");
			sb.append("</ul>");
			sb.append("</li>");
		}else{
			sb.append("");
			sb.append("<li>");
			String url = assemblyUrl(resourceData.getLink(), ticket);
			sb.append("");
			sb.append("<a href='###' onclick='openContent(\""+ resourceData.getName() +"\", \""+ url +"\")'>");
			sb.append("<span style='cursor:pointer;'>" + resourceData.getName() + "</span>");
			sb.append("</a>");
			sb.append("");
			sb.append("");
			sb.append("</li>");
		}
		return sb;
	}


	public String assemblyUrl(String url,String ticket){
		
//		if (resource.link == null || resource.link == "") {
//			return null;
//		}
//		var url = [];
//		if (resource.full == 1) { // 是否全路径 1-否 2-是
//			url.push("http://");
//			url.push(resource.component.address);
//			url.push(":");
//			url.push(resource.component.port);
//			url.push("/");
//			url.push(resource.component.code);
//		}
//		url.push(resource.link);
//		url.push("?ticket=" + ticket);
//		url.push("&pt_rtype=m");
//		
//		return url.join("");
		return url;
	}
}
/*
 * function createMenuListParent(resourceData,html,ticket){
	
}

function createMenuListChild(resourceData,html,ticket){
	
}


function getMenuList(roleId, sysId, ticket) {
	$.ajax({
		"dataType" : 'json',
		"type" : 'POST',
		"url" : basePath + '/pages/frame/getResourceZTreeByRoleId',
		"data" : {
			'sysId' : sysId,
			'roleId' : roleId
		},
		"async" :true,
		"success" : function(response) {
			if (response.isSuccess == "true") {
				var html = [];
				var resourceData = new Map();
				var resourceListData = new Map();
				var resourceList = response.aaData;
				if (resourceList != null) {
					for (var i = 0; i < resourceList.length; i++) {
						var resource = resourceList[i];
						resourceListData.set(resource.id, resource);
					}
				}
				if (resourceList != null) {
					for (var i = 0; i < resourceList.length; i++) {
						var resource = resourceList[i];
						
						if (resource.parentResourceId == null || resource.parentResourceId == "") {
							if(resource.children === undefined || resource.children == 0){
								resource.children = [];
							}
							resourceData.set(resource.id, resource);
						}else{
							var parentResource = resourceData.get(resource.parentResourceId);
							if (parentResource != null) {
								parentResource.children.push(resource);
							}else{
								var parentResource2 = resourceListData.get(resource.parentResourceId);
								if(parentResource2.children === undefined || parentResource2.children.length == 0){
									parentResource2.children = [];
								}
								 
								parentResource2.children.push(resource);
							}
						}
					}
				}
				if(resourceData.size > 0){
					createMenuListParent(resourceData,html,ticket);
				}else{
					html.push("<li iconCls=\"\">");
					html.push("<span>无权限</span> ");
					html.push("<ul>");
					html.push("");
					html.push("</ul>");
					html.push("</li>");   
				}
				
				var defaultResourceName = null;
				var defaultResourceUrl = null;
				//var resources = resourceData.values();
				
				$("#dtree").html(html.join(""));
				console.log(html.join(""));
				//addFrameTab(defaultResourceName, defaultResourceUrl);
			} else {
				alertMsg('alertModal', 'alertMsg', response.msg);
				window.location.href = basePath + response.url;
			}
		},
		"error" : function(response) {
			window.location.href = basePath ;
		}
	});
}
 * */
 