package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_角色和资源关系
 * @see SYS_RR_RELATIONSHIP
 */
@SuppressWarnings("serial")
public class SysRoleResourceRelationship implements Serializable {
	
	private String id;//角色和资源ID
	
	private String roleId;//角色ID 
	
	private String resourceId;//资源ID
	
//	private SysRole role;//角色
//	
//	private SysResource resource;//资源

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
}