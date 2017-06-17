package cn.digitalpublishing.base.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysRole;

public class RoleListByAccount {
	public static Map<String,List<SysRole>> map = new HashMap<String,List<SysRole>>();
	
	public static void put(String sid,List<SysRole> reourcesList){
		map.put(sid, reourcesList);
	}
	public static List<SysRole> get(String sid){
		return map.get(sid);
	}
	public static List<SysRole> remove(String sid){
		return map.remove(sid);
	}
}
