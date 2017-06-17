package cn.digitalpublishing.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysComponentMapper;
import cn.digitalpublishing.mapper.system.SysResourceMapper;
import cn.digitalpublishing.mapper.system.SysRoleMapper;
import cn.digitalpublishing.mapper.system.SysSystemMapper;
import cn.digitalpublishing.po.system.SysComponent;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysSystem;
import cn.digitalpublishing.service.system.SysSystemService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysSystemService")
public class SysSystemServiceImpl implements SysSystemService {
	
	@Resource(name="sysSystemMapper")
    private SysSystemMapper sysSystemMapper;
	
	@Resource(name="sysRoleMapper")
    private SysRoleMapper sysRoleMapper;
	
	@Resource(name="sysComponentMapper")
    private SysComponentMapper sysComponentMapper;
	
	@Resource(name="sysResourceMapper")
    private SysResourceMapper sysResourceMapper;
	
	
	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysSystemMapper.findPageCondition(pageInfo));
	}
	
	@Override
	public SysSystem findById(String id) {
		SysSystem system = sysSystemMapper.findById(id);
		return system;
	}
	

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
		
	}
	
	@Override
	public void changeStatus(SysSystem system) {
		int status = system.getStatus();
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("systemId", system.getId());
		if(status != 1){
			//系统状态 设置为 不可用。 其 被关联的所有 角色，资源，组件，均设置不可用
			sysSystemMapper.updateById(system);
			//批量更新 角色 状态为 不可用
			List<SysRole> roleList = sysRoleMapper.findListByCondition(condition);
			if(roleList !=null){
				for(SysRole role : roleList){
					role.setStatus(2);//状态 1 可用，2 不可用
					sysRoleMapper.updateById(role);
				}
			}
			
			//批量更新 资源 状态为 不可用
			List<SysResource> resourceList = sysResourceMapper.findListByCondition(condition);
			if(resourceList != null){
				for(SysResource resource :resourceList){
					resource.setStatus(2);//状态 2 ，是 停用
					sysResourceMapper.updateById(resource);
				}
			}
			
			//批量更新 组件 状态为 不可用
			List<SysComponent> componentList = sysComponentMapper.findListByCondition(condition);
			if(componentList != null){
				for(SysComponent component : componentList){
					component.setStatus(2);//状态2 ，无效
					sysComponentMapper.updateById(component);
				}
			}
			
		}else{
			//系统状态 设置为 可用，只更改系统 状态 为 可用。
			sysSystemMapper.updateById(system);
		}
	}

	@Override
	public List<SysSystem> getSystemList(Map<String, Object> condition) throws Exception {
		List<SysSystem> list = null;
		try {
			list = sysSystemMapper.findListByCondition(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public SysSystem getSystemById(String id) throws Exception {
		SysSystem system = null;
		try {
			system = sysSystemMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return system;
	}

	@Override
	public void updateSystem(SysSystem obj, String id, String[] properties)throws Exception {
		try {
			sysSystemMapper.updateById(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertSystem(SysSystem obj) throws Exception {
		try {
			sysSystemMapper.insert(obj);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public void deleteSystemById(String id) throws Exception {
		try {
			sysSystemMapper.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Integer getSystemCount(Map<String, Object> condition)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SysSystem> getSystemPagingList(Map<String, Object> condition,
			String string, int getiDisplayLength, int getiDisplayStart) {
		// TODO Auto-generated method stub
		return null;
	}

}
