package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_系统信息
 * @see SYS_SYSTEM
 */
@SuppressWarnings("serial")
public class SysSystem implements Serializable {

	private String id;//系统ID
	
	private String name;//系统名称
	
	private String code;//系统编号
	
	private Integer status;//系统状态 1-在用 2-停用 3-废弃
	
//	private Set<SysRole> roleSet;//角色集合
//	
//	private Set<SysComponent> componentSet;//组件集合
//	
//	private Set<SysResource> resourceSet;//资源集合

	public String getId() {
		return id;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}