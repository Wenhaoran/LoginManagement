package cn.digitalpublishing.springmvc.form.system;

public class SessionForm {
	
	public static final String EXIST_FALSE = "false";
	
	public static final String EXIST_TRUE = "true";
	
	private String exist = EXIST_FALSE;
	
	private String msg = "";
	
	private String url = "";

	public String getExist() {
		return exist;
	}

	public void setExist(String exist) {
		this.exist = exist;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	

}
