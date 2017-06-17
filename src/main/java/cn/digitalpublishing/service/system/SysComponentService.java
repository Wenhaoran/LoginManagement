package cn.digitalpublishing.service.system;

import java.util.List;

import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysComponentService extends RefreshCacheService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);

	/**
	 * 获取组件对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SysComponent getComponentById(String id) throws Exception;

	/**
	 * 修改组件对象
	 * @param obj
	 * @param id
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	public void updateComponent(SysComponent obj) throws Exception;

	/**
	 * 新增组件对象
	 * @param obj
	 * @throws Exception
	 */
	public void insertComponent(SysComponent obj) throws Exception;

	/**
	 * 删除组件
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void deleteComponentById(String id) throws Exception;

	
	//根据当前系统，查询 该系统下，所有的组件
	List<SysComponent> findListBySystemId(String systemId);
	
	
}
