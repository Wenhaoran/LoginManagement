package cn.digitalpublishing.service.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.base.Tree;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysResourceService extends RefreshCacheService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);

	List<Tree> findTree();

	List<Tree> findTreeBySystemId(String systemId);

	List<SysResource>  findResourceByCondition(Map<String, Object> condition);

	SysResource findById(String resourceId);

	void insertResource(SysResource resource);

	void deleteById(String resourceId);

	void updateResource(SysResource resource)throws Exception;

	void findDataGridByRole(PageInfo pageInfo);

	List<Tree> findTreeByCondition(HashMap<String, Object> condition);
	
	
}
