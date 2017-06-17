package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @since 1.0
 * @author Liu Ben
 * @see 01_模块
 * @see SYS_MODULE
 */
@SuppressWarnings("serial")
public class SysModule implements Serializable {
	
	private String id;//模块ID
	
	private String name;//模块名称
	
	private String i18n;//是否国际化
	
	private String link;//模块链接
	
	private String icon;//模块图标
	
	private String more;//模块更多连接
	
	private Integer must;//模块是否必须 1-是 2-否
	
	private Double height;//模块高度
	
	private Double width;//模块宽度

	private String hideShow;//判断 隐藏属性  （只显示用）
	
	private String componentId;//组件ID
	
	private String componentName;//组件名称
	
//	private SysComponent component;//组件信息
//	
//	private Set<SysAccountModuleRelationship> accountModuleRelationshipSet;

	public String getId() {
		return id;
	}

	public String getComponentName() {
		return componentName;
	}

	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}

	public String getComponentId() {
		return componentId;
	}

	public void setComponentId(String componentId) {
		this.componentId = componentId;
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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getMore() {
		return more;
	}

	public void setMore(String more) {
		this.more = more;
	}

	public Integer getMust() {
		return must;
	}

	public void setMust(Integer must) {
		this.must = must;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWidth() {
		return width;
	}

	public void setWidth(Double width) {
		this.width = width;
	}

	public String getI18n() {
		return i18n;
	}

	public void setI18n(String i18n) {
		this.i18n = i18n;
	}

	public String getHideShow() {
		return hideShow;
	}

	public void setHideShow(String hideShow) {
		this.hideShow = hideShow;
	}

}