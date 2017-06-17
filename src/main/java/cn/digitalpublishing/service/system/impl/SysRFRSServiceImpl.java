package cn.digitalpublishing.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysComponentMapper;
import cn.digitalpublishing.mapper.system.SysFunctionMapper;
import cn.digitalpublishing.mapper.system.SysPageMapper;
import cn.digitalpublishing.mapper.system.SysRFRSMapper;
import cn.digitalpublishing.mapper.system.SysResourceMapper;
import cn.digitalpublishing.mapper.system.cache.CacheCRRMapper;
import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.po.system.SysPage;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRoleFunctionRelationship;
import cn.digitalpublishing.po.system.cache.CacheCRR;
import cn.digitalpublishing.service.cache.DicCache;
import cn.digitalpublishing.service.system.SysRFRSService;

/**
 * @author Administrator
 * @see RoleFunctionRelationship
 */
@Service("sysRFRSService")
public class SysRFRSServiceImpl implements SysRFRSService {
	
	@Resource(name="sysRFRSMapper")
    private SysRFRSMapper sysRFRSMapper;
	
	@Resource(name="sysFunctionMapper")
    private SysFunctionMapper sysFunctionMapper;
	
	@Resource(name="sysPageMapper")
    private SysPageMapper sysPageMapper;
	
	@Resource(name="sysResourceMapper")
    private SysResourceMapper sysResourceMapper;
	
	@Resource(name="sysComponentMapper")
    private SysComponentMapper sysComponentMapper;
	
