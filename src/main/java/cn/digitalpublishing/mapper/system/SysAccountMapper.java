package cn.digitalpublishing.mapper.system;

import java.util.Map;

import cn.digitalpublishing.mapper.BaseMapper;
import cn.digitalpublishing.po.system.SysAccount;

public interface SysAccountMapper extends BaseMapper<SysAccount,SysAccount> {
	
    //根据用户名和密码，查询账户
    SysAccount getByUidAndPwd(Map<String,Object> condition);
    
    
}