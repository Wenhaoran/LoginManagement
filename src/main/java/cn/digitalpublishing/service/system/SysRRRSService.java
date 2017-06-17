package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysRoleResourceRelationship;
import cn.digitalpublishing.service.cache.RefreshCacheService;

public interface SysRRRSService extends RefreshCacheService {
	
	/**
	 * 根据账户id批量保存角色资源关系
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public void batchSaveRoleResourceRelationship(String resourceId, String[] roleIds) throws Exception ;

	//解除 角色 资源 关系
	public void batchDelRoleResourceRelationship(String accountId, String[] ids) throws Exception ;

	
	//查询 角色-资源 集合 
	public List<SysRoleResourceRelationship> findListByCondition(Map<String, Object> condition) throws Exception ;

	
	//根据 角色ID ，批量 保存 角色-资源关系
	public void batchSaveRoleResourceRelationshipByRoleId(String roleId, String[] resourceIds);

	//根据角色ID ，批量 删除 角色-资源 关系
	public void batchDelRoleResourceRelationshipByRoleId(String roleId, String[] ids);  

	public Integer getPermissions(Map<String, Object> condition) throws Exception;

}
