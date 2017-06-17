package cn.digitalpublishing.service.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.po.system.SysPage;
import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysPageService extends RefreshCacheService {

	void findDataGridByResource(PageInfo pageInfo);

	void deleteByIds(String[] ids);

	void insertPage(SysPage page);

	List<SysPage> findListByCondition(Map<String, Object> condition);

	SysPage findById(String pageId);

	void update(SysPage page)throws Exception; 

}
