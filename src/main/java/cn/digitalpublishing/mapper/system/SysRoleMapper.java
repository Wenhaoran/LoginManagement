package cn.digitalpublishing.mapper.system;

import java.util.List;
import java.util.Map;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysRoleMapper extends BaseMapper<SysRole,SysRole> {

	List<SysRole> findPageConditionByAccountId(PageInfo pageInfo);

	SysRole findAllById(String roleId);

	SysRole findOneByCondition(Map<String, Object> condition);

	List<SysRole> findPageConditionByResourceId(PageInfo pageInfo);
	
}