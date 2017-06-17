package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysModuleService extends RefreshCacheService {
	
	/**
	 * 获取模块对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SysModule getModuleById(String id) throws Exception;

	/**
	 * 修改模块对象
	 * @param obj
	 * @param id
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	public void updateModule(SysModule obj) throws Exception;

	/**
	 * 新增模块对象
	 * @param obj
	 * @throws Exception
	 */
	public void insertModule(SysModule obj) throws Exception;

	/**
	 * 删除模块
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void deleteModuleById(String id) throws Exception;

	public List<SysModule> findModuleByCondition(Map<String, Object> resourceCondition);

	public void findDataGrid(PageInfo pageInfo); 
	
}