package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysRoleService extends RefreshCacheService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);
	

	/**
	 * 获取角色对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SysRole getRoleById(String id) throws Exception;

	/**
	 * 修改角色对象
	 * @param obj
	 * @param id
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	public void updateRole(SysRole obj) throws Exception;

	/**
	 * 新增角色对象
	 * @param obj
	 * @throws Exception
	 */
	public void insertRole(SysRole obj) throws Exception;

	/**
	 * 删除角色
	 * @param id
	 * @throws Exception
	 */
	public void deleteRoleById(String id) throws Exception;


	//根据账户ID 查询 关联角色列表信息
	void findDataGridByAccount(PageInfo pageInfo);//,List<SysRoleAccountRelationship> rars


	void findDataGridByResource(PageInfo pageInfo);


	List<SysRole> findListByCondition(Map<String, Object> accountCondition);
	
}
