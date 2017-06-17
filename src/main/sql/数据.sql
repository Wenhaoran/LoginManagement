/*
webgate 门户权限系统 初始化数据  v0.1


数据库类型		      : MYSQL

Date: 2017-03-14 13:45:52
*/

-- 账户
INSERT INTO `sys_account` VALUES (replace(uuid(),'-',''), 'webgate', '123456', '1', '1', '1', '1', null, NOW(), null, null, null, null, null, null, null);

-- 系统
INSERT INTO `sys_system` VALUES (replace(uuid(),'-',''), '英捷特门户权限控制系统', 'webgate', '1');

-- 角色
INSERT INTO `sys_role` VALUES (replace(uuid(),'-',''), 'webgate', null, '1', (select system_id from sys_system a where a.system_code = 'webgate'), '2015-07-09 16:36:01.000000', null);


-- 组件
INSERT INTO `sys_component` VALUES (replace(uuid(),'-',''), '门户权限中心', 'webgate', '127.0.0.1', '8080', '1', (select system_id from sys_system a where a.system_code = 'webgate'), null);


-- 资源
INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '系统管理', '026', '/webgate', '1', null, '26', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), null);

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '系统信息', '026001', '/pages/system/form/index', '1', null, '26001', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '资源信息', '026002', '/pages/resource/form/index', '1', null, '26002', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '账户信息', '026003', '/pages/account/form/index', '1', null, '26003', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '角色信息', '026004', '/pages/role/form/index', '1', null, '26004', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '组件信息', '026005', '/pages/component/form/index', '1', null, '26005', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '模块信息', '026006', '/pages/module/form/index', '1', null, '26006', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));

INSERT INTO `sys_resource` VALUES (replace(uuid(),'-',''), '功能信息', '026007', '/pages/function/form/index', '1', null, '26007', '1', '1', null, (select system_id from sys_system a where a.system_code = 'webgate'), (select component_id from sys_component a where a.component_code = 'webgate'), (select resource_id from sys_resource a where a.resource_name = '系统管理'));




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