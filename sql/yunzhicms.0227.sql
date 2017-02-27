/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : localhost
 Source Database       : yunzhicms

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 02/27/2017 08:19:22 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `yunzhi_access_menu_block`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_menu_block`;
CREATE TABLE `yunzhi_access_menu_block` (
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT 'fk menu',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT 'fk block',
  `action` varchar(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`block_id`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='菜单-区块 权限表';

-- ----------------------------
--  Records of `yunzhi_access_menu_block`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_access_menu_block` VALUES ('1', '1', ''), ('1', '7', ''), ('1', '8', ''), ('1', '9', ''), ('1', '13', ''), ('1', '14', ''), ('2', '1', ''), ('2', '7', ''), ('2', '9', ''), ('2', '13', ''), ('2', '14', ''), ('4', '1', ''), ('4', '7', ''), ('4', '9', ''), ('4', '13', ''), ('4', '14', ''), ('5', '1', ''), ('5', '7', ''), ('5', '9', ''), ('5', '13', ''), ('5', '14', ''), ('6', '1', ''), ('6', '7', ''), ('6', '9', ''), ('6', '13', ''), ('6', '14', ''), ('7', '1', ''), ('7', '7', ''), ('7', '9', ''), ('7', '13', ''), ('7', '14', ''), ('8', '1', ''), ('8', '7', ''), ('8', '9', ''), ('8', '13', ''), ('8', '14', ''), ('9', '1', ''), ('9', '7', ''), ('9', '9', ''), ('9', '13', ''), ('9', '14', ''), ('10', '1', ''), ('10', '7', ''), ('10', '9', ''), ('10', '13', ''), ('10', '14', ''), ('11', '1', ''), ('11', '7', ''), ('11', '9', ''), ('11', '13', ''), ('11', '14', ''), ('12', '1', ''), ('12', '7', ''), ('12', '9', ''), ('12', '13', ''), ('12', '14', ''), ('13', '1', ''), ('13', '7', ''), ('13', '9', ''), ('13', '13', ''), ('13', '14', ''), ('14', '1', ''), ('14', '7', ''), ('14', '9', ''), ('14', '13', ''), ('14', '14', ''), ('15', '1', ''), ('15', '7', ''), ('15', '9', ''), ('15', '13', ''), ('15', '14', ''), ('16', '1', ''), ('16', '7', ''), ('16', '9', ''), ('16', '13', ''), ('16', '14', ''), ('17', '1', ''), ('17', '7', ''), ('17', '9', ''), ('17', '13', ''), ('17', '14', ''), ('18', '1', ''), ('18', '7', ''), ('18', '9', ''), ('18', '13', ''), ('18', '14', ''), ('19', '1', ''), ('19', '7', ''), ('19', '9', ''), ('19', '13', ''), ('19', '14', ''), ('20', '1', ''), ('20', '7', ''), ('20', '9', ''), ('20', '13', ''), ('20', '14', ''), ('21', '1', ''), ('21', '7', ''), ('21', '9', ''), ('21', '13', ''), ('21', '14', ''), ('22', '1', ''), ('22', '7', ''), ('22', '9', ''), ('22', '13', ''), ('22', '14', ''), ('23', '1', ''), ('23', '7', ''), ('23', '9', ''), ('23', '13', ''), ('23', '14', ''), ('24', '1', ''), ('24', '7', ''), ('24', '9', ''), ('24', '13', ''), ('24', '14', ''), ('25', '1', ''), ('25', '7', ''), ('25', '9', ''), ('25', '13', ''), ('25', '14', ''), ('26', '1', ''), ('26', '7', ''), ('26', '9', ''), ('26', '13', ''), ('26', '14', ''), ('27', '1', ''), ('27', '7', ''), ('27', '9', ''), ('27', '13', ''), ('27', '14', ''), ('28', '1', ''), ('28', '7', ''), ('28', '9', ''), ('28', '13', ''), ('28', '14', ''), ('29', '1', ''), ('29', '7', ''), ('29', '9', ''), ('29', '13', ''), ('29', '14', ''), ('30', '1', ''), ('30', '7', ''), ('30', '9', ''), ('30', '13', ''), ('30', '14', ''), ('31', '1', ''), ('31', '7', ''), ('31', '9', ''), ('31', '13', ''), ('31', '14', ''), ('32', '1', ''), ('32', '7', ''), ('32', '9', ''), ('32', '13', ''), ('32', '14', ''), ('34', '1', ''), ('34', '7', ''), ('34', '9', ''), ('34', '13', ''), ('34', '14', ''), ('35', '1', ''), ('35', '7', ''), ('35', '9', ''), ('35', '13', ''), ('35', '14', ''), ('36', '1', ''), ('36', '7', ''), ('36', '9', ''), ('36', '13', ''), ('36', '14', ''), ('37', '1', ''), ('37', '7', ''), ('37', '9', ''), ('37', '13', ''), ('37', '14', ''), ('38', '1', ''), ('38', '7', ''), ('38', '9', ''), ('38', '13', ''), ('38', '14', ''), ('39', '1', ''), ('39', '7', ''), ('39', '9', ''), ('39', '13', ''), ('39', '14', ''), ('40', '1', ''), ('40', '7', ''), ('40', '9', ''), ('40', '13', ''), ('40', '14', ''), ('41', '1', ''), ('41', '7', ''), ('41', '9', ''), ('41', '13', ''), ('41', '14', ''), ('42', '1', ''), ('42', '7', ''), ('42', '9', ''), ('42', '13', ''), ('42', '14', ''), ('43', '1', ''), ('43', '7', ''), ('43', '9', ''), ('43', '13', ''), ('43', '14', ''), ('44', '1', ''), ('44', '7', ''), ('44', '9', ''), ('44', '13', ''), ('44', '14', ''), ('45', '1', ''), ('45', '7', ''), ('45', '9', ''), ('45', '13', ''), ('45', '14', ''), ('46', '1', ''), ('46', '7', ''), ('46', '9', ''), ('46', '13', ''), ('46', '14', ''), ('47', '1', ''), ('47', '7', ''), ('47', '9', ''), ('47', '13', ''), ('47', '14', ''), ('48', '1', ''), ('48', '7', ''), ('48', '9', ''), ('48', '13', ''), ('48', '14', ''), ('49', '1', ''), ('49', '7', ''), ('49', '9', ''), ('49', '13', ''), ('49', '14', ''), ('50', '1', ''), ('50', '7', ''), ('50', '9', ''), ('50', '13', ''), ('50', '14', ''), ('51', '1', ''), ('51', '7', ''), ('51', '9', ''), ('51', '13', ''), ('51', '14', ''), ('52', '1', ''), ('52', '7', ''), ('52', '9', ''), ('52', '13', ''), ('52', '14', ''), ('53', '1', ''), ('53', '7', ''), ('53', '9', ''), ('53', '13', ''), ('53', '14', ''), ('54', '1', ''), ('54', '7', ''), ('54', '9', ''), ('54', '13', ''), ('54', '14', ''), ('55', '1', ''), ('55', '7', ''), ('55', '9', ''), ('55', '13', ''), ('55', '14', ''), ('56', '1', ''), ('56', '7', ''), ('56', '9', ''), ('56', '13', ''), ('56', '14', ''), ('57', '1', ''), ('57', '7', ''), ('57', '9', ''), ('57', '13', ''), ('57', '14', ''), ('58', '1', ''), ('58', '7', ''), ('58', '9', ''), ('58', '13', ''), ('58', '14', ''), ('59', '1', ''), ('59', '7', ''), ('59', '9', ''), ('59', '13', ''), ('59', '14', ''), ('60', '1', ''), ('60', '7', ''), ('60', '9', ''), ('60', '13', ''), ('60', '14', ''), ('61', '1', ''), ('61', '7', ''), ('61', '9', ''), ('61', '13', ''), ('61', '14', ''), ('62', '1', ''), ('62', '7', ''), ('62', '9', ''), ('62', '13', ''), ('62', '14', ''), ('63', '1', ''), ('63', '7', ''), ('63', '9', ''), ('63', '13', ''), ('63', '14', ''), ('65', '1', ''), ('65', '7', ''), ('65', '9', ''), ('65', '13', ''), ('65', '14', ''), ('66', '1', ''), ('66', '7', ''), ('66', '9', ''), ('66', '13', ''), ('66', '14', ''), ('67', '1', ''), ('67', '7', ''), ('67', '9', ''), ('67', '13', ''), ('67', '14', ''), ('68', '1', ''), ('68', '7', ''), ('68', '9', ''), ('68', '13', ''), ('68', '14', ''), ('69', '1', ''), ('69', '7', ''), ('69', '9', ''), ('69', '13', ''), ('69', '14', ''), ('70', '1', ''), ('70', '7', ''), ('70', '9', ''), ('70', '13', ''), ('70', '14', ''), ('71', '1', ''), ('71', '7', ''), ('71', '9', ''), ('71', '13', ''), ('71', '14', ''), ('72', '1', ''), ('72', '7', ''), ('72', '9', ''), ('72', '13', ''), ('72', '14', ''), ('73', '1', ''), ('73', '7', ''), ('73', '9', ''), ('73', '13', ''), ('73', '14', ''), ('74', '1', ''), ('74', '7', ''), ('74', '9', ''), ('74', '13', ''), ('74', '14', ''), ('75', '1', ''), ('75', '7', ''), ('75', '9', ''), ('75', '13', ''), ('75', '14', ''), ('76', '1', ''), ('76', '7', ''), ('76', '9', ''), ('76', '13', ''), ('76', '14', ''), ('77', '1', ''), ('77', '7', ''), ('77', '9', ''), ('77', '13', ''), ('77', '14', ''), ('78', '1', ''), ('78', '7', ''), ('78', '9', ''), ('78', '13', ''), ('78', '14', ''), ('79', '1', ''), ('79', '7', ''), ('79', '9', ''), ('79', '13', ''), ('79', '14', ''), ('80', '1', ''), ('80', '7', ''), ('80', '9', ''), ('80', '13', ''), ('80', '14', ''), ('81', '1', ''), ('81', '7', ''), ('81', '9', ''), ('81', '13', ''), ('81', '14', ''), ('82', '1', ''), ('82', '7', ''), ('82', '9', ''), ('82', '13', ''), ('82', '14', ''), ('83', '1', ''), ('83', '7', ''), ('83', '9', ''), ('83', '13', ''), ('83', '14', ''), ('84', '1', ''), ('84', '7', ''), ('84', '9', ''), ('84', '13', ''), ('84', '14', ''), ('85', '1', ''), ('85', '7', ''), ('85', '9', ''), ('85', '13', ''), ('85', '14', ''), ('86', '1', ''), ('86', '7', ''), ('86', '9', ''), ('86', '13', ''), ('86', '14', ''), ('87', '1', ''), ('87', '7', ''), ('87', '9', ''), ('87', '13', ''), ('87', '14', ''), ('88', '1', ''), ('88', '7', ''), ('88', '9', ''), ('88', '13', ''), ('88', '14', ''), ('89', '1', ''), ('89', '7', ''), ('89', '9', ''), ('89', '13', ''), ('89', '14', ''), ('90', '1', ''), ('90', '7', ''), ('90', '9', ''), ('90', '13', ''), ('90', '14', ''), ('91', '1', ''), ('91', '7', ''), ('91', '9', ''), ('91', '13', ''), ('91', '14', ''), ('92', '1', ''), ('92', '7', ''), ('92', '9', ''), ('92', '13', ''), ('92', '14', ''), ('93', '1', ''), ('93', '7', ''), ('93', '9', ''), ('93', '13', ''), ('93', '14', ''), ('94', '1', ''), ('94', '7', ''), ('94', '9', ''), ('94', '13', ''), ('94', '14', ''), ('95', '1', ''), ('95', '7', ''), ('95', '9', ''), ('95', '13', ''), ('95', '14', ''), ('96', '1', ''), ('96', '7', ''), ('96', '9', ''), ('96', '13', ''), ('96', '14', ''), ('97', '1', ''), ('97', '7', ''), ('97', '9', ''), ('97', '13', ''), ('97', '14', ''), ('98', '1', ''), ('98', '7', ''), ('98', '9', ''), ('98', '13', ''), ('98', '14', ''), ('99', '1', ''), ('99', '7', ''), ('99', '9', ''), ('99', '13', ''), ('99', '14', ''), ('100', '1', ''), ('100', '7', ''), ('100', '9', ''), ('100', '13', ''), ('100', '14', ''), ('101', '1', ''), ('101', '7', ''), ('101', '9', ''), ('101', '13', ''), ('101', '14', ''), ('102', '1', ''), ('102', '7', ''), ('102', '9', ''), ('102', '13', ''), ('102', '14', ''), ('103', '1', ''), ('103', '7', ''), ('103', '9', ''), ('103', '13', ''), ('103', '14', ''), ('104', '1', ''), ('104', '7', ''), ('104', '9', ''), ('104', '13', ''), ('104', '14', ''), ('105', '1', ''), ('105', '7', ''), ('105', '9', ''), ('105', '13', ''), ('105', '14', ''), ('106', '1', ''), ('106', '7', ''), ('106', '9', ''), ('106', '13', ''), ('106', '14', ''), ('107', '1', ''), ('107', '7', ''), ('107', '9', ''), ('107', '13', ''), ('107', '14', ''), ('108', '1', ''), ('108', '7', ''), ('108', '9', ''), ('108', '13', ''), ('108', '14', ''), ('109', '1', ''), ('109', '7', ''), ('109', '9', ''), ('109', '13', ''), ('109', '14', ''), ('110', '1', ''), ('110', '7', ''), ('110', '9', ''), ('110', '13', ''), ('110', '14', ''), ('112', '1', ''), ('112', '7', ''), ('112', '9', ''), ('112', '13', ''), ('112', '14', ''), ('113', '1', ''), ('113', '7', ''), ('113', '9', ''), ('113', '13', ''), ('113', '14', ''), ('114', '1', ''), ('114', '7', ''), ('114', '9', ''), ('114', '13', ''), ('114', '14', ''), ('115', '1', ''), ('115', '7', ''), ('115', '9', ''), ('115', '13', ''), ('115', '14', ''), ('116', '1', ''), ('116', '7', ''), ('116', '9', ''), ('116', '13', ''), ('116', '14', ''), ('117', '1', ''), ('117', '7', ''), ('117', '9', ''), ('117', '13', ''), ('117', '14', ''), ('118', '1', ''), ('118', '7', ''), ('118', '9', ''), ('118', '13', ''), ('118', '14', ''), ('119', '1', ''), ('119', '7', ''), ('119', '9', ''), ('119', '13', ''), ('119', '14', ''), ('120', '1', ''), ('120', '7', ''), ('120', '9', ''), ('120', '13', ''), ('120', '14', ''), ('121', '1', ''), ('121', '7', ''), ('121', '9', ''), ('121', '13', ''), ('121', '14', ''), ('122', '1', ''), ('122', '7', ''), ('122', '9', ''), ('122', '13', ''), ('122', '14', ''), ('123', '1', ''), ('123', '7', ''), ('123', '9', ''), ('123', '13', ''), ('123', '14', ''), ('124', '1', ''), ('124', '7', ''), ('124', '9', ''), ('124', '13', ''), ('124', '14', ''), ('125', '1', ''), ('125', '7', ''), ('125', '9', ''), ('125', '13', ''), ('125', '14', ''), ('126', '1', ''), ('126', '7', ''), ('126', '9', ''), ('126', '13', ''), ('126', '14', ''), ('127', '1', ''), ('127', '7', ''), ('127', '9', ''), ('127', '13', ''), ('127', '14', ''), ('129', '1', ''), ('129', '7', ''), ('129', '9', ''), ('129', '13', ''), ('129', '14', ''), ('130', '1', ''), ('130', '7', ''), ('130', '9', ''), ('130', '13', ''), ('130', '14', ''), ('131', '1', ''), ('131', '7', ''), ('131', '9', ''), ('131', '13', ''), ('131', '14', ''), ('132', '1', ''), ('132', '7', ''), ('132', '9', ''), ('132', '13', ''), ('132', '14', ''), ('133', '1', ''), ('133', '7', ''), ('133', '9', ''), ('133', '13', ''), ('133', '14', ''), ('134', '1', ''), ('134', '7', ''), ('134', '9', ''), ('134', '13', ''), ('134', '14', ''), ('135', '1', ''), ('135', '7', ''), ('135', '9', ''), ('135', '13', ''), ('135', '14', ''), ('136', '1', ''), ('136', '7', ''), ('136', '9', ''), ('136', '13', ''), ('136', '14', ''), ('137', '1', ''), ('137', '7', ''), ('137', '9', ''), ('137', '13', ''), ('137', '14', ''), ('138', '1', ''), ('138', '7', ''), ('138', '9', ''), ('138', '13', ''), ('138', '14', ''), ('139', '1', ''), ('139', '7', ''), ('139', '9', ''), ('139', '13', ''), ('139', '14', ''), ('140', '1', ''), ('140', '7', ''), ('140', '9', ''), ('140', '13', ''), ('140', '14', ''), ('141', '1', ''), ('141', '7', ''), ('141', '9', ''), ('141', '13', ''), ('141', '14', ''), ('143', '1', ''), ('143', '2', ''), ('143', '9', ''), ('143', '13', ''), ('143', '14', ''), ('144', '1', ''), ('144', '7', ''), ('144', '9', ''), ('144', '13', ''), ('144', '14', ''), ('146', '1', ''), ('146', '9', ''), ('146', '13', ''), ('146', '14', ''), ('147', '1', ''), ('148', '1', ''), ('149', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_access_menu_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_menu_plugin`;
CREATE TABLE `yunzhi_access_menu_plugin` (
  `menu_id` int(11) unsigned NOT NULL,
  `plugin_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`menu_id`,`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='菜单-插件 权限表';

-- ----------------------------
--  Records of `yunzhi_access_menu_plugin`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_access_menu_plugin` VALUES ('1', '2'), ('2', '2'), ('3', '1'), ('4', '2'), ('5', '2'), ('6', '2'), ('7', '2'), ('8', '2'), ('9', '2'), ('10', '2'), ('11', '2'), ('12', '2'), ('13', '2'), ('14', '2'), ('15', '2'), ('18', '2'), ('19', '2'), ('20', '2'), ('39', '2'), ('40', '2'), ('48', '2'), ('49', '2'), ('50', '2'), ('60', '2'), ('61', '2'), ('65', '2'), ('66', '2'), ('67', '2'), ('68', '2'), ('69', '2'), ('70', '2'), ('71', '2'), ('72', '2'), ('73', '2'), ('74', '2'), ('75', '2'), ('117', '2'), ('118', '2'), ('129', '2'), ('130', '2'), ('131', '2'), ('132', '2'), ('133', '2'), ('134', '2'), ('135', '2'), ('137', '2'), ('138', '2'), ('139', '2'), ('140', '2'), ('141', '2'), ('143', '2'), ('144', '2');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_access_user_group_block`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_user_group_block`;
CREATE TABLE `yunzhi_access_user_group_block` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `block_id` int(11) unsigned NOT NULL COMMENT 'fk block 区块外键',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group_name`,`block_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组-菜单 权限表。权限设置(LCURD)';

-- ----------------------------
--  Records of `yunzhi_access_user_group_block`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_access_user_group_block` VALUES ('admin', '1', '1'), ('admin', '2', 'edit'), ('admin', '2', 'index'), ('admin', '2', 'save'), ('admin', '14', '1'), ('editor', '1', '1'), ('editor', '2', 'edit'), ('editor', '2', 'index'), ('editor', '2', 'save'), ('editor', '14', '1'), ('public', '1', '1'), ('public', '2', 'index'), ('public', '14', '1'), ('register', '1', '1'), ('register', '2', 'index'), ('register', '14', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_access_user_group_field`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_user_group_field`;
CREATE TABLE `yunzhi_access_user_group_field` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `field_id` int(11) unsigned NOT NULL COMMENT 'fk field 字段外键',
  `action` char(20) NOT NULL,
  PRIMARY KEY (`user_group_name`,`field_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组 字段 权限设置';

-- ----------------------------
--  Records of `yunzhi_access_user_group_field`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_access_user_group_field` VALUES ('admin', '4', 'addSubCount'), ('admin', '4', 'edit'), ('admin', '4', 'index'), ('admin', '5', 'addSubCount'), ('admin', '5', 'edit'), ('admin', '5', 'index'), ('admin', '5', 'upload'), ('admin', '6', 'addSubCount'), ('admin', '6', 'edit'), ('admin', '6', 'index'), ('admin', '7', 'addSubCount'), ('admin', '7', 'edit'), ('admin', '7', 'index'), ('admin', '8', 'addSubCount'), ('admin', '8', 'edit'), ('admin', '8', 'index'), ('admin', '19', 'edit'), ('admin', '19', 'index'), ('admin', '19', 'save'), ('admin', '21', 'edit'), ('admin', '21', 'index'), ('admin', '21', 'upload'), ('editor', '4', 'addSubCount'), ('editor', '4', 'edit'), ('editor', '4', 'index'), ('editor', '5', 'addSubCount'), ('editor', '5', 'edit'), ('editor', '5', 'index'), ('editor', '5', 'upload'), ('editor', '6', 'addSubCount'), ('editor', '6', 'edit'), ('editor', '6', 'index'), ('editor', '7', 'addSubCount'), ('editor', '7', 'edit'), ('editor', '7', 'index'), ('editor', '8', 'addSubCount'), ('editor', '8', 'edit'), ('editor', '8', 'index'), ('editor', '19', 'edit'), ('editor', '19', 'index'), ('editor', '19', 'save'), ('editor', '21', 'edit'), ('editor', '21', 'index'), ('editor', '21', 'upload'), ('public', '4', 'index'), ('public', '5', 'index'), ('public', '6', 'index'), ('public', '7', 'index'), ('public', '8', 'index'), ('public', '19', 'index'), ('public', '21', 'index'), ('register', '4', 'index'), ('register', '5', 'index'), ('register', '6', 'index'), ('register', '7', 'index'), ('register', '8', 'index'), ('register', '19', 'index'), ('register', '21', 'index');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_access_user_group_menu`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_user_group_menu`;
CREATE TABLE `yunzhi_access_user_group_menu` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `menu_id` int(11) unsigned NOT NULL COMMENT 'fk menu 菜单外键',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group_name`,`menu_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组-菜单 权限表。权限设置(LCURD)';

-- ----------------------------
--  Records of `yunzhi_access_user_group_menu`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_access_user_group_menu` VALUES ('admin', '1', 'index'), ('admin', '12', 'add'), ('admin', '12', 'delete'), ('admin', '12', 'edit'), ('admin', '12', 'index'), ('admin', '12', 'read'), ('admin', '12', 'save'), ('admin', '12', 'update'), ('admin', '13', 'add'), ('admin', '13', 'delete'), ('admin', '13', 'edit'), ('admin', '13', 'index'), ('admin', '13', 'read'), ('admin', '13', 'save'), ('admin', '13', 'update'), ('admin', '14', 'add'), ('admin', '14', 'delete'), ('admin', '14', 'edit'), ('admin', '14', 'index'), ('admin', '14', 'read'), ('admin', '14', 'save'), ('admin', '14', 'update'), ('admin', '15', 'edit'), ('admin', '15', 'index'), ('admin', '15', 'save'), ('admin', '143', 'index'), ('admin', '144', 'edit'), ('admin', '144', 'index'), ('admin', '144', 'logout'), ('admin', '144', 'update'), ('admin', '146', 'edit'), ('admin', '146', 'index'), ('admin', '146', 'logout'), ('admin', '146', 'update'), ('admin', '147', 'edit'), ('admin', '147', 'index'), ('admin', '147', 'logout'), ('admin', '147', 'update'), ('editor', '1', 'index'), ('editor', '12', 'add'), ('editor', '12', 'delete'), ('editor', '12', 'edit'), ('editor', '12', 'index'), ('editor', '12', 'read'), ('editor', '12', 'save'), ('editor', '12', 'update'), ('editor', '13', 'add'), ('editor', '13', 'delete'), ('editor', '13', 'edit'), ('editor', '13', 'index'), ('editor', '13', 'read'), ('editor', '13', 'save'), ('editor', '13', 'update'), ('editor', '14', 'add'), ('editor', '14', 'delete'), ('editor', '14', 'edit'), ('editor', '14', 'index'), ('editor', '14', 'read'), ('editor', '14', 'save'), ('editor', '14', 'update'), ('editor', '15', 'edit'), ('editor', '15', 'index'), ('editor', '15', 'save'), ('editor', '143', 'index'), ('editor', '144', 'edit'), ('editor', '144', 'index'), ('editor', '144', 'logout'), ('editor', '144', 'update'), ('editor', '146', 'edit'), ('editor', '146', 'index'), ('editor', '146', 'logout'), ('editor', '146', 'update'), ('editor', '147', 'edit'), ('editor', '147', 'index'), ('editor', '147', 'logout'), ('editor', '147', 'update'), ('public', '1', 'index'), ('public', '10', 'add'), ('public', '10', 'delete'), ('public', '10', 'edit'), ('public', '10', 'index'), ('public', '10', 'read'), ('public', '10', 'save'), ('public', '10', 'update'), ('public', '12', 'index'), ('public', '12', 'read'), ('public', '13', 'add'), ('public', '13', 'delete'), ('public', '13', 'edit'), ('public', '13', 'index'), ('public', '13', 'read'), ('public', '13', 'save'), ('public', '13', 'update'), ('public', '14', 'add'), ('public', '14', 'delete'), ('public', '14', 'edit'), ('public', '14', 'index'), ('public', '14', 'read'), ('public', '14', 'save'), ('public', '14', 'update'), ('public', '15', 'edit'), ('public', '15', 'index'), ('public', '15', 'save'), ('public', '143', 'index'), ('public', '144', 'edit'), ('public', '144', 'index'), ('public', '144', 'logout'), ('public', '144', 'update'), ('public', '146', 'index'), ('public', '146', 'login'), ('register', '1', 'index'), ('register', '12', 'add'), ('register', '12', 'delete'), ('register', '12', 'edit'), ('register', '12', 'index'), ('register', '12', 'read'), ('register', '12', 'save'), ('register', '12', 'update'), ('register', '13', 'add'), ('register', '13', 'delete'), ('register', '13', 'edit'), ('register', '13', 'index'), ('register', '13', 'read'), ('register', '13', 'save'), ('register', '13', 'update'), ('register', '14', 'add'), ('register', '14', 'delete'), ('register', '14', 'edit'), ('register', '14', 'index'), ('register', '14', 'read'), ('register', '14', 'save'), ('register', '14', 'update'), ('register', '15', 'edit'), ('register', '15', 'index'), ('register', '15', 'save'), ('register', '143', 'index'), ('register', '144', 'edit'), ('register', '144', 'index'), ('register', '144', 'logout'), ('register', '144', 'update'), ('register', '146', 'edit'), ('register', '146', 'index'), ('register', '146', 'logout'), ('register', '146', 'update'), ('register', '147', 'edit'), ('register', '147', 'index'), ('register', '147', 'logout'), ('register', '147', 'update');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_access_user_group_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_user_group_plugin`;
CREATE TABLE `yunzhi_access_user_group_plugin` (
  `user_group_name` varchar(40) NOT NULL,
  `plugin_id` int(11) unsigned NOT NULL,
  `action` varchar(40) NOT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_group_name`,`plugin_id`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `yunzhi_access_user_group_plugin`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_access_user_group_plugin` VALUES ('admin', '1', '', '1474704189', '1474704189'), ('admin', '2', 'edit', '1487586320', '1487586320'), ('admin', '3', '', '1474709149', '1474709149'), ('editor', '1', '', '1474704189', '1474704189'), ('editor', '2', 'edit', '1487586320', '1487586320'), ('editor', '3', '', '1474709149', '1474709149'), ('public', '2', 'edit', '1487586320', '1487586320'), ('register', '1', '', '1474704189', '1474704189'), ('register', '2', 'edit', '1487586320', '1487586320');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_block`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_block`;
CREATE TABLE `yunzhi_block` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_type_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk block_type',
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk menu 菜单FK。模块如果想实现LCURD，则必然需要组件支持。而组件则需要菜单支持。所以关系是区块对应菜单，菜单对应组件。',
  `position_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk position',
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0启用 1禁用',
  `weight` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `config` varchar(255) NOT NULL DEFAULT '[]' COMMENT '配置信息json',
  `filter` varchar(255) NOT NULL DEFAULT '[]' COMMENT '过滤器信息json',
  `update_time` int(6) unsigned NOT NULL,
  `create_time` int(6) unsigned NOT NULL,
  `delete_time` int(6) unsigned NOT NULL,
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `'is_delete'` (`is_delete`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='区块表';

-- ----------------------------
--  Records of `yunzhi_block`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_block` VALUES ('1', 'Menu', '0', 'menu', '主菜单', '显示在页面上方', '0', '0', '{\"pid\":\"148\",\"cssId\":\"cssmenu\",\"count\":\"5\"}', '[]', '1487770074', '0', '0', '0'), ('2', 'Slider', '0', 'slider', '幻灯片', '', '0', '0', '[]', '{\"title\":{\"type\":\"String\",\"function\":\"substr\",\"param\":{\"length\":\"8\",\"ext\":\"...\"}},\"href\":{\"type\":\"System\",\"function\":\"makeFrontpageContentUrl\",\"param\":[]},\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"Y-m-d\"}}}', '1487828850', '0', '0', '0'), ('3', 'ContentVideo', '0', 'main', '文字视频介绍', '', '0', '2', '[]', '[]', '65535', '0', '0', '0'), ('4', 'DataCounter', '0', 'main', '数据统计', '', '0', '0', '[]', '[]', '0', '0', '0', '0'), ('5', 'CaseShow', '0', 'main', '案例展示', '', '0', '0', '[]', '[]', '0', '0', '0', '0'), ('6', 'ShowCaseSlider', '0', 'main', '动态案例展示', '', '0', '0', '[]', '[]', '0', '0', '0', '0'), ('7', 'BreadCrumb', '0', 'breadCrumb', '面包屑', '', '0', '0', '[]', '[]', '1487131377', '0', '0', '0'), ('9', 'Footer', '0', 'main', '页脚', '', '0', '0', '[]', '[]', '1487593327', '78', '0', '0'), ('8', 'PictureNews', '0', 'main', '图文列表', '', '0', '1', '[]', '[]', '0', '0', '0', '0'), ('12', 'Header', '0', 'header', 'header', '', '0', '1', '[]', '[]', '1487646898', '65535', '0', '1'), ('13', 'Logo', '0', 'logo', 'logo', 'logo', '0', '1', '[]', '[]', '1487593282', '65535', '0', '0'), ('14', 'Menu', '0', 'header', '最上侧菜单', '显示在LOGO上方', '0', '0', '{\"pid\":\"149\",\"cssId\":\"cssmenu\",\"count\":\"5\"}', '[]', '1487770163', '1487645810', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_block_type`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_block_type`;
CREATE TABLE `yunzhi_block_type` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='区块类型表';

-- ----------------------------
--  Records of `yunzhi_block_type`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_block_type` VALUES ('Menu', '菜单', '显示菜单'), ('BreadCrumb', '面包屑', ''), ('Slider', '幻灯片', ''), ('ContentVideo', '文字视频介绍', '通常用于首页的关于我们'), ('DataCounter', '数据统计', '数据统计'), ('CaseShow', '案例展示', ''), ('ShowCaseSlider', '动态案例展示', ''), ('Header', '网页头展示', ''), ('Logo', 'LOGO展示', ''), ('Footer', '页脚', '页脚显示');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_component`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_component`;
CREATE TABLE `yunzhi_component` (
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '类名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组件（类型）表';

-- ----------------------------
--  Records of `yunzhi_component`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_component` VALUES ('Home', '首页', '用于显示首页', 'panjie', '1.0.0', '0', '0', null), ('ContentList', '新闻列表', '新闻列表页，显示新闻列表及展示新闻详情', 'panjie', '1.0.0', '0', '0', null), ('Content', '新闻', '显示一篇新闻', '', '', '0', '0', null), ('Login', '登陆注销', '用于用户的登陆与注销', 'mengyunzhi', '1.0.0', '0', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_content`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_content`;
CREATE TABLE `yunzhi_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'FK 用户名',
  `content_type_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'FK 类别名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0',
  `update_time` int(5) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(5) unsigned NOT NULL DEFAULT '0',
  `is_freezed` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否冻结',
  `weight` smallint(6) NOT NULL DEFAULT '0',
  `hit` int(11) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_name` (`content_type_name`),
  KEY `is_freezed` (`is_freezed`),
  KEY `is_deleted` (`is_delete`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
--  Records of `yunzhi_content`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_content` VALUES ('1', '', 'news', '这是一条新闻', '1232323111', '1487473451', '0', '0', '0', '482', '0'), ('2', '', 'news', '这是另一条新闻', '1232323111', '1487578982', '0', '0', '0', '195', '0'), ('3', '', 'products', ' 这是一个产品的新闻', '0', '1472446012', '0', '0', '0', '43', '0'), ('271', '', 'products', 'test', '1487046911', '1487915198', '0', '0', '0', '113', '0'), ('272', '', 'employmentWork', '这是一条新闻', '1487475010', '1487475010', '0', '0', '0', '0', '0'), ('273', '', 'employmentWork', 'dfdfdf', '1487475395', '1487481673', '0', '0', '0', '18', '0'), ('274', '', 'collegeCulture', '学院文化', '1487556267', '1487923903', '0', '0', '0', '137', '0'), ('275', '', 'collegeCulture', '测试新闻2', '1487590137', '1487923923', '0', '0', '0', '2', '0'), ('276', '', 'collegeCulture', '测试新闻2', '1487590262', '1487849009', '0', '0', '0', '20', '0');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_content_type`;
CREATE TABLE `yunzhi_content_type` (
  `name` varchar(40) NOT NULL,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk 菜单。用于被区块调用后，生成LCURD的信息。',
  `pname` varchar(40) NOT NULL COMMENT '上级name',
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '描述',
  `weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '权重',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `fileds` varchar(255) NOT NULL DEFAULT '[]' COMMENT '字段',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='类别(文章类型)表';

-- ----------------------------
--  Records of `yunzhi_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_content_type` VALUES ('news', '3', '', '新闻通知', '新闻通知', '0', '0', '[]', '0', '0', '0'), ('products', '2', '', '产品列表', '', '0', '0', '[]', '0', '0', '0'), ('collegeIntroduction', '15', 'schoolProfile', '学院简介', '', '0', '0', '[]', '0', '1487042362', '1486993316'), ('schoolProfile', '1', '', '学院概况', '学院概况', '0', '0', '[]', '0', '1486987248', '1486987248'), ('currentLeader', '17', 'collegeLeader', '现任领导', '', '0', '0', '[]', '0', '1487043951', '1486993359'), ('historyLeader', '16', 'collegeLeader', '历任领导', '', '0', '0', '[]', '0', '1487043966', '1486993420'), ('history', '13', 'schoolProfile', '历史沿革', '', '0', '0', '[]', '0', '1487044054', '1486993462'), ('collegeCulture', '12', 'schoolProfile', '学院文化', '', '0', '0', '[]', '0', '1487044076', '1486993536'), ('computer', '26', 'departmentCenter', '计算机科学与技术系', '', '0', '0', '[]', '0', '1487044358', '1486993576'), ('internet', '25', 'departmentCenter', '网络工程系', '', '0', '0', '[]', '0', '1487044371', '1486993627'), ('software', '24', 'departmentCenter', '软件工程系', '', '0', '0', '[]', '0', '1487044391', '1486993663'), ('internetThings', '23', 'departmentCenter', '物联网工程系', '', '0', '0', '[]', '0', '1487044513', '1486993758'), ('basicEduction', '22', 'departmentCenter', '基础教学部', '', '0', '0', '[]', '0', '1487044532', '1486993792'), ('computerExperiment', '21', 'departmentCenter', '计算机实验中心', '', '0', '0', '[]', '0', '1487044551', '1486993845'), ('collegeOffice', '32', 'managementAgency', '学院办公室', '', '0', '0', '[]', '0', '1487044569', '1486993887'), ('collegeCommittee', '31', 'managementAgency', '院团委', '', '0', '0', '[]', '0', '1487044584', '1486993925'), ('innovationOffice', '30', 'managementAgency', '协同创新办公室', '', '0', '0', '[]', '0', '1487044622', '1486993970'), ('teacherOffice', '29', 'managementAgency', '教学运行办公室', '', '0', '0', '[]', '0', '1487044638', '1486994029'), ('subjectOffice', '28', 'managementAgency', '学科建设办公室', '', '0', '0', '[]', '0', '1487044657', '1486994062'), ('studentDevelopment', '27', 'managementAgency', '学生发展规划办公室', '', '0', '0', '[]', '0', '1487044672', '1486994106'), ('academicCommittee', '38', 'committee', '学术委员会', '', '0', '0', '[]', '0', '1487046161', '1486994166'), ('degreeCommiittee', '37', 'committee', '学位委员会', '', '0', '0', '[]', '0', '1487046180', '1486994191'), ('subjectBuild', '36', 'committee', '学科建设咨询委员会', '', '0', '0', '[]', '0', '1487046196', '1486994263'), ('politicalIdea', '35', 'committee', '政治思想文化咨询委员会', '', '0', '0', '[]', '0', '1487046214', '1486994357'), ('deepenReform', '34', 'committee', '深化改革咨询委员会', '', '0', '0', '[]', '0', '1487046235', '1486994427'), ('professionalIntroduction', '43', 'undergraduate', '专业介绍', '', '0', '0', '[]', '0', '1487046738', '1486995091'), ('trainDirection', '42', 'undergraduate', '培养方向', '', '0', '0', '[]', '0', '1486995154', '1486995154'), ('commonDownload', '41', 'undergraduate', '常用下载', '', '0', '0', '[]', '0', '1486995216', '1486995216'), ('subjectDirection', '47', 'postgraduate', '学科方向', '', '0', '0', '[]', '0', '1487046787', '1486995248'), ('enrollmentDirectory', '46', 'postgraduate', '招生目录', '', '0', '0', '[]', '0', '1486995308', '1486995308'), ('trainWork', '45', 'postgraduate', '培养工作', '', '0', '0', '[]', '0', '1486995997', '1486995997'), ('employmentWork', '44', 'postgraduate', '就业工作', '', '0', '0', '[]', '0', '1486996088', '1486996088'), ('mainLab', '52', ' researchInstitutions', '重点实验室', '', '0', '0', '[]', '0', '1487047289', '1487035222'), ('graduateSchool', '51', ' researchInstitutions', '研究所', '', '0', '0', '[]', '0', '1487047311', '1487035357'), ('iconicResults', '53', 'scientificGain', '标志性成果', '', '0', '0', '[]', '0', '1487047187', '1487035403'), ('academicReport', '55', 'academicExchange', '学术报告', '', '0', '0', '[]', '0', '1487047260', '1487035483'), ('scientificCooperation', '54', 'academicExchange', '科研合作', '', '0', '0', '[]', '0', '1487047349', '1487035632'), ('organizationalProfile', '59', 'partyBuild', '组织概况', '', '0', '0', '[]', '0', '1487047565', '1487035681'), ('partyMemberDevelop', '58', 'partyBuild', '党员发展', '', '0', '0', '[]', '0', '1487035736', '1487035736'), ('outstandMember', '57', 'partyBuild', '优秀党员', '', '0', '0', '[]', '0', '1487035840', '1487035840'), ('tradeUnionProfile', '63', 'unionWork', '工会概况', '', '0', '0', '[]', '0', '1487047605', '1487036433'), ('tradeUnionDynamic', '62', 'unionWork', '工会动态', '', '0', '0', '[]', '0', '1487036468', '1487036468'), ('schoolGroup', '80', 'organization', '学工组', '', '0', '0', '[]', '0', '1487049896', '1487036514'), ('memberActivity', '56', 'organization', '党员活动', '', '0', '0', '[]', '0', '1487036546', '1487036546'), ('leagueCommittee', '79', 'organization', '团委', '', '0', '0', '[]', '0', '1487036591', '1487036591'), ('studentUnion', '78', 'organization', '学生会', '', '0', '0', '[]', '0', '1487036621', '1487036621'), ('innovationCenter', '77', 'organization', '大学生创新创业实践中心', '', '0', '0', '[]', '0', '1487036661', '1487036661'), ('community', '76', 'organization', '社团', '', '0', '0', '[]', '0', '1487036694', '1487036694'), ('contestNotice', '83', 'scienceInnovation', '竞赛通知', '', '0', '0', '[]', '0', '1487049953', '1487036760'), ('contestCatalog', '82', 'scienceInnovation', '竞赛目录', '', '0', '0', '[]', '0', '1487036786', '1487036786'), ('winner', '81', 'scienceInnovation', '获奖名单', '', '0', '0', '[]', '0', '1487036812', '1487036812'), ('projectIntroduction', '86', 'socialPractice', '项目介绍', '', '0', '0', '[]', '0', '1487049994', '1487036839'), ('practicalResults', '85', 'socialPractice', '实践成果', '', '0', '0', '[]', '0', '1487050016', '1487036885'), ('researchReport', '84', 'socialPractice', '调研报告', '', '0', '0', '[]', '0', '1487036979', '1487036979'), ('activityIntroduction', '89', 'volunteerService', '活动简介', '', '0', '0', '[]', '0', '1487050042', '1487037619'), ('baseConstruction', '88', 'volunteerService', '基地建设', '', '0', '0', '[]', '0', '1487037648', '1487037648'), ('activityDocument', '87', 'volunteerService', '活动纪实', '', '0', '0', '[]', '0', '1487037678', '1487037678'), ('historyMember', '91', 'newSummerCamp', '历届成员', '', '0', '0', '[]', '0', '1487050083', '1487037923'), ('excelentCamper', '90', 'newSummerCamp', '优秀营员', '', '0', '0', '[]', '0', '1487037953', '1487037953'), ('implementMeasure', '95', 'professionalInterest', '实施办法', '', '0', '0', '[]', '0', '1487037993', '1487037993'), ('introductionGroup', '94', 'professionalInterest', '小组简介', '', '0', '0', '[]', '0', '1487050199', '1487038022'), ('teacherIntroduction', '97', 'professionalInterest', '教师介绍', '', '0', '0', '[]', '0', '1487038052', '1487038052'), ('activityDemo', '96', 'professionalInterest', '活动展示', '', '0', '0', '[]', '0', '1487038074', '1487038074'), ('join', '93', 'professionalInterest', '我要加入', '', '0', '0', '[]', '0', '1487038104', '1487038104'), ('employInfo', '101', 'employmentBusiness', '就业信息', '', '0', '0', '[]', '0', '1487050236', '1487038160'), ('employPolicy', '102', 'employmentBusiness', '就业政策', '', '0', '0', '[]', '0', '1487038200', '1487038200'), ('careerEducation', '99', 'employmentBusiness', '生涯教育', '', '0', '0', '[]', '0', '1487038241', '1487038241'), ('businessPolicy', '102', 'employmentBusiness', '创业政策', '', '0', '0', '[]', '0', '1487038285', '1487038285'), ('businessStar', '98', 'employmentBusiness', '创业之星', '', '0', '0', '[]', '0', '1487038312', '1487038312'), ('awad', '107', 'studentAffairs', '奖优评定', '', '0', '0', '[]', '0', '1487050302', '1487038344'), ('scholarship', '106', 'studentAffairs', '奖学金', '', '0', '0', '[]', '0', '1487038389', '1487038389'), ('grant', '105', 'studentAffairs', '助学金', '', '0', '0', '[]', '0', '1487038413', '1487038413'), ('studentLoan', '104', 'studentAffairs', '助学贷款', '', '0', '0', '[]', '0', '1487038488', '1487038488'), ('workStudy', '103', 'studentAffairs', '勤工助学', '', '0', '0', '[]', '0', '1487038521', '1487038521'), ('implementWay', '95', 'classTutorial', '实施办法', '', '0', '0', '[]', '0', '1487050339', '1487038584'), ('mentorIntruction', '109', 'classTutorial', '导师介绍', '', '0', '0', '[]', '0', '1487038612', '1487038612'), ('eventGallery', '108', 'classTutorial', '活动展示', '', '0', '0', '[]', '0', '1487038688', '1487038688'), ('commpitionUp', '113', 'excellentStudentDemo', '竞赛达人', '', '0', '0', '[]', '0', '1487050373', '1487038715'), ('excellentPersonal', '112', 'excellentStudentDemo', '先进个人', '', '0', '0', '[]', '0', '1487038753', '1487038753'), ('lifeService', '116', 'serviceGuide', '生活服务', '', '0', '0', '[]', '0', '1487050404', '1487038809'), ('studyService', '115', 'serviceGuide', '学习服务', '', '0', '0', '[]', '0', '1487038833', '1487038833'), ('administrativeService', '114', 'serviceGuide', '行政服务', '', '0', '0', '[]', '0', '1487038872', '1487038872'), ('admissionGuide', '121', 'admissionsInformation', '招生简章	', '', '0', '0', '[]', '0', '1487050951', '1487038971'), ('enrollmentPlan', '122', 'admissionsInformation', '招生计划	', '', '0', '0', '[]', '0', '1487039018', '1487039018'), ('historyFraction', '120', 'admissionsInformation', '历年招生分数线	', '', '0', '0', '[]', '0', '1487039057', '1487039057'), ('collegeLeader', '0', 'schoolProfile', '学院领导', '', '0', '0', '[]', '0', '1487043921', '1487043921'), ('institutionalSetting', '0', '', '机构设置', '', '0', '0', '[]', '0', '1487044206', '1487044206'), ('departmentCenter', '0', 'institutionalSetting', '系部中心', '', '0', '0', '[]', '0', '1487044237', '1487044237'), ('managementAgency', '0', 'institutionalSetting', '管理机构', '', '0', '0', '[]', '0', '1487044290', '1487044290'), ('committee', '0', 'institutionalSetting', '委员会', '', '0', '0', '[]', '0', '1487044340', '1487044340'), ('educations', '0', '', '教育教学', '', '0', '0', '[]', '0', '1487046606', '1487046606'), ('undergraduate', '0', 'educations', '本科生', '', '0', '0', '[]', '0', '1487046649', '1487046649'), ('postgraduate', '0', 'educations', '研究生', '', '0', '0', '[]', '0', '1487046678', '1487046678'), ('scientificResearch', '0', '', '科学研究', '', '0', '0', '[]', '0', '1487046911', '1487046911'), (' researchInstitutions', '0', 'scientificResearch', '科研机构', '', '0', '0', '[]', '0', '1487046946', '1487046946'), ('scientificGain', '0', 'scientificResearch', '科研成果', '', '0', '0', '[]', '0', '1487047024', '1487047024'), ('academicExchange', '0', 'scientificResearch', '学术交流', '', '0', '0', '[]', '0', '1487047056', '1487047056'), ('partyWork', '0', '', '党群工作', '', '0', '0', '[]', '0', '1487047457', '1487047457'), ('partyBuild', '0', 'partyWork', '党建工作', '', '0', '0', '[]', '0', '1487047496', '1487047496'), ('unionWork', '0', 'partyWork', '工会工作', '', '0', '0', '[]', '0', '1487047525', '1487047525'), ('groupWork', '0', '', '团学工作', '', '0', '0', '[]', '0', '1487047701', '1487047701'), ('organization', '0', 'groupWork', '组织机构', '', '0', '0', '[]', '0', '1487047753', '1487047753'), ('scienceInnovation', '0', 'groupWork', '科技创新', '', '0', '0', '[]', '0', '1487047789', '1487047789'), ('socialPractice', '0', 'groupWork', '社会实践', '', '0', '0', '[]', '0', '1487047829', '1487047829'), ('volunteerService', '0', 'groupWork', '志愿服务', '', '0', '0', '[]', '0', '1487047882', '1487047882'), ('newSummerCamp', '0', 'groupWork', '新生夏令营', '', '0', '0', '[]', '0', '1487047918', '1487047918'), ('professionalInterest', '0', 'groupWork', '专业兴趣小组', '', '0', '0', '[]', '0', '1487049687', '1487049687'), ('employmentBusiness', '0', 'groupWork', '就业创业', '', '0', '0', '[]', '0', '1487049733', '1487049733'), ('studentAffairs', '0', 'groupWork', '学生事务', '', '0', '0', '[]', '0', '1487049771', '1487049771'), ('classTutorial', '0', 'groupWork', '班导师', '', '0', '0', '[]', '0', '1487049797', '1487049797'), ('excellentStudentDemo', '0', 'groupWork', '优秀学生展示', '', '0', '0', '[]', '0', '1487049819', '1487049819'), ('serviceGuide', '0', 'groupWork', '服务指南', '', '0', '0', '[]', '0', '1487049849', '1487049849'), ('campingDynamic', '0', 'newSummerCamp', '营区动态', '', '0', '0', '[]', '0', '1487050172', '1487050172'), (' recruitment', '0', '', '招生招聘', '', '0', '0', '[]', '0', '1487050458', '1487050458'), ('admissionsInformation', '0', ' recruitment', '招生信息', '', '0', '0', '[]', '0', '1487050848', '1487050848'), ('', '0', '', '', '', '0', '0', '[]', '1', '1487050800', '1487050800'), ('recruit', '0', ' recruitment', '人才招聘', '', '0', '0', '[]', '0', '1487050921', '1487050921'), ('rewardMoney', '0', 'admissionsInformation', '奖助学金', '', '0', '0', '[]', '0', '1487051074', '1487051074'), ('futureDevelopment', '0', 'admissionsInformation', '未来发展', '', '0', '0', '[]', '0', '1487051100', '1487051100'), ('alumniWork', '0', '', '校友工作', '', '0', '0', '[]', '0', '1487051212', '1487051212'), ('alumniMessage', '0', 'alumniWork', '校友寄语  ', '', '0', '0', '[]', '0', '1487051263', '1487051263'), ('alumniAnnouncement', '0', 'alumniWork', '校友公告 ', '', '0', '0', '[]', '0', '1487051302', '1487051302'), ('alumniDynamics', '0', 'alumniWork', '校友动态  ', '', '0', '0', '[]', '0', '1487051332', '1487051332'), ('alumniService', '0', 'alumniWork', '校友服务  ', '', '0', '0', '[]', '0', '1487051355', '1487051355'), ('graduateImage', '0', 'alumniWork', '毕业映像', '', '0', '0', '[]', '0', '1487051386', '1487051386'), ('internationalExchange', '0', '', '国际交流', '', '0', '0', '[]', '0', '1487051437', '1487051437'), ('cooperationProjects', '0', 'internationalExchange', '合作项目 ', '', '0', '0', '[]', '0', '1487051469', '1487051469'), ('communicationDynamics', '0', 'internationalExchange', '交流动态', '', '0', '0', '[]', '0', '1487051513', '1487051513'), ('courtyardOpen', '0', '', '院务公开', '', '0', '0', '[]', '0', '1487051552', '1487051552'), (' schoolDocuments', '0', 'courtyardOpen', '学校文件', '', '0', '0', '[]', '0', '1487051604', '1487051604'), ('collegeDocument', '0', 'courtyardOpen', '学院文件  ', '', '0', '0', '[]', '0', '1487051631', '1487051631'), ('minutesMeeting', '0', 'courtyardOpen', '会议纪要  ', '', '0', '0', '[]', '0', '1487051678', '1487051678'), ('meetCheck', '0', 'courtyardOpen', '会议签到', '', '0', '0', '[]', '0', '1487051714', '1487051714'), ('collegeEvaluation', '0', 'courtyardOpen', '院内评推', '', '0', '0', '[]', '0', '1487051743', '1487051743'), ('thingsOpen', '0', 'courtyardOpen', '要事公开', '', '0', '0', '[]', '0', '1487051767', '1487051767'), ('collegesIntruction', '0', 'recruit', '学院简介	', '', '0', '0', '[]', '0', '1487051807', '1487051807'), ('applicationCondition', '0', 'recruit', '应聘条件	', '', '0', '0', '[]', '0', '1487052239', '1487052239'), ('recruitmentMethods', '0', 'recruit', '应聘方式及流程', '', '0', '0', '[]', '0', '1487052365', '1487052365'), ('contactInfo', '0', 'recruit', '联系方式	', '', '0', '0', '[]', '0', '1487052394', '1487052394'), ('computerScience', '0', 'professionalIntroduction', '计算机科学与技术', '', '0', '0', '[]', '0', '1487052826', '1487052826'), ('softwareEngineering', '0', 'professionalIntroduction', '软件工程', '', '0', '0', '[]', '0', '1487052869', '1487052869'), ('networkEngineering', '0', 'professionalIntroduction', '网络工程', '', '0', '0', '[]', '0', '1487052909', '1487052909'), ('internetWork', '0', 'professionalIntroduction', '物联网工程', '', '0', '0', '[]', '0', '1487052960', '1487052960'), ('reformComputer', '0', 'professionalIntroduction', '计算机科学与技术（改革试点）', '', '0', '0', '[]', '0', '1487052981', '1487052981'), ('computerRe', '0', 'trainDirection', '计算机科学与技术', '', '0', '0', '[]', '0', '1487053011', '1487053011'), ('softwarere', '0', 'trainDirection', '软件工程', '', '0', '0', '[]', '0', '1487053032', '1487053032'), ('networkre', '0', 'trainDirection', '网络工程', '', '0', '0', '[]', '0', '1487053061', '1487053061'), ('networkThing', '0', 'trainDirection', '物联网工程', '', '0', '0', '[]', '0', '1487053116', '1487053116'), ('computerDouble', '0', 'trainDirection', '计算机科学与技术（双学位）', '', '0', '0', '[]', '0', '1487053153', '1487053153'), ('hebuter', '0', 'commonDownload', '河北工业大学本科生学籍管理规定', '', '0', '0', '[]', '0', '1487053216', '1487053216'), ('calendar', '0', 'commonDownload', '本学期校历', '', '0', '0', '[]', '0', '1487053248', '1487053248'), ('curriculum', '0', 'commonDownload', '本学期班级课表', '', '0', '0', '[]', '0', '1487053304', '1487053304'), ('reExamination', '0', 'commonDownload', '重修重考报名表', '', '0', '0', '[]', '0', '1487053333', '1487053333'), ('achievement', '0', 'commonDownload', '成绩修改申请表', '', '0', '0', '[]', '0', '1487053360', '1487053360'), ('applicationForm', '0', 'commonDownload', '缓考申请表', '', '0', '0', '[]', '0', '1487053389', '1487053389'), ('exemptions ', '0', 'commonDownload', '免修申请表', '', '0', '0', '[]', '0', '1487053456', '1487053456'), ('prerequisite', '0', 'commonDownload', '先修申请表', '', '0', '0', '[]', '0', '1487053492', '1487053492'), ('reviemResult', '0', 'commonDownload', '复核成绩申请表', '', '0', '0', '[]', '0', '1487053514', '1487053514'), ('courseSubstitution', '0', 'commonDownload', '课程替代申请表', '', '0', '0', '[]', '0', '1487053569', '1487053569'), ('subjectComputer', '0', 'subjectDirection', '计算机科学与技术', '', '0', '0', '[]', '0', '1487053645', '1487053645'), ('intelligentSystems', '0', 'subjectDirection', '模式识别与智能系统', '', '0', '0', '[]', '0', '1487053684', '1487053684'), ('computerTechnolgy', '0', 'subjectDirection', '计算机技术（专业学位）', '', '0', '0', '[]', '0', '1487053713', '1487053713'), ('softwareDirection', '0', 'subjectDirection', '软件工程（专业学位）', '', '0', '0', '[]', '0', '1487053751', '1487053751'), ('trainingProgram', '0', 'trainWork', '培养方案', '', '0', '0', '[]', '0', '1487053793', '1487053793'), ('curriculumRe', '0', 'trainWork', '本学期课表', '', '0', '0', '[]', '0', '1487053819', '1487053819'), ('studentloans', '0', 'rewardMoney', '助学贷款', '', '0', '0', '[]', '0', '1487053945', '1487053945'), ('reScholarships', '0', 'rewardMoney', '奖助学金', '', '0', '0', '[]', '0', '1487053976', '1487053976'), ('greenChanel', '0', 'rewardMoney', '绿色通道', '', '0', '0', '[]', '0', '1487054003', '1487054003'), ('researchSituation', '0', 'futureDevelopment', '历年考研情况', '', '0', '0', '[]', '0', '1487054037', '1487054037'), ('historyEmployment', '0', 'futureDevelopment', '历年就业情况', '', '0', '0', '[]', '0', '1487054067', '1487054067'), ('communation', '0', 'futureDevelopment', '国际交流情况', '', '0', '0', '[]', '0', '1487054099', '1487054099'), ('test1', '0', '', 'test1', '', '0', '0', '[]', '0', '1487555402', '1487555402');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field`;
CREATE TABLE `yunzhi_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '机读字段',
  `field_type_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk filed',
  `relate_type` varchar(40) NOT NULL DEFAULT '' COMMENT '关联的实体类型',
  `relate_value` varchar(40) NOT NULL DEFAULT '' COMMENT '关联实体类型的具体值',
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '后台 编辑 添加 时显示的信息',
  `weight` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `config` varchar(4096) NOT NULL DEFAULT '[]' COMMENT '字段配置信息 json',
  `filter` varchar(4096) NOT NULL DEFAULT '[]' COMMENT '过滤器，用于前台的输出. 使用字段与实体类型绑定的方法实现过滤器后的输出',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `relate_type` (`relate_type`),
  KEY `relate_value` (`relate_value`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字段表 各个实体与字段的对应关系写在这里';

-- ----------------------------
--  Records of `yunzhi_field`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field` VALUES ('1', 'body', 'Body', 'Content', 'news', '内容', '0', '[]', '{\"type\":\"System\",\"function\":\"htmlspecialchars_decode\",\"param\":{\"length\":\"6\",\"ext\":\"...\"}}', '0', '1487399498'), ('2', 'image', 'Image', 'Content', 'news', '新闻图片', '1', '[]', '[]', '0', '0'), ('3', 'body', 'Body', 'Content', 'products', '新闻内容', '0', '[]', '[]', '0', '0'), ('4', 'titles', 'Json', 'Block', 'Slider', '标题', '0', '{\"type\":\"text\"}', '[]', '0', '1487851434'), ('6', 'urls', 'Json', 'Block', 'Slider', '链接地址', '0', '{\"type\":\"text\"}', '[]', '0', '1487851525'), ('5', 'images', 'Images', 'Block', 'Slider', '图片链接', '0', '{\"js\":\"\\/bower_components\\/ng-file-upload\\/ng-file-upload-all.min.js\",\"uploadPath\":\"\\/upload\",\"size\":\"2048000\",\"ext\":\"png,jpg,jpeg,gif,bmp,doc,pdf\"}', '[]', '0', '1487901807'), ('7', 'headers', 'Json', 'Block', 'Slider', '副标题', '0', '{\"type\":\"text\"}', '[]', '0', '1487851537'), ('8', 'descriptions', 'Json', 'Block', 'Slider', '描述信息', '0', '{\"type\":\"textarea\"}', '[]', '0', '1487851550'), ('10', 'attachment', 'Attachment', 'Content', 'news', '附件', '0', '[]', '[]', '0', '0'), ('12', 'body', 'Body', 'content', 'news', 'dfdf', '0', '[]', '[]', '1487403799', '1487403882'), ('13', 'body', 'Body', 'component', 'ContentList', 'body', '0', '[]', '[]', '1487475786', '1487475786'), ('18', 'image', 'Image', 'content', 'test1', '新闻图片', '0', '[]', '[]', '1487555402', '1487555402'), ('17', 'body', 'Body', 'content', 'test1', '新闻内容', '0', '[]', '[]', '1487555402', '1487555402'), ('19', 'body', 'Body', 'content', 'collegeCulture', 'body', '0', '[]', '[]', '1487556998', '1487848225'), ('20', 'body', 'Body', 'content', 'employmentWork', '内容', '0', '[]', '[]', '1487560671', '1487560671'), ('21', 'image', 'Image', 'content', 'collegeCulture', '新闻图片', '1', '{\"uploadPath\":\"\\/upload\",\"size\":\"2048000\",\"ext\":\"png,jpg,jpeg,gif,bmp,doc,pdf\"}', '[]', '1487832527', '1487849284');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_config`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_config`;
CREATE TABLE `yunzhi_field_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk filed',
  `type` varchar(40) NOT NULL DEFAULT '' COMMENT '绑定的实体类型',
  `value` varchar(40) NOT NULL DEFAULT '' COMMENT '绑定实体类型的具体值',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0启用 1禁用',
  `is_one` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否唯一. 1: 1对1 ；2：1对多',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字段配置表（各个实体的扩展字段配置）';

-- ----------------------------
--  Records of `yunzhi_field_config`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_config` VALUES ('1', 'body', 'Content', 'news', '0', '1'), ('2', 'field_image', 'Content', 'news', '0', '1'), ('3', 'body', 'Content', 'products', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_data_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_attachment`;
CREATE TABLE `yunzhi_field_data_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The entity id this data is attached to',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk of user_name',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `save_name` varchar(100) NOT NULL DEFAULT '' COMMENT '保存文件名',
  `ext` varchar(10) NOT NULL DEFAULT '' COMMENT '扩展名',
  `sha1` varchar(40) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小B',
  `mime` varchar(40) NOT NULL DEFAULT '' COMMENT 'MIME',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `key_id` (`key_id`),
  KEY `sha1` (`sha1`),
  KEY `md5` (`md5`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
--  Records of `yunzhi_field_data_attachment`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_data_attachment` VALUES ('83', '5', '0', '', '4816be8aab31bc3dd96a068babf7b3f1.jpg', '/upload/20170224/a17aaae6003df768511e342563e15b98.jpg', 'jpg', 'c4eb60cb8d93c641d7968f06901b3c333f421962', 'de32827c690341063cc912de9045be0e', '30641', 'image/jpeg', '1487903564', '1487903564'), ('84', '5', '0', '', '167b5f27e87081f4545c14c29b869964.jpg', '/upload/20170224/23514af7d64a18f97f3c8edb898d0de7.jpg', 'jpg', 'cca18b443fe9a6be89f9fecbd858e48767863b89', '54fe7a710948136957ae5552fa9d3d45', '75156', 'image/jpeg', '1487903658', '1487903658'), ('85', '5', '0', '', '53b68492cfa0c681e9a7d54f74d3fecb.jpg', '/upload/20170224/428b77e98b2cbc5fc03f2f850405ba19.jpg', 'jpg', '37f43a9f43a06c1da330b4f19e67155cdcbb8c5c', '58c61881873640a1f7daca1e6850cc1f', '640535', 'image/jpeg', '1487903664', '1487903664'), ('86', '5', '0', '', '4816be8aab31bc3dd96a068babf7b3f1.jpg', '/upload/20170224/a17aaae6003df768511e342563e15b98.jpg', 'jpg', 'c4eb60cb8d93c641d7968f06901b3c333f421962', 'de32827c690341063cc912de9045be0e', '30641', 'image/jpeg', '1487903671', '1487903671'), ('87', '5', '0', '', '167b5f27e87081f4545c14c29b869964.jpg', '/upload/20170224/23514af7d64a18f97f3c8edb898d0de7.jpg', 'jpg', 'cca18b443fe9a6be89f9fecbd858e48767863b89', '54fe7a710948136957ae5552fa9d3d45', '75156', 'image/jpeg', '1487903715', '1487903715'), ('88', '5', '0', '', '167b5f27e87081f4545c14c29b869964.jpg', '/upload/20170224/23514af7d64a18f97f3c8edb898d0de7.jpg', 'jpg', 'cca18b443fe9a6be89f9fecbd858e48767863b89', '54fe7a710948136957ae5552fa9d3d45', '75156', 'image/jpeg', '1487903779', '1487903779'), ('89', '5', '0', '', '167b5f27e87081f4545c14c29b869964.jpg', '/upload/20170224/23514af7d64a18f97f3c8edb898d0de7.jpg', 'jpg', 'cca18b443fe9a6be89f9fecbd858e48767863b89', '54fe7a710948136957ae5552fa9d3d45', '75156', 'image/jpeg', '1487903897', '1487903897'), ('90', '5', '0', '', 'mid2.png', '/upload/20170224/1e9bf117a9281adefb937eee6a2811c4.png', 'png', '71dd076055b9723139e48e56e876f9790c0423d8', '3ba34c39bc48106fd22456864f260978', '93765', 'image/png', '1487909921', '1487909921'), ('91', '5', '0', '', 'mid3.png', '/upload/20170224/e9485464c78aa2c93a173a997b3f702a.png', 'png', 'fc52435693ec58474a48dfc14ee8863d96fd3b27', '552c6f598ae31c390d0c5e7e1b960f53', '101665', 'image/png', '1487910500', '1487910500');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_data_body`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_body`;
CREATE TABLE `yunzhi_field_data_body` (
  `field_id` int(11) unsigned NOT NULL COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL COMMENT '对应的关键字ID',
  `value` longtext NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`key_id`,`field_id`),
  KEY `entity_id` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Data storage for field 2 (body)';

-- ----------------------------
--  Records of `yunzhi_field_data_body`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_data_body` VALUES ('0', '0', '   \r\n&lt;p&gt;河北工业大学计算机科学与软件学院前身是1985年成立的计算机科学与工程系，2002年与计算中心合并成立学院。学院有&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/computer-scien%E2%80%A6and-technology%20%E2%80%8E&quot;&gt;计算机科学与技术&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/software-engineering&quot;&gt;软件工程&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/network-engineering%20%E2%80%8E&quot;&gt;网络工程&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/internet-of-things&quot;&gt;物联网工程&lt;/a&gt;4个本科专业；计算机科学与技术、控制科学与工程两个一级硕士点，计算机技术、软件工程两个二级硕士点；计算机科学与技术系、网络工程系、软件工程系、基础教学部、计算机实验中心、嵌入式技术及其应用实验室、软件工程研究中心、信息技术研究所等教学和科研机构，在智能信息处理、网络信息安全、并行处理与智能计算、图像处理与多媒体、计算机智能控制等研究方向和领域具有很好的科研基础，与法国巴黎高等计算机专科学院(supinfo)、新西兰梅西大学等国外知名大学和IT公司在教学、科研和人才培养方面展开合作。&lt;/p&gt;&lt;p&gt;学院坚持“以人为本，育人为先”的人才培养理念，拥有一支教学经验丰富、科研能力强、结构合理的师资队伍，其中教授 13 名，副教授21名，具有博士学位和在读博士的教师 38 名，专任教师60名。青年教师多人次在天津市高校青年教师基本功竞赛、青年管理干部基本功竞赛中获奖。&amp;nbsp;近年来，学院教师承担国家和省、部级自然科学科研课题40余项，社会科学科研课题10余项，获省、部级以上奖励10余项，在智能信息处理、网络信息安全、并行处理与智能计算、图像处理与多媒体、计算机智能控制等研究方向取得多项研究成果，出版专著、教材40多部，在国内外刊物和会议上发表论文400余篇。&lt;/p&gt;&lt;p&gt;河北工业大学计算机科学与软件学院秉承学校“勤慎公忠”的校训，在人才培养中坚持“厚实基础、深化专业、注重理论、突出实践”的办学特色，近五年来，学生中共有47人次获得国家级专业竞赛奖励， 87人荣获省级以上专业竞赛奖励，学院毕业生就业形势良好，年均就业率高达91%。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '1487258598', '1487258598'), ('1', '1', '   &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt; 这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题&lt;img src=&quot;/yunzhicms/public/upload/20160907/fecddd331f269a93b55fc16c7c742121.png&quot; alt=&quot;个人真实性核验单 (1)&quot; style=&quot;line-height: 1; max-width: 100%;&quot;&gt;&lt;br style=&quot;line-height: 1;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n', '1474938567', '0'), ('1', '2', '   &lt;p&gt; 新闻通知1新闻通知1新闻通知1新闻通知1新闻通知1&lt;/p&gt;\r\n', '0', '0'), ('2', '3', '新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2', '0', '0'), ('3', '271', '   &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    \r\n&lt;p&gt;河北工业大学计算机科学与软件学院前身是1985年成立的计算机科学与工程系，2002年与计算中心合并成立学院。学院有&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/computer-scien%E2%80%A6and-technology%20%E2%80%8E&quot;&gt;计算机科学与技术&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/software-engineering&quot;&gt;软件工程&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/network-engineering%20%E2%80%8E&quot;&gt;网络工程&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/internet-of-things&quot;&gt;物联网工程&lt;/a&gt;4个本科专业；计算机科学与技术、控制科学与工程两个一级硕士点，计算机技术、软件工程两个二级硕士点；计算机科学与技术系、网络工程系、软件工程系、基础教学部、计算机实验中心、嵌入式技术及其应用实验室、软件工程研究中心、信息技术研究所等教学和科研机构，在智能信息处理、网络信息安全、并行处理与智能计算、图像处理与多媒体、计算机智能控制等研究方向和领域具有很好的科研基础，与法国巴黎高等计算机专科学院(supinfo)、新西兰梅西大学等国外知名大学和IT公司在教学、科研和人才培养方面展开合作。&lt;/p&gt;&lt;p&gt;学院坚持“以人为本，育人为先”的人才培养理念，拥有一支教学经验丰富、科研能力强、结构合理的师资队伍，其中教授 13 名，副教授21名，具有博士学位和在读博士的教师 38 名，专任教师60名。青年教师多人次在天津市高校青年教师基本功竞赛、青年管理干部基本功竞赛中获奖。&amp;nbsp;近年来，学院教师承担国家和省、部级自然科学科研课题40余项，社会科学科研课题10余项，获省、部级以上奖励10余项，在智能信息处理、网络信息安全、并行处理与智能计算、图像处理与多媒体、计算机智能控制等研究方向取得多项研究成果，出版专著、教材40多部，在国内外刊物和会议上发表论文400余篇。&lt;/p&gt;&lt;p&gt;河北工业大学计算机科学与软件学院秉承学校“勤慎公忠”的校训，在人才培养中坚持“厚实基础、深化专业、注重理论、突出实践”的办学特色，近五年来，学生中共有47人次获得国家级专业竞赛奖励， 87人荣获省级以上专业竞赛奖励，学院毕业生就业形势良好，年均就业率高达91%。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n', '1487583385', '1487488077'), ('13', '273', '新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2\r\n&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;河北工业大学计算机科学与软件学院前身是1985年成立的计算机科学与工程系，2002年与计算中心合并成立学院。学院有&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/computer-scien%E2%80%A6and-technology%20%E2%80%8E&quot; style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;计算机科学与技术&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/software-engineering&quot; style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;软件工程&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/network-engineering%20%E2%80%8E&quot; style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;网络工程&lt;/a&gt;、&lt;a href=&quot;http://www.scse.hebut.edu.cn/for_all/school_intro/internet-of-things&quot; style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;物联网工程&lt;/a&gt;4个本科专业；计算机科学与技术、控制科学与工程两个一级硕士点，计算机技术、软件工程两个二级硕士点；计算机科学与技术系、网络工程系、软件工程系、基础教学部、计算机实验中心、嵌入式技术及其应用实验室、软件工程研究中心、信息技术研究所等教学和科研机构，在智能信息处理、网络信息安全、并行处理与智能计算、图像处理与多媒体、计算机智能控制等研究方向和领域具有很好的科研基础，与法国巴黎高等计算机专科学院(supinfo)、新西兰梅西大学等国外知名大学和IT公司在教学、科研和人才培养方面展开合作。&lt;/p&gt;&lt;p&gt;学院坚持“以人为本，育人为先”的人才培养理念，拥有一支教学经验丰富、科研能力强、结构合理的师资队伍，其中教授 13 名，副教授21名，具有博士学位和在读博士的教师 38 名，专任教师60名。青年教师多人次在天津市高校青年教师基本功竞赛、青年管理干部基本功竞赛中获奖。&amp;nbsp;近年来，学院教师承担国家和省、部级自然科学科研课题40余项，社会科学科研课题10余项，获省、部级以上奖励10余项，在智能信息处理、网络信息安全、并行处理与智能计算、图像处理与多媒体、计算机智能控制等研究方向取得多项研究成果，出版专著、教材40多部，在国内外刊物和会议上发表论文400余篇。&lt;/p&gt;&lt;p&gt;河北工业大学计算机科学与软件学院秉承学校“勤慎公忠”的校训，在人才培养中坚持“厚实基础、深化专业、注重理论、突出实践”的办学特色，近五年来，学生中共有47人次获得国家级专业竞赛奖励， 87人荣获省级以上专业竞赛奖励，学院毕业生就业形势良好，年均就业率高达91%。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n', '1487418493', '1487259062'), ('19', '274', '   &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt; &lt;/p&gt;\r\n&lt;p&gt;这里是学院文化的HTML页面.&lt;/p&gt;&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n', '1487915778', '1487557603'), ('19', '276', '   &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    &lt;p&gt;    \r\n&lt;p&gt;上学的时候，&lt;/p&gt;&lt;p&gt;第一次学习C语言编程就是输出“Hello World!”。&lt;/p&gt;&lt;p&gt;今天，新网站正式上线了。&lt;/p&gt;&lt;p&gt;让我们对世界说一声 “Hello World!”。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;/p&gt;\r\n', '1487591328', '1487590262');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_data_comment_body`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_comment_body`;
CREATE TABLE `yunzhi_field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Data storage for field 1 (comment_body)';

-- ----------------------------
--  Table structure for `yunzhi_field_data_image`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_image`;
CREATE TABLE `yunzhi_field_data_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The entity id this data is attached to',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk of user_name',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `save_name` varchar(100) NOT NULL DEFAULT '' COMMENT '保存文件名',
  `ext` varchar(10) NOT NULL DEFAULT '' COMMENT '扩展名',
  `sha1` varchar(40) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小B',
  `mime` varchar(40) NOT NULL DEFAULT '' COMMENT 'MIME',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `key_id` (`key_id`),
  KEY `sha1` (`sha1`),
  KEY `md5` (`md5`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Data storage for field 4 (field_image)';

-- ----------------------------
--  Records of `yunzhi_field_data_image`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_data_image` VALUES ('47', '2', '1', '', 'Girl fashion beauty.jpg', '20160907/819029973ba3b6d987748accff729b76.jpg', 'jpg', '7a3b581096d4a97e9ea73bbf10e37723dead9284', '3b3cac76b6d7901de8688bded8b9b37d', '450782', 'image/jpeg', '0', '0'), ('79', '0', '0', '', '', '', '', '', '', '0', '', '1487844925', '1487844925'), ('80', '0', '0', '', '', '', '', '', '', '0', '', '1487844951', '1487844951'), ('81', '0', '0', '', '', '', '', '', '', '0', '', '1487845052', '1487845052'), ('82', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845074', '1487845074'), ('83', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845190', '1487845190'), ('84', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845329', '1487845329'), ('85', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845377', '1487845377'), ('86', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845414', '1487845414'), ('87', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845486', '1487845486'), ('88', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845520', '1487845520'), ('89', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845620', '1487845620'), ('90', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845699', '1487845699'), ('91', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845740', '1487845740'), ('92', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845787', '1487845787'), ('93', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845801', '1487845801'), ('94', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487845825', '1487845825'), ('95', '0', '0', '', 'bg01.jpg', '20170223/c5c3534a7e3d770c013fc818985a0651.jpg', 'jpg', 'f33de963db94a58f38aaa352faf98b24f600dbd5', '83e60f0ca5f18fc8dbd193b5b10fae6c', '35589', 'image/jpeg', '1487846912', '1487846912'), ('96', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847258', '1487847258'), ('97', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847274', '1487847274'), ('98', '0', '0', '', 'bg01.jpg', '20170223/c5c3534a7e3d770c013fc818985a0651.jpg', 'jpg', 'f33de963db94a58f38aaa352faf98b24f600dbd5', '83e60f0ca5f18fc8dbd193b5b10fae6c', '35589', 'image/jpeg', '1487847306', '1487847306'), ('99', '0', '0', '', 'bg01.jpg', '20170223/c5c3534a7e3d770c013fc818985a0651.jpg', 'jpg', 'f33de963db94a58f38aaa352faf98b24f600dbd5', '83e60f0ca5f18fc8dbd193b5b10fae6c', '35589', 'image/jpeg', '1487847317', '1487847317'), ('100', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847336', '1487847336'), ('101', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847361', '1487847361'), ('102', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847396', '1487847396'), ('103', '0', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847409', '1487847409'), ('104', '21', '0', '', 'date.png', '20170223/247cd946c60e9c9ba8b2785521e75b12.png', 'png', 'e87529999a088b167403f36bdc0d481bafca047e', 'd6a3d41991faabf6012aa69ec72c32f1', '2591', 'image/png', '1487847512', '1487847512'), ('105', '21', '0', '', 'images.png', '20170223/04ac76278a33e908c16471aba59d6391.png', 'png', '1d8b352c677826721b8e37e899344fa4d8797c97', '23a150ba5bc2280b4898ce727290157b', '270', 'image/png', '1487847553', '1487847553'), ('109', '21', '0', '', 'mid1.png', '20170223/6ad3279d600aa42e4b68bbce32831cfa.png', 'png', 'cac44193d27eb894b835f94a41a3f2bb01b3e36c', '1c48253c30e9aee1a5ac333cc54beb57', '79897', 'image/png', '1487915757', '1487915757'), ('110', '21', '274', '', 'img.jpg', '/upload/20170224/12ca1e6f5fae117db5df71b3098e39bc.jpg', 'jpg', '62f23a90f70ceeff467d106c956d33cd3d72d447', '3a3e8d1c874d90d6ebae6bc462fabb75', '5706', 'image/jpeg', '1487915771', '1487915778');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_data_images`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_images`;
CREATE TABLE `yunzhi_field_data_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk ...',
  `user_name` varchar(40) NOT NULL COMMENT 'fk user',
  `value` varchar(4096) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='多图片字段.使用json格式进行存储';

-- ----------------------------
--  Records of `yunzhi_field_data_images`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_data_images` VALUES ('2', '5', '2', '', '[\"\\/yunzhicms\\/public\\/upload\\/20160912\\/53b68492cfa0c681e9a7d54f74d3fecb.jpg\",\"\\/yunzhicms\\/public\\/upload\\/20160912\\/4816be8aab31bc3dd96a068babf7b3f1.jpg\",\"\"]');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_data_json`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_json`;
CREATE TABLE `yunzhi_field_data_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk ...',
  `user_name` varchar(40) NOT NULL COMMENT 'fk user',
  `value` varchar(4096) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `yunzhi_field_data_json`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_data_json` VALUES ('1', '4', '2', '', '[\"\\u8fd9\\u662f\\u4e3b\\u6807\\u9898\",\"\\u8fd9\\u662f\\u4e3b\\u6807\\u9898\"]'), ('2', '5', '2', '', '[\"\\u94fe\\u63a51\",\"\\u5730\\u57404\",\"\"]'), ('3', '6', '2', '', '[\"http:\\/\\/www.mengyunzhi.com\",\"http:\\/\\/www.scse.hebut.edu.cn\"]'), ('4', '7', '2', '', '[\"\\u8fd9\\u662f\\u526f\\u6807\\u98981\",\"\\u8fd9\\u662f\\u526f\\u6807\\u98982\"]'), ('5', '8', '2', '', '[\"\\u8fd9\\u91cc\\u662f\\u63cf\\u8ff0\\u4fe1\\u606f\\uff1a\\u56fe\\u7247\\u4e0a\\u4f20\\u7684\\u89c4\\u683c\\u4e3a1920*500, \\u975e\\u8be5\\u89c4\\u683c\\u4f1a\\u8fdb\\u884c\\u81ea\\u52a8\\u7684\\u62c9\\u4f38\\u3002\\u5982\\u679c\\u56fe\\u7247\\u4e0a\\u4f20\\u540e\\u6709\\u4e9b\\u6697\\uff0c\\u662f\\u6b63\\u5e38\\u73b0\\u8c61\\u3002\\u8bf7\\u589e\\u52a0\\u4eae\\u5ea6\\u540e\\u91cd\\u65b0\\u4e0a\\u4f20\\u3002\",\"\\u7531\\u4e8e\\u5b57\\u4f53\\u4e3a\\u767d\\u8272\\uff0c\\u6240\\u4ee5\\u6211\\u4eec\\u5bf9\\u56fe\\u7247\\u8fdb\\u884c\\u4e86\\u8499\\u677f\\u5904\\u7406\\u3002\\u4e0a\\u4f20\\u56fe\\u7247\\u540e\\uff0c\\u5c06\\u4f1a\\u770b\\u5230\\u56fe\\u7247\\u4e0a\\u65b9\\u6709\\u4e00\\u5c42\\u534a\\u900f\\u660e\\u7684\\u8499\\u677f\\uff0c\\u8fd9\\u662f\\u6b63\\u5e38\\u7684\\u73b0\\u8c61\\u3002\\u5f53\\u7136\\u4e86\\uff0c\\u5373\\u4f7f\\u662f\\u8fd9\\u6837\\uff0c\\u6211\\u4eec\\u4e5f\\u5e76\\u4e0d\\u63a8\\u8350\\u4f7f\\u7528\\u767d\\u8272\\u7684\\u80cc\\u666f\\u56fe\\u7247\\u3002\"]');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_field_data_text`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_data_text`;
CREATE TABLE `yunzhi_field_data_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk ...',
  `user_name` varchar(40) NOT NULL COMMENT 'fk user',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `yunzhi_field_type`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_field_type`;
CREATE TABLE `yunzhi_field_type` (
  `name` varchar(40) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0启用，1禁用',
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(40) NOT NULL,
  `version` varchar(40) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字段类型表';

-- ----------------------------
--  Records of `yunzhi_field_type`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_field_type` VALUES ('Body', '0', '富文本', '', '', '', ''), ('Image', '0', '图片', '', '', '', ''), ('Text', '0', '文本', '', '', '', ''), ('Attachment', '0', '附件', '', '', '', ''), ('Images', '0', '多图片', '', '', '', ''), ('Json', '0', 'json存的数组数据', '', '', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_filter`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_filter`;
CREATE TABLE `yunzhi_filter` (
  `type` varchar(40) NOT NULL COMMENT '类型（对应过滤器的类名）',
  `function` varchar(40) NOT NULL COMMENT '方法名',
  `param` varchar(4096) NOT NULL COMMENT '参数及参数的说明、默认值（json）',
  `title` varchar(40) NOT NULL COMMENT '标题',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `author` varchar(40) NOT NULL COMMENT '作者',
  `version` varchar(40) NOT NULL COMMENT '版本号',
  `website` varchar(100) NOT NULL COMMENT '网址',
  `demo_url` varchar(100) NOT NULL COMMENT '示例站点URL',
  `email` varchar(100) NOT NULL COMMENT '作者邮箱',
  PRIMARY KEY (`type`,`function`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='过滤器表';

-- ----------------------------
--  Records of `yunzhi_filter`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_filter` VALUES ('System', 'makeFrontpageContentUrl', '[]', '首页新闻链接', '直接生成首页新闻链接（直接链接到 Content组件）', '梦云智', '1.0.0', 'http://www.mengyunzhi.com', 'http://www.mengyunzhi.com', '3792535@qq.com'), ('System', 'makeCurrentMenuReadUrl', '[]', '生成菜单URL', '生成菜单对应的路由URL信息', '', '', '', '', ''), ('String', 'substr', '{\"length\":{\"value\":20,\"title\":\"\\u622a\\u53d6\\u957f\\u5ea6\",\"type\":\"text\",\"description\":\"\\u622a\\u53d6\\u7684UTF8\\u7f16\\u7801\\u7684\\u957f\\u5ea6\"},\"ext\":{\"value\":\"...\",\"title\":\"\\u540e\\u7f00\",\"type\":\"text\",\"description\":\"\\u5c06\\u53d1\\u751f\\u622a\\u53d6\\u64cd\\u4f5c\\u540e\\uff0c\\u586b\\u5145\\u5728\\u6807\\u9898\\u540e\\u9762\\u7684\\u540e\\u7f00\\u4fe1\\u606f\"}}', '标题截取', '对UTF8编码的标题进行截取', '', '', '', '', ''), ('Date', 'format', '{\"dateFormat\":{\"value\":\"Y-m-d\",\"title\":\"\\u65f6\\u95f4\\u6233\\u683c\\u5f0f\\u5316\",\"description\":\"\\u5bf9\\u65f6\\u95f4\\u6233\\u8fdb\\u884c\\u683c\\u5f0f\\u5316\",\"type\":\"text\"}}', '时间戳格式化', '时间戳格式化', '', '', '', '', ''), ('System', 'makeContentReadUrl', '[]', '生成新闻读链接', '根据新闻对应的类别信息，取类别的URL信息，生成LCURD路由', '', '', '', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_menu`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_menu`;
CREATE TABLE `yunzhi_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_type_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'FK(menu_type)菜单类型',
  `component_name` varchar(40) NOT NULL DEFAULT '' COMMENT '组件组',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题，用于直接显示在前台中',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '在前台中显示的路径，即URL',
  `is_hidden` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `config` varchar(255) NOT NULL DEFAULT '[]' COMMENT '配置参数（json）',
  `filter` varchar(255) NOT NULL DEFAULT '[]' COMMENT '过滤器参数',
  `is_home` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否首页',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0启用，1禁用',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `params` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `list` (`weight`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单表（每一个菜单对应唯一的一个组件）';

-- ----------------------------
--  Records of `yunzhi_menu`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_menu` VALUES ('1', 'main', 'Home', '学院概况', '148', 'school_profile', '0', '98', '', '{\"newsCount\":\"3\",\"infoCount\":\"4\"}', '', '0', '0', '65535', '0', '0', ''), ('2', 'main', 'ContentList', '机构设置', '148', 'institutional', '0', '97', '这里是描述信息', '{\"contentTypeName\":\"institutionalSetting\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '{\"title\":{\"type\":\"String\",\"function\":\"substr\",\"param\":{\"length\":\"30\",\"ext\":\"...\"}},\"href\":{\"type\":\"System\",\"function\":\"makeCurrentMenuReadUrl\",\"param\":[]},\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"Y-m-d\"}}}', '0', '0', '65535', '0', '0', ''), ('4', 'main', 'ContentList', '教育教学', '148', 'eduction', '0', '96', '测试', '{\"contentTypeName\":\"news\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '{\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"Y-m-d\"}}}', '0', '0', '65535', '0', '0', ''), ('5', 'main', 'ContentList', '科学研究', '148', 'since', '0', '95', '用于显示首页链接过来的新闻', '{\"contentTypeName\":\"news\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '{\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"m-d\"}},\"href\":{\"type\":\"System\",\"function\":\"makeCurrentMenuReadUrl\",\"param\":[]}}', '0', '0', '65535', '0', '0', ''), ('6', 'main', 'ContentList', '党群工作', '148', 'party_work', '0', '94', '用于用户登陆与注销', '{\"contentTypeName\":\"news\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('7', 'main', 'ContentList', '团学工作', '148', 'league_work', '0', '93', '', '{\"contentTypeName\":\"news\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('8', 'main', 'ContentList', '校友工作', '148', 'alumni_work', '0', '91', '', '{\"contentTypeName\":\"alumniWork\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('9', 'main', 'ContentList', '招生招聘', '148', 'admissions', '0', '92', '', '{\"contentTypeName\":\"news\",\"count\":\"10\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('10', 'main', 'ContentList', '院务公开', '148', 'open_hospital_affairs', '0', '88', '', '{\"contentTypeName\":\"courtyardOpen\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('11', 'main', 'ContentList', '国际交流', '148', 'international', '0', '90', '', '{\"contentTypeName\":\"internationalExchange\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('12', 'main', 'ContentList', '学院文化', '1', 'school_profile/culture', '0', '0', '', '{\"contentTypeName\":\"collegeCulture\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('13', 'main', 'ContentList', '历史沿革', '1', 'school_profile/history', '0', '0', '', '{\"contentTypeName\":\"history\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('14', 'main', 'ContentList', '学院领导', '1', 'school_profile/collegeLeader', '0', '0', '', '{\"contentTypeName\":\"collegeLeader\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('15', 'main', 'Content', '学院简介', '1', 'collegeIntroduction', '0', '0', '', '{\"id\":\"271\"}', '[]', '0', '0', '65535', '0', '0', ''), ('16', 'main', 'Content', '历任领导', '14', 'school_profile/collegeLeader/historyLeader/', '0', '0', '', '{\"id\":\"273\"}', '[]', '0', '0', '65535', '0', '0', ''), ('17', 'main', 'Content', '现任领导', '14', 'school_profile/collegeLeader/currentLeader/', '0', '0', '', '{\"id\":\"272\"}', '[]', '0', '0', '65535', '0', '0', ''), ('18', 'main', 'ContentList', '委员会', '2', 'institutional/committee', '0', '0', '', '{\"contentTypeName\":\"committee\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('19', 'main', 'ContentList', '管理机构', '2', 'institutional/management', '0', '0', '', '{\"contentTypeName\":\"managementAgency\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('20', 'main', 'ContentList', '系部中心', '2', 'institutional/department_centers', '0', '0', '', '{\"contentTypeName\":\"departmentCenter\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('21', 'main', 'ContentList', '计算机实验中心', '20', 'institutional/department_centers/computer_laboratory_center', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('22', 'main', 'ContentList', '基础教学部', '20', 'institutional/department_centers/basic_education', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('23', 'main', 'ContentList', '物联网工程系', '20', 'institutional/department_centers/things_engineer', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('24', 'main', 'ContentList', '软件工程系', '20', 'institutional/department_centers/software_engineer', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('25', 'main', 'ContentList', '网络工程系', '20', 'institutional/department_centers/network_engineer', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('26', 'main', 'ContentList', '计算机科学与技术系', '20', 'institutional/department_centers/computer_science_technology', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('27', 'main', 'ContentList', '学生发展规划办公室', '19', 'institutional/management/stu_develop_office', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('28', 'main', 'ContentList', '学科建设办公室', '19', 'institutional/management/discipline_office', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('29', 'main', 'ContentList', '教学运行办公室', '19', 'institutional/management/teach_operat_office', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('30', 'main', 'ContentList', '协同创新办公室', '19', 'institutional/management/collaborat_office', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('31', 'main', 'ContentList', '院团委', '19', 'institutional/management/house_committee', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('32', 'main', 'ContentList', '学院办公室', '19', 'institutional/management/college_office', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('34', 'main', 'Content', '深化改革咨询委员会', '18', 'institutional/committee /deep _reform_advisory_committee', '0', '0', '', '{\"id\":\"274\"}', '[]', '0', '0', '65535', '0', '0', ''), ('35', 'main', 'ContentList', '政治思想文化咨询委员会', '18', 'institutional/committee/political_thought_culture_committee', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('36', 'main', 'ContentList', '学科建设咨询委员会', '18', 'institutional/committee/discipline_construction_committee', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('37', 'main', 'ContentList', '学位委员会', '18', 'institutional/committee/degree_committee', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('38', 'main', 'ContentList', '学术委员会', '18', 'institutional/committee/academic_committee', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('39', 'main', 'ContentList', '研究生', '4', 'eduction/postgraduate', '0', '156416546', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('40', 'main', 'ContentList', '本科生', '4', 'eduction/undergraduate', '0', '254532453', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('41', 'main', 'ContentList', '常用下载', '40', 'eduction/undergraduate/common_download', '0', '0', '', '{\"contentTypeName\":\"commonDownload\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('42', 'main', 'ContentList', '培养方向', '40', 'eduction/undergraduate/train_direction', '0', '0', '', '{\"contentTypeName\":\"trainDirection\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('43', 'main', 'ContentList', '专业介绍', '40', 'eduction/undergraduate/profes_present', '0', '0', '', '{\"contentTypeName\":\"professionalIntroduction\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('44', 'main', 'ContentList', '就业工作', '39', 'eduction/postgraduate/employment', '0', '0', '', '{\"contentTypeName\":\"employmentWork\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('45', 'main', 'ContentList', '培养工作', '39', 'eduction/postgraduate/job_train', '0', '0', '', '{\"contentTypeName\":\"trainWork\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('46', 'main', 'ContentList', '招生目录', '39', 'eduction/postgraduate/directory_admission', '0', '0', '', '{\"contentTypeName\":\"enrollmentDirectory\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('47', 'main', 'ContentList', '学科方向', '39', 'eduction/postgraduate/subject_orient', '0', '0', '', '{\"contentTypeName\":\"subjectDirection\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('48', 'main', 'ContentList', '学术交流', '5', 'since/academic_exchange', '0', '0', '', '{\"contentTypeName\":\"academicExchange\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('49', 'main', 'ContentList', '科研成果', '5', 'since/science_research', '0', '0', '', '{\"contentTypeName\":\"scientificGain\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('50', 'main', 'ContentList', '科研机构', '5', 'since/research_institutions', '0', '0', '', '{\"contentTypeName\":\"researchInstitutions\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('51', 'main', 'ContentList', '研究所', '50', 'since/research_institutions/graduate_school', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('52', 'main', 'ContentList', '重点实验室', '50', 'since/research_institutions/main_lab', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('53', 'main', 'ContentList', '标志性成果', '49', 'since/science_research/landmark_achievement', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('54', 'main', 'ContentList', '科研合作', '48', 'since/academic_exchange/research_cooperation', '0', '45252', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('55', 'main', 'ContentList', '学术报告', '48', 'since/academic_exchange/academic_report', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('56', 'main', 'ContentList', '党员活动', '60', 'party_work/Party_Build/party_activities', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('57', 'main', 'ContentList', '优秀党员', '60', 'party_work/Party_Build/outstand_member', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('58', 'main', 'ContentList', '党员发展', '60', 'party_work/Party_Build/party_develop', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('59', 'main', 'ContentList', '组织概况', '60', 'party_work/Party_Build/organization_overview', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('60', 'main', 'ContentList', '党建工作', '6', 'party_work/Party_Build', '0', '0', '', '{\"contentTypeName\":\"partyBuild\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('61', 'main', 'ContentList', '工会工作', '6', 'party_work/trade_union_work', '0', '0', '', '{\"contentTypeName\":\"unionWork\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('62', 'main', 'ContentList', '工会动态', '61', 'party_work/trade_union_work/dynamic_union', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('63', 'main', 'ContentList', '工会概况', '61', 'party_work/trade_union_work/trade_union', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('65', 'main', 'ContentList', '服务指南', '7', 'league_work/service_guide', '0', '0', '', '{\"contentTypeName\":\"serviceGuide\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('66', 'main', 'ContentList', '优秀学生作品展', '7', 'league_work/excellent_stu_exhibition', '0', '0', '', '{\"contentTypeName\":\"excellentStudentDemo\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('67', 'main', 'ContentList', '班导师', '7', 'league_work/tutor', '0', '0', '', '{\"contentTypeName\":\"classTutorial\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('68', 'main', 'ContentList', '学生事务', '7', 'league_work/stu_affairs', '0', '0', '', '{\"contentTypeName\":\"studentAffairs\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('69', 'main', 'ContentList', '就业创业', '7', 'league_work/employment_entrepreneurship', '0', '0', '', '{\"contentTypeName\":\"employmentBusiness\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('70', 'main', 'ContentList', '专业兴趣小组', '7', 'league_work/profes_interest_group', '0', '0', '', '{\"contentTypeName\":\"professionalInterest\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('71', 'main', 'ContentList', ' 新生夏令营', '7', 'league_work/freshmen_camp', '0', '0', '', '{\"contentTypeName\":\"newSummerCamp\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('72', 'main', 'ContentList', '志愿服务', '7', 'league_work/volunteer_service', '0', '0', '', '{\"contentTypeName\":\"volunteerService\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('73', 'main', 'ContentList', '社会实践', '7', 'league_work/social_practice', '0', '0', '', '{\"contentTypeName\":\"socialPractice\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('74', 'main', 'ContentList', '科技创新', '7', 'league_work/technological_innovation', '0', '0', '', '{\"contentTypeName\":\"scienceInnovation\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('75', 'main', 'ContentList', '组织机构', '7', 'league_work/organization', '0', '0', '', '{\"contentTypeName\":\"organization\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('76', 'main', 'ContentList', '社团', '75', 'league_work/organization/associations', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('77', 'main', 'ContentList', '大学生创新创业实践中心', '75', 'league_work/organization/innovation_stu_center', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('78', 'main', 'ContentList', '学生会', '75', 'league_work/organization/stu', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('79', 'main', 'ContentList', '团委', '75', 'league_work/organization/youth_league', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('80', 'main', 'ContentList', '学工组', '75', 'league_work/organization/science_engineer_group', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('81', 'main', 'ContentList', '获奖名单', '74', 'league_work/technological_innovation/winners', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('82', 'main', 'ContentList', '竞赛目录', '74', 'league_work/technological_innovation/competition_directory', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('83', 'main', 'ContentList', '竞赛通知', '74', 'league_work/technological_innovation/competition_notice', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('84', 'main', 'ContentList', '调研报告', '73', 'league_work/social_practice/research_report', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('85', 'main', 'ContentList', '实践成果', '73', 'league_work/social_practice/practical_results', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('86', 'main', 'ContentList', '项目介绍', '73', 'league_work/social_practice/rroject_introduction', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('87', 'mian', 'ContentList', '活动纪实', '72', 'league_work/volunteer_service/event_blog', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('88', 'main', 'ContentList', '基地建设', '72', 'league_work/volunteer_service/base_construction', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('89', 'main', 'ContentList', '活动简介', '72', 'league_work/volunteer_service/activity_profile', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('90', 'main', 'ContentList', '优秀营员', '71', 'league_work/freshmen_camp/excellent_campers', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('91', 'main', 'ContentList', '历届成员', '71', 'league_work/freshmen_camp/previous_members', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('92', 'main', 'ContentList', '营区活动', '71', 'league_work/freshmen_camp/camp_activities', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('93', 'main', 'ContentList', '我要加入', '70', 'league_work/profes_interest_group/want_join', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('94', 'main', 'ContentList', '小组简介', '70', 'league_work/profes_interest_group/team_profile', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('95', 'main', 'ContentList', '实施办法', '70', 'league_work/profes_interest_group/implement_measure', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('96', 'main', 'ContentList', '活动展示', '70', 'league_work/profes_interest_group/event_gallery', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('97', 'main', 'ContentList', '教师介绍', '70', 'league_work/profes_interest_group/teacher_profile', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('98', 'main', 'ContentList', '创业之星', '69', 'league_work/employment_entrepreneurship/venture_star', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('99', 'main', 'ContentList', '生涯教育', '69', 'league_work/employment_entrepreneurship/career_edu', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('100', 'main', 'ContentList', '就业政策', '69', 'league_work/employment_entrepreneurship/employment_policy', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('101', 'main', 'ContentList', '就业信息', '69', 'league_work/employment_entrepreneurship/employment_information', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('102', 'main', 'ContentList', '创业政策', '69', 'league_work/employment_entrepreneurship/entrepreneurship_policy', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('103', 'mian', 'ContentList', '勤工助学', '68', 'league_work/stu_affairs/work_study', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('104', 'main', 'ContentList', '助学贷款', '68', 'league_work/stu_affairs/student_loans', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('105', 'main', 'ContentList', '助学金', '68', 'league_work/stu_affairs/stipend', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('106', 'main', 'ContentList', '奖学金', '68', 'league_work/stu_affairs/scholarship', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('107', 'main', 'ContentList', '奖优评定', '68', 'league_work/stu_affairs/award_assessment', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('108', 'main', 'ContentList', '活动展示', '67', 'league_work/tutor/events_gallery', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('109', 'main', 'ContentList', '导师介绍', '67', 'league_work/tutor/instructors', '0', '13213213', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('110', 'main', 'ContentList', '实施办法', '67', 'league_work/tutor/implementation_measure', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('112', 'main', 'ContentList', '先进个人', '66', 'league_work/excellent_stu_exhibition/outstanding_person', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('113', 'main', 'ContentList', '竞赛达人', '66', 'league_work/excellent_stu_exhibition/competition_daren', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('114', 'main', 'ContentList', '行政服务', '65', 'league_work/service_guide/administrative_services', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('115', 'main', 'ContentList', '学习服务', '65', 'league_work/service_guide/learning_services', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('116', 'main', 'ContentList', '生活服务', '65', 'league_work/service_guide/domestic_services', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('117', 'main', 'ContentList', '人才招聘', '9', 'admissions/recruitment/recruitment', '0', '0', '', '{\"contentTypeName\":\"recruit\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('118', 'main', 'ContentList', '招生信息', '9', 'admissions/admis_information', '0', '0', '', '{\"contentTypeName\":\"admissionsInformation\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('119', 'main', 'ContentList', '奖助学金', '118', 'admissions/admis_information/scholarship', '0', '2147483647', '', '{\"contentTypeName\":\"rewardMoney\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('120', 'main', 'ContentList', '历年招生分数线', '118', 'admissions/admis_information/calendar_admission_score', '0', '45641313', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('121', 'main', 'ContentList', '招生简章', '118', 'admissions/admis_information/brochures', '0', '546514651', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('122', 'main', 'ContentList', '招生计划', '118', 'admissions/admis_information/enrollment_plan', '0', '2147483647', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('123', 'main', 'ContentList', '未来发展', '118', 'admissions/admis_information/future_develop', '0', '963852741', '', '{\"contentTypeName\":\"futureDevelopment\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '65535', '0', '0', ''), ('124', 'main', 'ContentList', '联系方式', '117', 'admissions/recruitment/recruitment/contact_information', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('125', 'main', 'ContentList', '应聘方式及流程', '117', 'admissions/recruitment/recruitment/app_method_processe', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('126', 'main', 'ContentList', '应聘条件', '117', 'admissions/recruitment/recruitment/qualification', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('127', 'main', 'ContentList', '学院简介', '117', 'admissions/recruitment/recruitment/college_introduction', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('129', 'main', 'ContentList', '校友服务', '8', 'alumni_work/alumni_services', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('130', 'main', 'ContentList', '校友动态', '8', 'alumni_work/alumni_dynamic', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('131', 'main', 'ContentList', '校友公告', '8', 'alumni_work/alumni_bulletin', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('132', 'main', 'ContentList', '校友寄语', '8', 'alumni_work/alumni_message', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('133', 'main', 'ContentList', '毕业映像', '8', 'alumni_work/graduation_image', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('134', 'main', 'ContentList', '交流动态', '11', 'international/dynamic_exchange', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('135', 'main', 'ContentList', '合作项目', '11', 'international/cooperation_pro', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('136', 'mian', 'ContentList', '中法班,中新班', '135', 'international/cooperation_pro/sino_french_new', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('137', 'main', 'ContentList', '院内推评', '10', 'open_hospital_affairs/push_comment', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('138', 'main', 'ContentList', '会议签到', '10', 'open_hospital_affairs/conference_registration', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('139', 'main', 'ContentList', '会议纪要', '10', 'open_hospital_affairs/meet_minute', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('140', 'main', 'ContentList', ' 学院文件', '10', 'open_hospital_affairs/college_file', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('141', 'main', 'ContentList', '学校文件', '10', 'open_hospital_affairs/school_document', '0', '0', '', '[]', '[]', '0', '0', '65535', '0', '0', ''), ('143', 'main', 'Home', '首页', '148', '', '0', '99', '', '{\"newsCount\":\"3\",\"infoCount\":\"4\"}', '[]', '0', '0', '65535', '32767', '0', ''), ('144', 'main', 'Login', '个人中心', '149', 'personalcenter', '1', '98', '', '[]', '[]', '0', '0', '65535', '32767', '0', ''), ('146', 'header', 'Login', '教职工', '149', 'login', '0', '0', '', '[]', '[]', '0', '0', '65535', '32767', '0', ''), ('147', 'header', 'Login', '注销', '149', 'logout', '0', '0', '', '{\"newsCount\":\"3\",\"infoCount\":\"4\"}', '[]', '0', '0', '65535', '32767', '0', '/logout'), ('148', '', '', '主菜单', '0', '', '0', '0', '', '[]', '[]', '0', '0', '0', '0', '0', ''), ('149', '', '', '最上侧菜单', '0', '', '0', '0', '', '[]', '[]', '0', '0', '0', '0', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_menu_type`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_menu_type`;
CREATE TABLE `yunzhi_menu_type` (
  `name` varchar(40) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单类型表（主要为了可以使用区块进行菜单的调用）';

-- ----------------------------
--  Records of `yunzhi_menu_type`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_menu_type` VALUES ('main', '主菜单', '主菜单', '0', '0', '0'), ('header', '页头菜单', '显示在LOGO上方', '0', '1487592245', '1487592245');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_plugin`;
CREATE TABLE `yunzhi_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_type_name` varchar(40) NOT NULL COMMENT 'fk plugin_type 插件类型',
  `position_name` varchar(40) NOT NULL COMMENT 'fk of plugin_position',
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL,
  `config` varchar(4096) NOT NULL DEFAULT '[]',
  `filter` varchar(4096) NOT NULL DEFAULT '[]',
  `weight` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='插件表';

-- ----------------------------
--  Records of `yunzhi_plugin`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_plugin` VALUES ('1', 'PreNextContent', 'afterContent', '文章后', '', '0', '', '{\"href\":{\"type\":\"System\",\"function\":\"makeContentReadUrl\"}}', '0', '0', '0', '0'), ('2', 'FrontPageNews', 'beforeContent', '推荐到首页', '将新闻内容推荐到首页', '0', '[]', '[]', '0', '0', '1487405271', '1487586320');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_plugin_data_front_page_news`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_plugin_data_front_page_news`;
CREATE TABLE `yunzhi_plugin_data_front_page_news` (
  `content_id` int(11) NOT NULL,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章阅读的URL地址',
  `type` char(6) NOT NULL DEFAULT '' COMMENT 'news:新闻，info:通知',
  `weight` smallint(6) unsigned NOT NULL COMMENT '0',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='首页文章表';

-- ----------------------------
--  Records of `yunzhi_plugin_data_front_page_news`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_plugin_data_front_page_news` VALUES ('274', '15', '/school_profile/culture/read/id/274.html', 'news', '0', '1487582315', '1487915778'), ('271', '15', '', 'news', '0', '1487583385', '1487583385'), ('276', '0', '/school_profile/culture/read/id/276.html', 'info', '0', '1487590519', '1487591328');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_plugin_type`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_plugin_type`;
CREATE TABLE `yunzhi_plugin_type` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='插件类型表';

-- ----------------------------
--  Records of `yunzhi_plugin_type`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_plugin_type` VALUES ('PreNextContent', '上一篇、下一篇文章', ''), ('FrontPageNews', '首页新闻通知', '将新闻显示在首页上');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_position`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_position`;
CREATE TABLE `yunzhi_position` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(40) NOT NULL DEFAULT 'blcok' COMMENT '类型: block 区块，plugin 插件',
  `theme_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk of theme',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='位置表，记录着某个主题(theme)下的插件(plugin)及区块(block)位置信息';

-- ----------------------------
--  Records of `yunzhi_position`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_position` VALUES ('header', '网页头', '显示第一个ROW', 'block', 'default'), ('logo', 'logo', 'logo', 'block', 'default'), ('beforeContent', '文章前', '在查看或编辑文章以前', 'plugin', 'default');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_theme`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_theme`;
CREATE TABLE `yunzhi_theme` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `is_current` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否激活. 0未激活，1已激活',
  `author` varchar(40) NOT NULL DEFAULT '',
  `version` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='主题表';

-- ----------------------------
--  Records of `yunzhi_theme`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_theme` VALUES ('default', '默认主题', '', '1', '梦云智', ''), ('zhenjie', '汤师兄', '', '0', '汤师兄', ''), ('liuyanzhao', 'young', '', '0', '刘艳招', ''), ('huangtheme', '二斌', '', '0', '二斌', ''), ('liming', '高黎明', '', '0', '高黎明', ''), ('Chutheme', '楚航', '', '0', '楚航', ''), ('Fantheme', '小范儿师姐', '', '0', '小范儿师姐', '');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_user`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_user`;
CREATE TABLE `yunzhi_user` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `qq_open_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'qq 认证openid',
  `password` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1冻结',
  `user_group_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk user_group',
  `create_time` smallint(6) unsigned NOT NULL,
  `update_time` smallint(6) unsigned NOT NULL,
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '1已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
--  Records of `yunzhi_user`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_user` VALUES ('1', 'admin@admin.com', '', '1e7b95c5614637fdcde70eb7f2d109134c95c6bf', '梦云智', '1', 'admin', '0', '65535', '0');
COMMIT;

-- ----------------------------
--  Table structure for `yunzhi_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_user_group`;
CREATE TABLE `yunzhi_user_group` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` smallint(6) unsigned NOT NULL DEFAULT '0',
  `update_time` smallint(6) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组（用户类型）表';

-- ----------------------------
--  Records of `yunzhi_user_group`
-- ----------------------------
BEGIN;
INSERT INTO `yunzhi_user_group` VALUES ('admin', '超级管理员', '拥有开发权限', '0', '0', '0'), ('editor', '站点编辑人员', '对站点进行管理', '0', '0', '0'), ('register', '注册用户', '注册用户，拥有对权限新闻的查看权限', '0', '0', '0'), ('public', '公共用户', '浏览网站的用户', '0', '0', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
