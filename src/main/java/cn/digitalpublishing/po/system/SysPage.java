package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_页面
 * @see SYS_PAGE
 */
@SuppressWarnings("serial")
public class SysPage implements Serializable {
	
	private String id;//页面ID
	
	private String name;//页面名称
	
	private String code;//页面编号
	
	private String path;//页面路径
	
	private String special;//特殊标识 用于相同页面路径标识
	
	private String resourceId;//资源ID
	
	private String resourceName;//资源名称
	
	private SysResource resource;//资源
	
//	private Set<SysFunction> functionSet;//功能集合

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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public SysResource getResource() {
		return resource;
	}

	public void setResource(SysResource resource) {
		this.resource = resource;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	
}