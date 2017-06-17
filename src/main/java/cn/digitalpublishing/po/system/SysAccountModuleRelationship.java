package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_账户和模块关系
 * @see SYS_AM_RELATIONSHIP
 */
@SuppressWarnings("serial")
public class SysAccountModuleRelationship implements Serializable {
	
	private String id;//账户和模块ID
	
	private Integer location;//位置
	
	private Integer move;//是否可以移动 1-可以 2-不可以
	
	private String accountId; //账户
	
	private String moduleId; //模块
	
	
//	private SysAccount account;//账户
//	
//	private SysModule module;//模块

	public String getId() {
		return id;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getLocation() {
		return location;
	}

	public void setLocation(Integer location) {
		this.location = location;
	}

	public Integer getMove() {
		return move;
	}

	public void setMove(Integer move) {
		this.move = move;
	}
	
}