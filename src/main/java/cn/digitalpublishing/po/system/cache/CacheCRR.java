package cn.digitalpublishing.po.system.cache;

import java.io.Serializable;

/**
 * @since 1.0			2.0
 * @author Liu Ben		HaoRan.Wen
 * @see 01_账户信息
 * @see SYS_ACCOUNT
 */
@SuppressWarnings("serial")
public class CacheCRR implements Serializable {
	
	private String id;
	
	private String componentCode;//组件code
	private String resourceLink;//资源link
	private String roleId;//角色ID
	
	private String key;//缓存的key

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComponentCode() {
		return componentCode;
	}

	public void setComponentCode(String componentCode) {
		this.componentCode = componentCode;
	}

	public String getResourceLink() {
		return resourceLink;
	}

	public void setResourceLink(String resourceLink) {
		this.resourceLink = resourceLink;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	

}