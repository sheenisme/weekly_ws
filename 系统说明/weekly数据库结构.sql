/*
Navicat MySQL Data Transfer

Source Server         : link1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : weekly

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-08-28 10:44:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for week_company
-- ----------------------------
DROP TABLE IF EXISTS `week_company`;
CREATE TABLE `week_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `usernum` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for week_department
-- ----------------------------
DROP TABLE IF EXISTS `week_department`;
CREATE TABLE `week_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) unsigned DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for week_keysupervision
-- ----------------------------
DROP TABLE IF EXISTS `week_keysupervision`;
CREATE TABLE `week_keysupervision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_requires` varchar(255) DEFAULT NULL,
  `item_time` date DEFAULT NULL,
  `item_leadings` varchar(255) DEFAULT NULL,
  `item_execution` varchar(255) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for week_keytree
-- ----------------------------
DROP TABLE IF EXISTS `week_keytree`;
CREATE TABLE `week_keytree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `lids` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for week_log
-- ----------------------------
DROP TABLE IF EXISTS `week_log`;
CREATE TABLE `week_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag` tinyint(4) DEFAULT NULL,
  `usernum` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for week_news
-- ----------------------------
DROP TABLE IF EXISTS `week_news`;
CREATE TABLE `week_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `periods` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for week_nextcontent
-- ----------------------------
DROP TABLE IF EXISTS `week_nextcontent`;
CREATE TABLE `week_nextcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `userid` int(11) DEFAULT NULL,
  `usernum` varchar(255) DEFAULT NULL,
  `content` text,
  `lastdate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for week_role
-- ----------------------------
DROP TABLE IF EXISTS `week_role`;
CREATE TABLE `week_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for week_user
-- ----------------------------
DROP TABLE IF EXISTS `week_user`;
CREATE TABLE `week_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usernum` varchar(10) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for week_week
-- ----------------------------
DROP TABLE IF EXISTS `week_week`;
CREATE TABLE `week_week` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usernum` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `startDate` bigint(20) DEFAULT NULL,
  `endDate` bigint(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `theTable` text,
  `nextTable` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
