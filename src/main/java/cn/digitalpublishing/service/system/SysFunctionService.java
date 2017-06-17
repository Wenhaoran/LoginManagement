package cn.digitalpublishing.service.system;

import java.util.List;

import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysFunctionService extends RefreshCacheService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);

	/**
	 * 获取功能对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SysFunction getFunctionById(String id) throws Exception;

	/**
	 * 修改功能对象
	 * @param obj
	 * @param id
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	public void updateFunction(SysFunction obj) throws Exception;

	/**
	 * 新增功能对象
	 * @param obj
	 * @throws Exception
	 */
	public void insertFunction(SysFunction obj) throws Exception;

	/**
	 * 删除功能
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void deleteFunctionById(String id) throws Exception;

	List<SysFunction> findListByPageId(String id); 
	
}
