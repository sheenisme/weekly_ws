/*
Navicat MySQL Data Transfer

Source Server         : link1
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : weekly

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-07-02 10:03:45
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_department
-- ----------------------------
INSERT INTO `week_department` VALUES ('2', '111111111', '部门1', '1', '测试公司1');
INSERT INTO `week_department` VALUES ('5', '1111111111', '部门1', '2', '测试公司2');
INSERT INTO `week_department` VALUES ('6', '1111111112', '部门2', '2', '测试公司2');
INSERT INTO `week_department` VALUES ('7', '11111112', '部门积极', '1', '测试公司1');

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
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `week_log` VALUES ('102', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 08:37:16');
INSERT INTO `week_log` VALUES ('103', '0', '111111', '公司1负责人', '2020-06-28 08:44:07', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('104', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 10:16:18');
INSERT INTO `week_log` VALUES ('105', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 11:38:51');
INSERT INTO `week_log` VALUES ('106', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 13:22:25');
INSERT INTO `week_log` VALUES ('107', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 17:25:45');
INSERT INTO `week_log` VALUES ('108', '0', '111111', '公司1负责人', '2020-06-28 17:46:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('109', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 17:46:32');
INSERT INTO `week_log` VALUES ('110', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 17:46:43');
INSERT INTO `week_log` VALUES ('111', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 18:02:18');
INSERT INTO `week_log` VALUES ('112', '0', '111114', '成员1', '2020-06-28 18:11:28', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('113', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-28 18:11:38');
INSERT INTO `week_log` VALUES ('114', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 08:33:50');
INSERT INTO `week_log` VALUES ('115', '0', '111111', '公司1负责人', '2020-06-29 13:42:29', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('116', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 13:42:42');
INSERT INTO `week_log` VALUES ('117', '0', 'admin', 'administrator', '2020-06-29 13:43:31', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('118', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 13:43:33');
INSERT INTO `week_log` VALUES ('119', '0', '111111', '公司1负责人', '2020-06-29 15:29:43', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('120', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:29:46');
INSERT INTO `week_log` VALUES ('121', '0', '111111', '公司1负责人', '2020-06-29 15:29:57', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('122', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:30:05');
INSERT INTO `week_log` VALUES ('123', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:30:13');
INSERT INTO `week_log` VALUES ('124', '0', '111114', '成员1', '2020-06-29 15:30:55', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('125', '1', '1111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:31:09');
INSERT INTO `week_log` VALUES ('126', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:31:12');
INSERT INTO `week_log` VALUES ('127', '0', '111111', '公司1负责人', '2020-06-29 15:42:20', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('128', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:42:25');
INSERT INTO `week_log` VALUES ('129', '0', 'admin', 'administrator', '2020-06-29 15:42:47', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('130', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:42:49');
INSERT INTO `week_log` VALUES ('131', '0', '111111', '公司1负责人', '2020-06-29 15:48:13', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('132', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:48:16');
INSERT INTO `week_log` VALUES ('133', '0', 'admin', 'administrator', '2020-06-29 15:55:09', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('134', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:55:12');
INSERT INTO `week_log` VALUES ('135', '0', '111111', '公司1负责人', '2020-06-29 15:57:19', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('136', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:57:27');
INSERT INTO `week_log` VALUES ('137', '0', '111112', '部门经理1', '2020-06-29 15:58:31', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('138', '1', '159383', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:58:43');
INSERT INTO `week_log` VALUES ('139', '0', '159383', '宋广辉', '2020-06-29 15:58:55', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('140', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:58:59');
INSERT INTO `week_log` VALUES ('141', '0', '111114', '成员1', '2020-06-29 15:59:05', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('142', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:59:13');
INSERT INTO `week_log` VALUES ('143', '0', '222222', '公司2负责人', '2020-06-29 15:59:32', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('144', '1', '222223', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 15:59:39');
INSERT INTO `week_log` VALUES ('145', '0', '222223', '部门经理1', '2020-06-29 16:00:19', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('146', '1', '123456', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:00:26');
INSERT INTO `week_log` VALUES ('147', '0', '123456', '222224', '2020-06-29 16:00:34', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('148', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:00:39');
INSERT INTO `week_log` VALUES ('149', '0', 'admin', 'administrator', '2020-06-29 16:03:45', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('150', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:03:52');
INSERT INTO `week_log` VALUES ('151', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:08:12');
INSERT INTO `week_log` VALUES ('152', '0', '111111', '公司1负责人', '2020-06-29 16:08:32', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('153', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:08:53');
INSERT INTO `week_log` VALUES ('154', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:08:56');
INSERT INTO `week_log` VALUES ('155', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:09:01');
INSERT INTO `week_log` VALUES ('156', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:09:08');
INSERT INTO `week_log` VALUES ('157', '0', '222222', '公司2负责人', '2020-06-29 16:11:00', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('158', '1', '222224', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:11:16');
INSERT INTO `week_log` VALUES ('159', '0', '222224', '部门经理2', '2020-06-29 16:12:06', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('160', '1', '22225', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:12:12');
INSERT INTO `week_log` VALUES ('161', '0', '22225', '宋广辉', '2020-06-29 16:12:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('162', '1', '22225', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:13:05');
INSERT INTO `week_log` VALUES ('163', '0', '22225', '宋广辉', '2020-06-29 16:13:09', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('164', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:13:14');
INSERT INTO `week_log` VALUES ('165', '0', 'admin', 'administrator', '2020-06-29 16:14:06', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('166', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:14:11');
INSERT INTO `week_log` VALUES ('167', '0', '111111', '公司1负责人', '2020-06-29 16:27:40', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('168', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:27:43');
INSERT INTO `week_log` VALUES ('169', '0', '222222', '公司2负责人', '2020-06-29 16:34:35', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('170', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:34:40');
INSERT INTO `week_log` VALUES ('171', '0', 'admin', 'administrator', '2020-06-29 16:37:21', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('172', '1', '123456', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:37:28');
INSERT INTO `week_log` VALUES ('173', '0', '123456', '222224', '2020-06-29 16:37:49', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('174', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:37:53');
INSERT INTO `week_log` VALUES ('175', '0', '111111', '公司1负责人', '2020-06-29 16:39:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('176', '1', '1111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:39:15');
INSERT INTO `week_log` VALUES ('177', '1', '1111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:39:19');
INSERT INTO `week_log` VALUES ('178', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 16:39:23');
INSERT INTO `week_log` VALUES ('179', '0', '111112', '部门经理1', '2020-06-29 19:34:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('180', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-29 19:34:30');
INSERT INTO `week_log` VALUES ('181', '0', 'admin', 'administrator', '2020-06-29 19:36:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('182', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 08:27:20');
INSERT INTO `week_log` VALUES ('183', '0', 'admin', 'administrator', '2020-06-30 09:08:59', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('184', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 09:09:02');
INSERT INTO `week_log` VALUES ('185', '0', '111111', '公司1负责人', '2020-06-30 09:17:18', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('186', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 09:17:30');
INSERT INTO `week_log` VALUES ('187', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 09:17:37');
INSERT INTO `week_log` VALUES ('188', '0', '111114', '成员1', '2020-06-30 09:21:58', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('189', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 09:22:02');
INSERT INTO `week_log` VALUES ('190', '0', '111111', '公司1负责人', '2020-06-30 09:22:44', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('191', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 09:22:53');
INSERT INTO `week_log` VALUES ('192', '0', '111112', '部门经理1', '2020-06-30 09:24:31', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('193', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 09:24:35');
INSERT INTO `week_log` VALUES ('194', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 10:59:25');
INSERT INTO `week_log` VALUES ('195', '0', 'admin', 'administrator', '2020-06-30 11:11:18', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('196', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 11:11:24');
INSERT INTO `week_log` VALUES ('197', '0', '111111', '公司1负责人', '2020-06-30 11:21:41', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('198', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 11:21:45');
INSERT INTO `week_log` VALUES ('199', '0', '111111', '公司1负责人', '2020-06-30 11:21:52', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('200', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 11:21:59');
INSERT INTO `week_log` VALUES ('201', '0', 'admin', 'administrator', '2020-06-30 11:26:52', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('202', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 11:27:02');
INSERT INTO `week_log` VALUES ('203', '0', '111111', '公司1负责人', '2020-06-30 15:37:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('204', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 15:37:30');
INSERT INTO `week_log` VALUES ('205', '0', '111112', '部门经理1', '2020-06-30 15:51:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('206', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 15:51:29');
INSERT INTO `week_log` VALUES ('207', '0', '111111', '公司1负责人', '2020-06-30 15:51:59', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('208', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 15:52:06');
INSERT INTO `week_log` VALUES ('209', '0', '111112', '部门经理1', '2020-06-30 16:06:15', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('210', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 16:06:21');
INSERT INTO `week_log` VALUES ('211', '0', '111111', '公司1负责人', '2020-06-30 16:18:20', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('212', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 16:18:25');
INSERT INTO `week_log` VALUES ('213', '0', '111112', '部门经理1', '2020-06-30 16:22:24', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('214', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 16:22:36');
INSERT INTO `week_log` VALUES ('215', '0', '111111', '公司1负责人', '2020-06-30 16:23:35', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('216', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 16:23:38');
INSERT INTO `week_log` VALUES ('217', '0', '111112', '部门经理1', '2020-06-30 16:39:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('218', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 16:39:07');
INSERT INTO `week_log` VALUES ('219', '0', '111111', '公司1负责人', '2020-06-30 16:54:14', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('220', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 16:54:23');
INSERT INTO `week_log` VALUES ('221', '0', '111112', '部门经理1', '2020-06-30 19:17:23', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('222', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 19:17:30');
INSERT INTO `week_log` VALUES ('223', '0', '111111', '公司1负责人', '2020-06-30 19:17:53', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('224', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 19:17:58');
INSERT INTO `week_log` VALUES ('225', '0', 'admin', 'administrator', '2020-06-30 19:24:02', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('226', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-06-30 19:24:05');
INSERT INTO `week_log` VALUES ('227', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 08:15:56');
INSERT INTO `week_log` VALUES ('228', '0', 'admin', 'administrator', '2020-07-01 08:16:22', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('229', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 08:16:26');
INSERT INTO `week_log` VALUES ('230', '0', '111111', '公司1负责人', '2020-07-01 08:26:27', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('231', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 08:26:32');
INSERT INTO `week_log` VALUES ('232', '0', '111112', '部门经理1', '2020-07-01 08:31:45', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('233', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 08:31:49');
INSERT INTO `week_log` VALUES ('234', '0', 'admin', 'administrator', '2020-07-01 08:32:01', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('235', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 08:32:04');
INSERT INTO `week_log` VALUES ('236', '0', '111111', '公司1负责人', '2020-07-01 08:32:36', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('237', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 08:32:41');
INSERT INTO `week_log` VALUES ('238', '0', 'admin', 'administrator', '2020-07-01 09:57:12', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('239', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 09:57:17');
INSERT INTO `week_log` VALUES ('240', '0', '111112', '部门经理1', '2020-07-01 09:59:19', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('241', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 09:59:26');
INSERT INTO `week_log` VALUES ('242', '0', 'admin', 'administrator', '2020-07-01 11:04:41', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('243', '1', '123456', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 11:04:44');
INSERT INTO `week_log` VALUES ('244', '0', '123456', '222224', '2020-07-01 11:04:49', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('245', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 11:04:53');
INSERT INTO `week_log` VALUES ('246', '0', '111114', '成员1', '2020-07-01 11:04:58', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('247', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 11:05:07');
INSERT INTO `week_log` VALUES ('248', '0', '111111', '公司1负责人', '2020-07-01 11:05:21', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('249', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 11:05:22');
INSERT INTO `week_log` VALUES ('250', '0', '111111', '公司1负责人', '2020-07-01 11:05:38', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('251', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 11:05:41');
INSERT INTO `week_log` VALUES ('252', '0', '111112', '部门经理1', '2020-07-01 12:24:18', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('253', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 12:24:26');
INSERT INTO `week_log` VALUES ('254', '0', 'admin', 'administrator', '2020-07-01 14:25:42', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('255', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 14:25:44');
INSERT INTO `week_log` VALUES ('256', '0', '111112', '部门经理1', '2020-07-01 14:26:26', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('257', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 14:26:30');
INSERT INTO `week_log` VALUES ('258', '0', '222222', '公司2负责人', '2020-07-01 14:34:30', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('259', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 14:34:32');
INSERT INTO `week_log` VALUES ('260', '0', '222222', '公司2负责人', '2020-07-01 14:52:21', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('261', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 14:52:22');
INSERT INTO `week_log` VALUES ('262', '0', '222222', '公司2负责人', '2020-07-01 15:02:32', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('263', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:02:34');
INSERT INTO `week_log` VALUES ('264', '0', '222222', '公司2负责人', '2020-07-01 15:08:42', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('265', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:08:45');
INSERT INTO `week_log` VALUES ('266', '0', 'admin', 'administrator', '2020-07-01 15:22:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('267', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:22:15');
INSERT INTO `week_log` VALUES ('268', '0', '111111', '公司1负责人', '2020-07-01 15:35:12', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('269', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:35:23');
INSERT INTO `week_log` VALUES ('270', '0', 'admin', 'administrator', '2020-07-01 15:38:01', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('271', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:38:41');
INSERT INTO `week_log` VALUES ('272', '0', '111111', '公司1负责人', '2020-07-01 15:40:33', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('273', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:42:00');
INSERT INTO `week_log` VALUES ('274', '0', '111112', '部门经理1', '2020-07-01 15:48:07', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('275', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:48:09');
INSERT INTO `week_log` VALUES ('276', '0', 'admin', 'administrator', '2020-07-01 15:48:18', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('277', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:48:24');
INSERT INTO `week_log` VALUES ('278', '0', '111111', '公司1负责人', '2020-07-01 15:48:48', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('279', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:49:00');
INSERT INTO `week_log` VALUES ('280', '0', '111112', '部门经理1', '2020-07-01 15:49:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('281', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:49:30');
INSERT INTO `week_log` VALUES ('282', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 15:53:39');
INSERT INTO `week_log` VALUES ('283', '0', '111114', '成员1', '2020-07-01 16:00:38', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('284', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:00:41');
INSERT INTO `week_log` VALUES ('285', '0', '111111', '公司1负责人', '2020-07-01 16:00:49', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('286', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:00:54');
INSERT INTO `week_log` VALUES ('287', '0', '111112', '部门经理1', '2020-07-01 16:04:57', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('288', '1', '159383', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:05:03');
INSERT INTO `week_log` VALUES ('289', '1', '123456', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:05:06');
INSERT INTO `week_log` VALUES ('290', '0', '123456', '222224', '2020-07-01 16:47:29', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('291', '1', '222223', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:47:35');
INSERT INTO `week_log` VALUES ('292', '0', '222223', '部门经理1', '2020-07-01 16:48:08', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('293', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:48:20');
INSERT INTO `week_log` VALUES ('294', '0', '111111', '公司1负责人', '2020-07-01 16:48:39', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('295', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:48:52');
INSERT INTO `week_log` VALUES ('296', '0', 'admin', 'administrator', '2020-07-01 16:49:50', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('297', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:51:42');
INSERT INTO `week_log` VALUES ('298', '0', 'admin', 'administrator', '2020-07-01 16:57:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('299', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 16:57:10');
INSERT INTO `week_log` VALUES ('300', '0', '111111', '公司1负责人', '2020-07-01 19:11:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('301', '1', '111114', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 19:11:11');
INSERT INTO `week_log` VALUES ('302', '0', '111114', '成员1', '2020-07-01 19:11:36', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('303', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 19:11:47');
INSERT INTO `week_log` VALUES ('304', '0', '111112', '部门经理1', '2020-07-01 19:12:28', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('305', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 19:12:35');
INSERT INTO `week_log` VALUES ('306', '0', '111115', '成员2', '2020-07-01 19:14:55', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('307', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 19:14:59');
INSERT INTO `week_log` VALUES ('308', '0', 'admin', 'administrator', '2020-07-01 19:22:11', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('309', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-01 19:24:16');
INSERT INTO `week_log` VALUES ('310', '0', 'admin', 'administrator', '2020-07-01 19:29:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('311', '1', 'admin', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:26:34');
INSERT INTO `week_log` VALUES ('312', '0', 'admin', 'administrator', '2020-07-02 08:31:32', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('313', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:31:36');
INSERT INTO `week_log` VALUES ('314', '0', '111111', '公司1负责人', '2020-07-02 08:32:24', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('315', '1', '111112', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:32:27');
INSERT INTO `week_log` VALUES ('316', '0', '111112', '部门经理1', '2020-07-02 08:32:36', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('317', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:32:39');
INSERT INTO `week_log` VALUES ('318', '0', '111115', '成员2', '2020-07-02 08:35:05', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('319', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:35:07');
INSERT INTO `week_log` VALUES ('320', '0', '111111', '公司1负责人', '2020-07-02 08:35:25', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('321', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:35:30');
INSERT INTO `week_log` VALUES ('322', '0', '222222', '公司2负责人', '2020-07-02 08:35:33', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('323', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:39:34');
INSERT INTO `week_log` VALUES ('324', '0', '222222', '公司2负责人', '2020-07-02 08:40:26', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('325', '1', '111115', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 08:40:29');
INSERT INTO `week_log` VALUES ('326', '0', '111115', '成员2', '2020-07-02 09:05:56', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('327', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:21:18');
INSERT INTO `week_log` VALUES ('328', '0', '222222', '公司2负责人', '2020-07-02 09:23:30', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('329', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:23:51');
INSERT INTO `week_log` VALUES ('330', '0', '222222', '公司2负责人', '2020-07-02 09:27:04', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('331', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:37:30');
INSERT INTO `week_log` VALUES ('332', '0', '222222', '公司2负责人', '2020-07-02 09:40:12', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('333', '1', '111111', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:49:29');
INSERT INTO `week_log` VALUES ('334', '0', '111111', '公司1负责人', '2020-07-02 09:49:37', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('335', '1', '222222', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:52:20');
INSERT INTO `week_log` VALUES ('336', '0', '222222', '公司2负责人', '2020-07-02 09:53:11', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);
INSERT INTO `week_log` VALUES ('337', '1', '159383', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:53:19');
INSERT INTO `week_log` VALUES ('338', '1', '159383', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:53:21');
INSERT INTO `week_log` VALUES ('339', '1', '123456', null, null, '0c00cf218b8b1d41c0903cd62ac9edfe', '127.0.0.1', '2020-07-02 09:53:24');
INSERT INTO `week_log` VALUES ('340', '0', '123456', '222224', '2020-07-02 09:53:43', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null);

-- ----------------------------
-- Table structure for week_news
-- ----------------------------
DROP TABLE IF EXISTS `week_news`;
CREATE TABLE `week_news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of week_news
-- ----------------------------
INSERT INTO `week_news` VALUES ('1', '风吹日晒法国v热', '<p>v二十多人被v俄国人</p>', null);
INSERT INTO `week_news` VALUES ('2', '风吹日晒法国v热', '<p>v二十多人被v俄国人</p>', '2020-07-01 00:00:00');
INSERT INTO `week_news` VALUES ('3', ';glorhjmp[t;l', '<p>hytm, pj\'utyk,[pji;u,p;l,u\'k[;pu</p>', '2020-07-01 00:00:00');
INSERT INTO `week_news` VALUES ('4', '本月重点督办事宜', '<p>1.学习</p><p>2.学习</p><p>3.学习</p>', '2020-07-01 00:00:00');
INSERT INTO `week_news` VALUES ('5', '本周一定要捉放对策八块腹肌被我i拨穗韩国v啊FBI从而恢复', '<p class=\"ql-align-justify\">各位小伙伴们大家好，这次小编要介绍的是java中<strong>数组长度的获取</strong>与<strong>数组的遍历</strong>，首先小编要介绍的是，<strong>数组长度的获取</strong>，如何获取一个数组的长度呢？</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">获取数组长度的格式：<strong>数组名称.length。</strong>之后，将会出现一个int数字来代表数组的长度。为了方便大家的理解，小编先粘几行代码：</p><p class=\"ql-align-justify\">public class Demo03ArrayLength {public static void main(String args[]){short[] array1=new short[7];char[] array2={\'a\',\'s\',\'d\',\'f\',\'g\',\'h\',\'j\',\'k\',\'l\'};int len=<strong>array2.length;//可以先定义一个变量，然后打印输出。</strong>System.out.println(\"array2数组的长度是：\"+len);System.out.println(array2.length);//也可以，直接打印输出格式，数组名称.length。</p><p class=\"ql-align-justify\">大家也要注意一个问题，<strong>数组一旦创建，程序运行期间，长度不可改变。</strong>这是什么意思呢，小编先粘一张图片。</p><p class=\"ql-align-justify\">代码如下：</p><p class=\"ql-align-justify\">double[] array3=new double[5];System.out.println(array3.length);//5array3=new double[3];System.out.println(array3.length);//3</p><p class=\"ql-align-justify\">小编之前说过，数组在运行期间长度是不可以发生改变的，可是这行代码，还是可以输出3和5，这又是什么情况呢？小编觉得，<strong>右边new double[5]是赋值给左边的，右边是一个数组，而左边只是一个代号array3。</strong>大家可以参考小编上面粘的图片，之前小编有说过<strong>new出来的东西实在堆当中，</strong>所以这个代码中有两个数组，<strong>堆当中的数组长度没有发生改变，只是增加了一个长度为5的数组。</strong></p><p class=\"ql-align-justify\">接下来，小编要介绍的是<strong>数组的遍历</strong>，什么是数组的遍历呢？<strong>就是对数组当中的每一个元素进行逐一输出，挨个处理。</strong>默认的处理方式就是打印输出。</p><p><br></p>', '2020-07-01 00:00:00');
INSERT INTO `week_news` VALUES ('6', 'feqgtfw4eg yt4tba4w6n4', '<p> wttse4 bs6t4n y6sn</p>', '2020-07-01 00:00:00');

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
INSERT INTO `week_role` VALUES ('1', '1', '2', '总监');
INSERT INTO `week_role` VALUES ('2', '1', '3', '部门经理');
INSERT INTO `week_role` VALUES ('3', '1', '4', '成员');
INSERT INTO `week_role` VALUES ('4', '2', '2', '总监');
INSERT INTO `week_role` VALUES ('5', '2', '3', '部门经理');
INSERT INTO `week_role` VALUES ('6', '2', '4', '成员');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_user
-- ----------------------------
INSERT INTO `week_user` VALUES ('1', 'admin', 'administrator', null, '1', 'administrator', '0c00cf218b8b1d41c0903cd62ac9edfe', null, null, null, null, null, null, null);
INSERT INTO `week_user` VALUES ('6', '111111', '公司1负责人', '15225158238', '2', '总监', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', null, null, null, null);
INSERT INTO `week_user` VALUES ('7', '222222', '公司2负责人', '15225158237', '2', '总监', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108989@qq.com', '2', '测试公司2', null, null, null, null);
INSERT INTO `week_user` VALUES ('8', '111112', '部门经理1', '15225158236', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108996@qq.com', '1', '测试公司1', '111111111', '部门1', '2020-06-24 15:11:56', null);
INSERT INTO `week_user` VALUES ('10', '222223', '部门经理1', '15225158238', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '2', '测试公司2', '1111111111', '部门1', '2020-06-24 15:17:19', null);
INSERT INTO `week_user` VALUES ('11', '222224', '部门经理2', '15225158238', '3', '部门经理', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '2', '测试公司2', '1111111112', '部门2', '2020-06-24 15:17:50', null);
INSERT INTO `week_user` VALUES ('12', '111114', '成员1', '15225158238', '4', '成员', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', '111111111', '部门1', '2020-06-24 15:19:27', null);
INSERT INTO `week_user` VALUES ('15', '123456', '222224', '15225158236', '4', '成员', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '2', '测试公司2', '1111111111', '部门1', '2020-06-29 16:00:10', null);
INSERT INTO `week_user` VALUES ('16', '22225', '宋广辉', '1522518238', '4', '成员', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '2', '测试公司2', '1111111112', '部门2', '2020-06-29 16:12:01', null);
INSERT INTO `week_user` VALUES ('17', '111115', '成员2', '15225158238', '4', '成员', '0c00cf218b8b1d41c0903cd62ac9edfe', '717108998@qq.com', '1', '测试公司1', '111111111', '部门1', '2020-07-01 19:12:20', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of week_week
-- ----------------------------
INSERT INTO `week_week` VALUES ('6', '111112', '部门经理1', '3', '部门经理1测试周报第一次', '2020-06-24 00:00:00', '1592983452597', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('7', '111112', '部门经理1', '3', '部门经理1测试周报第二次', '2020-06-24 00:00:00', '1592983471055', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('8', '222222', '公司2负责人', '2', '公司2负责人填写周报第一次测试', '2020-06-24 00:00:00', '1592983396137', '1592755200000', '1593359999000', null, '2');
INSERT INTO `week_week` VALUES ('9', '222222', '公司2负责人', '2', '公司2负责人填写周报第二次测试', '2020-06-24 00:00:00', '1592983401967', '1592755200000', '1593359999000', null, '2');
INSERT INTO `week_week` VALUES ('10', '111111', '公司1负责人', '2', '数据来了！！[{\"本周重点目标内容\":\"重点内容1\",\"关键结果\":\"结果1\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"重点内容2\",\"关键结果\":\"结果2\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"重点内容3\",\"关键结果\":\"结果3\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"重点内容4\",\"关键结果\":\"结果4\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"重点内容5\",\"关键结果\":\"结果5\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false}][{\"下周重点工作计划\":\"下周工作1\",\"完成标准及输出结果\":\"标准1\",\"备注\":\"\",\"show\":false,\"完成时间点\":\"2020-07-06\"},{\"下周重点工作计划\":\"下周工作2\",\"完成标准及输出结果\":\"标准2\",\"备注\":\"\",\"show\":false,\"完成时间点\":\"2020-07-06\"},{\"下周重点工作计划\":\"下周工作3\",\"完成标准及输出结果\":\"标准3\",\"备注\":\"\",\"show\":false,\"完成时间点\":\"2020-07-06\"},{\"下周重点工作计划\":\"下周工作4\",\"完成标准及输出结果\":\"标准4\",\"备注\":\"\",\"show\":false,\"完成时间点\":\"2020-07-06\"},{\"下周重点工作计划\":\"下周工作5\",\"完成标准及输出结果\":\"标准5\",\"备注\":\"\",\"show\":false,\"完成时间点\":\"2020-07-06\"}]', '2020-06-24 00:00:00', '1593337460796', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('11', '111111', '公司1负责人', '2', '公司1负责人填写周报第二次测试', '2020-06-24 00:00:00', '1592983507829', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('12', '111111', '公司1负责人', '2', '公司1负责人填写周报第三次测试', '2020-06-24 00:00:00', '1592983512924', '1592755200000', '1593359999000', null, '1');
INSERT INTO `week_week` VALUES ('15', '111114', '成员1', '4', '数据来了！！[{\"本周重点目标内容\":\"\",\"关键结果\":\"\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"\",\"关键结果\":\"\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"\",\"关键结果\":\"\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"\",\"关键结果\":\"\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false},{\"本周重点目标内容\":\"\",\"关键结果\":\"\",\"未完成原因分析\":\"\",\"备注\":\"\",\"show\":false}][{\"下周重点工作计划\":\"\",\"完成标准及输出结果\":\"\",\"备注\":\"\",\"show\":false},{\"下周重点工作计划\":\"\",\"完成标准及输出结果\":\"\",\"备注\":\"\",\"show\":false},{\"下周重点工作计划\":\"\",\"完成标准及输出结果\":\"\",\"备注\":\"\",\"show\":false},{\"下周重点工作计划\":\"\",\"完成标准及输出结果\":\"\",\"备注\":\"\",\"show\":false},{\"下周重点工作计划\":\"\",\"完成标准及输出结果\":\"\",\"备注\":\"\",\"show\":false}]', '2020-06-24 00:00:00', '1593338543774', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('16', '111114', '成员1', '4', '成员1填写周报第二次测试', '2020-06-24 00:00:00', '1592983710721', '1592755200000', '1593359999000', '111111111', '1');
INSERT INTO `week_week` VALUES ('19', '111111', '公司1负责人', '2', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593479833278', '1593360000000', '1593964799000', null, '1');
INSERT INTO `week_week` VALUES ('20', '111114', '成员1', '4', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593480111733', '1593360000000', '1593964799000', '111111111', '1');
INSERT INTO `week_week` VALUES ('21', '111112', '部门经理1', '3', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1\n2\n3\n4</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593430270303', '1593360000000', '1593964799000', '111111111', '1');
INSERT INTO `week_week` VALUES ('23', '222222', '公司2负责人', '2', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593417559889', '1593360000000', '1593964799000', null, '2');
INSERT INTO `week_week` VALUES ('24', '222223', '部门经理1', '3', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593417583660', '1593360000000', '1593964799000', '1111111111', '2');
INSERT INTO `week_week` VALUES ('25', '123456', '222224', '4', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593592680752', '1593360000000', '1593964799000', '1111111111', '2');
INSERT INTO `week_week` VALUES ('26', '0', 'administrator', '1', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">2020-07-01</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593477507662', '1593360000000', '1593964799000', null, null);
INSERT INTO `week_week` VALUES ('27', '222224', '部门经理2', '3', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593418279907', '1593360000000', '1593964799000', '1111111112', '2');
INSERT INTO `week_week` VALUES ('28', '22225', '宋广辉', '4', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">undefined</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-06-29 00:00:00', '1593418335148', '1593360000000', '1593964799000', '1111111112', '2');
INSERT INTO `week_week` VALUES ('29', '111115', '成员2', '4', '<span class=\"content1 backgroundSet\">本周重点目标内容(O)</span><span class=\"content1 backgroundSet\">关键结果(KRs)</span><span class=\"content2 backgroundSet\">未完成原因分析</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">2</span><span class=\"content2 clearcenter\">3</span><span class=\"content3 clearcenter rightContent\">4</span><br><span class=\"content1 clearcenter\">11</span><span class=\"content1 clearcenter\">22</span><span class=\"content2 clearcenter\">33</span><span class=\"content3 clearcenter rightContent\">44</span><br><span class=\"content1 clearcenter\">111</span><span class=\"content1 clearcenter\">222</span><span class=\"content2 clearcenter\">333</span><span class=\"content3 clearcenter rightContent\">444</span><br><span class=\"content1 clearcenter\">1111</span><span class=\"content1 clearcenter\">2222</span><span class=\"content2 clearcenter\">3333</span><span class=\"content3 clearcenter rightContent\">4444</span><br><span class=\"content1 clearcenter\">11111</span><span class=\"content1 clearcenter\">22222</span><span class=\"content2 clearcenter\">33333</span><span class=\"content3 clearcenter rightContent\">44444</span><br><span class=\"content1 backgroundSet\">下周重点工作计划</span><span class=\"content1 backgroundSet\">完成标准及输出结果</span><span class=\"content2 backgroundSet\">完成时间点</span><span class=\"content3 backgroundSet rightContent\">备注</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">2020-07-02</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">2020-07-02</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">2020-07-02</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">2020-07-02</span><span class=\"content3 clearcenter rightContent\">1</span><br><span class=\"content1 clearcenter\">1</span><span class=\"content1 clearcenter\">1</span><span class=\"content2 clearcenter\">2020-07-03</span><span class=\"content3 clearcenter rightContent\">1</span><br>', '2020-07-01 00:00:00', '1593602020917', '1593360000000', '1593964799000', '111111111', '1');
