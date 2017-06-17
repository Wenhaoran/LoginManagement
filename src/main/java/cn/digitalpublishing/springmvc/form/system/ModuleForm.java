package cn.digitalpublishing.springmvc.form.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.springmvc.form.base.DataTableForm;

public class ModuleForm extends DataTableForm<SysModule> {
	
	
	private List<SysModule> sysModules ;
	
	private List<String> tableTd;
	
	private String[] tableHead;
	
	private Map<String,List<String>> map;
	
	/**
	 * 模块对象
	 */
	private SysModule obj = new SysModule();
	
	/**
	 * 模块名称
	 */
	private String name;
	
	/**
	 * 模块链接
	 */
	private String link;
	
	/**
	 * 模块图标
	 */
	private String icon;
	
	/**
	 * 模块更多连接
	 */
	private String more;
	
	/**
	 * 模块是否必须 1-是 2-否
	 */
	private Integer must;
	
	/**
	 * 模块高度
	 */
	private Double height;
	
	/**
	 * 模块宽度
	 */
	private Double width;

    private String hideIds;
	
	private List<SysComponent> componentList = new ArrayList<SysComponent>();

	public SysModule getObj() {
		return obj;
	}

	public void setObj(SysModule obj) {
		this.obj = obj;
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
		this.getCondition().put("must", must);
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.getCondition().put("name", name);
		this.name = name;
	}

	public List<SysModule> getSysModules() {
	
		return sysModules;
	}

	
	public void setSysModules(List<SysModule> sysModules) {
	
		this.sysModules = sysModules;
	}

	
	public String[] getTableHead() {
	
		return tableHead;
	}

	
	public void setTableHead(String[] tableHead) {
	
		this.tableHead = tableHead;
	}

	
	public Map<String, List<String>> getMap() {
	
		return map;
	}

	
	public void setMap(Map<String, List<String>> map) {
	
		this.map = map;
	}

	
	public List<String> getTableTd() {
	
		return tableTd;
	}

	
	public void setTableTd(List<String> tableTd) {
	
		this.tableTd = tableTd;
	}

	public List<SysComponent> getComponentList() {
		return componentList;
	}

	public void setComponentList(List<SysComponent> componentList) {
		this.componentList = componentList;
	}

    public String getHideIds() {
        return hideIds;
    }

    public void setHideIds(String hideIds) {
        this.hideIds = hideIds;
    }
}
