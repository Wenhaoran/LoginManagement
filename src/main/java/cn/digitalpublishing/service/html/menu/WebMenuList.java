package cn.digitalpublishing.service.html.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.digitalpublishing.base.bean.MenuHtmlList;
import cn.digitalpublishing.base.bean.MenuResourceList;
import cn.digitalpublishing.po.system.SysResource;

/**
 * 
 * @author Administrator
 *	菜单html
 */
public class WebMenuList {
	
	public String getMenuList(HttpServletRequest request) {
		String ticket = (String) request.getSession().getAttribute("ticket");
		if(!"".equals(ticket)&&ticket!=null){
			List<SysResource> resourceList = MenuResourceList.get(ticket);
			if(resourceList!=null&&resourceList.size()>0){
				if("".equals(MenuHtmlList.get(ticket))||MenuHtmlList.get(ticket) == null){
					String html = createMenuHtml(resourceList,ticket);
					MenuHtmlList.put(ticket, html);
					return html;
				}else{
					return MenuHtmlList.get(ticket);
				}
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
						if(parentResource2 != null){
							if(parentResource2.getChild() == null){
								 List<SysResource> list = new ArrayList<SysResource>();
								 parentResource2.setChild(list);
							 }
							parentResource2.getChild().add(resource);
						}
						 
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
				String url = assemblyUrl(entry.getValue(), ticket);
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
			String url = assemblyUrl(resourceData, ticket);
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

	public String assemblyUrl(SysResource resource,String ticket){
		
		if (resource.getLink() == null || resource.getLink() == "") {
			return null;
		}
		StringBuffer url = new StringBuffer();
		if (resource.getFull() == 1) { // 是否全路径 1-否 2-是
			url.append("http://");
			url.append(resource.getComponent().getAddress());
			url.append(":");
			url.append(resource.getComponent().getPort());
			url.append("/");
			url.append(resource.getComponent().getCode());
		}
		url.append(resource.getLink());
		url.append("?ticket=" + ticket);
		url.append("&pt_rtype=m");
		
		return url.toString();
	}
}

 