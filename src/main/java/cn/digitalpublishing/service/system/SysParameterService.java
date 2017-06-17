package cn.digitalpublishing.service.system;

import cn.digitalpublishing.service.cache.RefreshCacheService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysParameterService extends RefreshCacheService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);

}
