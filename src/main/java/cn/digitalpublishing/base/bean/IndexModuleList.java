package cn.digitalpublishing.base.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysModule;

public class IndexModuleList {
	public static Map<String,List<SysModule>> map = new HashMap<String,List<SysModule>>();
	
	public static void put(String sid,List<SysModule> reourcesList){
		map.put(sid, reourcesList);
	}
	public static List<SysModule> get(String sid){
		return map.get(sid);
	}
	public static List<SysModule> remove(String sid){
		return map.remove(sid);
	}
}
