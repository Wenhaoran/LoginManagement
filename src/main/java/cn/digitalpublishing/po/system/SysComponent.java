package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_系统组件	组件，就是在webgate 中配置管理的项目。
 * @see SYS_COMPONENT
 */
@SuppressWarnings("serial")
public class SysComponent implements Serializable {
	
	private String id;//组件ID
	
	private String name;//组件名称
	
	private String code;//组件编号
	
	private String address;//组件地址 项目部署地址 example:127.0.0.1
	
	private String port;//组件端口	项目运行端口 example:8080
	
	private Integer status;//组件状态 1-有效 2-无效
	
	private String systemId;//当前组件所属系统 ID
	
	private String systemName;//当前组件所属系统 名称

	private String deployCode;//部署编号
	
//	private SysSystem system;//当前组件所属系统
	
//	private Set<SysResource> resourceSet;//资源集合
//	
//	private Set<SysModule> modules;//模块信息

	public String getId() {
		return id;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDeployCode() {
		return deployCode;
	}

	public void setDeployCode(String deployCode) {
		this.deployCode = deployCode;
	}
	
}