package cn.digitalpublishing.mapper.system.cache;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.cache.CacheCRR;

public interface CacheCRRMapper extends BaseMapper<CacheCRR,CacheCRR> {
	
	CacheCRR findByKey(String cacheKey);
    
}