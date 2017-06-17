package cn.digitalpublishing.po.system;

import java.io.Serializable;
import java.sql.Date;

/**
 * @since 1.0			2.0
 * @author Liu Ben		HaoRan.Wen
 * @see 01_账户信息
 * @see SYS_ACCOUNT
 */
@SuppressWarnings("serial")
public class SysAccount implements Serializable {
	
	private String id;
	
	private String name;//名称
	private String pass;//账户密码
	
	private Date inserttime;//创建时间

	private Integer encryption;//加密 1-不加密 2-加密
	private String employeeId;//员工Id
	private String employeeName;//员工名称
	
	private Integer type;//账户类型 1-本地账户 2-Sina账户
	private Integer level;//账户级别 1-超级用户（不能维护不能删除） 2-普通用户（可维护可删除）
	private Integer status;//账户状态 1-在用 2-停用
	

	/**
	 * @see V0.1 hibernate 关联关系 
	 * @return
	 */
//	private String ssoAccount;//单点登录OA账户
//	private Set<SysAccountModuleRelationship> accountModuleRelationshipSet;//账户和模块关系集合	
//	private Set<SysRoleAccountRelationship> roleAccountRelationshipSet;//角色和账户关系集合

	public String getId() {
		return id;
	}

	public Date getInserttime() {
		return inserttime;
	}

	public void setInserttime(Date inserttime) {
		this.inserttime = inserttime;
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getEncryption() {
		return encryption;
	}

	public void setEncryption(Integer encryption) {
		this.encryption = encryption;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

}