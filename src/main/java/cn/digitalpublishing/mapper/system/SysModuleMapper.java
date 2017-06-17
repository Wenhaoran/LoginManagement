package cn.digitalpublishing.mapper.system;

import java.util.List;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

/**
 * @author Administrator
 * @see 模块 
 */
public interface SysModuleMapper extends BaseMapper<SysModule,SysModule> {
	
	/**
     * 分页 查询
     * @param 
     * @return
     */
	List<SysModule> findRolePageCondition(PageInfo pageInfo);
    
}