	@Resource(name="cacheCRRMapper")
    private CacheCRRMapper cacheCRRMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)throws Exception {
	}

	@Override
	public List<SysRoleFunctionRelationship> getRoleFunctionRelationshipListByCondition(Map<String, Object> condition) throws Exception{
		
		return sysRFRSMapper.findListByCondition(condition);
	}

	@Override
	public void batchSaveRoleFunctionRelationshipByFunctionId(String functionId,String[] roleIds) {
		try {
			if(roleIds!=null&&roleIds.length>0){
				for(int i=0;i<roleIds.length;i++){
					String roleId = roleIds[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("roleId", roleId);
					condition.put("functionId", functionId);
					List<SysRoleFunctionRelationship> sysRAList = sysRFRSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysRoleFunctionRelationship sysRF = new SysRoleFunctionRelationship();
						sysRF.setRoleId(roleId);
						sysRF.setFunctionId(functionId);
						sysRFRSMapper.insert(sysRF);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void batchDelRoleFunctionRelationshipByFunctionId(String functionId, String[] ids) {
		try {
			if(functionId!=null&&ids.length>0){
				for(int i=0;i<ids.length;i++){
					String roleId = ids[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("functionId", functionId);
					condition.put("roleId", roleId);
					List<SysRoleFunctionRelationship> sysRFList = sysRFRSMapper.findListByCondition(condition);
					if(sysRFList.size()!=0){
						
						//角色-功能 关系表数据 大于零 ,就关联查询 到  资源,然后根据 资源 link 来删缓存
						SysFunction function = sysFunctionMapper.findById(functionId);
						SysPage page = sysPageMapper.findById(function.getPageId());
						SysResource resource = sysResourceMapper.findById(page.getResourceId());
						Map<String, Object> conditionCache = new HashMap<String, Object>();
						conditionCache.put("resourceLink", resource.getLink());
						List<CacheCRR> crrList = cacheCRRMapper.findListByCondition(conditionCache);
						if(crrList.size()>0){
							for(CacheCRR crr : crrList){
								cacheCRRMapper.deleteById(crr.getId());
								removePermissionsCache(crr.getKey());
							}
						}
						
						sysRFRSMapper.deleteById(sysRFList.get(0).getId());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void batchSaveRoleFunctionRelationshipByRoleId(String[] functionIds,String roleId) {
		try {
			if(functionIds!=null&&functionIds.length>0){
				for(int i=0;i<functionIds.length;i++){
					String functionId = functionIds[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("roleId", roleId);
					condition.put("functionId", functionId);
					List<SysRoleFunctionRelationship> sysRAList = sysRFRSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysRoleFunctionRelationship sysRF = new SysRoleFunctionRelationship();
						sysRF.setRoleId(roleId);
						sysRF.setFunctionId(functionId);
						sysRFRSMapper.insert(sysRF);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void batchDelRoleFunctionRelationshipByRoleId(String roleId,String[] ids) {
		try {
			if(roleId!=null&&ids.length>0){
				for(int i=0;i<ids.length;i++){
					String functionId = ids[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("functionId", functionId);
					condition.put("roleId", roleId);
					List<SysRoleFunctionRelationship> sysRFList = sysRFRSMapper.findListByCondition(condition);
					if(sysRFList.size()!=0){
						SysFunction function = sysFunctionMapper.findById(functionId);
						SysPage page = sysPageMapper.findById(function.getPageId());
						SysResource resource = sysResourceMapper.findById(page.getResourceId());
						
						Map<String, Object> conditionCache = new HashMap<String, Object>();
						conditionCache.put("resourceLink", resource.getLink());
						List<CacheCRR> crrList = cacheCRRMapper.findListByCondition(conditionCache);
						if(crrList.size()>0){
							for(CacheCRR crr : crrList){
								cacheCRRMapper.deleteById(crr.getId());
								removePermissionsCache(crr.getKey());
							}
						}
						
						sysRFRSMapper.deleteById(sysRFList.get(0).getId());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void removePermissionsCache(String key )throws Exception{
		DicCache.removeCache(key);
	}

	@Override
	public List<SysRoleFunctionRelationship> getRoleFunctionRelationshipListByConditionAll(Map<String, Object> condition) {
		return sysRFRSMapper.findListByConditionAll(condition);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, String> getFunctionMap(Map<String, Object> condition) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		String key = builderPermissionsKey(condition);
		
		Map<String, Object> permissions = DicCache.getFullData(key);
		List<SysRoleFunctionRelationship> rfrsList = sysRFRSMapper.findListByConditionAll(condition);
		if(rfrsList.size()>0){
			if(permissions==null){
				for(SysRoleFunctionRelationship obj : rfrsList){
					SysFunction function = sysFunctionMapper.findById(obj.getFunctionId());
					SysPage page = sysPageMapper.findById(function.getPageId());
					SysResource resource = sysResourceMapper.findById(page.getResourceId());
					SysComponent component = sysComponentMapper.findById(resource.getComponentId());
					map.put("/"+component.getCode()+	//组件编号 
								page.getPath()+			//页面
								((page.getSpecial()!=null&&!"".equals(page.getSpecial()))//当页面特殊标识不为空  true:false
								//不为空，加特殊标识；为空，加空字符串	页面特殊标识 默认为空
								?("#"+page.getSpecial()):"") 				
								+ "#"+function.getCode()//功能编码  功能编码意思：页面路径上的，增删改查
								,
								"true");
//					map.put("/组件编码+页面地址+ # + 功能编码","true");
				}
				
				//保存key 到 缓存表中
				CacheCRR crrCache = new CacheCRR();
				crrCache.setComponentCode((String)condition.get("componentCode"));
				crrCache.setResourceLink((String)condition.get("url"));
				crrCache.setRoleId((String)condition.get("roleId"));
				crrCache.setKey(key);
				cacheCRRMapper.insert(crrCache);
				
				setPermissionsCache(key, map);
			}else{
				map=(Map<String, String>) permissions.get("value");
			}
		}
		
		return map;
	}
	
	public String builderPermissionsKey(Map<String, Object> mapKey) throws Exception {
		String cacheKey = null;
		
		StringBuilder cacheKeyBuilder = new StringBuilder();
		cacheKeyBuilder.append("fun/");
		cacheKeyBuilder.append(mapKey.get("componentCode"));
		cacheKeyBuilder.append(mapKey.get("url"));
		cacheKeyBuilder.append(mapKey.get("roleId"));
		cacheKey = cacheKeyBuilder.toString();
		return cacheKey;
	}
	
	public String setPermissionsCache(String key, Map<String,String> value) throws Exception {
		if (value != null) {
			List<Map<String, Object>> cacheData = new ArrayList<Map<String, Object>>();
			Map<String, Object> cacheDataItem = new HashMap<String, Object>();
			cacheDataItem.put("id", key);
			cacheDataItem.put("value", value);
			cacheData.add(cacheDataItem);
			DicCache.writeCache(cacheData, key);
		}
		return key;
	}
}
