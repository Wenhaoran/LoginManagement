package cn.digitalpublishing.springmvc.form.system;

import java.util.ArrayList;
import java.util.List;

import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class AccountForm extends DataTableForm<SysAccount> {
	
	private boolean changepwd;
	
	private String moduleId;
	
	private String[] ids;//账户ID 集合（根据角色ID 关联保存 使用）
	
	/**
	 * 角色列表
	 */
	private List<SysRole> roleList = new ArrayList<SysRole>();
	
	/**
	 * 角色id
	 */
	private String roleId;
	
	/**
	 * 系统id
	 */
	private String sysId;
	
	/**
	 * 账户id
	 */
	private String accountId;
	
	/**
	 * 验证码
	 */
	private String validateCode;
	
	/**
	 * 账户对象
	 */
	private SysAccount obj = new SysAccount();
	
	/**
	 * 账户名称
	 */
	private String username;
	
	/**
	 * 账户密码
	 */
	private String password;
	
	/**
	 * 账户状态 1-在用 2-停用
	 */
	private Integer status;
	
	/**
	 * 账户类型 1-本地账户 2-Sina账户
	 */
	private Integer type;
	/**
	 * 源密码
	 */
	private String origin_pass;
	/**
	 * 新密码
	 */
	private String new_pass;
	/**
	 * 确认密码
	 */
	private String confirm_pass;
	
	/**
	 * 账户级别 1-超级用户（不能维护不能删除） 2-普通用户（可维护可删除）
	 */
	private Integer level;

    /**
     * 记住我
     */
    private String remember;
    /**
     * SSO账户
     */
    private String ssoAccount;

	public boolean isChangepwd() {
		return changepwd;
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public void setChangepwd(boolean changepwd) {
		this.changepwd = changepwd;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	public SysAccount getObj() {
		return obj;
	}

	public void setObj(SysAccount obj) {
		this.obj = obj;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.getCondition().put("status", status);
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.getCondition().put("type", type);
		this.type = type;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.getCondition().put("level", level);
		this.level = level;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getSysId() {
		return sysId;
	}

	public void setSysId(String sysId) {
		this.sysId = sysId;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public List<SysRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<SysRole> roleList) {
		this.roleList = roleList;
	}

	public String getOrigin_pass() {
		return origin_pass;
	}

	public void setOrigin_pass(String origin_pass) {
		this.origin_pass = origin_pass;
	}

	public String getNew_pass() {
		return new_pass;
	}

	public void setNew_pass(String new_pass) {
		this.new_pass = new_pass;
	}

	public String getConfirm_pass() {
		return confirm_pass;
	}

	public void setConfirm_pass(String confirm_pass) {
		this.confirm_pass = confirm_pass;
	}

    public String getRemember() {
        return remember;
    }

    public void setRemember(String remember) {
        this.remember = remember;
    }

	public String getSsoAccount() {
		return ssoAccount;
	}

	public void setSsoAccount(String ssoAccount) {
		this.ssoAccount = ssoAccount;
	}
}
