/*
Navicat MySQL Data Transfer

Source Server         : link1
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : weekly

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-08-03 16:12:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for week_keysupervision
-- ----------------------------
DROP TABLE IF EXISTS `week_keysupervision`;
CREATE TABLE `week_keysupervision` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_requires` varchar(255) DEFAULT NULL,
  `item_time` date DEFAULT NULL,
  `item_leadings` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_execution` varchar(255) DEFAULT NULL,
  `item_sources` varchar(255) DEFAULT NULL,
  `item_period` varchar(255) DEFAULT NULL,
  `item_date` date DEFAULT NULL,
  `item_auth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
