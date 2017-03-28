/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : yunzhicms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-01-24 17:31:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yunzhi_access_menu_block
-- ----------------------------
DROP TABLE IF EXISTS `yunzhi_access_menu_block`;
CREATE TABLE `yunzhi_access_menu_block` (
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT 'fk menu',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT 'fk block',
  PRIMARY KEY (`menu_id`,`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='菜单-区块 权限表';

-- ----------------------------
-- Records of yunzhi_access_menu_block
-- ----------------------------
INSERT INTO `yunzhi_access_menu_block` VALUES ('1', '1');
INSERT INTO `yunzhi_access_menu_block` VALUES ('1', '2');
INSERT INTO `yunzhi_access_menu_block` VALUES ('1', '3');
INSERT INTO `yunzhi_access_menu_block` VALUES ('1', '8');
INSERT INTO `yunzhi_access_menu_block` VALUES ('1', '9');
INSERT INTO `yunzhi_access_menu_block` VALUES ('2', '1');
INSERT INTO `yunzhi_access_menu_block` VALUES ('2', '9');
INSERT INTO `yunzhi_access_menu_block` VALUES ('3', '1');
INSERT INTO `yunzhi_access_menu_block` VALUES ('3', '7');
INSERT INTO `yunzhi_access_menu_block` VALUES ('4', '1');
INSERT INTO `yunzhi_access_menu_block` VALUES ('4', '9');
INSERT INTO `yunzhi_access_menu_block` VALUES ('5', '1');
INSERT INTO `yunzhi_access_menu_block` VALUES ('5', '7');
INSERT INTO `yunzhi_access_menu_block` VALUES ('6', '1');
INSERT INTO `yunzhi_access_menu_block` VALUES ('6', '7');
