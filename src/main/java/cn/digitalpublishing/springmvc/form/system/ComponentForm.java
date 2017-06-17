package cn.digitalpublishing.springmvc.form.system;

import java.util.ArrayList;
import java.util.List;

import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class ComponentForm extends DataTableForm<SysComponent> {
	
	/**
	 * 可用系统列表
	 */
	private List<SysSystem> systemList = new ArrayList<SysSystem>();
	
	/**
	 * 组件对象
	 */
	private SysComponent obj = new SysComponent();
	
	/**
	 * 组件编码
	 */
	private String code;
	
	/**
	 * 组件名称
	 */
	private String name;
	
	/**
	 * 组件地址
	 */
	private String address;
	
	/**
	 * 组件端口
	 */
	private String port;
	
	/**
	 * 组件状态 1-有效 2-无效
	 */
	private Integer status;
	
	/**
	 * 系统ID
	 */
	private String sysId;

	public SysComponent getObj() {
		return obj;
	}

	public void setObj(SysComponent obj) {
		this.obj = obj;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.getCondition().put("status", status);
		this.status = status;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.getCondition().put("address", address);
		this.address = address;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.getCondition().put("port", port);
		this.port = port;
	}

	public List<SysSystem> getSystemList() {
		return systemList;
	}

	public void setSystemList(List<SysSystem> systemList) {
		this.systemList = systemList;
	}

	public String getSysId() {
		return sysId;
	}

	public void setSysId(String sysId) {
		this.getCondition().put("sysId", sysId);
		this.sysId = sysId;
	}

}
