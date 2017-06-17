package cn.digitalpublishing.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysAMRSMapper;
import cn.digitalpublishing.po.system.SysAccountModuleRelationship;
import cn.digitalpublishing.service.system.SysAMRSService;

@Service("sysAMRSService")
public class SysAMRSServiceImpl implements SysAMRSService {
	
	@Resource(name="sysAMRSMapper")
    private SysAMRSMapper sysAMRSMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)throws Exception {}

	@Override
	public void batchDelAccountModuleRelationshipByModuleId(String moduleId,String[] ids) {
		try {
			if(moduleId!=null&&ids.length>0){
				for(int i=0;i<ids.length;i++){
					String accountId = ids[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("moduleId", moduleId);
					condition.put("accountId", accountId);
					List<SysAccountModuleRelationship> sysAMList = sysAMRSMapper.findListByCondition(condition);
					if(sysAMList.size()!=0){
						sysAMRSMapper.deleteById(sysAMList.get(0).getId());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void batchSaveAccountModuleRelationshipByRoleId(String moduleId,String[] accountIds) {
		try {
			if(moduleId!=null&&accountIds.length>0){
				for(int i=0;i<accountIds.length;i++){
					String accountId = accountIds[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("moduleId", moduleId);
					condition.put("accountId", accountId);
					List<SysAccountModuleRelationship> sysRAList = sysAMRSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysAccountModuleRelationship sysAM = new SysAccountModuleRelationship();
						sysAM.setAccountId(accountId);
						sysAM.setModuleId(moduleId);
						sysAMRSMapper.insert(sysAM);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SysAccountModuleRelationship> getAccountModuleRelationshipListByCondition(Map<String, Object> condition) {
		List<SysAccountModuleRelationship> amrsList = sysAMRSMapper.findListByCondition(condition);
		return amrsList;
	}
}
