package cn.digitalpublishing.po.system;

import java.io.Serializable;
import java.util.List;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_系统资源
 * @see SYS_RESOURCE
 */
@SuppressWarnings("serial")
public class SysResource implements Serializable {
	
	private String id;//资源ID
	private String name;//资源名称
	private String code;//资源编号
	private String link;//资源链接
	private Integer status;//资源状态 1-在用 2-停用（菜单状态 上级菜单 决定下级菜单的状态）
	private Integer leaf;//资源叶子节点 1-是 2-不是（只有叶子节点可以挂功能页面）
	private Integer order;//资源排序
	private Integer type;//资源类型 1-菜单 2-接口
	private String locale;//或计划参数
	private Integer full;//是否全路径 1-否 2-是
	
	private String systemId;//系统ID 
	private String systemName;//系统名称
	private String componentId;//组件ID 
	private String componentName;//组件名称
	
	private String parentResourceId;// 上级资源ID
	
	private SysSystem system;//系统
	private SysComponent component;//组件
	
	private List<SysResource> child ;
	
	private String icon;//资源图标
//	
//	private SysResource parentResource;//上级资源
//	
//	private Set<SysPage> pageSet;//页面集合
//
//	private Set<SysParameter> parameterSet;//资源参数
//	
//	private Set<SysRoleResourceRelationship> roleResourceRelationshipSet;//角色和资源关系集合
	
//	private Integer chooseType=0;//用于在页面checkbox选中的
//
//	private String treeCode;//资源层级编号
	
	public String getId() {
		return id;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getComponentName() {
		return componentName;
	}

	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<SysResource> getChild() {
		return child;
	}

	public void setChild(List<SysResource> child) {
		this.child = child;
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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getLeaf() {
		return leaf;
	}

	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public Integer getFull() {
		return full;
	}

	public void setFull(Integer full) {
		this.full = full;
	}

	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}

	public String getComponentId() {
		return componentId;
	}

	public void setComponentId(String componentId) {
		this.componentId = componentId;
	}

	public String getParentResourceId() {
		return parentResourceId;
	}

	public void setParentResourceId(String parentResourceId) {
		this.parentResourceId = parentResourceId;
	}

	public SysSystem getSystem() {
		return system;
	}

	public void setSystem(SysSystem system) {
		this.system = system;
	}

	public SysComponent getComponent() {
		return component;
	}

	public void setComponent(SysComponent component) {
		this.component = component;
	}
	
}