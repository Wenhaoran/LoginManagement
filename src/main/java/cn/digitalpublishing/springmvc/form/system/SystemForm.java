package cn.digitalpublishing.springmvc.form.system;

import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class SystemForm extends DataTableForm<SysSystem> {
	
	
	/**
	 * 系统对象
	 */
	private SysSystem obj = new SysSystem();
	
	/**
	 * 系统名称
	 */
	private String name;
	
	/**
	 * 系统编码
	 */
	private String code;
	
	/**
	 * 系统状态
	 */
	private Integer status;

	public SysSystem getObj() {
		return obj;
	}

	public void setObj(SysSystem obj) {
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.getCondition().put("status", status);
		this.status = status;
	}

}
