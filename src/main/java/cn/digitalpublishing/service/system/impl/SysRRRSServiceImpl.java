package cn.digitalpublishing.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysComponentMapper;
import cn.digitalpublishing.mapper.system.SysRRRSMapper;
import cn.digitalpublishing.mapper.system.SysResourceMapper;
import cn.digitalpublishing.mapper.system.SysRoleMapper;
import cn.digitalpublishing.mapper.system.cache.CacheCRRMapper;
import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleResourceRelationship;
import cn.digitalpublishing.po.system.cache.CacheCRR;
import cn.digitalpublishing.service.cache.DicCache;
import cn.digitalpublishing.service.system.SysRRRSService;

/**
 * @author Administrator
 * @see RoleResourceRelationship
 */
@Service("sysRRRSService")
public class SysRRRSServiceImpl implements SysRRRSService {
	
	@Resource(name="sysRRRSMapper")
    private SysRRRSMapper sysRRRSMapper;
	
	@Resource(name="sysRoleMapper")
    private SysRoleMapper sysRoleMapper;
	
	@Resource(name="sysResourceMapper")
    private SysResourceMapper sysResourceMapper;
	
	@Resource(name="sysComponentMapper")
    private SysComponentMapper sysComponentMapper;
	
	@Resource(name="cacheCRRMapper")
    private CacheCRRMapper cacheCRRMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
	}

	
	//生成 
	public String builderPermissionsKeyRES(Map<String, Object> mapKey) throws Exception {
		String cacheKey = null;
		StringBuilder cacheKeyBuilder = new StringBuilder();
		cacheKeyBuilder.append("res/");
		cacheKeyBuilder.append(mapKey.get("componentCode"));
		cacheKeyBuilder.append(mapKey.get("link"));
		cacheKeyBuilder.append(mapKey.get("roleId"));
		cacheKey = cacheKeyBuilder.toString();
		return cacheKey;
	}
	
	public String builderPermissionsKeyFUN(Map<String, Object> mapKey) throws Exception {
		String cacheKey = null;
		StringBuilder cacheKeyBuilder = new StringBuilder();
		cacheKeyBuilder.append("fun/");
		cacheKeyBuilder.append(mapKey.get("componentCode"));
		cacheKeyBuilder.append(mapKey.get("url"));
		cacheKeyBuilder.append(mapKey.get("roleId"));
		cacheKey = cacheKeyBuilder.toString();
		return cacheKey;
	}
	
