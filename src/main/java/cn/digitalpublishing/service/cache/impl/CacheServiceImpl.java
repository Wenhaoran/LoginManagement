package cn.digitalpublishing.service.cache.impl;

import java.util.List;

import cn.digitalpublishing.service.cache.CacheService;
import cn.digitalpublishing.service.cache.RefreshCacheService;

public class CacheServiceImpl implements CacheService {

	private List<RefreshCacheService> refreshCacheServices;

	@Override
	public void refresh() throws Exception {
		for (RefreshCacheService refreshCache : refreshCacheServices) {
			refreshCache.refreshCache(null, null);
		}
	}

	public List<RefreshCacheService> getRefreshCacheServices() {
		return refreshCacheServices;
	}

	public void setRefreshCacheServices(List<RefreshCacheService> refreshCacheServices) {
		this.refreshCacheServices = refreshCacheServices;
	}
}