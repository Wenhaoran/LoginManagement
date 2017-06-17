package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_角色
 * @see SYS_ROLE
 */
public class SysRole implements Serializable {
	
	private static final long serialVersionUID = -4441962402147038181L;

	private String id;//角色ID
	
	private String name;//角色名称
	
	private String desc;//角色描述

	private Integer status;//角色状态 1-在用 2-停用（角色状态决定 用户状态）
	
//	private Integer accountChooseType=0;//用于在页面account的checkbox选中的

//	private Integer resourceChooseType=0;//用于在页面resource的checkbox选中的

	private String systemId;//系统ID
	
	private String systemName;//系统名称
	
//	private SysSystem system;//系统
//	
//	private Set<SysRoleResourceRelationship> roleResourceRelationshipSet;//角色和资源关系集合
//	
//	private Set<SysRoleFunctionRelationship> roleFunctionRelationshipSet;//角色和功能关系集合
//	
//	private Set<SysRoleAccountRelationship> roleAccountRelationshipSet;//角色和账户关系集合

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
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

//	public Integer getAccountChooseType() {
//		return accountChooseType;
//	}
//
//	public void setAccountChooseType(Integer accountChooseType) {
//		this.accountChooseType = accountChooseType;
//	}
//
//	public Integer getResourceChooseType() {
//		return resourceChooseType;
//	}
//
//	public void setResourceChooseType(Integer resourceChooseType) {
//		this.resourceChooseType = resourceChooseType;
//	}
	
}