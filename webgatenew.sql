/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : webgatenew

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-17 09:40:20
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
INSERT INTO `cache_crr` VALUES ('006fc6d72baf11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 09:07:04.000000');
INSERT INTO `cache_crr` VALUES ('016e0222384611e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:38:18.000000');
INSERT INTO `cache_crr` VALUES ('01e2790a309a11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 15:19:25.000000');
INSERT INTO `cache_crr` VALUES ('040cfcb2386011e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:44:29.000000');
INSERT INTO `cache_crr` VALUES ('047738003b6b11e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 09:40:48.000000');
INSERT INTO `cache_crr` VALUES ('0498b5c1309a11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 15:19:30.000000');
INSERT INTO `cache_crr` VALUES ('06c78827386d11e7a80b201a065c45d9', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 14:16:40.000000');
INSERT INTO `cache_crr` VALUES ('072cc7982baf11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 09:07:15.000000');
INSERT INTO `cache_crr` VALUES ('0a656d4f298211e78ee80a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 14:40:15.000000');
INSERT INTO `cache_crr` VALUES ('0a6e0e25412211e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 16:13:25.000000');
INSERT INTO `cache_crr` VALUES ('0b8400783b6811e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 09:19:31.000000');
INSERT INTO `cache_crr` VALUES ('0cd869f02f2311e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 18:35:25.000000');
INSERT INTO `cache_crr` VALUES ('0d46257f3c3b11e7a72c0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-19 10:29:57.000000');
INSERT INTO `cache_crr` VALUES ('0da80a4c3c7611e7a72c0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-19 17:32:18.000000');
INSERT INTO `cache_crr` VALUES ('0dc46a324fdc11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 10:00:15.000000');
INSERT INTO `cache_crr` VALUES ('0f35e52c386d11e7a80b201a065c45d9', 'webgate', '/pages/module/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/module/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 14:16:54.000000');
INSERT INTO `cache_crr` VALUES ('0fccda73384711e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:45:51.000000');
INSERT INTO `cache_crr` VALUES ('0feb2c26309b11e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 15:26:58.000000');
INSERT INTO `cache_crr` VALUES ('102024f036e811e784970a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 15:53:18.000000');
INSERT INTO `cache_crr` VALUES ('12077a2b362711e786990a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 16:51:47.000000');
INSERT INTO `cache_crr` VALUES ('12c0de61387a11e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:50:04.000000');
INSERT INTO `cache_crr` VALUES ('13098f4e384711e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:45:57.000000');
INSERT INTO `cache_crr` VALUES ('13800c1040e811e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 09:18:30.000000');
INSERT INTO `cache_crr` VALUES ('1502588b40ed11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 09:54:20.000000');
INSERT INTO `cache_crr` VALUES ('1610787230ac11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 17:28:49.000000');
INSERT INTO `cache_crr` VALUES ('162abe96289b11e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 11:06:58.000000');
INSERT INTO `cache_crr` VALUES ('163747383e8b11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-22 09:07:52.000000');
INSERT INTO `cache_crr` VALUES ('1661892f289b11e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 11:06:58.000000');
INSERT INTO `cache_crr` VALUES ('182df96e289b11e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 11:07:01.000000');
INSERT INTO `cache_crr` VALUES ('19c52e362c8211e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-29 10:18:09.000000');
INSERT INTO `cache_crr` VALUES ('1bbcd9c84c1611e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-08 14:45:47.000000');
INSERT INTO `cache_crr` VALUES ('1be4c2c12f8f11e783f40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 07:28:54.000000');
INSERT INTO `cache_crr` VALUES ('1c34244b2f2311e7bcd40a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 18:35:50.000000');
INSERT INTO `cache_crr` VALUES ('1da48ce54fa611e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 03:34:09.000000');
INSERT INTO `cache_crr` VALUES ('1dee382d362711e786990a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 16:52:07.000000');
INSERT INTO `cache_crr` VALUES ('1e9c1691516411e79a362c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-15 08:46:51.000000');
INSERT INTO `cache_crr` VALUES ('1e9da9522f8f11e783f40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 07:28:59.000000');
INSERT INTO `cache_crr` VALUES ('1ee0dfb0524b11e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 12:20:24.000000');
INSERT INTO `cache_crr` VALUES ('200c8dd74cb111e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-09 09:15:28.000000');
INSERT INTO `cache_crr` VALUES ('2036432830ac11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 17:29:06.000000');
INSERT INTO `cache_crr` VALUES ('2066d0b3354b11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:37:15.000000');
INSERT INTO `cache_crr` VALUES ('216ee609355211e798820a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 15:27:24.000000');
INSERT INTO `cache_crr` VALUES ('217c947730ac11e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 17:29:09.000000');
INSERT INTO `cache_crr` VALUES ('21c76fa03afb11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:19:48.000000');
INSERT INTO `cache_crr` VALUES ('222fd66d4b4511e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 13:49:53.000000');
INSERT INTO `cache_crr` VALUES ('2250dc8641b911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-26 10:14:58.000000');
INSERT INTO `cache_crr` VALUES ('2252c894354b11e798820a0027000000', 'design', '/pages/ftp/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/ftp/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:37:18.000000');
INSERT INTO `cache_crr` VALUES ('235123a9307611e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 11:02:39.000000');
INSERT INTO `cache_crr` VALUES ('23adf5b2385011e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:50:50.000000');
INSERT INTO `cache_crr` VALUES ('25a8bca0307611e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 11:02:42.000000');
INSERT INTO `cache_crr` VALUES ('25c62e783e9b11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-22 11:02:50.000000');
INSERT INTO `cache_crr` VALUES ('2616b444385011e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:50:54.000000');
INSERT INTO `cache_crr` VALUES ('262946243e9e11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-22 11:24:19.000000');
INSERT INTO `cache_crr` VALUES ('270d3093404011e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 13:16:28.000000');
INSERT INTO `cache_crr` VALUES ('27191cbe3fb711e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 20:55:47.000000');
INSERT INTO `cache_crr` VALUES ('271da4f545d311e7a6e50a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-31 15:31:25.000000');
INSERT INTO `cache_crr` VALUES ('27c13f93403f11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 13:09:19.000000');
INSERT INTO `cache_crr` VALUES ('288772ed295911e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:47:36.000000');
INSERT INTO `cache_crr` VALUES ('2a3c6c1b307b11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 11:38:38.000000');
INSERT INTO `cache_crr` VALUES ('2a706039289611e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:31:44.000000');
INSERT INTO `cache_crr` VALUES ('2aa3d3ac289611e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:31:45.000000');
INSERT INTO `cache_crr` VALUES ('2b44a84b295911e78ee80a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:47:41.000000');
INSERT INTO `cache_crr` VALUES ('2c1ae47e307b11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 11:38:41.000000');
INSERT INTO `cache_crr` VALUES ('2d6bcc3e526711e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 15:41:14.000000');
INSERT INTO `cache_crr` VALUES ('2e7d90884ff211e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 12:38:39.000000');
INSERT INTO `cache_crr` VALUES ('2f3ad97a28b511e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 14:13:46.000000');
INSERT INTO `cache_crr` VALUES ('2f8fef71385111e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:58:19.000000');
INSERT INTO `cache_crr` VALUES ('2f92ce0c385d11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:24:13.000000');
INSERT INTO `cache_crr` VALUES ('2f93b0ff28b511e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 14:13:47.000000');
INSERT INTO `cache_crr` VALUES ('2f98b5303fae11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 19:51:37.000000');
INSERT INTO `cache_crr` VALUES ('2fa62971473a11e79cb60a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-02 10:21:29.000000');
INSERT INTO `cache_crr` VALUES ('30483955289511e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:24:45.000000');
INSERT INTO `cache_crr` VALUES ('308140af289511e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:24:45.000000');
INSERT INTO `cache_crr` VALUES ('315400f428b511e7830e0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 14:13:50.000000');
INSERT INTO `cache_crr` VALUES ('3176a392385d11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:24:17.000000');
INSERT INTO `cache_crr` VALUES ('319551cf385111e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:58:23.000000');
INSERT INTO `cache_crr` VALUES ('31ae295d4b2e11e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 11:05:41.000000');
INSERT INTO `cache_crr` VALUES ('31b3a108356211e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 17:22:23.000000');
INSERT INTO `cache_crr` VALUES ('3239f422289511e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:24:48.000000');
INSERT INTO `cache_crr` VALUES ('333fac314f6a11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 20:25:17.000000');
INSERT INTO `cache_crr` VALUES ('34ecf22a3faf11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 19:58:55.000000');
INSERT INTO `cache_crr` VALUES ('360d82e92fce11e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 15:00:36.000000');
INSERT INTO `cache_crr` VALUES ('36c397aa289611e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:32:05.000000');
INSERT INTO `cache_crr` VALUES ('37280af7356211e798820a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 17:22:32.000000');
INSERT INTO `cache_crr` VALUES ('38ce12e7312f11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 09:07:32.000000');
INSERT INTO `cache_crr` VALUES ('39102eb52fd511e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 15:50:48.000000');
INSERT INTO `cache_crr` VALUES ('395984573adf11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 17:00:04.000000');
INSERT INTO `cache_crr` VALUES ('3a4412cf296411e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 11:06:50.000000');
INSERT INTO `cache_crr` VALUES ('3abd545b386311e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 13:07:29.000000');
INSERT INTO `cache_crr` VALUES ('3af67eab4b2611e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 10:08:41.000000');
INSERT INTO `cache_crr` VALUES ('3b12e2624fde11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 10:15:50.000000');
INSERT INTO `cache_crr` VALUES ('3bac40802a5b11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-26 16:34:56.000000');
INSERT INTO `cache_crr` VALUES ('3ca91b7e296411e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 11:06:54.000000');
INSERT INTO `cache_crr` VALUES ('3d099b2d36fa11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 18:03:25.000000');
INSERT INTO `cache_crr` VALUES ('3d71396b2a5b11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-26 16:34:59.000000');
INSERT INTO `cache_crr` VALUES ('3d9897db500711e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 15:09:24.000000');
INSERT INTO `cache_crr` VALUES ('3e02645d4f5811e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 18:16:43.000000');
INSERT INTO `cache_crr` VALUES ('3e837f88386311e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 13:07:35.000000');
INSERT INTO `cache_crr` VALUES ('3e8f4231312f11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 09:07:41.000000');
INSERT INTO `cache_crr` VALUES ('3eedc6c9524011e79a362c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 11:02:34.000000');
INSERT INTO `cache_crr` VALUES ('3fa8cf8b3fb611e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 20:49:19.000000');
INSERT INTO `cache_crr` VALUES ('4147a3624f5b11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 18:38:17.000000');
INSERT INTO `cache_crr` VALUES ('41fc213f36fa11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 18:03:33.000000');
INSERT INTO `cache_crr` VALUES ('420c5b524fe311e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 10:51:49.000000');
INSERT INTO `cache_crr` VALUES ('422c7626523e11e79a362c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 10:48:21.000000');
INSERT INTO `cache_crr` VALUES ('423d1392352511e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 10:06:12.000000');
INSERT INTO `cache_crr` VALUES ('42ddc0203ae011e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 17:07:30.000000');
INSERT INTO `cache_crr` VALUES ('43d2987e410f11e78edf0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 13:59:01.000000');
INSERT INTO `cache_crr` VALUES ('4401b6044f5e11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 18:59:50.000000');
INSERT INTO `cache_crr` VALUES ('44e07357384411e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:25:52.000000');
INSERT INTO `cache_crr` VALUES ('45530cb142b311e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-27 16:05:31.000000');
INSERT INTO `cache_crr` VALUES ('45c3b0dc289e11e7830e0a0027000000', 'webgate', '/pages/component/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/component/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 11:29:47.000000');
INSERT INTO `cache_crr` VALUES ('463e35d73b0411e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 21:25:15.000000');
INSERT INTO `cache_crr` VALUES ('467660a7289e11e7830e0a0027000000', 'webgate', '/pages/role/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/role/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 11:29:48.000000');
INSERT INTO `cache_crr` VALUES ('4700e11e50da11e7b3252c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 16:20:07.000000');
INSERT INTO `cache_crr` VALUES ('47f2d9e636f911e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:56:33.000000');
INSERT INTO `cache_crr` VALUES ('48813715384411e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:25:58.000000');
INSERT INTO `cache_crr` VALUES ('49b0a204509a11e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 08:42:03.000000');
INSERT INTO `cache_crr` VALUES ('49da430c36f911e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:56:37.000000');
INSERT INTO `cache_crr` VALUES ('49fb4a064b2d11e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 10:59:13.000000');
INSERT INTO `cache_crr` VALUES ('4a438ea5473111e79cb60a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-02 09:17:48.000000');
INSERT INTO `cache_crr` VALUES ('4a54068a411911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 15:10:48.000000');
INSERT INTO `cache_crr` VALUES ('4aae64e4387911e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:44:29.000000');
INSERT INTO `cache_crr` VALUES ('4b176b21384e11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:37:37.000000');
INSERT INTO `cache_crr` VALUES ('4cfc1166384e11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:37:40.000000');
INSERT INTO `cache_crr` VALUES ('4d6002e2473111e79cb60a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-02 09:17:53.000000');
INSERT INTO `cache_crr` VALUES ('4d8a919e30a811e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 17:01:45.000000');
INSERT INTO `cache_crr` VALUES ('4e453e0330a811e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 17:01:46.000000');
INSERT INTO `cache_crr` VALUES ('4f02223d3b0f11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 22:44:14.000000');
INSERT INTO `cache_crr` VALUES ('4fe38c9f42a311e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-27 14:11:16.000000');
INSERT INTO `cache_crr` VALUES ('50fe17f02f9e11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 09:17:45.000000');
INSERT INTO `cache_crr` VALUES ('51c1a4113afc11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:28:18.000000');
INSERT INTO `cache_crr` VALUES ('52329bf3385011e7bf640a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:52:08.000000');
INSERT INTO `cache_crr` VALUES ('5274884a387411e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:08:54.000000');
INSERT INTO `cache_crr` VALUES ('52c8fb23352711e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 10:20:58.000000');
INSERT INTO `cache_crr` VALUES ('52f2fd954b3111e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 11:28:05.000000');
INSERT INTO `cache_crr` VALUES ('5373df75354511e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 13:55:43.000000');
INSERT INTO `cache_crr` VALUES ('542c92e0386611e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 13:29:40.000000');
INSERT INTO `cache_crr` VALUES ('55498ba2352711e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 10:21:03.000000');
INSERT INTO `cache_crr` VALUES ('55550712295911e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:48:51.000000');
INSERT INTO `cache_crr` VALUES ('56881110352711e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 10:21:05.000000');
INSERT INTO `cache_crr` VALUES ('5695c2503afd11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:35:36.000000');
INSERT INTO `cache_crr` VALUES ('589df65e4fa411e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 03:21:29.000000');
INSERT INTO `cache_crr` VALUES ('591461b850cb11e7b3252c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 14:33:16.000000');
INSERT INTO `cache_crr` VALUES ('5a12966d385211e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:06:40.000000');
INSERT INTO `cache_crr` VALUES ('5bc5d0ee384c11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:23:46.000000');
INSERT INTO `cache_crr` VALUES ('5d7a3ccd385211e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:06:46.000000');
INSERT INTO `cache_crr` VALUES ('5dd8835a404611e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 14:00:57.000000');
INSERT INTO `cache_crr` VALUES ('5e002b08354911e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:24:39.000000');
INSERT INTO `cache_crr` VALUES ('5e58fe63384211e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:12:15.000000');
INSERT INTO `cache_crr` VALUES ('5eb17d2f509911e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 08:35:29.000000');
INSERT INTO `cache_crr` VALUES ('5ebb17f1289511e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:26:02.000000');
INSERT INTO `cache_crr` VALUES ('5edf54c0289511e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:26:03.000000');
INSERT INTO `cache_crr` VALUES ('5fa7d75b4f4f11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 17:13:14.000000');
INSERT INTO `cache_crr` VALUES ('5fbc564a384c11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:23:53.000000');
INSERT INTO `cache_crr` VALUES ('5ff84828526711e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 15:42:39.000000');
INSERT INTO `cache_crr` VALUES ('6030bc29354911e798820a0027000000', 'design', '/pages/ftp/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/ftp/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:24:43.000000');
INSERT INTO `cache_crr` VALUES ('606ce1ee289511e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:26:05.000000');
INSERT INTO `cache_crr` VALUES ('61d71d1746a911e79cb60a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-01 17:04:56.000000');
INSERT INTO `cache_crr` VALUES ('61ea6efe50a311e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 09:47:09.000000');
INSERT INTO `cache_crr` VALUES ('638c772a4f1b11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 11:01:07.000000');
INSERT INTO `cache_crr` VALUES ('64cd22cd384211e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:12:26.000000');
INSERT INTO `cache_crr` VALUES ('64d3c82b3adb11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 16:32:39.000000');
INSERT INTO `cache_crr` VALUES ('651c1edf2fde11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 16:56:27.000000');
INSERT INTO `cache_crr` VALUES ('674624652efc11e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 13:58:46.000000');
INSERT INTO `cache_crr` VALUES ('67587266295411e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:13:30.000000');
INSERT INTO `cache_crr` VALUES ('679c1830295411e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:13:30.000000');
INSERT INTO `cache_crr` VALUES ('67e07052384f11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:45:35.000000');
INSERT INTO `cache_crr` VALUES ('6898d1fb2fde11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 16:56:33.000000');
INSERT INTO `cache_crr` VALUES ('68a753083add11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 16:47:05.000000');
INSERT INTO `cache_crr` VALUES ('691e3ae04f4c11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 16:52:01.000000');
INSERT INTO `cache_crr` VALUES ('69df33bc35e811e786990a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 09:23:16.000000');
INSERT INTO `cache_crr` VALUES ('6aef79aa42b411e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-27 16:13:43.000000');
INSERT INTO `cache_crr` VALUES ('6c03c00d35e811e786990a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 09:23:20.000000');
INSERT INTO `cache_crr` VALUES ('6c460c653ae011e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 17:08:39.000000');
INSERT INTO `cache_crr` VALUES ('6c80c4092a5811e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-26 16:14:49.000000');
INSERT INTO `cache_crr` VALUES ('6cf6bd5d4f0b11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 09:06:51.000000');
INSERT INTO `cache_crr` VALUES ('6d492ee3500911e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 15:25:03.000000');
INSERT INTO `cache_crr` VALUES ('6d54bd7d384f11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:45:44.000000');
INSERT INTO `cache_crr` VALUES ('6d57c740403d11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 12:56:57.000000');
INSERT INTO `cache_crr` VALUES ('6d711c1c387511e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:16:49.000000');
INSERT INTO `cache_crr` VALUES ('6df074a5387611e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:23:59.000000');
INSERT INTO `cache_crr` VALUES ('6e877dc84fc511e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 07:18:19.000000');
INSERT INTO `cache_crr` VALUES ('6fbdf83e35fc11e786990a0027000000', 'design', '/pages/ftp/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/ftp/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 11:46:36.000000');
INSERT INTO `cache_crr` VALUES ('710a861135fc11e786990a0027000000', 'design', '/pages/time/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/time/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 11:46:38.000000');
INSERT INTO `cache_crr` VALUES ('71a54af5411811e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 15:04:44.000000');
INSERT INTO `cache_crr` VALUES ('71b92ad7295411e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:13:47.000000');
INSERT INTO `cache_crr` VALUES ('71baa0ed524511e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 11:39:46.000000');
INSERT INTO `cache_crr` VALUES ('72580d293b7111e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 10:26:50.000000');
INSERT INTO `cache_crr` VALUES ('73f4cdbb4b2c11e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 10:53:14.000000');
INSERT INTO `cache_crr` VALUES ('7526c0bc3faf11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 20:00:42.000000');
INSERT INTO `cache_crr` VALUES ('7543954e384111e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:05:44.000000');
INSERT INTO `cache_crr` VALUES ('779c67b4354b11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:39:41.000000');
INSERT INTO `cache_crr` VALUES ('77dca47b289611e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:33:54.000000');
INSERT INTO `cache_crr` VALUES ('77ede924384111e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:05:49.000000');
INSERT INTO `cache_crr` VALUES ('78468231289611e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:33:55.000000');
INSERT INTO `cache_crr` VALUES ('795fccd5354b11e798820a0027000000', 'design', '/pages/ftp/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/ftp/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:39:44.000000');
INSERT INTO `cache_crr` VALUES ('7a09ffe04f6611e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 19:58:37.000000');
INSERT INTO `cache_crr` VALUES ('7a4469ed525711e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 13:48:50.000000');
INSERT INTO `cache_crr` VALUES ('7a65cebb2bf011e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 16:55:46.000000');
INSERT INTO `cache_crr` VALUES ('7b074729297711e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 13:24:40.000000');
INSERT INTO `cache_crr` VALUES ('7b0cff28289611e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:33:59.000000');
INSERT INTO `cache_crr` VALUES ('7c149f124b3011e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 11:22:05.000000');
INSERT INTO `cache_crr` VALUES ('7c7ef2b02bf011e78ee80a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 16:55:49.000000');
INSERT INTO `cache_crr` VALUES ('7c98219c2fe511e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 17:47:13.000000');
INSERT INTO `cache_crr` VALUES ('7cb79506295a11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:57:07.000000');
INSERT INTO `cache_crr` VALUES ('7d6342a740e911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 09:28:37.000000');
INSERT INTO `cache_crr` VALUES ('7d837b0a387811e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:38:44.000000');
INSERT INTO `cache_crr` VALUES ('7e25e0a83ba111e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 16:10:45.000000');
INSERT INTO `cache_crr` VALUES ('7e2778f8297711e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 13:24:45.000000');
INSERT INTO `cache_crr` VALUES ('7e68b446295a11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:57:10.000000');
INSERT INTO `cache_crr` VALUES ('7efb41ba526611e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 15:36:21.000000');
INSERT INTO `cache_crr` VALUES ('7f8690ee349d11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 17:54:23.000000');
INSERT INTO `cache_crr` VALUES ('7f92187635eb11e786990a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 09:45:21.000000');
INSERT INTO `cache_crr` VALUES ('818e573f306711e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 09:17:55.000000');
INSERT INTO `cache_crr` VALUES ('828df6dc295411e7830e0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:14:16.000000');
INSERT INTO `cache_crr` VALUES ('82a33792297b11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 13:53:30.000000');
INSERT INTO `cache_crr` VALUES ('83858b9c50ab11e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 10:45:22.000000');
INSERT INTO `cache_crr` VALUES ('844b6a17297b11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 13:53:33.000000');
INSERT INTO `cache_crr` VALUES ('84ec0541501211e780dd2c56dc95bc1a', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 16:30:08.000000');
INSERT INTO `cache_crr` VALUES ('871851c9308f11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:04:24.000000');
INSERT INTO `cache_crr` VALUES ('872e42a4289211e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:05:42.000000');
INSERT INTO `cache_crr` VALUES ('876bff56289211e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:05:42.000000');
INSERT INTO `cache_crr` VALUES ('87edbf513e9a11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-22 10:58:25.000000');
INSERT INTO `cache_crr` VALUES ('881aa2903adc11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 16:40:48.000000');
INSERT INTO `cache_crr` VALUES ('88b72ee035eb11e786990a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 09:45:37.000000');
INSERT INTO `cache_crr` VALUES ('895b2d502a5811e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-26 16:15:38.000000');
INSERT INTO `cache_crr` VALUES ('896d9174308f11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:04:28.000000');
INSERT INTO `cache_crr` VALUES ('8a672f52403f11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 13:12:05.000000');
INSERT INTO `cache_crr` VALUES ('8ad1c20236b611e784970a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 09:58:49.000000');
INSERT INTO `cache_crr` VALUES ('8b33dd33316a11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 16:12:09.000000');
INSERT INTO `cache_crr` VALUES ('8b52bcb62efc11e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 13:59:47.000000');
INSERT INTO `cache_crr` VALUES ('8b8e34a8289211e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:05:49.000000');
INSERT INTO `cache_crr` VALUES ('8d52c420289511e7830e0a0027000000', 'webgate', '/pages/component/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/component/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:27:21.000000');
INSERT INTO `cache_crr` VALUES ('8ea6f70a36b611e784970a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 09:58:55.000000');
INSERT INTO `cache_crr` VALUES ('8f89937d385c11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:19:45.000000');
INSERT INTO `cache_crr` VALUES ('906bcfe22f0411e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 14:57:11.000000');
INSERT INTO `cache_crr` VALUES ('90d154f9405b11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 16:32:42.000000');
INSERT INTO `cache_crr` VALUES ('90f38383314511e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 11:47:28.000000');
INSERT INTO `cache_crr` VALUES ('910bd30d385211e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:08:13.000000');
INSERT INTO `cache_crr` VALUES ('917b74fd385c11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:19:48.000000');
INSERT INTO `cache_crr` VALUES ('928a135c2f0411e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 14:57:14.000000');
INSERT INTO `cache_crr` VALUES ('92fa18e5385211e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:08:16.000000');
INSERT INTO `cache_crr` VALUES ('93338f31267511e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 17:33:26.000000');
INSERT INTO `cache_crr` VALUES ('937eab7a2fe511e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 17:47:51.000000');
INSERT INTO `cache_crr` VALUES ('93c4fca72f9e11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 09:19:38.000000');
INSERT INTO `cache_crr` VALUES ('951751d4404f11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 15:06:55.000000');
INSERT INTO `cache_crr` VALUES ('9562d5ff299711e78ee80a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 17:14:28.000000');
INSERT INTO `cache_crr` VALUES ('958cdafe4b2911e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 10:32:41.000000');
INSERT INTO `cache_crr` VALUES ('95c7d9114b2b11e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 10:47:01.000000');
INSERT INTO `cache_crr` VALUES ('96cb7bac3e9b11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-22 11:05:59.000000');
INSERT INTO `cache_crr` VALUES ('9915cbd04b8811e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 21:52:48.000000');
INSERT INTO `cache_crr` VALUES ('9ab7d53c354911e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 14:26:21.000000');
INSERT INTO `cache_crr` VALUES ('9af91c3c387211e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 14:56:37.000000');
INSERT INTO `cache_crr` VALUES ('9b2b41f52bf111e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 17:03:50.000000');
INSERT INTO `cache_crr` VALUES ('9b7ff8363fb511e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 20:44:44.000000');
INSERT INTO `cache_crr` VALUES ('9c0bdc83349e11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 18:02:21.000000');
INSERT INTO `cache_crr` VALUES ('9c22ef572f9411e783f40a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 08:08:17.000000');
INSERT INTO `cache_crr` VALUES ('9c50857849f011e79cb60a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-05 21:12:18.000000');
INSERT INTO `cache_crr` VALUES ('9d712a4e2fc411e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 13:51:55.000000');
INSERT INTO `cache_crr` VALUES ('9eda6d8c289811e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:49:19.000000');
INSERT INTO `cache_crr` VALUES ('9f230b48289c11e7830e0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 11:17:58.000000');
INSERT INTO `cache_crr` VALUES ('9f25ffce289811e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:49:19.000000');
INSERT INTO `cache_crr` VALUES ('9f650c94526411e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 15:22:57.000000');
INSERT INTO `cache_crr` VALUES ('9f96b5c450d111e7b3252c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 15:18:11.000000');
INSERT INTO `cache_crr` VALUES ('9fe6aba7309611e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:55:12.000000');
INSERT INTO `cache_crr` VALUES ('a046c40a297d11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 14:08:39.000000');
INSERT INTO `cache_crr` VALUES ('a07acd11339011e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-08 09:49:45.000000');
INSERT INTO `cache_crr` VALUES ('a0862d16309111e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:19:25.000000');
INSERT INTO `cache_crr` VALUES ('a092568c524711e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 11:55:23.000000');
INSERT INTO `cache_crr` VALUES ('a0f52ee5289811e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:49:22.000000');
INSERT INTO `cache_crr` VALUES ('a16f0a062fc411e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 13:52:02.000000');
INSERT INTO `cache_crr` VALUES ('a199d9b250bc11e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 12:47:53.000000');
INSERT INTO `cache_crr` VALUES ('a22aea8d2f0511e7bcd40a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 15:04:50.000000');
INSERT INTO `cache_crr` VALUES ('a22de0bb297d11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 14:08:42.000000');
INSERT INTO `cache_crr` VALUES ('a2a2e967309611e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:55:17.000000');
INSERT INTO `cache_crr` VALUES ('a3a0b577345611e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 09:27:10.000000');
INSERT INTO `cache_crr` VALUES ('a3bb9c3e517b11e79a362c56dc95bc1a', 'webgate', '/pages/function/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/function/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-15 11:35:12.000000');
INSERT INTO `cache_crr` VALUES ('a3e989aa349e11e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 18:02:34.000000');
INSERT INTO `cache_crr` VALUES ('a4940a50384611e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:42:51.000000');
INSERT INTO `cache_crr` VALUES ('a4ac070d345611e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 09:27:12.000000');
INSERT INTO `cache_crr` VALUES ('a4e6e08d384411e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:28:33.000000');
INSERT INTO `cache_crr` VALUES ('a538a9334ce611e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-09 15:38:34.000000');
INSERT INTO `cache_crr` VALUES ('a54ea7083af611e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 19:47:44.000000');
INSERT INTO `cache_crr` VALUES ('a57d676d36f811e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:52:01.000000');
INSERT INTO `cache_crr` VALUES ('a6a8447250d811e7b3252c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 16:08:29.000000');
INSERT INTO `cache_crr` VALUES ('a6cbe0043b9111e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 14:17:22.000000');
INSERT INTO `cache_crr` VALUES ('a6fa3bce4c1611e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-08 14:49:40.000000');
INSERT INTO `cache_crr` VALUES ('a708e1af387711e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:32:44.000000');
INSERT INTO `cache_crr` VALUES ('a72f0110349e11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 18:02:40.000000');
INSERT INTO `cache_crr` VALUES ('a752e86b387511e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:18:26.000000');
INSERT INTO `cache_crr` VALUES ('a7fc1b3936f811e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:52:05.000000');
INSERT INTO `cache_crr` VALUES ('a862e568384611e7bf640a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:42:58.000000');
INSERT INTO `cache_crr` VALUES ('a887ef47384411e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:28:39.000000');
INSERT INTO `cache_crr` VALUES ('a916c6033add11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 16:48:53.000000');
INSERT INTO `cache_crr` VALUES ('aa66c4a4349e11e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-09 18:02:45.000000');
INSERT INTO `cache_crr` VALUES ('aae759ca2f4711e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 22:57:32.000000');
INSERT INTO `cache_crr` VALUES ('abb16622404211e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 13:34:29.000000');
INSERT INTO `cache_crr` VALUES ('ac0c3a8f4f7f11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 22:58:58.000000');
INSERT INTO `cache_crr` VALUES ('acfb470e500311e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 14:43:52.000000');
INSERT INTO `cache_crr` VALUES ('ad5c2142315b11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 14:25:44.000000');
INSERT INTO `cache_crr` VALUES ('ad87051b467611e784a40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-01 11:01:56.000000');
INSERT INTO `cache_crr` VALUES ('ae8a0b352f4711e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 22:57:38.000000');
INSERT INTO `cache_crr` VALUES ('ae9c9d454fa511e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 03:31:03.000000');
INSERT INTO `cache_crr` VALUES ('af0611fe315b11e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 14:25:47.000000');
INSERT INTO `cache_crr` VALUES ('b07708bb45d511e784a40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-31 15:49:33.000000');
INSERT INTO `cache_crr` VALUES ('b07b569f384311e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:21:43.000000');
INSERT INTO `cache_crr` VALUES ('b100492a385111e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:01:57.000000');
INSERT INTO `cache_crr` VALUES ('b125cffc386d11e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 14:21:26.000000');
INSERT INTO `cache_crr` VALUES ('b16c76c14fd411e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 09:07:33.000000');
INSERT INTO `cache_crr` VALUES ('b2269bb9384311e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:21:46.000000');
INSERT INTO `cache_crr` VALUES ('b29e353542bb11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-27 17:05:50.000000');
INSERT INTO `cache_crr` VALUES ('b2f06b9d267711e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 17:48:39.000000');
INSERT INTO `cache_crr` VALUES ('b313417a385111e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:02:00.000000');
INSERT INTO `cache_crr` VALUES ('b35545834fd411e780dd2c56dc95bc1a', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 09:07:37.000000');
INSERT INTO `cache_crr` VALUES ('b3dcc6c12a5711e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-26 16:09:39.000000');
INSERT INTO `cache_crr` VALUES ('b3e34956386d11e7a80b201a065c45d9', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 14:21:31.000000');
INSERT INTO `cache_crr` VALUES ('b3e515a33b7611e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 11:04:28.000000');
INSERT INTO `cache_crr` VALUES ('b46dc3112f2311e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 18:40:06.000000');
INSERT INTO `cache_crr` VALUES ('b5ae04292a5711e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-26 16:09:42.000000');
INSERT INTO `cache_crr` VALUES ('b64000d62bd111e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 13:15:31.000000');
INSERT INTO `cache_crr` VALUES ('b6776e7e3e9711e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-22 10:38:15.000000');
INSERT INTO `cache_crr` VALUES ('b69289503ae011e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 17:10:44.000000');
INSERT INTO `cache_crr` VALUES ('b75c00024b5a11e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 16:24:23.000000');
INSERT INTO `cache_crr` VALUES ('b7895d86267811e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 17:55:56.000000');
INSERT INTO `cache_crr` VALUES ('b7bf90ab267711e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 17:48:47.000000');
INSERT INTO `cache_crr` VALUES ('b85bff043af211e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 19:19:38.000000');
INSERT INTO `cache_crr` VALUES ('b8c7ea9e3afd11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:38:21.000000');
INSERT INTO `cache_crr` VALUES ('b95de07c3fb911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 21:14:12.000000');
INSERT INTO `cache_crr` VALUES ('b99bd659314511e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 11:48:36.000000');
INSERT INTO `cache_crr` VALUES ('bc0e6b87403511e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 12:01:53.000000');
INSERT INTO `cache_crr` VALUES ('bc29a18e316911e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 16:06:22.000000');
INSERT INTO `cache_crr` VALUES ('be40d520316911e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 16:06:25.000000');
INSERT INTO `cache_crr` VALUES ('bf696ca83b8e11e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 13:56:34.000000');
INSERT INTO `cache_crr` VALUES ('c0e797cb4b2f11e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 11:16:50.000000');
INSERT INTO `cache_crr` VALUES ('c2499c52402311e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 09:53:13.000000');
INSERT INTO `cache_crr` VALUES ('c2cbe89d4fdc11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 10:05:19.000000');
INSERT INTO `cache_crr` VALUES ('c382c55a309211e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:27:34.000000');
INSERT INTO `cache_crr` VALUES ('c3cf2b8a509511e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 08:09:40.000000');
INSERT INTO `cache_crr` VALUES ('c419f029297a11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 13:48:11.000000');
INSERT INTO `cache_crr` VALUES ('c476cec02bef11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 16:50:41.000000');
INSERT INTO `cache_crr` VALUES ('c50b10704b2911e78e740a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 10:34:01.000000');
INSERT INTO `cache_crr` VALUES ('c53110fd387311e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:04:57.000000');
INSERT INTO `cache_crr` VALUES ('c5418f20309211e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:27:37.000000');
INSERT INTO `cache_crr` VALUES ('c653c258297a11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 13:48:14.000000');
INSERT INTO `cache_crr` VALUES ('c6adb5cb296311e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 11:03:36.000000');
INSERT INTO `cache_crr` VALUES ('c6f909793b9811e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 15:08:23.000000');
INSERT INTO `cache_crr` VALUES ('c7268232316411e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 15:30:53.000000');
INSERT INTO `cache_crr` VALUES ('c8c7eb013fb611e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 20:53:09.000000');
INSERT INTO `cache_crr` VALUES ('c8e721e336f511e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:31:32.000000');
INSERT INTO `cache_crr` VALUES ('c9634c6a50c811e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 14:14:54.000000');
INSERT INTO `cache_crr` VALUES ('c9c4edc5296311e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 11:03:42.000000');
INSERT INTO `cache_crr` VALUES ('ca821f02523b11e79a362c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 10:30:40.000000');
INSERT INTO `cache_crr` VALUES ('cb0bce1536f511e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:31:35.000000');
INSERT INTO `cache_crr` VALUES ('cb5b06d82f0411e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 14:58:50.000000');
INSERT INTO `cache_crr` VALUES ('cbc9635d41be11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-26 10:55:30.000000');
INSERT INTO `cache_crr` VALUES ('cbf2fd15313111e798820a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 09:25:58.000000');
INSERT INTO `cache_crr` VALUES ('cc3c324f50aa11e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 10:40:14.000000');
INSERT INTO `cache_crr` VALUES ('ccf63baf3a0911e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-16 15:32:20.000000');
INSERT INTO `cache_crr` VALUES ('cd3c93752f0411e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 14:58:53.000000');
INSERT INTO `cache_crr` VALUES ('cef9940a385e11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:35:50.000000');
INSERT INTO `cache_crr` VALUES ('d06a10462fcc11e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 14:50:36.000000');
INSERT INTO `cache_crr` VALUES ('d097033a411811e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 15:07:24.000000');
INSERT INTO `cache_crr` VALUES ('d0ba965d385e11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 12:35:53.000000');
INSERT INTO `cache_crr` VALUES ('d104b8cb4f5b11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 18:42:19.000000');
INSERT INTO `cache_crr` VALUES ('d110faae351e11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 09:20:04.000000');
INSERT INTO `cache_crr` VALUES ('d12d4855267811e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-21 17:56:39.000000');
INSERT INTO `cache_crr` VALUES ('d19f45934fde11e780dd2c56dc95bc1a', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 10:20:03.000000');
INSERT INTO `cache_crr` VALUES ('d22dd4e84f6d11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 20:51:12.000000');
INSERT INTO `cache_crr` VALUES ('d2a5ba283a0911e7bf640a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-16 15:32:29.000000');
INSERT INTO `cache_crr` VALUES ('d37271db3fa911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 19:20:25.000000');
INSERT INTO `cache_crr` VALUES ('d5fb2934386411e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 13:18:59.000000');
INSERT INTO `cache_crr` VALUES ('d640135e3fa911e78edf0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 19:20:29.000000');
INSERT INTO `cache_crr` VALUES ('d6559eea385011e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:55:50.000000');
INSERT INTO `cache_crr` VALUES ('d7617c62309011e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:13:48.000000');
INSERT INTO `cache_crr` VALUES ('d77b245135f811e786990a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 11:20:52.000000');
INSERT INTO `cache_crr` VALUES ('d7aa860a4f3f11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 15:22:03.000000');
INSERT INTO `cache_crr` VALUES ('d834da41386411e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 13:19:03.000000');
INSERT INTO `cache_crr` VALUES ('d837dafd385011e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:55:53.000000');
INSERT INTO `cache_crr` VALUES ('d8f8d6c1501b11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 17:36:54.000000');
INSERT INTO `cache_crr` VALUES ('d97e50b9309011e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 14:13:52.000000');
INSERT INTO `cache_crr` VALUES ('d9d3b427405211e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 15:30:19.000000');
INSERT INTO `cache_crr` VALUES ('d9ec03de298e11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 16:11:57.000000');
INSERT INTO `cache_crr` VALUES ('d9ee7cb33aff11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:53:35.000000');
INSERT INTO `cache_crr` VALUES ('da8da43350b111e78b5f2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-14 11:30:45.000000');
INSERT INTO `cache_crr` VALUES ('dab0ae54517911e79a362c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-15 11:22:26.000000');
INSERT INTO `cache_crr` VALUES ('dad1defd2fc711e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 14:15:07.000000');
INSERT INTO `cache_crr` VALUES ('db0d4aa14b7111e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 19:10:01.000000');
INSERT INTO `cache_crr` VALUES ('db2e966c387511e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:19:53.000000');
INSERT INTO `cache_crr` VALUES ('dbb82eec411311e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 14:31:54.000000');
INSERT INTO `cache_crr` VALUES ('dcce49e8298e11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 16:12:02.000000');
INSERT INTO `cache_crr` VALUES ('dd5b12e630a611e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 16:51:27.000000');
INSERT INTO `cache_crr` VALUES ('dec532f62fc711e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 14:15:13.000000');
INSERT INTO `cache_crr` VALUES ('defce6ab3f8b11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 15:45:59.000000');
INSERT INTO `cache_crr` VALUES ('df626b0d2ed411e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 09:15:47.000000');
INSERT INTO `cache_crr` VALUES ('e003a0822bd111e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 13:16:41.000000');
INSERT INTO `cache_crr` VALUES ('e03ee5284f6111e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 19:25:41.000000');
INSERT INTO `cache_crr` VALUES ('e0919196307a11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 11:36:35.000000');
INSERT INTO `cache_crr` VALUES ('e151a79641c111e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-26 11:17:35.000000');
INSERT INTO `cache_crr` VALUES ('e29f499236eb11e784970a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 16:20:40.000000');
INSERT INTO `cache_crr` VALUES ('e2b83dbb2bf111e78ee80a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 17:05:50.000000');
INSERT INTO `cache_crr` VALUES ('e30457c439eb11e7bf640a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-16 11:58:12.000000');
INSERT INTO `cache_crr` VALUES ('e3eb359b2bf111e78ee80a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 17:05:52.000000');
INSERT INTO `cache_crr` VALUES ('e425a63b387811e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 15:41:37.000000');
INSERT INTO `cache_crr` VALUES ('e4554cdb309711e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 15:04:17.000000');
INSERT INTO `cache_crr` VALUES ('e5064f4c2ed411e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 09:15:56.000000');
INSERT INTO `cache_crr` VALUES ('e59150f92bf111e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 17:05:55.000000');
INSERT INTO `cache_crr` VALUES ('e615c997410911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 13:20:36.000000');
INSERT INTO `cache_crr` VALUES ('e6556612289511e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:29:50.000000');
INSERT INTO `cache_crr` VALUES ('e68926a5289511e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:29:50.000000');
INSERT INTO `cache_crr` VALUES ('e6f81e0b309711e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-04 15:04:21.000000');
INSERT INTO `cache_crr` VALUES ('e82cda45289511e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:29:53.000000');
INSERT INTO `cache_crr` VALUES ('e9caceb335f811e786990a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-11 11:21:23.000000');
INSERT INTO `cache_crr` VALUES ('eaa6cc632bb111e78ee80a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 09:27:56.000000');
INSERT INTO `cache_crr` VALUES ('ead759344f4c11e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-12 16:55:39.000000');
INSERT INTO `cache_crr` VALUES ('ebd1f58c36eb11e784970a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 16:20:55.000000');
INSERT INTO `cache_crr` VALUES ('ebdb94394b4511e78e740a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-07 13:55:31.000000');
INSERT INTO `cache_crr` VALUES ('ec2fc7cf2fce11e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 15:05:41.000000');
INSERT INTO `cache_crr` VALUES ('ecc2d6e6385111e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:03:37.000000');
INSERT INTO `cache_crr` VALUES ('ed4722cc412311e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 16:26:55.000000');
INSERT INTO `cache_crr` VALUES ('edc4b6873b0411e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 21:29:56.000000');
INSERT INTO `cache_crr` VALUES ('ee31aa20384d11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:35:01.000000');
INSERT INTO `cache_crr` VALUES ('ee6499972fce11e798820a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-03 15:05:45.000000');
INSERT INTO `cache_crr` VALUES ('eed8aa74385111e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 11:03:40.000000');
INSERT INTO `cache_crr` VALUES ('ef3466ec429711e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-27 12:49:51.000000');
INSERT INTO `cache_crr` VALUES ('ef9d4f0b473311e79cb60a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-02 09:36:44.000000');
INSERT INTO `cache_crr` VALUES ('efd697e8312f11e798820a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-05 09:12:39.000000');
INSERT INTO `cache_crr` VALUES ('f201b77b3f8b11e78edf0a0027000000', 'webgate', '/pages/resource/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/resource/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-23 15:46:31.000000');
INSERT INTO `cache_crr` VALUES ('f22b496f42b911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-27 16:53:18.000000');
INSERT INTO `cache_crr` VALUES ('f234612f352611e798820a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-10 10:18:16.000000');
INSERT INTO `cache_crr` VALUES ('f425ec602bef11e78ee80a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-28 16:52:01.000000');
INSERT INTO `cache_crr` VALUES ('f4c31653295411e7830e0a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 09:17:28.000000');
INSERT INTO `cache_crr` VALUES ('f4cb8118384d11e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 10:35:12.000000');
INSERT INTO `cache_crr` VALUES ('f5f709a7411811e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 15:08:26.000000');
INSERT INTO `cache_crr` VALUES ('f6920fba3afe11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:47:14.000000');
INSERT INTO `cache_crr` VALUES ('f694e009289411e7830e0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:23:08.000000');
INSERT INTO `cache_crr` VALUES ('f6ca0db8289411e7830e0a0027000000', 'webgate', '/pages/account/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/account/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:23:08.000000');
INSERT INTO `cache_crr` VALUES ('f6dc8d9b36f611e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:39:58.000000');
INSERT INTO `cache_crr` VALUES ('f6ef0c573c3a11e7a72c0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-19 10:29:20.000000');
INSERT INTO `cache_crr` VALUES ('f782dc1a401c11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-24 09:04:36.000000');
INSERT INTO `cache_crr` VALUES ('f801c6ad4fb511e780dd2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-13 05:27:38.000000');
INSERT INTO `cache_crr` VALUES ('f86bca6b386c11e7a80b201a065c45d9', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 14:16:16.000000');
INSERT INTO `cache_crr` VALUES ('f8c8d90e36f611e7bf640a0027000000', 'design', '/pages/xls/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/xls/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-12 17:40:02.000000');
INSERT INTO `cache_crr` VALUES ('f9ee69f7289411e7830e0a0027000000', 'design', '/pages/dbconn/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/dbconn/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-24 10:23:13.000000');
INSERT INTO `cache_crr` VALUES ('fa09718b411911e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 15:15:43.000000');
INSERT INTO `cache_crr` VALUES ('fa0cdadc40fa11e78edf0a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-25 11:33:48.000000');
INSERT INTO `cache_crr` VALUES ('fa2254b82f0211e7bcd40a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 14:45:49.000000');
INSERT INTO `cache_crr` VALUES ('fa91580d525611e7ad2e2c56dc95bc1a', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-16 13:45:16.000000');
INSERT INTO `cache_crr` VALUES ('fceacb3e2f0211e7bcd40a0027000000', 'design', '/pages/des/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/des/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-02 14:45:54.000000');
INSERT INTO `cache_crr` VALUES ('fd014b24297d11e78ee80a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 14:11:15.000000');
INSERT INTO `cache_crr` VALUES ('fdfacd1d3afd11e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-17 20:40:17.000000');
INSERT INTO `cache_crr` VALUES ('fe2d8627384511e7bf640a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-14 09:38:12.000000');
INSERT INTO `cache_crr` VALUES ('fe5704ca517b11e79a362c56dc95bc1a', 'webgate', '/pages/system/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/system/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-06-15 11:37:44.000000');
INSERT INTO `cache_crr` VALUES ('ff1076e8297d11e78ee80a0027000000', 'design', '/pages/obj/form/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/design/pages/obj/form/indexc60eb4d20eb011e7860d0a0027000000', '2017-04-25 14:11:18.000000');
INSERT INTO `cache_crr` VALUES ('ffab9fbc3b7311e78db10a0027000000', 'webgate', '/pages/index', 'c60eb4d20eb011e7860d0a0027000000', 'res/webgate/pages/indexc60eb4d20eb011e7860d0a0027000000', '2017-05-18 10:45:06.000000');

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
INSERT INTO `sys_component` VALUES ('16acbbf6151b11e7ad640a0027000000', '高尚的电脑', 'webgate', '127.0.0.1', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'webgate', '2017-03-30 15:32:52.000000');
INSERT INTO `sys_component` VALUES ('2e58c3691aa911e7ad640a0027000000', '门户权限中心新', 'webgate', '127.0.0.1', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'webgate', '2017-03-22 11:36:38.000000');
INSERT INTO `sys_component` VALUES ('453740fd150c11e7ad640a0027000000', 'ERP', 'editorial', '127.0.0.1', '8080', '1', '376f4f95150911e7ad640a0027000000', 'editorial', '2017-03-30 13:46:47.000000');
INSERT INTO `sys_component` VALUES ('644b5970263111e7830e0a0027000000', '22', '11', '127.0.0.1', '5', '1', '0ea031700f9211e7860d0a0027000000', '11', '2017-04-21 09:25:23.000000');
INSERT INTO `sys_component` VALUES ('978fdfd6267211e7830e0a0027000000', '代码生成', 'design', '127.0.0.1', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'design', '2017-04-21 17:12:05.000000');
INSERT INTO `sys_component` VALUES ('ada5931c263111e7830e0a0027000000', '12', '1', '127.0.0.1', '123', '2', '376f4f95150911e7ad640a0027000000', '1', '2017-04-21 09:27:26.000000');
INSERT INTO `sys_component` VALUES ('c60ed0870eb011e7860d0a0027000000', '门户权限中心', 'webgate', '127.0.0.1', '8080', '1', 'c60e9adc0eb011e7860d0a0027000000', 'webgate', '2017-03-22 11:36:38.000000');

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
INSERT INTO `sys_resource` VALUES ('1043a3cb24cc11e79ee00a0027000000', '对象生成', '010001', '/pages/obj/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-19 14:47:32.000000');
INSERT INTO `sys_resource` VALUES ('17c67f0039ec11e7bf640a0027000000', '导入规则', '1001', '/pages/importRole/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'fb127e3f39eb11e7bf640a0027000000', '2017-05-16 11:59:40.000000');
INSERT INTO `sys_resource` VALUES ('1b5c08b1152e11e7ad640a0027000000', '菜单1001', '001001', '1', '2', null, null, '1', '1', null, '5d9195320f9411e7860d0a0027000000', '00257f73152e11e7ad640a0027000000', 'd7648564152d11e7ad640a0027000000', '2017-03-30 17:49:00.000000');
INSERT INTO `sys_resource` VALUES ('1feeef593c3b11e7a72c0a0027000000', '导出管理', '200', 'export', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', null, '2017-05-19 10:30:29.000000');
INSERT INTO `sys_resource` VALUES ('2542a8f52be811e78ee80a0027000000', '数据迁移', '010008', '0', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-28 15:56:06.000000');
INSERT INTO `sys_resource` VALUES ('3616e8c4352011e798820a0027000000', 'FTP链接', '03002', '/pages/ftp/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'dcfb122c351f11e798820a0027000000', '2017-05-10 09:30:03.000000');
INSERT INTO `sys_resource` VALUES ('46c23be53f8c11e78edf0a0027000000', '报表定义', '2002', '/pages/export/readSQL', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', '1feeef593c3b11e7a72c0a0027000000', '2017-05-23 15:48:53.000000');
INSERT INTO `sys_resource` VALUES ('4770d9fd3c3b11e7a72c0a0027000000', '数据导出', '2001', '/pages/export/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', '1feeef593c3b11e7a72c0a0027000000', '2017-05-19 10:31:35.000000');
INSERT INTO `sys_resource` VALUES ('4e0c089324cc11e79ee00a0027000000', '生成方案', '001002', '/pages/des/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-19 14:49:16.000000');
INSERT INTO `sys_resource` VALUES ('5692e389362811e786990a0027000000', '导入日志', '009', '/pages/impLog/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'fb127e3f39eb11e7bf640a0027000000', '2017-05-11 17:00:51.000000');
INSERT INTO `sys_resource` VALUES ('60035f49410f11e78edf0a0027000000', 'txt对象', '03004', '/pages/txt/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'dcfb122c351f11e798820a0027000000', '2017-05-25 13:59:48.000000');
INSERT INTO `sys_resource` VALUES ('6051a95c151b11e7ad640a0027000000', '两个tomcat', '006', 'webgate', '1', null, null, '1', '2', null, 'c60e9adc0eb011e7860d0a0027000000', '16acbbf6151b11e7ad640a0027000000', null, '2017-03-30 15:34:56.000000');
INSERT INTO `sys_resource` VALUES ('60a338c73f8c11e78edf0a0027000000', '综合查询', '2003', '/pages/echarts/integratedQue', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', '1feeef593c3b11e7a72c0a0027000000', '2017-05-23 15:49:37.000000');
INSERT INTO `sys_resource` VALUES ('631b9e49352011e798820a0027000000', '定时任务 配置', '03003', '/pages/time/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'dcfb122c351f11e798820a0027000000', '2017-05-10 09:31:19.000000');
INSERT INTO `sys_resource` VALUES ('63fdd0d2151c11e7ad640a0027000000', '全路径', '006002', 'http://192.168.0.100:8080/webgate/pages/resource/form/index', '1', null, null, '1', '2', null, 'c60e9adc0eb011e7860d0a0027000000', null, '6051a95c151b11e7ad640a0027000000', '2017-03-30 15:42:11.000000');
INSERT INTO `sys_resource` VALUES ('6f5db8fd473111e79cb60a0027000000', '图表模板', '2004', '/pages/echarts/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', '1feeef593c3b11e7a72c0a0027000000', '2017-06-02 09:18:50.000000');
INSERT INTO `sys_resource` VALUES ('75e485dc151b11e7ad640a0027000000', '不是全路径', '006001', '/pages/component/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '16acbbf6151b11e7ad640a0027000000', '6051a95c151b11e7ad640a0027000000', '2017-03-30 15:35:32.000000');
INSERT INTO `sys_resource` VALUES ('896d306215cf11e7ad640a0027000000', '2', '1', '3', '1', null, null, '1', '1', null, '376f4f95150911e7ad640a0027000000', '453740fd150c11e7ad640a0027000000', null, '2017-03-31 13:04:33.000000');
INSERT INTO `sys_resource` VALUES ('92ea2d071e8211e7a7ba0a0027000000', '测试', '001', '/pages/index', '1', null, null, '1', '1', null, '376f4f95150911e7ad640a0027000000', '453740fd150c11e7ad640a0027000000', '896d306215cf11e7ad640a0027000000', '2017-04-11 14:46:14.000000');
INSERT INTO `sys_resource` VALUES ('b1c6b412143311e7ad640a0027000000', '功能管理', '026007001', '/pages/function/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', 'c60ed0870eb011e7860d0a0027000000', 'c616e3770eb011e7860d0a0027000000', '2017-03-29 11:56:30.000000');
INSERT INTO `sys_resource` VALUES ('bc327c2d267211e7830e0a0027000000', '数据库链接', '001003', '/pages/dbconn/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'bf141a1524ca11e79ee00a0027000000', '2017-04-21 17:13:07.000000');
INSERT INTO `sys_resource` VALUES ('bf141a1524ca11e79ee00a0027000000', '代码生成', '010', 'webgate', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', null, '2017-04-19 14:38:06.000000');
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
INSERT INTO `sys_resource` VALUES ('dcfb122c351f11e798820a0027000000', 'excel操作', '030', 'design', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', null, '2017-05-10 09:27:34.000000');
INSERT INTO `sys_resource` VALUES ('ec06627e152d11e7ad640a0027000000', '系统4-菜单2', '002', '000', '2', null, null, '1', '2', null, '5d9195320f9411e7860d0a0027000000', null, null, '2017-03-30 17:47:40.000000');
INSERT INTO `sys_resource` VALUES ('fb127e3f39eb11e7bf640a0027000000', '导入管理', '100', 'imp', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', null, '2017-05-16 11:58:52.000000');
INSERT INTO `sys_resource` VALUES ('fc7a48ed351f11e798820a0027000000', 'excel 对象', '03001', '/pages/xls/form/index', '1', null, null, '1', '1', null, 'c60e9adc0eb011e7860d0a0027000000', '978fdfd6267211e7830e0a0027000000', 'dcfb122c351f11e798820a0027000000', '2017-05-10 09:28:27.000000');

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
INSERT INTO `sys_rr_relationship` VALUES ('00dc98f039ec11e7bf640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'fb127e3f39eb11e7bf640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('19f5f45224cc11e79ee00a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'bf141a1524ca11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('2579e84239ec11e7bf640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '17c67f0039ec11e7bf640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('2beef5d715cd11e7ad640a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c616d4c70eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('2c8005932be811e78ee80a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '2542a8f52be811e78ee80a0027000000');
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
INSERT INTO `sys_rr_relationship` VALUES ('4f9dcb513c3b11e7a72c0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '1feeef593c3b11e7a72c0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('52977b7a24cc11e79ee00a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '4e0c089324cc11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('5466bd7b3c3b11e7a72c0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '4770d9fd3c3b11e7a72c0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('571fb06715d911e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '6051a95c151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('5726f1a615d911e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '63fdd0d2151c11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('57314d7c15d911e7ad640a0027000000', 'c620f3150eb011e7860d0a0027000000', '75e485dc151b11e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('5bfe550e362811e786990a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '5692e389362811e786990a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('68b65f383f8c11e78edf0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '46c23be53f8c11e78edf0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('68ec8a3a410f11e78edf0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '60035f49410f11e78edf0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('6c4825813f8c11e78edf0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '60a338c73f8c11e78edf0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('7084bef0352011e798820a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'dcfb122c351f11e798820a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('93f6fc81295411e7830e0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '1043a3cb24cc11e79ee00a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('9ae7135d15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c60f01fb0eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('9aff5c0915da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616e82f0eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('a2ad787c15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('a2b6e57e15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'c616e3770eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('a2bc998d15da11e7ad640a0027000000', 'c617481e0eb011e7860d0a0027000000', 'b1c6b412143311e7ad640a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('ab1229de352011e798820a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '3616e8c4352011e798820a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('af8f1d11352011e798820a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '631b9e49352011e798820a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('b2fdab59352011e798820a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'fc7a48ed351f11e798820a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('c61724f10eb011e7860d0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c60eeb990eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('c6172e930eb011e7860d0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'c60f08850eb011e7860d0a0027000000');
INSERT INTO `sys_rr_relationship` VALUES ('cd8305c34b2911e78e740a0027000000', 'c60eb4d20eb011e7860d0a0027000000', '6f5db8fd473111e79cb60a0027000000');
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
INSERT INTO `sys_rr_relationship` VALUES ('f565147f267211e7830e0a0027000000', 'c60eb4d20eb011e7860d0a0027000000', 'bc327c2d267211e7830e0a0027000000');

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
