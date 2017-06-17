package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysAccountModuleRelationship;
import cn.digitalpublishing.service.cache.RefreshCacheService;

public interface SysAMRSService extends RefreshCacheService {

	void batchDelAccountModuleRelationshipByModuleId(String moduleId,String[] ids);

	void batchSaveAccountModuleRelationshipByRoleId(String moduleId,String[] accountIds);

	List<SysAccountModuleRelationship> getAccountModuleRelationshipListByCondition(Map<String, Object> condition);   
	
}
