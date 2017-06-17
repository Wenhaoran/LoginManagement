package cn.digitalpublishing.springmvc.form.system;

import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class RoleForm extends DataTableForm<SysRole> {
	
	private String[] ids;//角色 管理 其他 列表集合 or 其他 关联 角色 
	
	/**
	 * 角色对象
	 */
	private SysRole obj = new SysRole();
	
	private String accountId;//账户ID
	
	private String resourceId;//账户ID
	
	private String functionId;//账户ID
	
	private Integer status;//状态
	
	private String systemId;//系统ID
	
	private String name;//名称
	
	public String getFunctionId() {
		return functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	public SysRole getObj() {
		return obj;
	}
	
	public void setObj(SysRole obj) {
		this.obj = obj;
	}
	
	
}
