package cn.digitalpublishing.base.bean;

import java.util.HashMap;
import java.util.Map;

public class SessionIdMap {
	public static Map<String,LoginInfo> map = new HashMap<String,LoginInfo>();
	
	public static void put(String sid,LoginInfo loginInfo){
		map.put(sid, loginInfo);
	}
	public static LoginInfo get(String sid){
		return map.get(sid);
	}
	public static LoginInfo remove(String sid){
		return map.remove(sid);
	}
}
