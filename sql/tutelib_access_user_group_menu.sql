/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : yunzhicms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-12-29 22:34:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tutelib_access_user_group_menu
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_user_group_menu`;
CREATE TABLE `tutelib_access_user_group_menu` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `menu_id` int(11) unsigned NOT NULL COMMENT 'fk menu 菜单外键',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group_name`,`menu_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组-菜单 权限表。权限设置(LCURD)';

-- ----------------------------
-- Records of tutelib_access_user_group_menu
-- ----------------------------
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'public');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '3', 'editor');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '12', 'index');
