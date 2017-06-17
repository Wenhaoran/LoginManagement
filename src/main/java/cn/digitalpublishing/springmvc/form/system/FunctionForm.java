package cn.digitalpublishing.springmvc.form.system;

import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class FunctionForm extends DataTableForm<SysFunction> {
	
	/**
	 * 功能对象
	 */
	private SysFunction obj = new SysFunction();
	
	/**
	 * 功能名称
	 */
	private String name;
	
	/**
	 * 功能编码
	 */
	private String code;
	
	/**
	 * 功能路径
	 */
	private String path;
	
	/**
	 * 页面ID
	 */
	private String pageId;
	
	/**
	 * 当前页面所有ID
	 */
	private String roleId;
	
	private String[] ids;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	public SysFunction getObj() {
		return obj;
	}

	public void setObj(SysFunction obj) {
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

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.getCondition().put("pageId", pageId);
		this.pageId = pageId;
	}

}
