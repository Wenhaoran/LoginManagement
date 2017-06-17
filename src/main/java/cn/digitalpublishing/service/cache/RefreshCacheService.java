package cn.digitalpublishing.service.cache;

public interface RefreshCacheService {

	void refreshCache(String[] types, String removeSearch) throws Exception;
}