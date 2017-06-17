package cn.digitalpublishing.springmvc.form.system;


public class TreeNode {
	public TreeNode() {
		
	}
	public TreeNode(String id,String name,boolean isParent,boolean checked,String sysId,String roleId){
		this.id= id;
		this.name=name;
		this.isParent = isParent;
		this.checked = checked ;
		this.sysId=sysId;
		this.roleId = roleId;
//		this.level = level;
	}
	
	public TreeNode(String id,String name,boolean isParent,boolean checked,String sysId,String roleId,String type){
		this.id= id;
		this.name=name;
		this.isParent = isParent;
		this.checked = checked ;
		this.sysId=sysId;
		this.roleId = roleId;
		this.type = type;
	}
	
	private String id;//节点id
	private String name;//节点名称
	private boolean isParent;//是否为叶子节点
	private boolean checked;
	private String sysId;
	private String roleId;
	private String type;
//	private String level;
	

	//	public String getLevel() {
//		return level;
//	}
//	public void setLevel(String level) {
//		this.level = level;
//	}
	public String getSysId() {
		return sysId;
	}
	public void setSysId(String sysId) {
		this.sysId = sysId;
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
	public boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
