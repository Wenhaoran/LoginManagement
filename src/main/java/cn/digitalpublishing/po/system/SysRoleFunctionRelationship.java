package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_角色和功能关系
 * @see SYS_RF_RELATIONSHIP
 */
@SuppressWarnings("serial")
public class SysRoleFunctionRelationship implements Serializable {
	
	private String id;//角色和功能ID
	
	private String roleId;//角色ID
	
	private String functionId;//功能ID
	
	private SysRole role;//角色
	
	private SysFunction function;//功能

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

	public String getFunctionId() {
		return functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public SysRole getRole() {
		return role;
	}

	public void setRole(SysRole role) {
		this.role = role;
	}

	public SysFunction getFunction() {
		return function;
	}

	public void setFunction(SysFunction function) {
		this.function = function;
	}

}