package cn.digitalpublishing.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysFunctionMapper;
import cn.digitalpublishing.po.system.SysFunction;
import cn.digitalpublishing.service.system.SysFunctionService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysFunctionService")
public class SysFunctionServiceImpl implements SysFunctionService {
	
	@Resource(name="sysFunctionMapper")
    private SysFunctionMapper sysFunctionMapper;
	
	@Override
	public void refreshCache(String[] types, String removeSearch)throws Exception {}
	
	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysFunctionMapper.findPageCondition(pageInfo));
	}


	@Override
	public SysFunction getFunctionById(String id) throws Exception {
		SysFunction function = null;
		try {
			function = sysFunctionMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return function;
	}

	@Override
	public void updateFunction(SysFunction obj)throws Exception {
		try {
			sysFunctionMapper.updateById(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertFunction(SysFunction obj) throws Exception {
		try {
			sysFunctionMapper.insert(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteFunctionById(String id) throws Exception {
		try {
			sysFunctionMapper.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SysFunction> findListByPageId(String id) {
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("pageId", id);
		return sysFunctionMapper.findListByCondition(condition);
	}

}
