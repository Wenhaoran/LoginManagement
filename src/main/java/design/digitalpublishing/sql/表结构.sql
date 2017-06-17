/*
design 代码表结构设计  v0.1


数据库类型		      : MYSQL

Date: 2017-03-14 13:45:52
*/

-- design_db	数据库连接
-- ----------------------------
-- Table structure for design_db
-- ----------------------------
DROP TABLE IF EXISTS `design_db`;
CREATE TABLE `design_db` (
  `db_id` varchar(32) NOT NULL COMMENT '数据库连接ID',
  
  `db_code` varchar(32) DEFAULT NULL COMMENT '编号',
  `db_name` varchar(64) DEFAULT NULL COMMENT '连接名称',
  `db_address` varchar(64) DEFAULT NULL COMMENT '地址',
  `db_port` varchar(64) DEFAULT NULL COMMENT '端口',
  `db_dbname` varchar(64) DEFAULT NULL COMMENT '数据库名称',
  `db_username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `db_password` varchar(64) DEFAULT NULL COMMENT '密码',
  
  `create_id` varchar(64) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `update_id` varchar(64) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL COMMENT '状态：1-在用 2-停用',
  PRIMARY KEY (`db_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

