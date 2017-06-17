package cn.digitalpublishing.mapper.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysResourceMapper extends BaseMapper<SysResource,SysResource> {
	
	List<SysResource> findResourcePageCondition(PageInfo pageInfo);
	
	List<SysResource> findResourcePageConditionByRoleId(PageInfo pageInfo); 
    
	
	List<SysResource> getResourceListByRoleId(Map<String, Object> condition);//暂时没有使用
	
	List<SysResource> findResourceBySysIdAndPidNull(String systemId);
	
	List<SysResource> findResourceByCondition(HashMap<String, Object> condition);

	List<SysResource> findResourceAll();

	List<SysResource> getResourceListByRoleIdAndPidIsNull(HashMap<String, Object> condition);
	
}