//	public String setPermissionsCache(Map<String, Object> mapKey, Integer value) throws Exception {
//		return setPermissionsCache(builderPermissionsKeyRES(mapKey), value);
//	}
	
	public String setPermissionsCache(String key, Integer value) throws Exception {
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
	
	public void removePermissionsCache(String key )throws Exception{
		DicCache.removeCache(key);
	}

	@Override
	public void batchSaveRoleResourceRelationship(String resourceId, String[] roleIds)  throws Exception {
		try {
			if(roleIds!=null&&roleIds.length>0){
				for(int i=0;i<roleIds.length;i++){
					String roleId = roleIds[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("roleId", roleId);
					condition.put("resourceId", resourceId);
					List<SysRoleResourceRelationship> sysRAList = sysRRRSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysRoleResourceRelationship sysRR = new SysRoleResourceRelationship();
						sysRR.setResourceId(resourceId);
						sysRR.setRoleId(roleId);
						sysRRRSMapper.insert(sysRR);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//根据资源ID ，来删除 角色
	@Override
	public void batchDelRoleResourceRelationship(String resourceId, String[] ids) throws Exception  {
		try {
			SysResource resource = sysResourceMapper.findById(resourceId);
			SysComponent component = sysComponentMapper.findById(resource.getComponentId());
			String resourceName = resource.getName();
			if(ids!=null&&ids.length>0){
				for(int i=0;i<ids.length;i++){
					String roleId = ids[i];
					SysRole webgateRole = sysRoleMapper.findById(roleId);
					
					if(webgateRole != null){
						String roleName = webgateRole.getName();
						
						//当 资源为：系统管理 或 资源信息 ，并且 角色是 webgate 时， 关联不能删除
						if(!((resourceName.equals("系统管理")|| resourceName.equals("资源信息")) && roleName.equals("webgate"))){
							
							Map<String, Object> condition = new HashMap<String,Object>();
							condition.put("roleId",roleId);
							condition.put("resourceId",resourceId);
							List<SysRoleResourceRelationship> sysRAList = sysRRRSMapper.findListByCondition(condition);
							if(sysRAList != null){
								SysRoleResourceRelationship sysRA = sysRAList.get(0);
							
								sysRRRSMapper.deleteById(sysRA.getId());
								
								//删除 角色-资源 缓存
								Map<String, Object> conditionCache = new HashMap<String, Object>();
								conditionCache.put("componentCode", component.getCode());
								conditionCache.put("link", resource.getLink());
								conditionCache.put("roleId", webgateRole.getId());
								String cacheKey = builderPermissionsKeyRES(conditionCache);
								CacheCRR crrcache = cacheCRRMapper.findByKey(cacheKey);
								if(crrcache!=null){
									cacheCRRMapper.deleteById(crrcache.getId());
								}
								removePermissionsCache(cacheKey);
								
								//删除 角色-功能 缓存
								conditionCache.clear();
								conditionCache.put("componentCode", component.getCode());
								conditionCache.put("url", resource.getLink());
								conditionCache.put("roleId", webgateRole.getId());
								String key = builderPermissionsKeyFUN(conditionCache);
								CacheCRR cache = cacheCRRMapper.findByKey(key);
								if(cache!=null){
									cacheCRRMapper.deleteById(cache.getId());
								}
								removePermissionsCache(key);
								
							}
							
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SysRoleResourceRelationship> findListByCondition(Map<String, Object> condition) throws Exception {
		return sysRRRSMapper.findListByCondition(condition);
	}

	
	
	@Override
	public void batchSaveRoleResourceRelationshipByRoleId(String roleId,String[] resourceIds) {

		try {
			if(resourceIds!=null&&resourceIds.length>0){
				for(int i=0;i<resourceIds.length;i++){
					String resourceId = resourceIds[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("roleId", roleId);
					condition.put("resourceId", resourceId);
					List<SysRoleResourceRelationship> sysRAList = sysRRRSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysRoleResourceRelationship sysRR = new SysRoleResourceRelationship();
						sysRR.setResourceId(resourceId);
						sysRR.setRoleId(roleId);
						sysRRRSMapper.insert(sysRR);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void batchDelRoleResourceRelationshipByRoleId(String roleId,String[] ids) {

		try {
			SysRole role = sysRoleMapper.findById(roleId);
			String roleName = role.getName();
			if(ids!=null&&ids.length>0){
				for(int i=0;i<ids.length;i++){
					String resourceId = ids[i];
					SysResource resource = sysResourceMapper.findById(resourceId);
					
					if(resource != null){
						String resourceName = resource.getName();
						SysComponent component = sysComponentMapper.findById(resource.getComponentId());
						//当 资源为：系统管理 或 资源信息 ，并且 角色是 webgate 时， 关联不能删除
						if(!((resourceName.equals("系统管理")|| resourceName.equals("资源信息")) && roleName.equals("webgate"))){
							
							Map<String, Object> condition = new HashMap<String,Object>();
							condition.put("roleId",roleId);
							condition.put("resourceId",resourceId);
							List<SysRoleResourceRelationship> sysRAList = sysRRRSMapper.findListByCondition(condition);
							if(sysRAList != null){
								SysRoleResourceRelationship sysRA = sysRAList.get(0);
								sysRRRSMapper.deleteById(sysRA.getId());
								
								//删除 角色-资源 缓存
								Map<String, Object> conditionCache = new HashMap<String, Object>();
								conditionCache.put("componentCode", component.getCode());
								conditionCache.put("link", resource.getLink());
								conditionCache.put("roleId", role.getId());
								String cacheKey = builderPermissionsKeyRES(conditionCache);
								CacheCRR crrcache = cacheCRRMapper.findByKey(cacheKey);
								if(crrcache!=null){
									cacheCRRMapper.deleteById(crrcache.getId());
								}
								removePermissionsCache(cacheKey);
								
								//删除 角色-功能 缓存
								conditionCache.clear();
								conditionCache.put("componentCode", component.getCode());
								conditionCache.put("url", resource.getLink());
								conditionCache.put("roleId", role.getId());
								String key = builderPermissionsKeyFUN(conditionCache);
								CacheCRR cache = cacheCRRMapper.findByKey(key);
								if(cache!=null){
									cacheCRRMapper.deleteById(cache.getId());
								}
								removePermissionsCache(key);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Integer getPermissions(Map<String, Object> condition) throws Exception {
		
		String cacheKey = builderPermissionsKeyRES(condition);
		Integer permissionsCount = 0;
		Map<String, Object> permissions = DicCache.getFullData(cacheKey);
		if (permissions == null) {
			//根据 组件code 和 资源link ，查询 资源集合
			Map<String, Object> conditionResource = new HashMap<String, Object>();
			conditionResource.put("componentCode", condition.get("componentCode"));
			conditionResource.put("link", condition.get("link"));
			List<SysResource> resourceList = sysResourceMapper.findListByCondition(conditionResource);
			if(resourceList.size()>0){
				//获取 资源集合 第一个资源，查询 角色资源关系
				SysResource resource = resourceList.get(0);
				Map<String, Object> conditionRR = new HashMap<String, Object>();
				conditionRR.put("roleId", condition.get("roleId"));
				conditionRR.put("resourceId", resource.getId());
				permissionsCount = sysRRRSMapper.findListByCondition(conditionRR).size();
				
				//保存key 到 缓存表中
				CacheCRR crrCache = new CacheCRR();
				crrCache.setComponentCode((String)condition.get("componentCode"));
				crrCache.setResourceLink((String)condition.get("link"));
				crrCache.setRoleId((String)condition.get("roleId"));
				crrCache.setKey(cacheKey);
				cacheCRRMapper.insert(crrCache);
				
				setPermissionsCache(cacheKey, permissionsCount);
			}
		}else{
			permissionsCount = (Integer) permissions.get("value");
		}
		return permissionsCount;
	}

}
