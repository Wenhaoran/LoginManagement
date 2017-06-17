package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_角色和账户关系
 * @see SYS_RA_RELATIONSHIP
 */
@SuppressWarnings("serial")
public class SysRoleAccountRelationship implements Serializable {
	
	private String id;//角色和账户ID
	
	private String roleId;//角色ID
	
	private String accountId;//账户ID
	
//	private SysRole role;//角色
//	
//	private SysAccount account;//账户

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

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

}