package cn.digitalpublishing.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysComponentMapper;
import cn.digitalpublishing.mapper.system.cache.CacheCRRMapper;
import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.cache.CacheCRR;
import cn.digitalpublishing.service.cache.DicCache;
import cn.digitalpublishing.service.system.SysComponentService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysComponentService")
public class SysComponentServiceImpl implements SysComponentService {
	
	@Resource(name="sysComponentMapper")
    private SysComponentMapper sysComponentMapper;
	
	@Resource(name="cacheCRRMapper")
    private CacheCRRMapper cacheCRRMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)throws Exception {}
	
	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysComponentMapper.findPageCondition(pageInfo));
	}

	@Override
	public SysComponent getComponentById(String id) throws Exception {
		SysComponent component = null;
		try {
			component = sysComponentMapper.findById(id);
		} catch (Exception e) {
		}
		return component;
	}

	@Override
	public void updateComponent(SysComponent obj)throws Exception {
		try {
			//判断，更新后的 组件code ，是否等于 更新前的code 
			SysComponent oobj = sysComponentMapper.findById(obj.getId());
			//如果 组件code  发生更改，删除缓存表数据，并删除缓存
			if(oobj.getCode()!=obj.getCode()){
				Map<String, Object> condition = new HashMap<String, Object>();
				condition.put("componentCode", oobj.getCode());
				List<CacheCRR> crrList = cacheCRRMapper.findListByCondition(condition);
				if(crrList.size()>0){
					for(CacheCRR crr : crrList){
						removePermissionsCache(crr.getKey());
						cacheCRRMapper.deleteById(crr.getId());
					}
				}
			}
			
			obj.setDeployCode(obj.getCode());
			sysComponentMapper.updateById(obj);
		} catch (Exception e) {
		}
	}
	
	public void removePermissionsCache(String key )throws Exception{
		DicCache.removeCache(key);
	}

	@Override
	public void insertComponent(SysComponent obj) throws Exception {
		try {
			obj.setDeployCode(obj.getCode());
			sysComponentMapper.insert(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteComponentById(String id) throws Exception {
		try {
			sysComponentMapper.deleteById(id);
		} catch (Exception e) {
		}
	}

	@Override
	public List<SysComponent> findListBySystemId(String systemId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("systemId", systemId);
		return sysComponentMapper.findListByCondition(condition);
	}


}
