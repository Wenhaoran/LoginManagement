package cn.digitalpublishing.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysResourceMapper;
import cn.digitalpublishing.mapper.system.cache.CacheCRRMapper;
import cn.digitalpublishing.po.base.Tree;
import cn.digitalpublishing.po.system.SysResource;
import cn.digitalpublishing.po.system.cache.CacheCRR;
import cn.digitalpublishing.service.cache.DicCache;
import cn.digitalpublishing.service.system.SysResourceService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysResourceService")
public class SysResourceServiceImpl implements SysResourceService {
	
	@Resource(name="sysResourceMapper")
    private SysResourceMapper sysResourceMapper;
	
	@Resource(name="cacheCRRMapper")
    private CacheCRRMapper cacheCRRMapper;
	
	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysResourceMapper.findResourcePageCondition(pageInfo));
	}

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
	}
	
	@Override
    public List<SysResource> findResourceByCondition(Map<String,Object> condition) {
        return sysResourceMapper.findListByCondition(condition);
    }
	
	@Override
	public List<Tree> findTreeBySystemId(String systemId) {
        List<Tree> trees = new ArrayList<Tree>();
        List<SysResource> resourceList = sysResourceMapper.findResourceBySysIdAndPidNull(systemId);
        if (resourceList != null) {
            for (SysResource resource : resourceList) {
            	HashMap<String,Object> condition = new HashMap<String,Object>();
                Tree treeOne = new Tree();
                treeOne.setId(resource.getId());
                treeOne.setText(resource.getName());
                condition.put("parentId", resource.getId());
                treeOne.setChildren(findChildOrgByPid(condition));
                treeOne.setType(String.valueOf(resource.getType()));
                trees.add(treeOne);
            }
        }
        return trees;
    }
	
	private List<Tree> findChildOrgByPid(HashMap<String,Object> condition) {
    	List<Tree> trees = new ArrayList<Tree>();  
        List<SysResource> sysResourceList = sysResourceMapper.findListByCondition(condition);
        if(sysResourceList != null){
        	for(SysResource resource : sysResourceList){
        		if(condition.get("orgId")!= null && 
            			((String)condition.get("orgId")).equals(resource.getId())){
            		continue;
            	}
            	Tree tree = new Tree();
                tree.setId(resource.getId());
                tree.setText(resource.getName());
                condition.put("parentId", resource.getId());
                tree.setChildren(findChildOrgByPid(condition));
                trees.add(tree);
            }
        }
        return trees;
    }

	@Override
	public List<Tree> findTree() {
    	HashMap<String,Object> condition = new HashMap<String,Object>();    	
        List<Tree> trees = new ArrayList<Tree>();
        List<SysResource> organizationFather = sysResourceMapper.findResourceAll();
        if (organizationFather != null) {
            for (SysResource organizationOne : organizationFather) {
            	
                Tree treeOne = new Tree();
                treeOne.setId(organizationOne.getId());
                treeOne.setText(organizationOne.getName());
                condition.put("parentId", organizationOne.getId());
                treeOne.setChildren(findChildOrgByPid(condition));
                treeOne.setType(String.valueOf(organizationOne.getType()));
                trees.add(treeOne);
            }
        }
        return trees;
    }

	@Override
	public SysResource findById(String id) {
		SysResource resource = null;
		try {
			resource = sysResourceMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resource;
	}

	@Override
	public void insertResource(SysResource resource) {
		try {
			sysResourceMapper.insert(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteById(String resourceId) {
		sysResourceMapper.deleteById(resourceId);
	}

	@Override
	public void updateResource(SysResource resource) throws Exception{
		SysResource oresource = sysResourceMapper.findById(resource.getId());
		//判断 资源的 link 是否发生过更改，如果更改，删除缓存表数据，并清除缓存。
		if(resource.getLink()!=oresource.getLink()){
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("resourceLink", oresource.getLink());
			List<CacheCRR> crrList = cacheCRRMapper.findListByCondition(condition);
			if(crrList.size()>0){
				for(CacheCRR crr : crrList){
					removePermissionsCache(crr.getKey());
					cacheCRRMapper.deleteById(crr.getId());
				}
			}
		}
		
		sysResourceMapper.updateById(resource);
	}
	
	public void removePermissionsCache(String key )throws Exception{
		DicCache.removeCache(key);
	}

	@Override
	public void findDataGridByRole(PageInfo pageInfo) {
		pageInfo.setRows(sysResourceMapper.findResourcePageConditionByRoleId(pageInfo));
	}

	@Override
	public List<Tree> findTreeByCondition(HashMap<String, Object> condition) {
    	
	List<Tree> trees = new ArrayList<Tree>();
	
	List<SysResource> resourceList = sysResourceMapper.getResourceListByRoleIdAndPidIsNull(condition);
	
	if (resourceList != null) {
	    for (SysResource resource : resourceList) {
	    	HashMap<String,Object> conditionC = new HashMap<String,Object>();
	        Tree treeOne = new Tree();
	        treeOne.setId(resource.getId());
	        treeOne.setText(resource.getName());
	        conditionC.put("parentId", resource.getId());
	        treeOne.setChildren(findChildOrgByPid(conditionC));
	        treeOne.setType(String.valueOf(resource.getType()));
	        trees.add(treeOne);
	        
	    }
	}
	return trees;
}
	

}
