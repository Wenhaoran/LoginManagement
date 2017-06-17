package cn.digitalpublishing.service.system;

import java.util.Map;

import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.service.cache.RefreshCacheService;

public interface CacheServiceServer extends RefreshCacheService {
	
	Integer getPermissions(Map<String, Object> condition) throws Exception;
	
	String builderPermissionsKey(Map<String, Object> mapKey) throws Exception;
	
	/**
	 * 设置角色权限缓存值
	 * @param mapKey {
	 * 	componentCode
	 * 	url
	 * 	roleId
	 * }
	 * @param value
	 * @return 缓存key
	 * @throws Exception
	 */
	String setPermissionsCache(Map<String, Object> mapKey, Integer value) throws Exception;
	
	/**
	 * 设置角色权限缓存值
	 * @param key
	 * @param value
	 * @return
	 * @throws Exception
	 */
	String setPermissionsCache(String key, Integer value) throws Exception;
	
	/**
	 * 设置账户信息缓存
	 * @param account
	 * @throws Exception
	 */
	void setAccountCache(SysAccount account) throws Exception;
	
	/**
	 * 获取账户信息缓存数据
	 * @param employeeId
	 * @return
	 * @throws Exception
	 */
	SysAccount getAccountCache(String employeeId) throws Exception;
}
