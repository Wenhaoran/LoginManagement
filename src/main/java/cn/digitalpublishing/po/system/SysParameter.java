package cn.digitalpublishing.po.system;

import java.io.Serializable;

/**
 * @author Administrator
 * @see 资源参数
 */
@SuppressWarnings("serial")
public class SysParameter implements Serializable {

	private String id;//id

	private String code;//编号

	private String val;//值
	
	private Integer isNull;//是否为空 1-允许 2-不允许
	
	private String resourceId;//资源ID 

//	private SysResource resource;//资源

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public Integer getIsNull() {
		return isNull;
	}

	public void setIsNull(Integer isNull) {
		this.isNull = isNull;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

}
