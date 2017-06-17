package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysRoleAccountRelationship;
import cn.digitalpublishing.service.cache.RefreshCacheService;

public interface SysRARSService extends RefreshCacheService {
	
	/**
	 * 根据账户id获取角色账户关系列表
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public List<SysRoleAccountRelationship> getRoleAccountRelationshipListByAccountId(Map<String,Object> condition) throws Exception;

	/**
	 * 根据账户id批量保存角色账户关系
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public void batchSaveRoleAccountRelationshipByAccountId(String AccountId,String[] roleIds) throws Exception;
	
	/**
	 * 根据账户id批量 删除 角色账户关系
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public void batchDelRoleAccountRelationshipByAccountId(String AccountId,String[] roleIds) throws Exception;

	/**
	 * 根据 角色 id批量保存 角色账户 关系
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public void batchSaveRoleAccountRelationshipByRoleId(String roleId,String[] accountIds);

	
	/**
	 * 根据 角色 id批量 删除 角色账户 关系
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public void batchDelRoleAccountRelationshipByRoleId(String roleId,String[] accountIds); 

}
