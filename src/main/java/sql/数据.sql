/*
webgate 门户权限系统 初始化数据  v0.1


数据库类型		      : MYSQL

Date: 2017-03-14 13:45:52
*/

-- 账户
INSERT INTO `sys_account` VALUES (replace(uuid(),'-',''), 'webgate', '123456', '1', '1', '1', '1', null, NOW(), null, null, null, null, null, null, null);

-- 系统
INSERT INTO `sys_system` VALUES (replace(uuid(),'-',''), '英捷特门户权限控制系统', 'webgate', '1', NOW());

-- 角色
INSERT INTO `sys_role` VALUES (replace(uuid(),'-',''), 'webgate', null, '1', (select system_id from sys_system a where a.system_code = 'webgate'), NOW(), null);


-- 组件
INSERT INTO `sys_component` VALUES (replace(uuid(),'-',''), '门户权限中心', 'webgate', '127.0.0.1', '8080', '1', (select system_id from sys_system a where a.system_code = 'webgate'), null, NOW());


-- 资源
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '系统管理', '026', '/webgate', '1', null, '26', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), null, NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '系统信息', '026001', '/webgate', '1', null, '26001', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '资源信息', '026002', '/pages/resource/form/index', '1', null, '26002', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '账户信息', '026003', '/pages/account/form/index', '1', null, '26003', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '角色信息', '026004', '/pages/role/form/index', '1', null, '26004', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '组件信息', '026005', '/pages/component/form/index', '1', null, '26005', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '模块信息', '026006', '/pages/module/form/index', '1', null, '26006', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '功能信息', '026007', '/pages/function/form/index', '1', null, '26007', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '三级菜单', '026001001', '/pages/system/form/index', '1', null, '26001', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统信息'), NOW());
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '一级菜单', '020', '/pages/system/form/index', '1', null, '20', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), null, NOW());


-- 角色-账户
INSERT INTO `sys_ra_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select account_id from sys_account a where a.account_name = 'webgate'), now(), '初始化账号权限');

-- 角色-资源
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统信息'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '资源信息'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '账户信息'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '角色信息'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '组件信息'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '模块信息'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '功能信息'));

/*
注：
	account 账户数据，与 员工管理（员工姓名，等其他基本信息有关系）
	暂时不知道webgate 如何实现。
	打算在 webgate提供接口， 通过 其他项目 调用接口。
	保存 员工信息，并与 account 进行关联。
	
*************************************
Account 
	webgate 登录账户。
	
Role 
	webgate 角色
	
RARS 	Role <--> Account
	webgate 账户 <--> webgate 角色
	

	
Resources
	模块首页					defaultIndex
	没有模块 欢迎页面。	welcome
	系统管理
		系统管理
		资源管理
		账户管理
		角色管理
		组件管理
		模块管理
		功能管理
		
		
RRRS	Resources <--> Role
	webgate 角色 <--> 默认菜单
	
	
System 系统管理
	webgate 门户系统
	
Component 组件管理
	门户组件
*/

-- 其他测试数据。
-- 3个测试角色。
INSERT INTO `sys_role` VALUES (replace(uuid(),'-',''), '测试1', null, '1', (select system_id from sys_system a where a.system_code = 'webgate'), NOW(), null);
INSERT INTO `sys_role` VALUES (replace(uuid(),'-',''), '测试2', null, '1', (select system_id from sys_system a where a.system_code = 'webgate'), NOW(), null);
INSERT INTO `sys_role` VALUES (replace(uuid(),'-',''), '测试3', null, '1', (select system_id from sys_system a where a.system_code = 'webgate'), NOW(), null);


-- webgate 账户 与 3个测试角色的关系
INSERT INTO `sys_ra_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = '测试1'), (select account_id from sys_account a where a.account_name = 'webgate'), now(), '初始化账号权限');
INSERT INTO `sys_ra_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = '测试2'), (select account_id from sys_account a where a.account_name = 'webgate'), now(), '初始化账号权限');
INSERT INTO `sys_ra_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = '测试3'), (select account_id from sys_account a where a.account_name = 'webgate'), now(), '初始化账号权限');


-- 1、3级 菜单，与 webgate 角色的关系
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '三级菜单'));
INSERT INTO `sys_rr_relationship` VALUES (replace(uuid(),'-',''), (select role_id from sys_role a where a.role_name = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '一级菜单'));


-- 测试 系统
INSERT INTO `sys_system` VALUES (replace(uuid(),'-',''), '测试系统', 'test', '1', NOW());
	