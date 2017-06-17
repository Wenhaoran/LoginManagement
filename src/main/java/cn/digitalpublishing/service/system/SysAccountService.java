package cn.digitalpublishing.service.system;

import java.util.Map;

import cn.digitalpublishing.po.system.SysAccount;
import cn.digitalpublishing.util.mybatis.page.PageInfo;

public interface SysAccountService {
	
	/**
     * 分页 查询
     * @param pageInfo
     */
    void findDataGrid(PageInfo pageInfo);
	

	/**
	 * 修改账户对象
	 * @param obj
	 * @param id
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	public void updateAccount(SysAccount obj, String id, String[] properties) throws Exception;

	/**
	 * 新增账户对象
	 * @param obj
	 * @throws Exception
	 */
	public void insertAccount(SysAccount obj) throws Exception;

	/**
	 * 删除账户
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void deleteAccountById(String id) throws Exception;
	

	/**
	 * 用户登录
	 * @param condition
	 * @param sort
	 * @param isEncrypt
	 * @return
	 * @throws Exception
	 */
	public SysAccount login(Map<String,Object> condition) throws Exception;
	
	
	/**
	 * 获取账户对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public SysAccount getAccountByEmpId(String id) throws Exception;

	SysAccount findById(String id);

	void update(SysAccount account);


}
