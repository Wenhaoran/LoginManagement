package cn.digitalpublishing.mapper.system;

import java.util.Map;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.SysRoleResourceRelationship;

/**
 * @author Administrator
 * @see 角色和资源关系
 */
public interface SysRRRSMapper extends BaseMapper<SysRoleResourceRelationship,SysRoleResourceRelationship> {

	void delByWhere(Map<String, Object> condition);

}