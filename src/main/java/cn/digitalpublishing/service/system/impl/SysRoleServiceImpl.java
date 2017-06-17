package cn.digitalpublishing.service.system.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysRoleMapper;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.service.system.SysRoleService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysRoleService")
public class SysRoleServiceImpl implements SysRoleService {
	
	@Resource(name="sysRoleMapper")
    private SysRoleMapper sysRoleMapper;

	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysRoleMapper.findPageCondition(pageInfo));
	}

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
		
	}

	@Override
	public SysRole getRoleById(String id) throws Exception {
		SysRole obj = null;
		try {
			obj = sysRoleMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public void updateRole(SysRole obj)throws Exception {
		try {
			sysRoleMapper.updateById(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertRole(SysRole obj) throws Exception {
		try {
			sysRoleMapper.insert(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRoleById(String id) throws Exception {
		try {
			sysRoleMapper.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void findDataGridByAccount(PageInfo pageInfo) {
		
		pageInfo.setRows(sysRoleMapper.findPageConditionByAccountId(pageInfo));
	}

	@Override
	public void findDataGridByResource(PageInfo pageInfo) {
		
		pageInfo.setRows(sysRoleMapper.findPageConditionByResourceId(pageInfo));
	}

	@Override
	public List<SysRole> findListByCondition(Map<String, Object> accountCondition) {
		
		return sysRoleMapper.findListByCondition(accountCondition);
	}
	
}
