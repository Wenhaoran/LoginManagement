package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_功能	功能：配置 按钮权限使用
 * @see SYS_FUNCTION
 */

@SuppressWarnings("serial")
public class SysFunction implements Serializable {

	private String id;//功能ID
	
	private String name;//功能名称
	
	private String code;//功能编号
	
	private String path;//功能路径
	
	private String pageId;//页面 ID 
	
	private String pageName;//页面名称
	
	private SysPage page;//页面
//	
//	private Set<SysRoleFunctionRelationship> roleFunctionRelationshipSet;//角色和功能关系集合
	
	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

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

	public SysPage getPage() {
		return page;
	}

	public void setPage(SysPage page) {
		this.page = page;
	}

}