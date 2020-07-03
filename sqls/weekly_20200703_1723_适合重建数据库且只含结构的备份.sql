# Host:   (Version: 5.5.53)
# Date: 2020-07-03 17:24:45
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "week_company"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Structure for table "week_department"
#

DROP TABLE IF EXISTS `week_department`;
CREATE TABLE `week_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) unsigned DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Structure for table "week_log"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Structure for table "week_news"
#

DROP TABLE IF EXISTS `week_news`;
CREATE TABLE `week_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#
# Structure for table "week_role"
#

DROP TABLE IF EXISTS `week_role`;
CREATE TABLE `week_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Structure for table "week_user"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Structure for table "week_week"
#

DROP TABLE IF EXISTS `week_week`;
CREATE TABLE `week_week` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usernum` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `startDate` bigint(20) DEFAULT NULL,
  `endDate` bigint(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
