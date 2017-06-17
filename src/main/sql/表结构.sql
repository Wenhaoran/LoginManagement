/*
webgate 门户权限系统 初始化表结构  v0.1


数据库类型		      : MYSQL

Date: 2017-03-14 13:45:52
*/

-- SYS_ACCOUNT	账户
-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account` (
  `account_id` varchar(32) NOT NULL COMMENT '账户ID',
  `account_name` varchar(200) DEFAULT NULL COMMENT '账户名称',
  `account_pwd` varchar(200) DEFAULT NULL COMMENT '账户密码',
  `account_status` decimal(10,0) DEFAULT NULL COMMENT '账户状态：1-在用 2-停用',
  `account_type` decimal(10,0) DEFAULT NULL COMMENT '账户类型：1-本地账户 2-Sina账户',
  `account_level` decimal(10,0) DEFAULT NULL COMMENT '账户级别：1-超级用户（不能维护不能删除） 2-普通用户（可维护可删除）',
  `account_encryption` decimal(10,0) DEFAULT NULL COMMENT '加密 1-不加密 2-加密',
  `employee_id` varchar(32) DEFAULT NULL COMMENT '员工Id',
  `inserttime` datetime(6) DEFAULT NULL,
  `notes` varchar(32) DEFAULT NULL,
  `person_name` varchar(32) DEFAULT NULL,
  `corp_full_name` varchar(64) DEFAULT NULL,
  `corp_parent_name` varchar(32) DEFAULT NULL,
  `position_name` varchar(64) DEFAULT NULL,
  `EMPLOYEE_NAME` varchar(512) DEFAULT NULL COMMENT '????',
  `SSO_ACCOUNT` varchar(512) DEFAULT NULL COMMENT 'SSO登录账户',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





-- SYS_SYSTEM	系统
-- ----------------------------
-- Table structure for sys_system
-- ----------------------------
DROP TABLE IF EXISTS `sys_system`;
CREATE TABLE `sys_system` (
  `system_id` varchar(32) NOT NULL COMMENT '系统ID',
  `system_name` varchar(50) DEFAULT NULL COMMENT '系统名称',
  `system_code` varchar(20) DEFAULT NULL COMMENT '系统编号',
  `system_status` decimal(10,0) DEFAULT NULL COMMENT '系统状态：1-在用 2-停用 3-废弃',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- SYS_ROLE	角色		system
-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `role_duty` varchar(128) DEFAULT NULL COMMENT '角色描述',
  `role_status` decimal(10,0) DEFAULT NULL COMMENT '角色状态：1-在用 2-停用（角色状态决定 用户状态）',
  `system_id` varchar(32) DEFAULT NULL,
  `inserttime` datetime(6) DEFAULT NULL,
  `notes` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `system_id` (`system_id`) USING BTREE,
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `sys_system` (`SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- SYS_COMPONENT	组件	system
-- ----------------------------
-- Table structure for sys_component
-- ----------------------------
DROP TABLE IF EXISTS `sys_component`;
CREATE TABLE `sys_component` (
  `component_id` varchar(32) NOT NULL COMMENT '组件ID',
  `component_name` varchar(50) DEFAULT NULL COMMENT '组件名称',
  `component_code` varchar(512) DEFAULT NULL COMMENT '组件编号',
  `component_addr` text COMMENT '组件地址',
  `component_port` varchar(10) DEFAULT NULL COMMENT '组件端口',
  `component_status` decimal(10,0) DEFAULT NULL COMMENT '组件状态：1-有效 2-无效',
  `system_id` varchar(32) DEFAULT NULL,
  `COMPONENT_DEPLOY_CODE` varchar(50) DEFAULT NULL COMMENT '组件部署编号',
  PRIMARY KEY (`component_id`),
  KEY `system_id` (`system_id`) USING BTREE,
  CONSTRAINT `sys_component_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `sys_system` (`SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- SYS_RESOURCE	资源	system
-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` varchar(32) NOT NULL COMMENT '资源ID',
  `resource_name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `resource_code` varchar(255) DEFAULT NULL COMMENT '资源编号',
  `resource_link` text COMMENT '资源链接',
  `resource_status` decimal(10,0) DEFAULT NULL COMMENT '资源状态：1-在用 2-停用（上级菜单 决定下级菜单的状态）',
  `resource_isleaf` decimal(10,0) DEFAULT NULL COMMENT '资源叶子节点：1-是 2-不是（只有叶子节点可以挂功能页面）',
  `resource_order` decimal(10,0) DEFAULT NULL COMMENT '资源排序',
  `resource_type` decimal(10,0) DEFAULT NULL COMMENT '资源类型：1-菜单 2-接口',
  `resource_full` decimal(10,0) DEFAULT NULL COMMENT '是否全路径：1-否 2-是（是否采用全路径）',
  `resource_locale` text COMMENT '国际化参数',
  `system_id` varchar(32) DEFAULT NULL,
  `component_id` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `system_id` (`system_id`) USING BTREE,
  KEY `component_id` (`component_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `sys_resource_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `sys_system` (`SYSTEM_ID`),
  CONSTRAINT `sys_resource_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `sys_component` (`component_id`),
  CONSTRAINT `sys_resource_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





-- SYS_RA_RELATIONSHIP	角色--账户	
-- ----------------------------
-- Table structure for sys_ra_relationship
-- ----------------------------
DROP TABLE IF EXISTS `sys_ra_relationship`;
CREATE TABLE `sys_ra_relationship` (
  `r_ra_id` varchar(32) NOT NULL COMMENT '角色和账户关系ID',
  `role_id` varchar(32) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `inserttime` datetime(6) DEFAULT NULL,
  `notes` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`r_ra_id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  CONSTRAINT `sys_ra_relationship_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`ROLE_ID`),
  CONSTRAINT `sys_ra_relationship_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `sys_account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- SYS_RR_RELATIONSHIP	角色--资源
-- ----------------------------
-- Table structure for sys_rr_relationship
-- ----------------------------
DROP TABLE IF EXISTS `sys_rr_relationship`;
CREATE TABLE `sys_rr_relationship` (
  `r_rr_id` varchar(32) NOT NULL COMMENT '角色和资源关系ID',
  `role_id` varchar(32) DEFAULT NULL,
  `resource_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`r_rr_id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `resource_id` (`resource_id`) USING BTREE,
  CONSTRAINT `sys_rr_relationship_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `sys_rr_relationship_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





















