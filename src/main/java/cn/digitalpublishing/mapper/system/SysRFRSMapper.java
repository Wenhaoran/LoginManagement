package cn.digitalpublishing.mapper.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.SysRoleFunctionRelationship;

/**
 * @author Administrator
 * @see 角色和功能关系
 */
public interface SysRFRSMapper extends BaseMapper<SysRoleFunctionRelationship,SysRoleFunctionRelationship> {
    /**
     * 添加资源
     *
     * @param sysRoleFunctionRelationship
     * @return
     */
    int insert(SysRoleFunctionRelationship sysRoleFunctionRelationship);

    /**
     * 修改资源
     * @param sysRoleFunctionRelationship
     * @return
     */
    int updateSysRoleFunctionRelationship(SysRoleFunctionRelationship sysRoleFunctionRelationship);

    /**
     * 查询菜单资源
     *
     * @param sysRoleFunctionRelationshipType
     * @param pid
     * @return
     */
    List<SysRoleFunctionRelationship> findSysRoleFunctionRelationshipAllByTypeAndPid(@Param("sysRoleFunctionRelationshipType") Integer sysRoleFunctionRelationshipType, @Param("pid") Long pid);

    /**
     * 查询所有资源
     *
     * @return
     */
    List<SysRoleFunctionRelationship> findSysRoleFunctionRelationshipAll();
    
    /**
     * 查询所有资源
     *
     * @return
     */
    List<SysRoleFunctionRelationship> findSysRoleFunctionRelationshipByCondition(HashMap<String,Object> condition);

    /**
     * 查询一级资源
     *
     * @param sysRoleFunctionRelationshipMenu
     * @return
     */
    List<SysRoleFunctionRelationship> findSysRoleFunctionRelationshipAllByTypeAndPidNull(Integer sysRoleFunctionRelationshipMenu);

    /**
     * 根据id查询资源
     *
     * @param id
     * @return
     */
    SysRoleFunctionRelationship findSysRoleFunctionRelationshipById(Long id);

    /**
     * 删除资源
     *
     * @param id
     * @return
     */
    int deleteSysRoleFunctionRelationshipById(Long id);
    
    /**
     * 形成资源
     * @param roleIds
     * @return
     */
    List<SysRoleFunctionRelationship> findSysRoleFunctionRelationshipIdListByRoleId(List<String> roleIds);

	Integer getCount(Map<String, Object> condition);

	List<SysRoleFunctionRelationship> getList(Map<String, Object> condition);

	void delByWhere(Map<String, Object> condition);

	List<SysRoleFunctionRelationship> findListByConditionAll(Map<String, Object> condition); 
}