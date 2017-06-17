package cn.digitalpublishing.springmvc.form.system;

import java.util.ArrayList;
import java.util.List;

import cn.digitalpublishing.po.system.SysPage;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class PageForm extends DataTableForm<SysPage> {
	
	/**
	 * 资源列表
	 */
	private List<SysResource> resourceList = new ArrayList<SysResource>();
	
	/**
	 * 页面对象
	 */
	private SysPage obj = new SysPage();
	
	/**
	 * 页面名称
	 */
	private String name;
	
	/**
	 * 页面编码
	 */
	private String code;
	
	/**
	 * 页面路径
	 */
	private String path;
	
	/**
	 * 资源ID
	 */
	private String resourceId;
	
	private String pageId;

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public SysPage getObj() {
		return obj;
	}

	public void setObj(SysPage obj) {
		this.obj = obj;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.getCondition().put("name", name);
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.getCondition().put("code", code);
		this.code = code;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.getCondition().put("resourceId", resourceId);
		this.resourceId = resourceId;
	}

	public List<SysResource> getResourceList() {
		return resourceList;
	}

	public void setResourceList(List<SysResource> resourceList) {
		this.resourceList = resourceList;
	}

}
