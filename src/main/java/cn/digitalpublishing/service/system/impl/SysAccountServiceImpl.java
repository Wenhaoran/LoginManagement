package cn.digitalpublishing.service.system.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysAccountMapper;
import cn.digitalpublishing.mapper.system.SysRARSMapper;
import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.service.cache.DicCache;
import cn.digitalpublishing.service.system.SysAccountService;
import cn.digitalpublishing.util.Md5Util;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

import com.google.common.base.Strings;

@Service("sysAccountService")
public class SysAccountServiceImpl implements SysAccountService {
	
	@Resource(name="sysAccountMapper")
    private SysAccountMapper sysAccountMapper;
	
	@Resource(name="sysRARSMapper")
    private SysRARSMapper sysRARSMapper;
	
	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysAccountMapper.findPageCondition(pageInfo));
	}
	
	@Override
	public void update(SysAccount account) {
		sysAccountMapper.updateById(account);
	}
	
	@Override
	public SysAccount findById(String id) {
		SysAccount account = null;
		try {
			account = sysAccountMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}

	@Override
	public void updateAccount(SysAccount obj, String id, String[] properties)throws Exception {
		try {
			sysAccountMapper.updateById(obj);
			setAccountCache(obj);
		} catch (Exception e) {
		}
	}
	

	@Override
	public void insertAccount(SysAccount obj) throws Exception {
		try {
			sysAccountMapper.insert(obj);
//			setAccountCache(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteAccountById(String id) throws Exception {
		try {
			sysAccountMapper.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public SysAccount login(Map<String, Object> condition) throws Exception {
		SysAccount obj = null;
		try {
			obj = sysAccountMapper.getByUidAndPwd(condition);
			if(obj == null){
				condition.put("password", Md5Util.md5((String)condition.get("password")));
				obj = sysAccountMapper.getByUidAndPwd(condition);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public SysAccount getAccountByEmpId(String id) throws Exception {
		SysAccount obj = null;
		try {
			obj = getAccountCache(id);
			if (obj == null) {
				Map<String, Object> condition = new HashMap<String,Object>();
				condition.put("employeeId",id);
				obj = sysAccountMapper.getByUidAndPwd(condition);
				setAccountCache(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	
	
	
	
	
	
	public void setAccountCache(SysAccount account) throws Exception {
		if (account != null && !Strings.isNullOrEmpty(account.getEmployeeId())) {
			List<Map<String, Object>> cacheData = new ArrayList<Map<String, Object>>();
			Map<String, Object> cacheDataItem = new HashMap<String, Object>();
			cacheDataItem.put("id", account.getEmployeeId());
			cacheDataItem.put(Object.class.getSimpleName(), account);
			cacheData.add(cacheDataItem);
			DicCache.writeCache(cacheData, account.getEmployeeId());
		}
	}
	
	public SysAccount getAccountCache(String employeeId) throws Exception {
		if (!Strings.isNullOrEmpty(employeeId)) {
			Map<String, Object> cacheData = DicCache.getFullData(employeeId);
			if (cacheData != null) {
				SysAccount account = (SysAccount) cacheData.get(Object.class.getSimpleName());
				return account;
			}
		}
		return null;
	}

}
