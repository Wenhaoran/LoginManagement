package cn.digitalpublishing.base.bean;

import java.util.HashMap;
import java.util.Map;

public class RoleHtmlList {
	public static Map<String,String> map = new HashMap<String,String>();
	
	public static void put(String sid,String reourcesList){
		map.put(sid, reourcesList);
	}
	public static String get(String sid){
		return map.get(sid);
	}
	public static String remove(String sid){
		return map.remove(sid);
	}
}
