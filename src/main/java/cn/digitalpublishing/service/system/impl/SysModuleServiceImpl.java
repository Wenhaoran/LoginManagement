package cn.digitalpublishing.service.system.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysModuleMapper;
import cn.digitalpublishing.po.system.SysModule;
import cn.digitalpublishing.service.system.SysModuleService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysModuleService")
public class SysModuleServiceImpl implements SysModuleService {
	
	@Resource(name="sysModuleMapper")
    private SysModuleMapper sysModuleMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)throws Exception {}
	

	@Override
	public SysModule getModuleById(String id) throws Exception {
		SysModule module = null;
		try {
			module = sysModuleMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return module;
	}

	@Override
	public void updateModule(SysModule obj) throws Exception {
		try {
			sysModuleMapper.updateById(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertModule(SysModule obj) throws Exception {
		try {
			sysModuleMapper.insert(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteModuleById(String id) throws Exception {
		try {
			sysModuleMapper.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<SysModule> findModuleByCondition(Map<String, Object> resourceCondition) {
		List<SysModule> moduleList = sysModuleMapper.findListByCondition(resourceCondition);
		return moduleList;
	}


	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysModuleMapper.findPageCondition(pageInfo));
	}
}
