package cn.digitalpublishing.service.system.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.digitalpublishing.mapper.system.SysParameterMapper;
import cn.digitalpublishing.service.system.SysParameterService;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

@Service("sysParameterService")
public class SysParameterServiceImpl implements SysParameterService {
	
	@Resource(name="sysParameterMapper")
    private SysParameterMapper sysParameterMapper;

	@Override
	public void refreshCache(String[] types, String removeSearch)
			throws Exception {
	}
	
	@Override
	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setRows(sysParameterMapper.findPageCondition(pageInfo));
	}


}
