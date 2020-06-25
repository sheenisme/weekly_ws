/*
Navicat MySQL Data Transfer

Source Server         : link1
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : weekly

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-06-25 18:39:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for week_company
-- ----------------------------
DROP TABLE IF EXISTS `week_company`;
CREATE TABLE `week_company` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usernum` int DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_company
-- ----------------------------
INSERT INTO `week_company` VALUES ('3', '1', '测试公司1', '111111', '公司1负责人', '15225158238', '717108998@qq.com', '2020-06-24 15:04:27', null);
INSERT INTO `week_company` VALUES ('4', '2', '测试公司2', '222222', '公司2负责人', '15225158237', '717108989@qq.com', '2020-06-24 15:05:16', null);

-- ----------------------------
-- Table structure for week_department
-- ----------------------------
DROP TABLE IF EXISTS `week_department`;
CREATE TABLE `week_department` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int unsigned DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_department
-- ----------------------------
INSERT INTO `week_department` VALUES ('2', '111111111', '部门1', '1', '测试公司1');
INSERT INTO `week_department` VALUES ('3', '111111112', '部门2', '1', '测试公司1');
INSERT INTO `week_department` VALUES ('5', '1111111111', '部门1', '2', '测试公司2');
INSERT INTO `week_department` VALUES ('6', '1111111112', '部门2', '2', '测试公司2');

-- ----------------------------
-- Table structure for week_log
-- ----------------------------
DROP TABLE IF EXISTS `week_log`;
CREATE TABLE `week_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `flag` tinyint DEFAULT NULL,
  `usernum` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_log
-- ----------------------------
INSERT INTO `week_log` VALUES ('66', '0', '111111', 'test', '2020-06-24 15:08:51', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('67', '1', '111111', null, null, '7490c64958ac6bd02b856e3882eb61a1', '127.0.0.1', '2020-06-24 15:09:00');
INSERT INTO `week_log` VALUES ('68', '1', 'admin', null, null, '7490c64958ac6bd02b856e3882eb61a1', '127.0.0.1', '2020-06-24 15:09:07');
INSERT INTO `week_log` VALUES ('69', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:10:01');
INSERT INTO `week_log` VALUES ('70', '0', 'admin', 'administrator', '2020-06-24 15:10:11', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('71', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:10:19');
INSERT INTO `week_log` VALUES ('72', '0', '111111', '公司1负责人', '2020-06-24 15:15:37', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('73', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:15:51');
INSERT INTO `week_log` VALUES ('74', '0', '222222', '公司2负责人', '2020-06-24 15:18:16', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('75', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:18:30');
INSERT INTO `week_log` VALUES ('76', '0', '111112', '部门经理1', '2020-06-24 15:21:34', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('77', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:21:37');
INSERT INTO `week_log` VALUES ('78', '0', '111111', '公司1负责人', '2020-06-24 15:22:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('79', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:22:29');
INSERT INTO `week_log` VALUES ('80', '0', '111112', '部门经理1', '2020-06-24 15:22:33', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('81', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:22:39');
INSERT INTO `week_log` VALUES ('82', '0', '222222', '公司2负责人', '2020-06-24 15:23:47', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('83', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:23:50');
INSERT INTO `week_log` VALUES ('84', '0', '111111', '公司1负责人', '2020-06-24 15:25:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('85', '1', '111113', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:26:13');
INSERT INTO `week_log` VALUES ('86', '0', '111113', '部门经理2', '2020-06-24 15:27:46', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('87', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:27:49');
INSERT INTO `week_log` VALUES ('88', '0', '111114', '成员1', '2020-06-24 15:28:40', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('89', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:28:46');
INSERT INTO `week_log` VALUES ('90', '0', '111111', '公司1负责人', '2020-06-24 15:29:50', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('91', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:29:55');
INSERT INTO `week_log` VALUES ('92', '0', '111115', '成员2', '2020-06-24 15:31:41', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('93', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 15:31:46');
INSERT INTO `week_log` VALUES ('94', '0', 'admin', 'administrator', '2020-06-24 15:56:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('95', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 16:05:01');
INSERT INTO `week_log` VALUES ('96', '0', 'admin', 'administrator', '2020-06-24 16:05:29', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('97', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 16:26:15');
INSERT INTO `week_log` VALUES ('98', '0', 'admin', 'administrator', '2020-06-24 16:26:28', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('99', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 16:31:01');
INSERT INTO `week_log` VALUES ('100', '0', 'admin', 'administrator', '2020-06-24 17:29:39', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('101', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-24 17:29:46');
INSERT INTO `week_log` VALUES ('102', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 10:15:16');
INSERT INTO `week_log` VALUES ('103', '0', 'admin', 'administrator', '2020-06-25 16:30:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('104', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 16:30:36');
INSERT INTO `week_log` VALUES ('105', '0', '111111', '公司1负责人', '2020-06-25 16:32:26', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('106', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 16:32:29');
INSERT INTO `week_log` VALUES ('107', '0', 'admin', 'administrator', '2020-06-25 17:36:11', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('108', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 17:36:16');
INSERT INTO `week_log` VALUES ('109', '0', '111111', '公司1负责人', '2020-06-25 17:40:53', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('110', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 17:44:25');
INSERT INTO `week_log` VALUES ('111', '0', '111111', '公司1负责人', '2020-06-25 17:49:24', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('112', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 17:50:03');
INSERT INTO `week_log` VALUES ('113', '0', '111114', '成员1', '2020-06-25 17:54:23', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('114', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 17:54:25');
INSERT INTO `week_log` VALUES ('115', '0', '111111', '公司1负责人', '2020-06-25 17:54:32', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('116', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 17:54:40');
INSERT INTO `week_log` VALUES ('117', '0', '111114', '成员1', '2020-06-25 17:55:39', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('118', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 18:00:18');
INSERT INTO `week_log` VALUES ('119', '0', '111111', '公司1负责人', '2020-06-25 18:00:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('120', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 18:01:05');
INSERT INTO `week_log` VALUES ('121', '0', '111115', '成员2', '2020-06-25 18:05:54', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('122', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 18:05:57');
INSERT INTO `week_log` VALUES ('123', '0', 'admin', 'administrator', '2020-06-25 18:06:40', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('124', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 18:06:42');
INSERT INTO `week_log` VALUES ('125', '0', 'admin', 'administrator', '2020-06-25 18:29:50', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('126', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 18:29:55');
INSERT INTO `week_log` VALUES ('127', '0', 'admin', 'administrator', '2020-06-25 18:31:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('128', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-25 18:31:17');
INSERT INTO `week_log` VALUES ('129', '0', '111112', '部门经理1', '2020-06-25 18:31:39', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);

-- ----------------------------
-- Table structure for week_role
-- ----------------------------
DROP TABLE IF EXISTS `week_role`;
CREATE TABLE `week_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `role` int DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_role
-- ----------------------------
INSERT INTO `week_role` VALUES ('7', '1', '2', '总监');
INSERT INTO `week_role` VALUES ('8', '1', '3', '部门经理');
INSERT INTO `week_role` VALUES ('9', '1', '4', '成员');
INSERT INTO `week_role` VALUES ('10', '2', '2', '总监');
INSERT INTO `week_role` VALUES ('11', '2', '3', '部门经理');
INSERT INTO `week_role` VALUES ('12', '2', '4', '成员');

-- ----------------------------
-- Table structure for week_user
-- ----------------------------
DROP TABLE IF EXISTS `week_user`;
CREATE TABLE `week_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usernum` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_user
-- ----------------------------
INSERT INTO `week_user` VALUES ('1', 'admin', 'administrator', null, '1', 'administrator', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null, null, null, null, null, null);
INSERT INTO `week_user` VALUES ('6', '111111', '公司1负责人', '15225158238', '2', '总监', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', null, null, null, null);
INSERT INTO `week_user` VALUES ('7', '222222', '公司2负责人', '15225158237', '2', '总监', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108989@qq.com', '2', '测试公司2', null, null, null, null);
INSERT INTO `week_user` VALUES ('8', '111112', '部门经理1', '15225158236', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108996@qq.com', '1', '测试公司1', '111111111', '部门1', '2020-06-24 15:11:56', null);
INSERT INTO `week_user` VALUES ('9', '111113', '部门经理2', '15225158238', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', '111111112', '部门2', '2020-06-24 15:15:22', null);
INSERT INTO `week_user` VALUES ('10', '222223', '部门经理1', '15225158238', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '2', '测试公司2', '1111111111', '部门1', '2020-06-24 15:17:19', null);
INSERT INTO `week_user` VALUES ('11', '222224', '部门经理2', '15225158238', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '2', '测试公司2', '1111111112', '部门2', '2020-06-24 15:17:50', null);
INSERT INTO `week_user` VALUES ('12', '111114', '成员1', '15225158238', '4', '成员', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', '111111111', '部门1', '2020-06-24 15:19:27', null);
INSERT INTO `week_user` VALUES ('13', '111115', '成员2', '15225158238', '4', '成员', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', '111111112', '部门2', '2020-06-24 15:27:01', null);

-- ----------------------------
-- Table structure for week_week
-- ----------------------------
DROP TABLE IF EXISTS `week_week`;
CREATE TABLE `week_week` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usernum` int DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` tinyint DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `date` datetime DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  `startDate` bigint DEFAULT NULL,
  `endDate` bigint DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_week
-- ----------------------------
INSERT INTO `week_week` VALUES ('6', '111112', '部门经理1', '3', '部门经理1测试周报第一次', '2020-06-24 00:00:00', '1592983452597', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('7', '111112', '部门经理1', '3', '部门经理1测试周报第二次', '2020-06-24 00:00:00', '1592983471055', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('8', '222222', '公司2负责人', '2', '公司2负责人填写周报第一次测试', '2020-06-24 00:00:00', '1592983396137', '1592755200000', '1593359999000', null, '2');
INSERT INTO `week_week` VALUES ('9', '222222', '公司2负责人', '2', '公司2负责人填写周报第二次测试', '2020-06-24 00:00:00', '1592983401967', '1592755200000', '1593359999000', null, '2');
INSERT INTO `week_week` VALUES ('10', '111111', '公司1负责人', '2', '公司1负责人填写周报第一次测试', '2020-06-24 00:00:00', '1592983504120', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('11', '111111', '公司1负责人', '2', '公司1负责人填写周报第二次测试', '2020-06-24 00:00:00', '1592983507829', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('12', '111111', '公司1负责人', '2', '公司1负责人填写周报第三次测试', '2020-06-24 00:00:00', '1592983512924', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('13', '111113', '部门经理2', '3', '部门经理2填写周报第一次测试', '2020-06-24 00:00:00', '1592983648661', '1592755200000', '1593359999000', '111111112', '1');
INSERT INTO `week_week` VALUES ('14', '111113', '部门经理2', '3', '部门经理2填写周报第二次测试', '2020-06-24 00:00:00', '1592983655045', '1592755200000', '1593359999000', '111111112', '1');
INSERT INTO `week_week` VALUES ('15', '111114', '成员1', '4', '成员1填写周报第一次测试', '2020-06-24 00:00:00', '1592983705960', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('16', '111114', '成员1', '4', '成员1填写周报第二次测试', '2020-06-24 00:00:00', '1592983710721', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('17', '111115', '成员2', '4', '成员2填写周报第一次测试', '2020-06-24 00:00:00', '1592983804036', '1592755200000', '1593359999000', '111111112', '1');
INSERT INTO `week_week` VALUES ('18', '111115', '成员2', '4', '成员2填写周报第二次测试', '2020-06-24 00:00:00', '1592983807807', '1592755200000', '1593359999000', '111111112', '1');
INSERT INTO `week_week` VALUES ('21', '0', 'administrator', '1', '[{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false}]', '2020-06-25 00:00:00', '1593073779463', '1592755200000', '1593359999000', null, null);
INSERT INTO `week_week` VALUES ('22', '111111', '公司1负责人', '2', '[{\"本周工作内容\":\"尽量详细1\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":0},{\"本周工作内容\":\"尽量详细2\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":1},{\"本周工作内容\":\"尽量详细3\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":2},{\"本周工作内容\":\"尽量详细4\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":3},{\"本周工作内容\":\"尽量详细5\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":4}]', '2020-06-25 00:00:00', '1593073861827', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('23', '0', 'administrator', '1', '[{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":0},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":1},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":2},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":3},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false,\"id\":4}]', '2020-06-25 00:00:00', '1593073987558', '1592755200000', '1593359999000', null, null);
INSERT INTO `week_week` VALUES ('24', '0', 'administrator', '1', '[{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false}]', '2020-06-25 00:00:00', '1593074867272', '1592755200000', '1593359999000', null, null);
INSERT INTO `week_week` VALUES ('25', '111111', '公司1负责人', '2', '\"本周工作内容\":\"写代码\",\"完成情况\":\"完成预期目标\",\"备注\":\"  今天端午节\",\"下周工作内容\":\"接着肝\",\"需协调的资源\":\"时间\",\"预计完成时间\":\"下周五\"', '2020-06-25 00:00:00', '1593078036117', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('26', '111114', '成员1', '4', '[{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false}]', '2020-06-25 00:00:00', '1593078933720', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('27', '111115', '成员2', '4', '[{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false},{\"本周工作内容\":\"尽量详细\",\"完成情况\":\"完成/未完成，并说明详细情况\",\"备注\":\"  \",\"下周工作内容\":\"越详细越好\",\"需协调的资源\":\"说明全部未掌握的资源\",\"预计完成时间\":\"下周五\",\"show\":false}]', '2020-06-25 00:00:00', '1593079277401', '1592755200000', '1593359999000', '111111112', '1');
