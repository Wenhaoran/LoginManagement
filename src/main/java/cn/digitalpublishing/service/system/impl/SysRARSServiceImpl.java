package cn.digitalpublishing.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysAccountMapper;
import cn.digitalpublishing.mapper.system.SysRARSMapper;
import cn.digitalpublishing.mapper.system.SysRoleMapper;
import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.po.system.SysRole;
import cn.digitalpublishing.po.system.SysRoleAccountRelationship;
import cn.digitalpublishing.service.system.SysRARSService;

@Service("sysRARSService")
public class SysRARSServiceImpl implements SysRARSService {
	
	@Resource(name="sysRARSMapper")
    private SysRARSMapper sysRARSMapper;
	
	@Resource(name="sysAccountMapper")
    private SysAccountMapper sysAccountMapper;
	
	@Resource(name="sysRoleMapper")
    private SysRoleMapper sysRoleMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
	}

	@Override
	public List<SysRoleAccountRelationship> getRoleAccountRelationshipListByAccountId(Map<String, Object> condition) throws Exception {
		List<SysRoleAccountRelationship> roleAccountRelationshipList = null;
		try {
			roleAccountRelationshipList = sysRARSMapper.findListByCondition(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roleAccountRelationshipList;
	}

	@Override
	public void batchSaveRoleAccountRelationshipByAccountId(String accountId,String[] roleIds) throws Exception {
		try {
			if(roleIds!=null&&roleIds.length>0){
				for(int i=0;i<roleIds.length;i++){
					String roleId = roleIds[i];
					Map<String, Object> condition = new HashMap<String,Object>();
					condition.put("roleId", roleId);
					condition.put("accountId", accountId);
					List<SysRoleAccountRelationship> sysRAList = sysRARSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysRoleAccountRelationship sysRA = new SysRoleAccountRelationship();
						sysRA.setAccountId(accountId);
						sysRA.setRoleId(roleId);
						sysRARSMapper.insert(sysRA);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void batchDelRoleAccountRelationshipByAccountId(String accountId,String[] roleIds) throws Exception {
		try {
			SysAccount webgateAccount = sysAccountMapper.findById(accountId);
			String accountName = webgateAccount.getName();
			if(roleIds!=null&&roleIds.length>0){
				for(int i=0;i<roleIds.length;i++){
					String roleId = roleIds[i];
					if(roleId != ""){
						SysRole webgateRole = sysRoleMapper.findById(roleId);
						if(webgateRole != null){
							String roleName = webgateRole.getName();
							boolean a = !accountName.equals("webgate") ;
							boolean b = !roleName.equals("webgate");
							if( a || b ){
								Map<String, Object> condition = new HashMap<String,Object>();
								condition.put("roleId",roleId);
								condition.put("accountId",accountId);
								List<SysRoleAccountRelationship> sysRAList = sysRARSMapper.findListByCondition(condition);
								if(sysRAList != null){
									SysRoleAccountRelationship sysRA = sysRAList.get(0);
									
									sysRARSMapper.deleteById(sysRA.getId());
								}
								
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
	public void batchSaveRoleAccountRelationshipByRoleId(String roleId,String[] accountIds) {
		try {
			if(accountIds!=null&&accountIds.length>0){
				for(int i=0;i<accountIds.length;i++){
					
					String accountId = accountIds[i];
					
					Map<String, Object> condition = new HashMap<String,Object>();
					
					condition.put("accountId", accountId);
					condition.put("roleId", roleId);
					List<SysRoleAccountRelationship> sysRAList = sysRARSMapper.findListByCondition(condition);
					if(sysRAList.size()==0){
						SysRoleAccountRelationship sysRA = new SysRoleAccountRelationship();
						sysRA.setAccountId(accountId);
						sysRA.setRoleId(roleId);
						sysRARSMapper.insert(sysRA);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void batchDelRoleAccountRelationshipByRoleId(String roleId,String[] accountIds) {
		try {
			SysRole webgateRole = sysRoleMapper.findById(roleId);
			String roleName = webgateRole.getName();
			if(accountIds!=null&&accountIds.length>0){
				for(int i=0;i<accountIds.length;i++){
					String accountId = accountIds[i];
					if(accountId != ""){
						SysAccount webgateAccount = sysAccountMapper.findById(accountId);
						if(webgateAccount != null){
							String accountName = webgateAccount.getName();
							boolean a = !accountName.equals("webgate") ;
							boolean b = !roleName.equals("webgate");
							if( a || b ){
								Map<String, Object> condition = new HashMap<String,Object>();
								condition.put("roleId",roleId);
								condition.put("accountId",accountId);
								List<SysRoleAccountRelationship> sysRAList = sysRARSMapper.findListByCondition(condition);
								if(sysRAList != null){
									SysRoleAccountRelationship sysRA = sysRAList.get(0);
									
									sysRARSMapper.deleteById(sysRA.getId());
								}
								
							}
						}
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
