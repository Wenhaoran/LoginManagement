package cn.digitalpublishing.base.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysResource;

public class MenuResourceList {
	public static Map<String,List<SysResource>> map = new HashMap<String,List<SysResource>>();
	
	public static void put(String sid,List<SysResource> reourcesList){
		map.put(sid, reourcesList);
	}
	public static List<SysResource> get(String sid){
		return map.get(sid);
	}
	public static List<SysResource> remove(String sid){
		return map.remove(sid);
	}
}
