package cn.digitalpublishing.util.authen.vo;

import java.util.Map;

public class Resource {
	
	private String url;
	
	private Map<String,Param> params;
	
	private Map<String,Function> functions;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Map<String, Param> getParams() {
		return params;
	}

	public void setParams(Map<String, Param> params) {
		this.params = params;
	}

	public Map<String, Function> getFunctions() {
		return functions;
	}

	public void setFunctions(Map<String, Function> functions) {
		this.functions = functions;
	}

}
