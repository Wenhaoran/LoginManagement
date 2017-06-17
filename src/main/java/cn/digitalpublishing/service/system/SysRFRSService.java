package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysRoleFunctionRelationship;
import cn.digitalpublishing.service.cache.RefreshCacheService;

public interface SysRFRSService extends RefreshCacheService {

	List<SysRoleFunctionRelationship> getRoleFunctionRelationshipListByCondition(Map<String, Object> condition)throws Exception;

	void batchSaveRoleFunctionRelationshipByFunctionId(String functionId, String[] roleIds);

	void batchDelRoleFunctionRelationshipByFunctionId(String functionId, String[] ids);

	void batchSaveRoleFunctionRelationshipByRoleId(String[] functionIds,String roleId);

	void batchDelRoleFunctionRelationshipByRoleId(String roleId, String[] ids);

	List<SysRoleFunctionRelationship> getRoleFunctionRelationshipListByConditionAll(Map<String, Object> condition);

	Map<String, String> getFunctionMap(Map<String, Object> condition)throws Exception ;

}
