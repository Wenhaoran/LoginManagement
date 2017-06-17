package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysSystemService extends RefreshCacheService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);
	
	/****System Start************************************************************************************************************************/
	/**
	 * 获取系统列表
	 * @param condition
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	public List<SysSystem> getSystemList(Map<String,Object> condition) throws Exception;

	/**
	 * 获取系统总数
	 * @param condition
	 * @return
	 * @throws Exception
	 */
	public Integer getSystemCount(Map<String,Object> condition) throws Exception;

	/**
	 * 获取系统对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SysSystem getSystemById(String id) throws Exception;

	/**
	 * 修改系统对象
	 * @param obj
	 * @param id
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	public void updateSystem(SysSystem obj, String id, String[] properties) throws Exception;

	/**
	 * 新增系统对象
	 * @param obj
	 * @throws Exception
	 */
	public void insertSystem(SysSystem obj) throws Exception;

	/**
	 * 删除系统
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void deleteSystemById(String id) throws Exception;

	List<SysSystem> getSystemPagingList(Map<String, Object> condition,String string, int getiDisplayLength, int getiDisplayStart);

	SysSystem findById(String id);

	void changeStatus(SysSystem system); 
	
}
