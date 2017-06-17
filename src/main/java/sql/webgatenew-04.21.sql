/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : webgatenew

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-04-21 15:17:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cache_crr
-- ----------------------------
DROP TABLE IF EXISTS `cache_crr`;
CREATE TABLE `cache_crr` (
  `crr_id` varchar(64) NOT NULL COMMENT '组件code + 资源link + 角色ID 缓存表',
  `component_code` varchar(64) DEFAULT NULL,
  `resource_link` varchar(128) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `cache_key` varchar(256) DEFAULT NULL,
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`crr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cache_crr
-- ----------------------------
INSERT INTO `cache_crr` VALUES ('1b60fcd9263411e7830e0a0027000000', 'webgate', '/pages/system/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/system/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:44:49.000000');
INSERT INTO `cache_crr` VALUES ('1b6c80a0263411e7830e0a0027000000', 'webgate', '/pages/system/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'fun/webgate/pages/system/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:44:49.000000');
INSERT INTO `cache_crr` VALUES ('33f968db25be11e78dd20a0027000000', 'webgate', '/pages/module/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/module/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:40:49.000000');
INSERT INTO `cache_crr` VALUES ('362df08e25be11e78dd20a0027000000', 'webgate', '/pages/function/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/function/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:40:53.000000');
INSERT INTO `cache_crr` VALUES ('38d499e425be11e78dd20a0027000000', 'webgate', '/pages/role/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/role/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:40:57.000000');
INSERT INTO `cache_crr` VALUES ('39e7f8ca25be11e78dd20a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:40:59.000000');
INSERT INTO `cache_crr` VALUES ('39f6c31325be11e78dd20a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'fun/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:40:59.000000');
INSERT INTO `cache_crr` VALUES ('3a943ba425be11e78dd20a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:41:00.000000');
INSERT INTO `cache_crr` VALUES ('3b78ecc225be11e78dd20a0027000000', 'webgate', '/pages/system/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/system/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:41:02.000000');
INSERT INTO `cache_crr` VALUES ('3b81481925be11e78dd20a0027000000', 'webgate', '/pages/system/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'fun/webgate/pages/system/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:41:02.000000');
INSERT INTO `cache_crr` VALUES ('45641b30263011e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:17:22.000000');
INSERT INTO `cache_crr` VALUES ('541086e1263011e7830e0a0027000000', 'webgate', '/pages/role/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/role/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:17:46.000000');
INSERT INTO `cache_crr` VALUES ('8cadc5d8264611e7830e0a0027000000', 'webgate', '/pages/module/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/module/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 11:56:49.000000');
INSERT INTO `cache_crr` VALUES ('8d79949a264611e7830e0a0027000000', 'webgate', '/pages/component/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/component/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 11:56:51.000000');
INSERT INTO `cache_crr` VALUES ('9f1156c8263511e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:55:40.000000');
INSERT INTO `cache_crr` VALUES ('a1819b14263511e7830e0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:55:44.000000');
INSERT INTO `cache_crr` VALUES ('a2cbde19263511e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'fun/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:55:46.000000');
INSERT INTO `cache_crr` VALUES ('b628a15c25bd11e78dd20a0027000000', 'webgate', '/pages/component/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/component/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-20 19:37:18.000000');
INSERT INTO `cache_crr` VALUES ('cac5f418263511e7830e0a0027000000', 'webgate', '/pages/role/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/role/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:56:53.000000');
INSERT INTO `cache_crr` VALUES ('d0808c83263511e7830e0a0027000000', 'webgate', '/pages/function/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/function/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:57:03.000000');
INSERT INTO `cache_crr` VALUES ('eef0aca7263311e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:43:35.000000');
INSERT INTO `cache_crr` VALUES ('f59b0257263011e7830e0a0027000000', 'webgate', '/pages/component/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/component/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 09:22:17.000000');

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
  `EMPLOYEE_NAME` varchar(512) DEFAULT NULL,
  `SSO_ACCOUNT` varchar(512) DEFAULT NULL COMMENT 'SSO登录账户',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES ('945c9ddc145411e7ad640a0027000000', 'test1', '123456', '1', '1', '2', '1', null, '2017-03-29 15:51:53.000000', null, null, null, null, null, null, null);
INSERT INTO `sys_account` VALUES ('c60e81540eb011e7860d0a0027000000', 'webgate', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', '2', null, '2017-03-22 11:36:38.000000', null, null, null, null, null, null, null);
INSERT INTO `sys_account` VALUES ('ed9da62b12fd11e7ad640a0027000000', 'admin', '123456', '1', '1', '1', '1', null, '2017-03-27 22:59:08.000000', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_am_relationship
-- ----------------------------
DROP TABLE IF EXISTS `sys_am_relationship`;
CREATE TABLE `sys_am_relationship` (
  `r_am_id` varchar(32) NOT NULL COMMENT '账户和模块关系ID',
  `account_id` varchar(32) DEFAULT NULL,
  `module_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`r_am_id`),
  KEY `module_id` (`module_id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  CONSTRAINT `sys_am_relationship_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sys_module` (`module_id`),
  CONSTRAINT `sys_am_relationship_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `sys_account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_am_relationship
-- ----------------------------
INSERT INTO `sys_am_relationship` VALUES ('336ab7e61db811e7a7ba0a0027000000', 'c60e81540eb011e7860d0a0027000000', 'a7168a091b6611e7ad640a0027000000');
INSERT INTO `sys_am_relationship` VALUES ('3b888dcf1db811e7a7ba0a0027000000', 'c60e81540eb011e7860d0a0027000000', 'f0b1539d1b6611e7ad640a0027000000');

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
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  KEY `system_id` (`system_id`) USING BTREE,
  CONSTRAINT `sys_component_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `sys_system` (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_component
-- ----------------------------
INSERT INTO `sys_component` VALUES ('00257f73152e11e7ad640a0027000000', '系统4的组件1', 'test', '127.0.0.1', '8080', '1', '5d9195320f9411e7860d0a0027000000', 'test', '2017-03-30 17:48:14.000000');
INSERT INTO `sys_component` VALUES ('16acbbf6151b11e7ad640a0027000000', '高尚的电脑', 'webgate', 'tst.gs.com', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'webgate', '2017-03-30 15:32:52.000000');
INSERT INTO `sys_component` VALUES ('2e58c3691aa911e7ad640a0027000000', '门户权限中心新', 'webgate', '127.0.0.1', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'webgate', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_component` VALUES ('453740fd150c11e7ad640a0027000000', 'ERP', 'editorial', '127.0.0.1', '8080', '1', '376f4f95150911e7ad640a0027000000', 'editorial', '2017-03-30 13:46:47.000000');
INSERT INTO `sys_component` VALUES ('644b5970263111e7830e0a0027000000', '22', '11', '34', '5', '1', '0ea031700f9211e7860d0a0027000000', '11', '2017-04-21 09:25:23.000000');
INSERT INTO `sys_component` VALUES ('ada5931c263111e7830e0a0027000000', '12', '1', '3123', '123', '2', '376f4f95150911e7ad640a0027000000', '1', '2017-04-21 09:27:26.000000');
INSERT INTO `sys_component` VALUES ('c60ed0870eb011e7860d0a0027000000', '门户权限中心', 'webgate', '192.168.0.109', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'webgate', '2017-03-22 11:36:38.000000');

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `fun_id` varchar(32) NOT NULL COMMENT '功能ID',
  `fun_name` varchar(50) DEFAULT NULL COMMENT '功能名称',
  `fun_code` varchar(20) DEFAULT NULL COMMENT '功能编号',
  `fun_path` varchar(255) DEFAULT NULL COMMENT '功能路径',
  `page_id` varchar(32) DEFAULT NULL,
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`fun_id`),
  KEY `page_id` (`page_id`) USING BTREE,
  CONSTRAINT `sys_function_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `sys_page` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES ('0e749e64264311e7830e0a0027000000', '123', '123123', null, 'a66fa65a1e8211e7a7ba0a0027000000', '2017-04-21 11:31:49.000000');
INSERT INTO `sys_function` VALUES ('4d28748c1f4f11e7a7ba0a0027000000', '新增', 'add', null, '3a3561861f4f11e7a7ba0a0027000000', '2017-04-12 15:11:40.000000');
INSERT INTO `sys_function` VALUES ('584d14331f4f11e7a7ba0a0027000000', '编辑', 'edit', null, '3a3561861f4f11e7a7ba0a0027000000', '2017-04-12 15:11:59.000000');
INSERT INTO `sys_function` VALUES ('5c3264c41e9111e7a7ba0a0027000000', '添加333', 'one', null, 'c17b11e01e8211e7a7ba0a0027000000', '2017-04-11 16:32:05.000000');
INSERT INTO `sys_function` VALUES ('6c04110f1e8911e7a7ba0a0027000000', '阿斯大法', 'test', null, 'a66fa65a1e8211e7a7ba0a0027000000', '2017-04-11 15:35:15.000000');

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `module_id` varchar(32) NOT NULL COMMENT '模块ID',
  `module_name` varchar(200) DEFAULT NULL COMMENT '模块名称',
  `module_i18n` varchar(10) DEFAULT NULL COMMENT '是否国际化',
  `module_link` text COMMENT '模块链接',
  `module_more` text COMMENT '模块更多链接',
  `module_icon` text COMMENT '模块图标',
  `module_must` decimal(10,0) DEFAULT NULL COMMENT '模块是否必须',
  `module_height` double DEFAULT NULL COMMENT '模块高度',
  `module_width` double DEFAULT NULL COMMENT '模块宽度',
  `component_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `component_id` (`component_id`) USING BTREE,
  CONSTRAINT `sys_module_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `sys_component` (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('847d60881b7311e7a7ba0a0027000000', '的吗需要的', null, '/pages/index', null, null, '2', '500', '700', null);
INSERT INTO `sys_module` VALUES ('a7168a091b6611e7ad640a0027000000', '3阿斯大法', null, 'http://192.168.0.109:8080/webgate/pages/account/form/index', null, null, '1', '500', '700', null);
INSERT INTO `sys_module` VALUES ('f0b1539d1b6611e7ad640a0027000000', '阿斯大法', null, 'http://192.168.0.109:8080/webgate/pages/account/form/index', null, null, '1', '400', '800', null);

-- ----------------------------
-- Table structure for sys_page
-- ----------------------------
DROP TABLE IF EXISTS `sys_page`;
CREATE TABLE `sys_page` (
  `page_id` varchar(32) NOT NULL COMMENT '页面ID',
  `page_name` varchar(255) DEFAULT NULL COMMENT '页面名称',
  `page_code` varchar(255) DEFAULT NULL COMMENT '页面编号',
  `page_path` varchar(255) DEFAULT NULL COMMENT '页面路径',
  `page_special` varchar(255) DEFAULT NULL COMMENT '特殊标识 用于相同页面路径标识',
  `resource_id` varchar(32) DEFAULT NULL,
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `resource_id` (`resource_id`) USING BTREE,
  CONSTRAINT `sys_page_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_page
-- ----------------------------
INSERT INTO `sys_page` VALUES ('3a3561861f4f11e7a7ba0a0027000000', '新建', 'add', '/views/sys/account/list.jsp', '', 'c616cd990eb011e7860d0a0027000000', '2017-04-12 15:11:08.000000');
INSERT INTO `sys_page` VALUES ('a66fa65a1e8211e7a7ba0a0027000000', '系统管理', 'test', '/views/sys/system/list.jsp', '', 'c616ecb20eb011e7860d0a0027000000', '2017-04-11 14:46:47.000000');
INSERT INTO `sys_page` VALUES ('c17b11e01e8211e7a7ba0a0027000000', '自行车v', 'zxcv', '/sys/INDEX.jsp', '', 'c616ecb20eb011e7860d0a0027000000', '2017-04-11 14:47:32.000000');
INSERT INTO `sys_page` VALUES ('d8e01485200e11e792980a0027000000', '阿斯大法22', 'asdf11', '/views/sys/system/list.jsp', '', 'c616ecb20eb011e7860d0a0027000000', '2017-04-13 14:02:58.000000');

-- ----------------------------
-- Table structure for sys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter`;
CREATE TABLE `sys_parameter` (
  `param_id` varchar(32) NOT NULL COMMENT '参数ID',
  `param_code` varchar(32) DEFAULT NULL COMMENT '参数编号',
  `param_val` varchar(64) DEFAULT NULL COMMENT '参数值',
  `param_isnull` decimal(10,0) DEFAULT NULL COMMENT '参数是否为空：1-允许 2-不允许',
  `resource_id` varchar(32) DEFAULT NULL COMMENT '所属资源',
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`param_id`),
  KEY `resource_id` (`resource_id`) USING BTREE,
  CONSTRAINT `sys_parameter_ibfk_1` FOREIGN KEY (`param_id`) REFERENCES `sys_resource` (`resource_id`),
  CONSTRAINT `sys_parameter_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_parameter
-- ----------------------------

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
  CONSTRAINT `sys_ra_relationship_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `sys_ra_relationship_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `sys_account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ra_relationship
-- ----------------------------
INSERT INTO `sys_ra_relationship` VALUES ('6b9241c0141c11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c60e81540eb011e7860d0a0027000000', '2017-03-29 09:09:53.000000', null);
INSERT INTO `sys_ra_relationship` VALUES ('9e9c937c145411e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '945c9ddc145411e7ad640a0027000000', '2017-03-29 15:52:11.000000', null);

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
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `system_id` (`system_id`) USING BTREE,
  KEY `component_id` (`component_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `sys_resource_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `sys_system` (`system_id`),
  CONSTRAINT `sys_resource_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `sys_component` (`component_id`),
  CONSTRAINT `sys_resource_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('052cabcb24cd11e79ee00a0027000000', '数据库', '010003', '0', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-19 14:54:23.000000');
INSERT INTO `sys_resource` VALUES ('1043a3cb24cc11e79ee00a0027000000', '对象生成', '010001', '0', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-19 14:47:32.000000');
INSERT INTO `sys_resource` VALUES ('1b5c08b1152e11e7ad640a0027000000', '菜单1001', '001001', '1', '2', null, null, '1', '1', null, '5d9195320f9411e7860d0a0027000000', '00257f73152e11e7ad640a0027000000', 'd7648564152d11e7ad640a0027000000', '2017-03-30 17:49:00.000000');
INSERT INTO `sys_resource` VALUES ('4e0c089324cc11e79ee00a0027000000', '生成方案', '001002', '0', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-19 14:49:16.000000');
INSERT INTO `sys_resource` VALUES ('6051a95c151b11e7ad640a0027000000', '两个tomcat', '006', 'webgate', '1', null, null, '1', '2', null, 'c60e9adc0eb011e7860d0a0027000000', '16acbbf6151b11e7ad640a0027000000', null, '2017-03-30 15:34:56.000000');
INSERT INTO `sys_resource` VALUES ('63fdd0d2151c11e7ad640a0027000000', '全路径', '006002', 'http://192.168.0.100:8080/webgate/pages/resource/form/index', '1', null, null, '1', '2', null, 'c60e9adc0eb011e7860d0a0027000000', null, '6051a95c151b11e7ad640a0027000000', '2017-03-30 15:42:11.000000');
INSERT INTO `sys_resource` VALUES ('75e485dc151b11e7ad640a0027000000', '不是全路径', '006001', '/pages/component/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '16acbbf6151b11e7ad640a0027000000', '6051a95c151b11e7ad640a0027000000', '2017-03-30 15:35:32.000000');
INSERT INTO `sys_resource` VALUES ('896d306215cf11e7ad640a0027000000', '2', '1', '3', '1', null, null, '1', '1', null, '376f4f95150911e7ad640a0027000000', '453740fd150c11e7ad640a0027000000', null, '2017-03-31 13:04:33.000000');
INSERT INTO `sys_resource` VALUES ('92ea2d071e8211e7a7ba0a0027000000', '测试', '001', '/pages/index', '1', null, null, '1', '1', null, '376f4f95150911e7ad640a0027000000', '453740fd150c11e7ad640a0027000000', '896d306215cf11e7ad640a0027000000', '2017-04-11 14:46:14.000000');
INSERT INTO `sys_resource` VALUES ('b1c6b412143311e7ad640a0027000000', '功能管理', '026007001', '/pages/function/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c616e3770eb011e7860d0a0027000000', '2017-03-29 11:56:30.000000');
INSERT INTO `sys_resource` VALUES ('bf141a1524ca11e79ee00a0027000000', '代码生成', '010', 'webgate', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', null, '2017-04-19 14:38:06.000000');
INSERT INTO `sys_resource` VALUES ('c60eeb990eb011e7860d0a0027000000', '系统管理', '026', '/webgate', '1', null, '26', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', null, '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c60f01fb0eb011e7860d0a0027000000', '系统信息', '026001', '/webgate', '1', null, '26001', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c60f08850eb011e7860d0a0027000000', '资源信息', '026002', '/pages/resource/form/index', '1', null, '26002', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616cd990eb011e7860d0a0027000000', '账户信息', '026003', '/pages/account/form/index', '1', null, '26003', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616d4c70eb011e7860d0a0027000000', '角色信息', '026004', '/pages/role/form/index', '1', null, '26004', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616d9a00eb011e7860d0a0027000000', '组件信息', '026005', '/pages/component/form/index', '1', null, '26005', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616deb30eb011e7860d0a0027000000', '模块信息', '026006', '/pages/module/form/index', '1', null, '26006', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616e3770eb011e7860d0a0027000000', '功能信息', '026007', '/pages/function/form/index', '1', null, '26007', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616e82f0eb011e7860d0a0027000000', '三级菜单', '026001001', '/pages/system/form/index', '1', null, '26001', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c60f01fb0eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('c616ecb20eb011e7860d0a0027000000', '一级菜单', '020', '/pages/system/form/index', '1', null, '20', '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', null, '2017-03-22 11:36:38.000000');
INSERT INTO `sys_resource` VALUES ('d7648564152d11e7ad640a0027000000', '系统4-菜单1', '001', '0', '2', null, null, '1', '2', null, '5d9195320f9411e7860d0a0027000000', null, null, '2017-03-30 17:47:06.000000');
INSERT INTO `sys_resource` VALUES ('ec06627e152d11e7ad640a0027000000', '系统4-菜单2', '002', '000', '2', null, null, '1', '2', null, '5d9195320f9411e7860d0a0027000000', null, null, '2017-03-30 17:47:40.000000');

-- ----------------------------
-- Table structure for sys_rf_relationship
-- ----------------------------
DROP TABLE IF EXISTS `sys_rf_relationship`;
CREATE TABLE `sys_rf_relationship` (
  `r_rf_id` varchar(32) NOT NULL COMMENT '角色和功能关系ID',
  `role_id` varchar(32) DEFAULT NULL,
  `fun_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`r_rf_id`),
  KEY `fun_id` (`fun_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `sys_rf_relationship_ibfk_1` FOREIGN KEY (`fun_id`) REFERENCES `sys_function` (`fun_id`),
  CONSTRAINT `sys_rf_relationship_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rf_relationship
-- ----------------------------
INSERT INTO `sys_rf_relationship` VALUES ('3cfd7062234111e795830a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '6c04110f1e8911e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('4b3d98911e9211e7a7ba0a0027000000', 'c61744390eb011e7860d0a0027000000', '6c04110f1e8911e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('66d40ba21e9111e7a7ba0a0027000000', '3e4fb90a152e11e7ad640a0027000000', '5c3264c41e9111e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('66dcbc4a1e9111e7a7ba0a0027000000', '7719fa7c138b11e7ad640a0027000000', '5c3264c41e9111e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('66e131ef1e9111e7a7ba0a0027000000', 'c620f3150eb011e7860d0a0027000000', '5c3264c41e9111e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('76ca7b6920f711e795830a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '584d14331f4f11e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('7b38faae258d11e78dd20a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '4d28748c1f4f11e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('8dee647c1e9b11e7a7ba0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '5c3264c41e9111e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('9d3330581e9311e7a7ba0a0027000000', '3e4fb90a152e11e7ad640a0027000000', '6c04110f1e8911e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('9d39c5dc1e9311e7a7ba0a0027000000', '7719fa7c138b11e7ad640a0027000000', '6c04110f1e8911e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('9d3e8d3f1e9311e7a7ba0a0027000000', 'c620f3150eb011e7860d0a0027000000', '6c04110f1e8911e7a7ba0a0027000000');
INSERT INTO `sys_rf_relationship` VALUES ('9d4fe97c1e9311e7a7ba0a0027000000', 'c617481e0eb011e7860d0a0027000000', '6c04110f1e8911e7a7ba0a0027000000');

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
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `sys_system` (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('3e4fb90a152e11e7ad640a0027000000', '系统4-角色1', '系统4-角色1', '2', '5d9195320f9411e7860d0a0027000000', '2017-03-30 17:49:58.000000', null);
INSERT INTO `sys_role` VALUES ('7719fa7c138b11e7ad640a0027000000', '22', '22', '2', '0ea031700f9211e7860d0a0027000000', '2017-03-28 15:52:16.000000', null);
INSERT INTO `sys_role` VALUES ('c60eb4d20eb011e7860d0a0027000000', 'webgate', null, '1', 'c60e9adc0eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000', null);
INSERT INTO `sys_role` VALUES ('c61744390eb011e7860d0a0027000000', '测试1', null, '1', 'c60e9adc0eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000', null);
INSERT INTO `sys_role` VALUES ('c617481e0eb011e7860d0a0027000000', '测试2', null, '1', 'c60e9adc0eb011e7860d0a0027000000', '2017-03-22 11:36:38.000000', null);
INSERT INTO `sys_role` VALUES ('c620f3150eb011e7860d0a0027000000', '测试3', null, '1', 'c60e9adc0eb011e7860d0a0027000000', '2017-03-22 11:36:39.000000', null);

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

-- ----------------------------
-- Records of sys_rr_relationship
-- ----------------------------
INSERT INTO `sys_rr_relationship` VALUES ('0ae6c8c524cd11e79ee00a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '052cabcb24cd11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('19f5f45224cc11e79ee00a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'bf141a1524ca11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('21aaa73524cc11e79ee00a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '1043a3cb24cc11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('2beef5d715cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616d4c70eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('36fbca7f15cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '6051a95c151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('37079f4e15cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '63fdd0d2151c11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('3710ad3a15cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '75e485dc151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('371d541f15cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c60f01fb0eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('3722accd15cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616e82f0eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('372689b615cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616cd990eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('372bf81615cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616d9a00eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('3730b4bf15cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616deb30eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('37342e0015cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616e3770eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('37384a6515cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'b1c6b412143311e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('52977b7a24cc11e79ee00a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '4e0c089324cc11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('571fb06715d911e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '6051a95c151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('5726f1a615d911e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '63fdd0d2151c11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('57314d7c15d911e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '75e485dc151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('9ae7135d15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c60f01fb0eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('9aff5c0915da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616e82f0eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('a2ad787c15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('a2b6e57e15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616e3770eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('a2bc998d15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'b1c6b412143311e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('c61724f10eb011e7860d0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('c6172e930eb011e7860d0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c60f08850eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d26a8bbe15d911e7ad640a0027000000', 'c61744390eb011e7860d0a0027000000', '6051a95c151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d270d03f15d911e7ad640a0027000000', 'c61744390eb011e7860d0a0027000000', '63fdd0d2151c11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d27be33715d911e7ad640a0027000000', 'c61744390eb011e7860d0a0027000000', '75e485dc151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d27ff15615d911e7ad640a0027000000', 'c61744390eb011e7860d0a0027000000', 'c616ecb20eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d95f21ba15d911e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c60f08850eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d965663815d911e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616cd990eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d96f111915d911e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616d4c70eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d979cc5715d911e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616d9a00eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('d987d7a015d911e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616deb30eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('ded3bd6e20f411e795830a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616ecb20eb011e7860d0a0027000000');

-- ----------------------------
-- Table structure for sys_system
-- ----------------------------
DROP TABLE IF EXISTS `sys_system`;
CREATE TABLE `sys_system` (
  `system_id` varchar(32) NOT NULL COMMENT '系统ID',
  `system_name` varchar(50) DEFAULT NULL COMMENT '系统名称',
  `system_code` varchar(20) DEFAULT NULL COMMENT '系统编号',
  `system_status` decimal(10,0) DEFAULT NULL COMMENT '系统状态：1-在用 2-停用 3-废弃',
  `inserttime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_system
-- ----------------------------
INSERT INTO `sys_system` VALUES ('0ea031700f9211e7860d0a0027000000', '系统16', 'one5', '2', '2017-03-23 14:29:15.000000');
INSERT INTO `sys_system` VALUES ('376f4f95150911e7ad640a0027000000', 'ERP3', 'editorial', '1', '2017-03-30 13:24:56.000000');
INSERT INTO `sys_system` VALUES ('5d9195320f9411e7860d0a0027000000', '系统33', 'four11', '2', '2017-03-23 14:45:46.000000');
INSERT INTO `sys_system` VALUES ('c60e9adc0eb011e7860d0a0027000000', '英捷特门户权限控制系统', 'webgate', '1', '2017-03-22 11:36:38.000000');
