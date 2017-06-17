package cn.digitalpublishing.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysPageMapper;
import cn.digitalpublishing.mapper.system.SysResourceMapper;
import cn.digitalpublishing.mapper.system.cache.CacheCRRMapper;
import cn.digitalpublishing.po.system.SysPage;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.cache.CacheCRR;
import cn.digitalpublishing.service.cache.DicCache;
import cn.digitalpublishing.service.system.SysPageService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysPageService")
public class SysPageServiceImpl implements SysPageService {
	
	@Resource(name="sysPageMapper")
    private SysPageMapper sysPageMapper;
	
	@Resource(name="cacheCRRMapper")
    private CacheCRRMapper cacheCRRMapper;
	
	@Resource(name="sysResourceMapper")
    private SysResourceMapper sysResourceMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
	}

	@Override
	public void findDataGridByResource(PageInfo pageInfo) {
		pageInfo.setRows(sysPageMapper.findPageCondition(pageInfo));
	}

	@Override
	public void deleteByIds(String[] ids) {
		for(String id:ids){
			sysPageMapper.deleteById(id);
		}
	}

	@Override
	public void insertPage(SysPage page) {
		sysPageMapper.insert(page);
	}

	@Override
	public List<SysPage> findListByCondition(Map<String, Object> condition) {
		return sysPageMapper.findListByCondition(condition);
	}

	@Override
	public SysPage findById(String pageId) {
		return sysPageMapper.findById(pageId);
	}

	@Override
	public void update(SysPage page) throws Exception{
		SysPage opage = sysPageMapper.findById(page.getId());
		if(opage.getPath()!=page.getPath()){
			String resourceId = page.getResourceId();
			SysResource resource = sysResourceMapper.findById(resourceId);
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("resourceLink", resource.getLink());
			List<CacheCRR> crrList = cacheCRRMapper.findListByCondition(condition);
			if(crrList.size()>0){
				for(CacheCRR crr : crrList){
					removePermissionsCache(crr.getKey());
					cacheCRRMapper.deleteById(crr.getId());
				}
			}
		}
		sysPageMapper.updateById(page);
	}
	
	public void removePermissionsCache(String key )throws Exception{
		DicCache.removeCache(key);
	}
	
}
