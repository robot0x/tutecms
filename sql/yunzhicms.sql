/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : yunzhicms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-12-21 11:06:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tutelib_access_menu_block
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_menu_block`;
CREATE TABLE `tutelib_access_menu_block` (
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT 'fk menu',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT 'fk block',
  PRIMARY KEY (`menu_id`,`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='菜单-区块 权限表';

-- ----------------------------
-- Records of tutelib_access_menu_block
-- ----------------------------
INSERT INTO `tutelib_access_menu_block` VALUES ('1', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('1', '2');
INSERT INTO `tutelib_access_menu_block` VALUES ('1', '3');
INSERT INTO `tutelib_access_menu_block` VALUES ('1', '8');
INSERT INTO `tutelib_access_menu_block` VALUES ('1', '9');
INSERT INTO `tutelib_access_menu_block` VALUES ('2', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('2', '8');
INSERT INTO `tutelib_access_menu_block` VALUES ('3', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('3', '8');
INSERT INTO `tutelib_access_menu_block` VALUES ('5', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('5', '7');
INSERT INTO `tutelib_access_menu_block` VALUES ('6', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('6', '8');
INSERT INTO `tutelib_access_menu_block` VALUES ('7', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('7', '8');
INSERT INTO `tutelib_access_menu_block` VALUES ('8', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('9', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('10', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('11', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('11', '8');
INSERT INTO `tutelib_access_menu_block` VALUES ('12', '1');
INSERT INTO `tutelib_access_menu_block` VALUES ('12', '8');

-- ----------------------------
-- Table structure for tutelib_access_menu_plugin
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_menu_plugin`;
CREATE TABLE `tutelib_access_menu_plugin` (
  `menu_id` int(11) unsigned NOT NULL,
  `plugin_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`menu_id`,`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单-插件 权限表';

-- ----------------------------
-- Records of tutelib_access_menu_plugin
-- ----------------------------
INSERT INTO `tutelib_access_menu_plugin` VALUES ('3', '1');

-- ----------------------------
-- Table structure for tutelib_access_user_group_block
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_user_group_block`;
CREATE TABLE `tutelib_access_user_group_block` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `block_id` int(11) unsigned NOT NULL COMMENT 'fk block 区块外键',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group_name`,`block_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组-菜单 权限表。权限设置(LCURD)';

-- ----------------------------
-- Records of tutelib_access_user_group_block
-- ----------------------------
INSERT INTO `tutelib_access_user_group_block` VALUES ('admin', '2', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('editor', '2', 'edit');
INSERT INTO `tutelib_access_user_group_block` VALUES ('editor', '2', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('editor', '2', 'save');
INSERT INTO `tutelib_access_user_group_block` VALUES ('editor', '2', 'update');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '1', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '2', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '3', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '4', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '5', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '6', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '6', 'login');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '6', 'logout');
INSERT INTO `tutelib_access_user_group_block` VALUES ('public', '8', 'index');
INSERT INTO `tutelib_access_user_group_block` VALUES ('register', '2', 'index');

-- ----------------------------
-- Table structure for tutelib_access_user_group_field
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_user_group_field`;
CREATE TABLE `tutelib_access_user_group_field` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `field_id` int(11) unsigned NOT NULL COMMENT 'fk field 字段外键',
  PRIMARY KEY (`user_group_name`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组 字段 权限设置';

-- ----------------------------
-- Records of tutelib_access_user_group_field
-- ----------------------------

-- ----------------------------
-- Table structure for tutelib_access_user_group_menu
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_user_group_menu`;
CREATE TABLE `tutelib_access_user_group_menu` (
  `user_group_name` varchar(40) NOT NULL COMMENT 'fk user_group 用户组外键',
  `menu_id` int(11) unsigned NOT NULL COMMENT 'fk menu 菜单外键',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group_name`,`menu_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组-菜单 权限表。权限设置(LCURD)';

-- ----------------------------
-- Records of tutelib_access_user_group_menu
-- ----------------------------
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '1', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '2', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '3', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'login');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'logout');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '6', 'update');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '7', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '7', 'frozen');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '7', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '7', 'reset');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '8', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '9', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '10', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '11', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '11', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('admin', '11', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '1', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'delete');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'read');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '2', 'update');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'addClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'addCourse');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'delete');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'editClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'period');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'read');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '3', 'update');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '4', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '5', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '6', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '6', 'logout');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'delete');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'deleteComment');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'read');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '7', 'saveComment');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '8', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '9', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '10', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'delete');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'read');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '11', 'update');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'addClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'addCourse');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'addKlass');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'addPeriod');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'addTeacher');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'classroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'deleteClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'deleteCourse');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'deleteKlass');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'deletePeriod');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'deleteTeacher');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'editClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'editCourse');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'editKlass');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'editPeriod');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'editTeacher');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'klass');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'period');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'saveClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'saveCourse');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'saveKlass');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'savePeriod');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'saveTeacher');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'teacher');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'updateClassroom');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'updateCourse');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'updateKlass');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'updatePeriod');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('editor', '12', 'updateTeacher');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '1', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '2', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '2', 'read');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '3', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '3', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '5', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '5', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'edit');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'login');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'logout');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '6', 'update');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '7', 'add');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '7', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '7', 'read');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '7', 'save');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '7', 'saveComment');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '8', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '9', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '10', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '11', 'index');
INSERT INTO `tutelib_access_user_group_menu` VALUES ('public', '11', 'read');

-- ----------------------------
-- Table structure for tutelib_access_user_group_plugin
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_access_user_group_plugin`;
CREATE TABLE `tutelib_access_user_group_plugin` (
  `user_group_name` varchar(40) NOT NULL,
  `plugin_id` int(11) unsigned NOT NULL,
  `action` varchar(40) NOT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_group_name`,`plugin_id`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_access_user_group_plugin
-- ----------------------------
INSERT INTO `tutelib_access_user_group_plugin` VALUES ('admin', '1', '', '1474704189', '1474704189');
INSERT INTO `tutelib_access_user_group_plugin` VALUES ('admin', '3', '', '1474709149', '1474709149');
INSERT INTO `tutelib_access_user_group_plugin` VALUES ('editor', '1', '', '1474704189', '1474704189');
INSERT INTO `tutelib_access_user_group_plugin` VALUES ('editor', '3', '', '1474709149', '1474709149');
INSERT INTO `tutelib_access_user_group_plugin` VALUES ('register', '1', '', '1474704189', '1474704189');

-- ----------------------------
-- Table structure for tutelib_block
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_block`;
CREATE TABLE `tutelib_block` (
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
  `update_time` smallint(6) unsigned NOT NULL,
  `create_time` smallint(6) unsigned NOT NULL,
  `delete_time` smallint(6) unsigned NOT NULL,
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `'is_delete'` (`is_delete`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='区块表';

-- ----------------------------
-- Records of tutelib_block
-- ----------------------------
INSERT INTO `tutelib_block` VALUES ('1', 'Menu', '0', 'menu', '主菜单', '显示在页面上方', '0', '0', '{\"menu_type_name\":\"main\",\"id\":\"cssmenu\"}', '[]', '65535', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('2', 'Slider', '0', 'slider', '幻灯片', '', '0', '0', '[]', '[]', '65535', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('3', 'ContentVideo', '0', 'main', '文字视频介绍', '', '0', '0', '[]', '[]', '0', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('4', 'DataCounter', '0', 'main', '数据统计', '', '0', '0', '[]', '[]', '0', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('5', 'CaseShow', '0', 'main', '案例展示', '', '0', '0', '[]', '[]', '0', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('6', 'ShowCaseSlider', '0', 'main', '动态案例展示', '', '0', '0', '[]', '[]', '0', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('7', 'BreadCrumb', '0', 'breadCrumb', '面包屑', '', '0', '0', '[]', '[]', '65535', '0', '0', '1');
INSERT INTO `tutelib_block` VALUES ('8', 'Footer', '0', 'main', '页脚', '', '0', '0', '[]', '[]', '65535', '0', '0', '0');
INSERT INTO `tutelib_block` VALUES ('9', 'PictureNews', '0', 'main', '图文列表', '', '0', '0', '[]', '[]', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tutelib_block_type
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_block_type`;
CREATE TABLE `tutelib_block_type` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='区块类型表';

-- ----------------------------
-- Records of tutelib_block_type
-- ----------------------------
INSERT INTO `tutelib_block_type` VALUES ('Menu', '菜单', '显示菜单');
INSERT INTO `tutelib_block_type` VALUES ('BreadCrumb', '面包屑', '');
INSERT INTO `tutelib_block_type` VALUES ('Slider', '幻灯片', '');
INSERT INTO `tutelib_block_type` VALUES ('ContentVideo', '文字视频介绍', '通常用于首页的关于我们');
INSERT INTO `tutelib_block_type` VALUES ('DataCounter', '数据统计', '数据统计');
INSERT INTO `tutelib_block_type` VALUES ('CaseShow', '案例展示', '');
INSERT INTO `tutelib_block_type` VALUES ('ShowCaseSlider', '动态案例展示', '');
INSERT INTO `tutelib_block_type` VALUES ('Footer', '页脚显示', '');

-- ----------------------------
-- Table structure for tutelib_chuhang_classroom
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_classroom`;
CREATE TABLE `tutelib_chuhang_classroom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '教室名',
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_classroom
-- ----------------------------
INSERT INTO `tutelib_chuhang_classroom` VALUES ('1', 'A701', '0', '0', '0');
INSERT INTO `tutelib_chuhang_classroom` VALUES ('2', 'A702', '0', '0', '0');
INSERT INTO `tutelib_chuhang_classroom` VALUES ('3', 'A801', '0', '0', '0');
INSERT INTO `tutelib_chuhang_classroom` VALUES ('4', 'A802', '0', '0', '0');

-- ----------------------------
-- Table structure for tutelib_chuhang_course
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_course`;
CREATE TABLE `tutelib_chuhang_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '课程名称',
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_course
-- ----------------------------
INSERT INTO `tutelib_chuhang_course` VALUES ('1', '电子商务概论', '0', '0', '0');
INSERT INTO `tutelib_chuhang_course` VALUES ('2', '计算机网路基础', '0', '0', '0');
INSERT INTO `tutelib_chuhang_course` VALUES ('3', 'java程序设计', '0', '0', '0');
INSERT INTO `tutelib_chuhang_course` VALUES ('4', '微观经济学', '0', '0', '0');
INSERT INTO `tutelib_chuhang_course` VALUES ('5', '统计学', '0', '0', '0');
INSERT INTO `tutelib_chuhang_course` VALUES ('23', '中国近现代史纲要', '0', '1481031427', '1481031427');

-- ----------------------------
-- Table structure for tutelib_chuhang_curriculum
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_curriculum`;
CREATE TABLE `tutelib_chuhang_curriculum` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) unsigned NOT NULL,
  `config` varchar(100) NOT NULL,
  `teacher_id` int(11) unsigned NOT NULL,
  `klass` varchar(100) NOT NULL,
  `course_id` int(11) unsigned NOT NULL,
  `time_id` int(11) unsigned NOT NULL,
  `week` int(11) NOT NULL,
  `day_id` int(11) unsigned NOT NULL,
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_curriculum
-- ----------------------------
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('134', '1', '[2,4,10]', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '1', '3', '0', '1481558299', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('136', '1', '[2,4,10]', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '1', '5', '0', '1481558299', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('138', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '2', '3', '0', '1481558299', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('140', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '2', '5', '0', '1481558299', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('142', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '4', '3', '0', '1481558299', '1481639573');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('144', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '4', '5', '0', '1481558299', '1481639573');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('146', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '10', '3', '0', '1481558299', '1481558299');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('148', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '3', '10', '5', '0', '1481558299', '1481558299');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('149', '1', '[2,3,4,10]', '1', '[\"1\",\"3\",\"8\"]', '1', '1', '1', '5', '0', '1481558376', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('151', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '1', '2', '5', '0', '1481558376', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('153', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '1', '3', '5', '0', '1481558376', '1481558376');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('155', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '1', '4', '5', '0', '1481558376', '1481639573');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('157', '1', '', '1', '[\"1\",\"3\",\"8\"]', '1', '1', '10', '5', '0', '1481558376', '1481558376');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('162', '1', '[19]', '1', '[\"7\"]', '1', '2', '9', '2', '0', '1481611248', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('163', '1', '', '1', '[\"7\"]', '1', '2', '19', '2', '0', '1481611248', '1481611248');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('165', '1', '[2,3,8,14]', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '1', '1', '0', '1481611265', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('167', '1', '[2,3,8,14]', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '1', '2', '0', '1481611265', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('169', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '2', '1', '0', '1481611265', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('171', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '2', '2', '0', '1481611265', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('173', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '3', '1', '0', '1481611265', '1481611265');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('175', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '3', '2', '0', '1481611265', '1481611265');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('177', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '8', '1', '0', '1481611265', '1481633649');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('179', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '8', '2', '0', '1481611265', '1481633649');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('181', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '14', '1', '0', '1481611265', '1481611265');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('183', '1', '', '1', '[\"1\",\"2\",\"8\"]', '1', '3', '14', '2', '0', '1481611265', '1481611265');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('187', '1', '[2,3,4,5]', '1', '[\"1\"]', '1', '4', '1', '1', '0', '1481611491', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('188', '1', '[2,3,4,5]', '1', '[\"1\"]', '1', '4', '1', '2', '0', '1481611491', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('189', '1', '', '1', '[\"1\"]', '1', '4', '2', '1', '0', '1481611491', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('190', '1', '', '1', '[\"1\"]', '1', '4', '2', '2', '0', '1481611491', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('191', '1', '', '1', '[\"1\"]', '1', '4', '3', '1', '0', '1481611491', '1481611491');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('192', '1', '', '1', '[\"1\"]', '1', '4', '3', '2', '0', '1481611491', '1481611491');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('193', '1', '', '1', '[\"1\"]', '1', '4', '4', '1', '0', '1481611491', '1481639573');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('194', '1', '', '1', '[\"1\"]', '1', '4', '4', '2', '0', '1481611491', '1481639573');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('195', '1', '', '1', '[\"1\"]', '1', '4', '5', '1', '0', '1481611491', '1481636953');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('196', '1', '', '1', '[\"1\"]', '1', '4', '5', '2', '0', '1481611491', '1481636953');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('202', '4', '[7]', '6', '[\"2\"]', '5', '1', '1', '4', '0', '1481611773', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('204', '4', '', '6', '[\"2\"]', '5', '1', '7', '4', '0', '1481611773', '1481611773');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('205', '1', '[2,3]', '4', '[\"1\"]', '3', '1', '1', '1', '0', '1481615770', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('206', '1', '', '4', '[\"1\"]', '3', '1', '2', '1', '0', '1481615770', '1481637270');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('207', '1', '', '4', '[\"1\"]', '3', '1', '3', '1', '0', '1481615770', '1481615770');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('210', '4', '[6,7,6,7]', '6', '[\"2\"]', '5', '1', '1', '3', '0', '1481630315', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('211', '4', '', '6', '[\"2\"]', '5', '1', '6', '3', '0', '1481630315', '1481630315');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('212', '4', '', '6', '[\"2\"]', '5', '1', '7', '3', '0', '1481630315', '1481630315');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('218', '2', '', '2', '[\"1\"]', '2', '4', '2', '2', '0', '1481633627', '1481633627');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('219', '1', '', '3', '[\"1\",\"2\"]', '3', '1', '16', '1', '0', '1481640257', '1481701696');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('221', '2', '[11,12,14,15,16]', '2', '[\"3\",\"4\"]', '2', '4', '6', '2', '0', '1481640427', '1481702380');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('223', '2', '', '2', '[\"3\",\"4\"]', '2', '4', '11', '2', '0', '1481640427', '1481640427');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('225', '2', '', '2', '[\"3\",\"4\"]', '2', '4', '12', '2', '0', '1481640427', '1481640427');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('227', '2', '', '2', '[\"3\",\"4\"]', '2', '4', '14', '2', '0', '1481640427', '1481640427');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('229', '2', '', '2', '[\"3\",\"4\"]', '2', '4', '15', '2', '0', '1481640427', '1481640427');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('231', '2', '', '2', '[\"3\",\"4\"]', '2', '4', '16', '2', '0', '1481640427', '1481701696');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('233', '4', '', '6', '[\"2\"]', '5', '1', '1', '3', '0', '1481701842', '1481701842');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('235', '4', '', '6', '[\"2\"]', '5', '1', '6', '3', '0', '1481701842', '1481701842');
INSERT INTO `tutelib_chuhang_curriculum` VALUES ('237', '4', '', '6', '[\"2\"]', '5', '1', '7', '3', '0', '1481701842', '1481701842');

-- ----------------------------
-- Table structure for tutelib_chuhang_day
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_day`;
CREATE TABLE `tutelib_chuhang_day` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `day` smallint(6) unsigned NOT NULL,
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_day
-- ----------------------------
INSERT INTO `tutelib_chuhang_day` VALUES ('1', '1', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_day` VALUES ('2', '2', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_day` VALUES ('3', '3', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_day` VALUES ('4', '4', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_day` VALUES ('5', '5', '0', '1481725144', '1481725144', '0');

-- ----------------------------
-- Table structure for tutelib_chuhang_klass
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_klass`;
CREATE TABLE `tutelib_chuhang_klass` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '班级名称',
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_klass
-- ----------------------------
INSERT INTO `tutelib_chuhang_klass` VALUES ('1', '电商1501', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('2', '电商1502', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('3', '物流1501', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('4', '物流1502', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('5', '金融1501', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('6', '金融1502', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('7', '财会1501', '0', '0', '0');
INSERT INTO `tutelib_chuhang_klass` VALUES ('8', '财会1502', '0', '0', '0');

-- ----------------------------
-- Table structure for tutelib_chuhang_period
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_period`;
CREATE TABLE `tutelib_chuhang_period` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `is_create` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '周期名称',
  `day` int(11) unsigned NOT NULL COMMENT '天数/周',
  `time` int(11) unsigned NOT NULL COMMENT '节次/天',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_period
-- ----------------------------
INSERT INTO `tutelib_chuhang_period` VALUES ('4', '2016', '2017', '1', '1481726275', '1481726275', '2015-2016第一学期', '5', '4');
INSERT INTO `tutelib_chuhang_period` VALUES ('5', '2016', '2017', '0', '1481727380', '1481727380', '2015-2016第二学期', '5', '4');

-- ----------------------------
-- Table structure for tutelib_chuhang_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_teacher`;
CREATE TABLE `tutelib_chuhang_teacher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '教师名称',
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_teacher
-- ----------------------------
INSERT INTO `tutelib_chuhang_teacher` VALUES ('1', '赵丽华', '0', '0', '0');
INSERT INTO `tutelib_chuhang_teacher` VALUES ('2', '李清', '0', '0', '0');
INSERT INTO `tutelib_chuhang_teacher` VALUES ('3', '付强', '0', '0', '0');
INSERT INTO `tutelib_chuhang_teacher` VALUES ('4', '郭跃红', '0', '0', '0');
INSERT INTO `tutelib_chuhang_teacher` VALUES ('6', '崔晓迪', '0', '1481033495', '1481070395');

-- ----------------------------
-- Table structure for tutelib_chuhang_time
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_chuhang_time`;
CREATE TABLE `tutelib_chuhang_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` smallint(6) unsigned NOT NULL,
  `is_delete` tinyint(2) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `term_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_chuhang_time
-- ----------------------------
INSERT INTO `tutelib_chuhang_time` VALUES ('1', '1', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_time` VALUES ('2', '2', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_time` VALUES ('3', '3', '0', '1481725144', '1481725144', '0');
INSERT INTO `tutelib_chuhang_time` VALUES ('4', '4', '0', '1481725144', '1481725144', '0');

-- ----------------------------
-- Table structure for tutelib_comment
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_comment`;
CREATE TABLE `tutelib_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '评论内容',
  `classroom` varchar(30) NOT NULL COMMENT 'j教师号',
  `number` int(11) NOT NULL COMMENT 'j机器号',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `key_id` int(11) NOT NULL COMMENT '评论对应的内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_comment
-- ----------------------------
INSERT INTO `tutelib_comment` VALUES ('2', '河北工业大学梦云智软件开发团队成立于2014年12月。依托于计算机科学与软件学院，团队现拥有自身独立的实验室，经过一年多不懈的努力，团队学习氛围越来越浓厚，团队精神越来越多地被我们诠释。 自团队成立以来，已先后完成”“众筹海淘” 微信购物平台系统 、 “天职师大”绩效管理系统、“洛克酒店”管理系统、 “河北工业大学材料学院”论文送审系统、“一鑫教育”英语在线学习系统等项目。在项目的开发过程中，我们也深深的认识到团队发展中分工、合作及设计模式等方面的不足，并不断的在新技术、新模式领域进行探索。二个评论', 'A122', '21', 'jfslf@qq.com', '0', '0', '1');
INSERT INTO `tutelib_comment` VALUES ('4', 'fsf', '', '0', '', '1480149842', '1480149842', '2');
INSERT INTO `tutelib_comment` VALUES ('5', 'fds', 'A123', '0', '', '1480152228', '1480152228', '0');
INSERT INTO `tutelib_comment` VALUES ('7', '消防是猪', 'A123', '0', '', '1480152737', '1480152737', '1');
INSERT INTO `tutelib_comment` VALUES ('8', '范德萨发的', 'A123', '0', '', '1480162176', '1480162176', '1');
INSERT INTO `tutelib_comment` VALUES ('9', '法师打发第三方士大夫', 'A123', '0', '', '1480162190', '1480162190', '3');

-- ----------------------------
-- Table structure for tutelib_component
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_component`;
CREATE TABLE `tutelib_component` (
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '类名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组件（类型）表';

-- ----------------------------
-- Records of tutelib_component
-- ----------------------------
INSERT INTO `tutelib_component` VALUES ('Home', '首页', '用于显示首页', 'panjie', '1.0.0', '0');
INSERT INTO `tutelib_component` VALUES ('ContentList', '新闻列表', '新闻列表页，显示新闻列表及展示新闻详情', 'panjie', '1.0.0', '0');
INSERT INTO `tutelib_component` VALUES ('Content', '新闻', '显示一篇新闻', '', '', '0');
INSERT INTO `tutelib_component` VALUES ('Login', '登陆注销', '用于用户的登陆与注销', 'mengyunzhi', '1.0.0', '0');
INSERT INTO `tutelib_component` VALUES ('User', '用户管理', '网站编辑对网站的管理', 'panjie', '1.0.0', '0');
INSERT INTO `tutelib_component` VALUES ('1', '1', '1', '1', '1', '0');
INSERT INTO `tutelib_component` VALUES ('Course', '课表管理', '用于课表的管理', 'chuhang', '1.0.0', '0');
INSERT INTO `tutelib_component` VALUES ('FeedBack', '故障反馈', '用于故障的反馈', 'chuhang', '1.0.0', '0');
INSERT INTO `tutelib_component` VALUES ('Curriculum', '课表信息', '用于站点编辑人员对站点的编辑', 'chuhang', '1.0.0', '0');

-- ----------------------------
-- Table structure for tutelib_content
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_content`;
CREATE TABLE `tutelib_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'FK 用户名',
  `content_type_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'FK 类别名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0',
  `update_time` int(5) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(5) unsigned NOT NULL DEFAULT '0',
  `is_freezed` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否冻结',
  `weight` smallint(6) NOT NULL,
  `hit` int(11) NOT NULL,
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_name` (`content_type_name`) USING BTREE,
  KEY `is_freezed` (`is_freezed`) USING BTREE,
  KEY `is_deleted` (`is_delete`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=680 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of tutelib_content
-- ----------------------------
INSERT INTO `tutelib_content` VALUES ('1', '', 'news', '这是一条新闻11', '1232323111', '1480161850', '0', '0', '0', '578', '1');
INSERT INTO `tutelib_content` VALUES ('2', '', 'news', '这是另一条新闻sklj', '1232323111', '1480162946', '0', '0', '0', '190', '1');
INSERT INTO `tutelib_content` VALUES ('4', '', 'news', '第五届全国高校体谈11', '0', '1482287856', '0', '0', '0', '296', '0');
INSERT INTO `tutelib_content` VALUES ('5', '', 'news', '学院的最新动态', '0', '1482285256', '0', '0', '0', '282', '1');
INSERT INTO `tutelib_content` VALUES ('6', '', 'news', '学生会举办茶话会发广告', '0', '1482285261', '0', '0', '0', '286', '1');
INSERT INTO `tutelib_content` VALUES ('7', '', 'news', '学生会举办茶话会规定', '0', '1482285265', '0', '0', '0', '284', '1');
INSERT INTO `tutelib_content` VALUES ('8', '', 'news', '学生会举办茶话会学生会举办茶话会学生会举办茶话会学生会举办茶话会学生会举办茶话会学生会举办茶话会学生会举办茶话会学生会举办茶话会学生会举办茶话会', '0', '1482285270', '0', '0', '0', '78', '1');
INSERT INTO `tutelib_content` VALUES ('9', '', 'inductive', '这是一个操作说明', '0', '1479827862', '0', '0', '0', '158', '1');
INSERT INTO `tutelib_content` VALUES ('10', '', 'inductive', '这是一个标题长的操作说明', '0', '1482232275', '0', '0', '0', '98', '0');
INSERT INTO `tutelib_content` VALUES ('11', '', 'inductive', '这这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明', '0', '1482289482', '0', '0', '0', '50', '0');
INSERT INTO `tutelib_content` VALUES ('12', '', 'inductive', '这是一个标题长的操作说明', '0', '1479827893', '0', '0', '0', '791', '1');
INSERT INTO `tutelib_content` VALUES ('13', '', 'inductive', '这是一个标题长的操作说明', '0', '1479825901', '0', '0', '0', '78979', '1');
INSERT INTO `tutelib_content` VALUES ('14', '', 'inductive', '这是一个标题长的操作说明', '0', '1479859498', '0', '0', '0', '7899', '1');
INSERT INTO `tutelib_content` VALUES ('15', '', 'inductive', '这是一个标题长的操作说明', '0', '1479828643', '0', '0', '0', '89', '1');
INSERT INTO `tutelib_content` VALUES ('16', '', 'inductive', '这是一个操作说明', '0', '1482289518', '0', '0', '0', '114', '0');
INSERT INTO `tutelib_content` VALUES ('303', '', 'inductive', '这是一个标题长的操作说明', '1479864777', '1482289480', '0', '0', '0', '100', '0');
INSERT INTO `tutelib_content` VALUES ('304', '', 'inductive', '这是一个标题长的操作说明', '1479864801', '1480169631', '0', '0', '0', '3', '1');
INSERT INTO `tutelib_content` VALUES ('305', '', 'inductive', '这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明', '1479864813', '1480169344', '0', '0', '0', '1', '1');
INSERT INTO `tutelib_content` VALUES ('306', '', 'inductive', '这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明', '1479864824', '1480169358', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('307', '', 'inductive', '这是一个标题长的操作说明这是一个标题长的操作说明', '1479864833', '1480169181', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('456', '', '', '', '1480172666', '1480172666', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('308', '', 'inductive', '这是一个标题长的操作说明这是一个标题长的操作说明', '1479864845', '1480169108', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('309', '', 'inductive', '这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明', '1479864854', '1480169242', '0', '0', '0', '1', '1');
INSERT INTO `tutelib_content` VALUES ('302', '', 'inductive', '这是一个文章标题文章吧i', '1479864694', '1479864708', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('314', '', 'news', '这是一个很长的标题', '1479911187', '1480169682', '0', '0', '0', '2', '1');
INSERT INTO `tutelib_content` VALUES ('315', '', 'news', '这是一个很长的标题', '1479911203', '1480169233', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('316', '', 'course', '物流管理 第二教学楼203 赵丽华 1-16周（两学时）', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('320', '', '', '', '1480162032', '1480162032', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('318', '', 'classroom', 'A123', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('319', '', 'classroom', 'A702', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('321', '', '', '', '1480162168', '1480162168', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('322', '', '', '', '1480162168', '1480162168', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('323', '', '', '', '1480162179', '1480162179', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('324', '', '', '', '1480162179', '1480162179', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('325', '', '', '', '1480162185', '1480162185', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('326', '', '', '', '1480162185', '1480162185', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('327', '', '', '', '1480162193', '1480162193', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('328', '', '', '', '1480162194', '1480162194', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('329', '', '', '', '1480162219', '1480162219', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('330', '', '', '', '1480162219', '1480162219', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('331', '', '', '', '1480162253', '1480162253', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('332', '', '', '', '1480162254', '1480162254', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('333', '', '', '', '1480162263', '1480162263', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('334', '', '', '', '1480162263', '1480162263', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('335', '', '', '', '1480162271', '1480162271', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('336', '', '', '', '1480162878', '1480162878', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('337', '', '', '', '1480162878', '1480162878', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('338', '', '', '', '1480162894', '1480162894', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('339', '', '', '', '1480162895', '1480162895', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('340', '', '', '', '1480162972', '1480162972', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('341', '', '', '', '1480162972', '1480162972', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('342', '', '', '', '1480163262', '1480163262', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('343', '', '', '', '1480163262', '1480163262', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('344', '', '', '', '1480163280', '1480163280', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('345', '', '', '', '1480163281', '1480163281', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('346', '', '', '', '1480163388', '1480163388', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('347', '', '', '', '1480163425', '1480163425', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('348', '', '', '', '1480163441', '1480163441', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('349', '', '', '', '1480163642', '1480163642', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('350', '', '', '', '1480163677', '1480163677', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('351', '', '', '', '1480163954', '1480163954', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('352', '', '', '', '1480163965', '1480163965', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('353', '', '', '', '1480163965', '1480163965', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('354', '', '', '', '1480163970', '1480163970', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('355', '', '', '', '1480163971', '1480163971', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('356', '', '', '', '1480164003', '1480164003', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('357', '', '', '', '1480164017', '1480164017', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('358', '', '', '', '1480164024', '1480164024', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('359', '', '', '', '1480164024', '1480164024', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('360', '', '', '', '1480164030', '1480164030', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('361', '', '', '', '1480164031', '1480164031', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('362', '', '', '', '1480164134', '1480164134', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('363', '', '', '', '1480164152', '1480164152', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('364', '', '', '', '1480164152', '1480164152', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('365', '', '', '', '1480164158', '1480164158', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('366', '', '', '', '1480164158', '1480164158', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('367', '', '', '', '1480168093', '1480168093', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('368', '', '', '', '1480168094', '1480168094', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('369', '', '', '', '1480168099', '1480168099', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('370', '', '', '', '1480168100', '1480168100', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('371', '', '', '', '1480168166', '1480168166', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('372', '', '', '', '1480168204', '1480168204', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('373', '', '', '', '1480168204', '1480168204', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('374', '', '', '', '1480168208', '1480168208', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('375', '', '', '', '1480168208', '1480168208', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('376', '', '', '', '1480168348', '1480168348', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('377', '', '', '', '1480168349', '1480168349', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('378', '', '', '', '1480168366', '1480168366', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('379', '', '', '', '1480168366', '1480168366', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('380', '', '', '', '1480168431', '1480168431', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('381', '', '', '', '1480168431', '1480168431', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('382', '', '', '', '1480168452', '1480168452', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('383', '', '', '', '1480168452', '1480168452', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('384', '', '', '', '1480168475', '1480168475', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('385', '', '', '', '1480168475', '1480168475', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('386', '', '', '', '1480168479', '1480168479', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('387', '', '', '', '1480168480', '1480168480', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('388', '', '', '', '1480168483', '1480168483', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('389', '', '', '', '1480168484', '1480168484', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('390', '', '', '', '1480168496', '1480168496', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('391', '', '', '', '1480168497', '1480168497', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('392', '', '', '', '1480168611', '1480168611', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('393', '', '', '', '1480168623', '1480168623', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('394', '', '', '', '1480168625', '1480168625', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('395', '', '', '', '1480168632', '1480168632', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('396', '', '', '', '1480168633', '1480168633', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('397', '', '', '', '1480168667', '1480168667', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('398', '', '', '', '1480168668', '1480168668', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('399', '', '', '', '1480168671', '1480168671', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('400', '', '', '', '1480168672', '1480168672', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('401', '', '', '', '1480168692', '1480168692', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('402', '', '', '', '1480168692', '1480168692', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('403', '', '', '', '1480168696', '1480168696', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('404', '', '', '', '1480168697', '1480168697', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('405', '', '', '', '1480168873', '1480168873', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('406', '', '', '', '1480168873', '1480168873', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('407', '', '', '', '1480168880', '1480168880', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('408', '', '', '', '1480168880', '1480168880', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('409', '', '', '', '1480168887', '1480168887', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('410', '', '', '', '1480168888', '1480168888', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('411', '', '', '', '1480168922', '1480168922', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('412', '', '', '', '1480168922', '1480168922', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('413', '', '', '', '1480169084', '1480169084', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('414', '', '', '', '1480169084', '1480169084', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('415', '', '', '', '1480171106', '1480171106', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('416', '', '', '', '1480171106', '1480171106', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('417', '', '', '', '1480172061', '1480172061', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('418', '', '', '', '1480172063', '1480172063', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('419', '', '', '', '1480172065', '1480172065', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('420', '', '', '', '1480172066', '1480172066', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('421', '', '', '', '1480172067', '1480172067', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('422', '', '', '', '1480172069', '1480172069', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('423', '', '', '', '1480172071', '1480172071', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('424', '', '', '', '1480172072', '1480172072', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('425', '', '', '', '1480172074', '1480172074', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('426', '', '', '', '1480172099', '1480172099', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('427', '', '', '', '1480172102', '1480172102', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('428', '', '', '', '1480172105', '1480172105', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('429', '', '', '', '1480172108', '1480172108', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('430', '', '', '', '1480172247', '1480172247', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('431', '', '', '', '1480172256', '1480172256', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('432', '', '', '', '1480172277', '1480172277', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('433', '', '', '', '1480172334', '1480172334', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('434', '', '', '', '1480172376', '1480172376', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('435', '', '', '', '1480172408', '1480172408', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('436', '', '', '', '1480172410', '1480172410', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('437', '', '', '', '1480172411', '1480172411', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('438', '', '', '', '1480172467', '1480172467', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('439', '', '', '', '1480172473', '1480172473', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('440', '', '', '', '1480172524', '1480172524', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('441', '', '', '', '1480172526', '1480172526', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('442', '', '', '', '1480172528', '1480172528', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('443', '', '', '', '1480172561', '1480172561', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('444', '', '', '', '1480172563', '1480172563', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('445', '', '', '', '1480172564', '1480172564', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('446', '', '', '', '1480172565', '1480172565', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('447', '', '', '', '1480172612', '1480172612', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('448', '', '', '', '1480172614', '1480172614', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('449', '', '', '', '1480172616', '1480172616', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('450', '', '', '', '1480172618', '1480172618', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('451', '', '', '', '1480172619', '1480172619', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('452', '', '', '', '1480172637', '1480172637', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('453', '', '', '', '1480172639', '1480172639', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('454', '', '', '', '1480172641', '1480172641', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('455', '', '', '', '1480172643', '1480172643', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('457', '', '', '', '1480172669', '1480172669', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('458', '', '', '', '1480172671', '1480172671', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('459', '', '', '', '1480172672', '1480172672', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('460', '', '', '', '1480172677', '1480172677', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('461', '', '', '', '1480172681', '1480172681', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('462', '', '', '', '1480172682', '1480172682', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('463', '', '', '', '1480172684', '1480172684', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('464', '', '', '', '1480172805', '1480172805', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('465', '', '', '', '1480172806', '1480172806', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('466', '', '', '', '1480172820', '1480172820', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('467', '', '', '', '1480291961', '1480291961', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('468', '', '', '', '1480292803', '1480292803', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('469', '', '', '', '1480295388', '1480295388', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('470', '', '', '', '1480295417', '1480295417', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('471', '', '', '', '1480295527', '1480295527', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('472', '', '', '', '1480295536', '1480295536', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('473', '', '', '', '1480295545', '1480295545', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('474', '', '', '', '1480295708', '1480295708', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('475', '', '', '', '1480295708', '1480295708', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('476', '', '', '', '1480295711', '1480295711', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('477', '', '', '', '1480295739', '1480295739', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('478', '', '', '', '1480295939', '1480295939', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('479', '', '', '', '1480295948', '1480295948', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('480', '', '', '', '1480295961', '1480295961', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('481', '', '', '', '1480318147', '1480318147', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('482', '', '', '', '1480319332', '1480319332', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('483', '', '', '', '1480319378', '1480319378', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('484', '', '', '', '1480319393', '1480319393', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('485', '', '', '', '1480320215', '1480320215', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('486', '', '', '', '1480320476', '1480320476', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('487', '', '', '', '1480321751', '1480321751', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('488', '', '', '', '1480321842', '1480321842', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('489', '', '', '', '1480344350', '1480344350', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('490', '', '', '', '1480344362', '1480344362', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('491', '', '', '', '1480403174', '1480403174', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('492', '', '', '', '1480404720', '1480404720', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('493', '', '', '', '1480414993', '1480414993', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('494', '', '', '', '1480426592', '1480426592', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('495', '', '', '', '1480426894', '1480426894', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('496', '', '', '', '1480426969', '1480426969', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('497', '', '', '', '1480427020', '1480427020', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('498', '', '', '', '1480427477', '1480427477', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('499', '', '', '', '1480427488', '1480427488', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('500', '', '', '', '1480427508', '1480427508', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('501', '', '', '', '1480428367', '1480428367', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('502', '', '', '', '1480428539', '1480428539', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('503', '', '', '', '1480429002', '1480429002', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('504', '', '', '', '1480429021', '1480429021', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('505', '', '', '', '1480429064', '1480429064', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('506', '', '', '', '1480429078', '1480429078', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('507', '', '', '', '1480429100', '1480429100', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('508', '', '', '', '1480429115', '1480429115', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('509', '', '', '', '1480429139', '1480429139', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('510', '', '', '', '1480429166', '1480429166', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('511', '', '', '', '1480429183', '1480429183', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('512', '', '', '', '1480429197', '1480429197', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('513', '', '', '', '1480432146', '1480432146', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('514', '', '', '', '1480432172', '1480432172', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('515', '', '', '', '1480432198', '1480432198', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('516', '', '', '', '1480432206', '1480432206', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('517', '', '', '', '1480432207', '1480432207', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('518', '', '', '', '1480571613', '1480571613', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('519', '', '', '', '1480571768', '1480571768', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('520', '', '', '', '1480571799', '1480571799', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('521', '', '', '', '1480571804', '1480571804', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('522', '', '', '', '1480571834', '1480571834', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('523', '', '', '', '1480571938', '1480571938', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('524', '', '', '', '1480574311', '1480574311', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('525', '', '', '', '1480574311', '1480574311', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('526', '', '', '', '1480574400', '1480574400', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('527', '', '', '', '1480575918', '1480575918', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('528', '', '', '', '1480666130', '1480666130', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('529', '', '', '', '1480666151', '1480666151', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('530', '', '', '', '1481640670', '1481640670', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('531', '', '', '', '1481640677', '1481640677', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('532', '', '', '', '1481640678', '1481640678', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('533', '', '', '', '1481640680', '1481640680', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('534', '', '', '', '1481640681', '1481640681', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('535', '', '', '', '1481640811', '1481640811', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('536', '', '', '', '1481640828', '1481640828', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('537', '', '', '', '1481703635', '1481703635', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('538', '', '', '', '1481703639', '1481703639', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('539', '', '', '', '1481703690', '1481703690', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('540', '', '', '', '1481703759', '1481703759', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('541', '', '', '', '1481703894', '1481703894', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('542', '', '', '', '1481704329', '1481704329', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('543', '', '', '', '1481711170', '1481711170', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('544', '', '', '', '1481711738', '1481711738', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('545', '', '', '', '1481712021', '1481712021', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('546', '', '', '', '1481712036', '1481712036', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('547', '', '', '', '1481712304', '1481712304', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('548', '', '', '', '1481712591', '1481712591', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('549', '', '', '', '1481712660', '1481712660', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('550', '', '', '', '1481712874', '1481712874', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('551', '', '', '', '1481713030', '1481713030', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('552', '', '', '', '1481713036', '1481713036', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('553', '', '', '', '1481713472', '1481713472', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('554', '', '', '', '1481716106', '1481716106', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('555', '', '', '', '1481716144', '1481716144', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('556', '', '', '', '1481716636', '1481716636', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('557', '', '', '', '1481716791', '1481716791', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('558', '', '', '', '1482067575', '1482067575', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('559', '', '', '', '1482067700', '1482067700', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('560', '', '', '', '1482068306', '1482068306', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('561', '', '', '', '1482068325', '1482068325', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('562', '', '', '', '1482068339', '1482068339', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('563', '', '', '', '1482068951', '1482068951', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('564', '', '', '', '1482069628', '1482069628', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('565', '', '', '', '1482071253', '1482071253', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('566', '', '', '', '1482071354', '1482071354', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('567', '', '', '', '1482071414', '1482071414', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('568', '', '', '', '1482071437', '1482071437', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('569', '', '', '', '1482071544', '1482071544', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('570', '', '', '', '1482071620', '1482071620', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('571', '', '', '', '1482071642', '1482071642', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('572', '', '', '', '1482071648', '1482071648', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('573', '', '', '', '1482071657', '1482071657', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('574', '', '', '', '1482071826', '1482071826', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('575', '', '', '', '1482071882', '1482071882', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('576', '', '', '', '1482072100', '1482072100', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('577', '', '', '', '1482072224', '1482072224', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('578', '', '', '', '1482072229', '1482072229', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('579', '', '', '', '1482072236', '1482072236', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('580', '', '', '', '1482072322', '1482072322', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('581', '', '', '', '1482072326', '1482072326', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('582', '', '', '', '1482072534', '1482072534', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('583', '', '', '', '1482072819', '1482072819', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('584', '', '', '', '1482072839', '1482072839', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('585', '', '', '', '1482072878', '1482072878', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('586', '', '', '', '1482073164', '1482073164', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('587', '', '', '', '1482073177', '1482073177', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('588', '', '', '', '1482073269', '1482073269', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('589', '', '', '', '1482073454', '1482073454', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('590', '', '', '', '1482156509', '1482156509', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('591', '', '', '', '1482156655', '1482156655', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('592', '', '', '', '1482156754', '1482156754', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('593', '', '', '', '1482156769', '1482156769', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('594', '', '', '', '1482156797', '1482156797', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('595', '', '', '', '1482156821', '1482156821', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('596', '', '', '', '1482156856', '1482156856', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('597', '', '', '', '1482156886', '1482156886', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('598', '', '', '', '1482156907', '1482156907', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('599', '', '', '', '1482157068', '1482157068', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('600', '', '', '', '1482157174', '1482157174', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('601', '', '', '', '1482157182', '1482157182', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('602', '', '', '', '1482157239', '1482157239', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('603', '', '', '', '1482157677', '1482157677', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('604', '', '', '', '1482157882', '1482157882', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('605', '', '', '', '1482157896', '1482157896', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('606', '', '', '', '1482158339', '1482158339', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('607', '', '', '', '1482158366', '1482158366', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('608', '', '', '', '1482158457', '1482158457', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('609', '', '', '', '1482158576', '1482158576', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('610', '', '', '', '1482158762', '1482158762', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('611', '', '', '', '1482158951', '1482158951', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('612', '', '', '', '1482158952', '1482158952', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('613', '', '', '', '1482159133', '1482159133', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('614', '', '', '', '1482159330', '1482159330', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('615', '', '', '', '1482159331', '1482159331', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('616', '', '', '', '1482159341', '1482159341', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('617', '', '', '', '1482159474', '1482159474', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('618', '', '', '', '1482160378', '1482160378', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('619', '', '', '', '1482160404', '1482160404', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('620', '', '', '', '1482160450', '1482160450', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('621', '', '', '', '1482160574', '1482160574', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('622', '', '', '', '1482227664', '1482227664', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('623', '', '', '', '1482227712', '1482227712', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('624', '', '', '', '1482227719', '1482227719', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('625', '', '', '', '1482227758', '1482227758', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('626', '', '', '', '1482227770', '1482227770', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('627', '', '', '', '1482227781', '1482227781', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('628', '', '', '', '1482227796', '1482227796', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('629', '', '', '', '1482227834', '1482227834', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('630', '', '', '', '1482227873', '1482227873', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('631', '', '', '', '1482228029', '1482228029', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('632', '', '', '', '1482228067', '1482228067', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('633', '', '', '', '1482228412', '1482228412', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('634', '', '', '', '1482228531', '1482228531', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('635', '', '', '', '1482228695', '1482228695', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('636', '', '', '', '1482228728', '1482228728', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('637', '', '', '', '1482228772', '1482228772', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('638', '', '', '', '1482228808', '1482228808', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('639', '', '', '', '1482228872', '1482228872', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('640', '', '', '', '1482228935', '1482228935', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('641', '', '', '', '1482229482', '1482229482', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('642', '', '', '', '1482229526', '1482229526', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('643', '', '', '', '1482229545', '1482229545', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('644', '', '', '', '1482229570', '1482229570', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('645', '', '', '', '1482229578', '1482229578', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('646', '', '', '', '1482229581', '1482229581', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('647', '', '', '', '1482229584', '1482229584', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('648', '', '', '', '1482229620', '1482229620', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('649', '', '', '', '1482229623', '1482229623', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('650', '', '', '', '1482229625', '1482229625', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('651', '', '', '', '1482229628', '1482229628', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('652', '', '', '', '1482229629', '1482229629', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('653', '', '', '', '1482229668', '1482229668', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('654', '', '', '', '1482229689', '1482229689', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('655', '', '', '', '1482229694', '1482229694', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('656', '', '', '', '1482229696', '1482229696', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('657', '', '', '', '1482229714', '1482229714', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('658', '', '', '', '1482229735', '1482229735', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('659', '', '', '', '1482229746', '1482229746', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('660', '', '', '', '1482230508', '1482230508', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('661', '', '', '', '1482284294', '1482284294', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('662', '', '', '', '1482284298', '1482284298', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('663', '', '', '', '1482284306', '1482284306', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('664', '', '', '', '1482284314', '1482284314', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('665', '', 'news', '这是一个长的新闻标题', '1482285280', '1482287876', '0', '0', '0', '5', '0');
INSERT INTO `tutelib_content` VALUES ('666', '', 'news', '', '1482285402', '1482285433', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('667', '', 'news', '这是一个新闻1', '1482285623', '1482287760', '0', '0', '0', '7', '0');
INSERT INTO `tutelib_content` VALUES ('668', '', 'news', '这是一个长的新闻标题', '1482285698', '1482288231', '0', '0', '0', '2', '0');
INSERT INTO `tutelib_content` VALUES ('669', '', 'inductive', '这是一个操作说明', '1482287905', '1482289520', '0', '0', '0', '3', '0');
INSERT INTO `tutelib_content` VALUES ('670', '', 'inductive', '这是一个操作说明', '1482287961', '1482289521', '0', '0', '0', '2', '0');
INSERT INTO `tutelib_content` VALUES ('671', '', 'inductive', '这是一个操作说明', '1482287972', '1482289485', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('672', '', 'news', '这是一个长的新闻标题', '1482288250', '1482288250', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('673', '', 'news', '这是一个长的新闻标题', '1482288278', '1482289285', '0', '0', '0', '0', '1');
INSERT INTO `tutelib_content` VALUES ('674', '', 'news', '这是一个长的新闻标题', '1482288292', '1482288292', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('675', '', 'inductive', '这是一个操作说明v', '1482289330', '1482289477', '0', '0', '0', '1', '0');
INSERT INTO `tutelib_content` VALUES ('676', '', 'news', '这是一个新闻标题', '1482289364', '1482289364', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('677', '', 'news', '这是一个新闻标题', '1482289374', '1482289374', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('678', '', 'news', '这是一个新闻标题这是一个新闻标题', '1482289418', '1482289418', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_content` VALUES ('679', '', 'inductive', '这是一个操作说明', '1482289446', '1482289475', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for tutelib_content_frontpage
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_content_frontpage`;
CREATE TABLE `tutelib_content_frontpage` (
  `content_id` int(11) NOT NULL,
  `weight` smallint(6) unsigned NOT NULL COMMENT '0',
  `create_time` int(5) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页文章表';

-- ----------------------------
-- Records of tutelib_content_frontpage
-- ----------------------------
INSERT INTO `tutelib_content_frontpage` VALUES ('672', '0', '1482288250', '1482288250');
INSERT INTO `tutelib_content_frontpage` VALUES ('4', '0', '0', '0');
INSERT INTO `tutelib_content_frontpage` VALUES ('668', '0', '1482285698', '1482285698');
INSERT INTO `tutelib_content_frontpage` VALUES ('667', '0', '1482285623', '1482285623');
INSERT INTO `tutelib_content_frontpage` VALUES ('665', '0', '1482285280', '1482285280');
INSERT INTO `tutelib_content_frontpage` VALUES ('669', '0', '1482287905', '1482287905');
INSERT INTO `tutelib_content_frontpage` VALUES ('670', '0', '1482287961', '1482287961');
INSERT INTO `tutelib_content_frontpage` VALUES ('671', '0', '1482287972', '1482287972');
INSERT INTO `tutelib_content_frontpage` VALUES ('675', '0', '1482289330', '1482289330');
INSERT INTO `tutelib_content_frontpage` VALUES ('674', '0', '1482288292', '1482288292');
INSERT INTO `tutelib_content_frontpage` VALUES ('676', '0', '1482289364', '1482289364');
INSERT INTO `tutelib_content_frontpage` VALUES ('677', '0', '1482289374', '1482289374');
INSERT INTO `tutelib_content_frontpage` VALUES ('678', '0', '1482289418', '1482289418');
INSERT INTO `tutelib_content_frontpage` VALUES ('679', '0', '1482289446', '1482289446');

-- ----------------------------
-- Table structure for tutelib_content_type
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_content_type`;
CREATE TABLE `tutelib_content_type` (
  `name` varchar(40) NOT NULL,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk 菜单。用于被区块调用后，生成LCURD的信息。',
  `pname` varchar(40) NOT NULL COMMENT '上级name',
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '描述',
  `weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '权重',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `fileds` varchar(255) NOT NULL DEFAULT '[]' COMMENT '字段',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='类别(文章类型)表';

-- ----------------------------
-- Records of tutelib_content_type
-- ----------------------------
INSERT INTO `tutelib_content_type` VALUES ('news', '2', '', '新闻通知', '新闻通知', '0', '0', '[]', '0', '0', '0');
INSERT INTO `tutelib_content_type` VALUES ('feedback', '7', '', '故障反馈', '故障的反馈', '0', '0', '[]', '0', '0', '0');
INSERT INTO `tutelib_content_type` VALUES ('inductive', '11', '', '操作说明', '操作说明的介绍', '0', '0', '[]', '0', '1479803709', '0');
INSERT INTO `tutelib_content_type` VALUES ('course', '3', '', '课表', '课表的管理', '0', '0', '[]', '0', '0', '0');
INSERT INTO `tutelib_content_type` VALUES ('classroom', '7', '', '教室', '教师序号', '0', '0', '[]', '0', '0', '0');
INSERT INTO `tutelib_content_type` VALUES ('fds', '1', '', 'fd', 'fds', '0', '0', '[]', '0', '1481023967', '1481023967');

-- ----------------------------
-- Table structure for tutelib_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_feedback`;
CREATE TABLE `tutelib_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `classroom` varchar(30) NOT NULL,
  `number` int(11) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `hit` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_feedback
-- ----------------------------
INSERT INTO `tutelib_feedback` VALUES ('1', '这是一个故障反馈', 'A12', '21', '0', '0', '0', '');
INSERT INTO `tutelib_feedback` VALUES ('5', '防守打法', 'A123', '12', '1480161739', '1480161739', '0', 'fds@qq');
INSERT INTO `tutelib_feedback` VALUES ('14', 'fdsf', 'A123', '0', '1480168169', '1480168169', '0', '');
INSERT INTO `tutelib_feedback` VALUES ('15', 'fdsfs', 'A123', '0', '1480571827', '1480571827', '0', '');
INSERT INTO `tutelib_feedback` VALUES ('16', 'fsdf', 'A123', '0', '1480572416', '1480572416', '0', '');
INSERT INTO `tutelib_feedback` VALUES ('17', 'fsd', 'A123', '0', '1480572506', '1480572506', '0', '');

-- ----------------------------
-- Table structure for tutelib_field
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field`;
CREATE TABLE `tutelib_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '机读字段',
  `field_type_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk filed',
  `relate_type` varchar(40) NOT NULL DEFAULT '' COMMENT '关联的实体类型',
  `relate_value` varchar(40) NOT NULL DEFAULT '' COMMENT '关联实体类型的具体值',
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '后台 编辑 添加 时显示的信息',
  `weight` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `config` varchar(4096) NOT NULL DEFAULT '[]' COMMENT '字段配置信息 json',
  `filter` varchar(4096) NOT NULL DEFAULT '[]' COMMENT '过滤器，用于前台的输出. 使用字段与实体类型绑定的方法实现过滤器后的输出',
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE,
  KEY `relate_type` (`relate_type`) USING BTREE,
  KEY `relate_value` (`relate_value`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字段表 各个实体与字段的对应关系写在这里';

-- ----------------------------
-- Records of tutelib_field
-- ----------------------------
INSERT INTO `tutelib_field` VALUES ('1', 'body', 'body', 'Content', 'news', '内容', '0', '[]', '{\"type\":\"System\",\"function\":\"htmlspecialchars_decode\",\"param\":{\"length\":\"6\",\"ext\":\"...\"}}', '0', '0');
INSERT INTO `tutelib_field` VALUES ('2', 'image', 'image', 'Content', 'news', '新闻图片', '1', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('3', 'body', 'body', 'Content', 'products', '新闻内容', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('4', 'titles', 'json', 'Block', 'Slider', '标题', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('6', 'urls', 'json', 'Block', 'Slider', '链接地址', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('5', 'images', 'images', 'Block', 'Slider', '图片链接', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('7', 'headers', 'json', 'Block', 'Slider', '副标题', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('8', 'descriptions', 'json', 'Block', 'Slider', '描述信息', '0', '{\"type\":\"textarea\"}', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('9', 'icon', 'text', 'Menu', 'main', '小图标', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('10', 'body', 'body', 'Content', 'inductive', '内容', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('11', 'body', 'body', 'Content', 'course', '课表', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('12', 'body', 'body', 'Content', 'feedback', '故障反馈', '0', '[]', '[]', '0', '0');
INSERT INTO `tutelib_field` VALUES ('13', 'image', 'image', 'Content', 'inductive', '图片', '1', '[]', '[]', '0', '0');

-- ----------------------------
-- Table structure for tutelib_field_config
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_config`;
CREATE TABLE `tutelib_field_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk filed',
  `type` varchar(40) NOT NULL DEFAULT '' COMMENT '绑定的实体类型',
  `value` varchar(40) NOT NULL DEFAULT '' COMMENT '绑定实体类型的具体值',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0启用 1禁用',
  `is_one` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否唯一. 1: 1对1 ；2：1对多',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='字段配置表（各个实体的扩展字段配置）';

-- ----------------------------
-- Records of tutelib_field_config
-- ----------------------------
INSERT INTO `tutelib_field_config` VALUES ('1', 'body', 'Content', 'news', '0', '1');
INSERT INTO `tutelib_field_config` VALUES ('2', 'field_image', 'Content', 'news', '0', '1');
INSERT INTO `tutelib_field_config` VALUES ('3', 'body', 'Content', 'products', '0', '1');
INSERT INTO `tutelib_field_config` VALUES ('4', 'field_image', 'Content', 'inductive', '0', '1');

-- ----------------------------
-- Table structure for tutelib_field_data_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_attachment`;
CREATE TABLE `tutelib_field_data_attachment` (
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
  KEY `field_id` (`field_id`) USING BTREE,
  KEY `key_id` (`key_id`) USING BTREE,
  KEY `sha1` (`sha1`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of tutelib_field_data_attachment
-- ----------------------------
INSERT INTO `tutelib_field_data_attachment` VALUES ('49', '0', '0', '', '3.jpg', '20160926/5f83ec7d5b66e78f7d47603bbcb5b7b2.jpg', 'jpg', '37f43a9f43a06c1da330b4f19e67155cdcbb8c5c', '58c61881873640a1f7daca1e6850cc1f', '640535', 'image/jpeg', '1474874743', '1474874743');
INSERT INTO `tutelib_field_data_attachment` VALUES ('50', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474874847', '1474874847');
INSERT INTO `tutelib_field_data_attachment` VALUES ('51', '0', '0', '', '3.jpg', '20160926/5f83ec7d5b66e78f7d47603bbcb5b7b2.jpg', 'jpg', '37f43a9f43a06c1da330b4f19e67155cdcbb8c5c', '58c61881873640a1f7daca1e6850cc1f', '640535', 'image/jpeg', '1474876630', '1474876630');
INSERT INTO `tutelib_field_data_attachment` VALUES ('52', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474876739', '1474876739');
INSERT INTO `tutelib_field_data_attachment` VALUES ('53', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474876961', '1474876961');
INSERT INTO `tutelib_field_data_attachment` VALUES ('54', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474877013', '1474877013');
INSERT INTO `tutelib_field_data_attachment` VALUES ('55', '0', '0', '', '88-20151030101118.jpg', '20160926/e56564656cc0276320362cb3ddca32a1.jpg', 'jpg', 'cca18b443fe9a6be89f9fecbd858e48767863b89', '54fe7a710948136957ae5552fa9d3d45', '75156', 'image/jpeg', '1474877065', '1474877065');
INSERT INTO `tutelib_field_data_attachment` VALUES ('56', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474877128', '1474877128');
INSERT INTO `tutelib_field_data_attachment` VALUES ('57', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474877156', '1474877156');
INSERT INTO `tutelib_field_data_attachment` VALUES ('58', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474936956', '1474936956');
INSERT INTO `tutelib_field_data_attachment` VALUES ('59', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474937080', '1474937080');
INSERT INTO `tutelib_field_data_attachment` VALUES ('60', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474937239', '1474937239');
INSERT INTO `tutelib_field_data_attachment` VALUES ('61', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474937325', '1474937325');
INSERT INTO `tutelib_field_data_attachment` VALUES ('62', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474937733', '1474937733');
INSERT INTO `tutelib_field_data_attachment` VALUES ('63', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474937810', '1474937810');
INSERT INTO `tutelib_field_data_attachment` VALUES ('64', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474937843', '1474937843');
INSERT INTO `tutelib_field_data_attachment` VALUES ('65', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474938004', '1474938004');
INSERT INTO `tutelib_field_data_attachment` VALUES ('66', '0', '0', '', '2016年8月行政值班表.doc', '20160926/2eaeeda274e0bc392bc398198fc1c3ea.doc', 'doc', '7fb926501cdfd81fb5bab5c3e009ba8a4fb397ad', '15338832888444e475300a92f2d4eee3', '112128', 'application/msword', '1474938019', '1474938019');
INSERT INTO `tutelib_field_data_attachment` VALUES ('67', '0', '0', '', '附件1：2015年度中管党费收支情况.pdf', '20160927/857583ff3054c0f223d015c480948c90.pdf', 'pdf', '1a56fe6661981cd2c3c91c3f25d71fb052120560', '931cf24dfcc29414450d1d3e59e6de01', '84433', 'application/pdf', '1474938025', '1474938025');
INSERT INTO `tutelib_field_data_attachment` VALUES ('68', '10', '1', '', '梦云智thinkphp入门教程02--VEIWS.ppt', '20160927/71570dd595d30dc376fca5e54f5bf455.ppt', 'ppt', 'b914cf8071a3cd2aca39363cd5cd14051b7f2d19', '8c5ca78c6e4c13f33ed277e880d43ef0', '198144', 'application/vnd.ms-powerpoint', '1474938044', '1478817365');
INSERT INTO `tutelib_field_data_attachment` VALUES ('69', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478210986', '1478210986');
INSERT INTO `tutelib_field_data_attachment` VALUES ('70', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478211093', '1478211093');
INSERT INTO `tutelib_field_data_attachment` VALUES ('71', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478220513', '1478220513');
INSERT INTO `tutelib_field_data_attachment` VALUES ('72', '0', '0', '', '查询1.PNG', '20161104\\4af3092a9f7eba5cfa32d91c723f05fc.PNG', 'png', '4c6f0850e64ac163d974218b37f5d2d3a8ba0fc4', 'fde424e56390d7aab4d8c5dc54f10fbd', '18423', 'image/png', '1478222782', '1478222782');
INSERT INTO `tutelib_field_data_attachment` VALUES ('73', '0', '0', '', '查询1.PNG', '20161104\\4af3092a9f7eba5cfa32d91c723f05fc.PNG', 'png', '4c6f0850e64ac163d974218b37f5d2d3a8ba0fc4', 'fde424e56390d7aab4d8c5dc54f10fbd', '18423', 'image/png', '1478222810', '1478222810');
INSERT INTO `tutelib_field_data_attachment` VALUES ('74', '0', '0', '', '查询1.PNG', '20161104\\4af3092a9f7eba5cfa32d91c723f05fc.PNG', 'png', '4c6f0850e64ac163d974218b37f5d2d3a8ba0fc4', 'fde424e56390d7aab4d8c5dc54f10fbd', '18423', 'image/png', '1478222851', '1478222851');
INSERT INTO `tutelib_field_data_attachment` VALUES ('75', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478223428', '1478223428');
INSERT INTO `tutelib_field_data_attachment` VALUES ('76', '0', '0', '', '查询1.PNG', '20161104\\4af3092a9f7eba5cfa32d91c723f05fc.PNG', 'png', '4c6f0850e64ac163d974218b37f5d2d3a8ba0fc4', 'fde424e56390d7aab4d8c5dc54f10fbd', '18423', 'image/png', '1478225223', '1478225223');
INSERT INTO `tutelib_field_data_attachment` VALUES ('77', '0', '0', '', '查询1.PNG', '20161104\\4af3092a9f7eba5cfa32d91c723f05fc.PNG', 'png', '4c6f0850e64ac163d974218b37f5d2d3a8ba0fc4', 'fde424e56390d7aab4d8c5dc54f10fbd', '18423', 'image/png', '1478225280', '1478225280');
INSERT INTO `tutelib_field_data_attachment` VALUES ('78', '0', '0', '', '查询1.PNG', '20161104\\4af3092a9f7eba5cfa32d91c723f05fc.PNG', 'png', '4c6f0850e64ac163d974218b37f5d2d3a8ba0fc4', 'fde424e56390d7aab4d8c5dc54f10fbd', '18423', 'image/png', '1478238231', '1478238231');
INSERT INTO `tutelib_field_data_attachment` VALUES ('79', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478238400', '1478238400');
INSERT INTO `tutelib_field_data_attachment` VALUES ('80', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478238473', '1478238473');
INSERT INTO `tutelib_field_data_attachment` VALUES ('81', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478238615', '1478238615');
INSERT INTO `tutelib_field_data_attachment` VALUES ('82', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478238644', '1478238644');
INSERT INTO `tutelib_field_data_attachment` VALUES ('83', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478239022', '1478239022');
INSERT INTO `tutelib_field_data_attachment` VALUES ('84', '0', '0', '', 'eq25.PNG', '20161104\\efe3f8a8ed68dcc472d3c70f312a2dcd.PNG', 'png', '6eb39c18ce9fb27478f548e190c28fddaf6373f3', '52b00974d0ec15e4a803832496a1c5ab', '39130', 'image/png', '1478239169', '1478239169');
INSERT INTO `tutelib_field_data_attachment` VALUES ('85', '0', '0', '', 'uploadify-cancel.png', '20161109\\afd9c7dd4e5596cc88f99cdcff89db51.png', 'png', 'd8b2741edca1e53a3e3ab49b972b8968ee30d259', 'e70bbd1cfdfe42ce9f566ba02f46ba3d', '11721', 'image/png', '1478649282', '1478649282');
INSERT INTO `tutelib_field_data_attachment` VALUES ('86', '0', '0', '', 'images.jpg', '20161109\\3b26e9cb5c4578dfa3c642e59fd9573f.jpg', 'jpg', '460964082f71e8d1d71c8111ac01fa0839a9ba1a', 'a41463825944f635ab0cf83a1fcb7931', '4315', 'image/jpeg', '1478650305', '1478650305');
INSERT INTO `tutelib_field_data_attachment` VALUES ('87', '0', '0', '', '201510141042001983.jpg', '20161109\\13f7892c4969f039d5183ee0265fc203.jpg', 'jpg', 'd6dd6f7ac04ca6727ba2d268a043abb02f66a7c5', '9acf7c31aaefab81f52edd23d044ffed', '612408', 'image/jpeg', '1478650314', '1478650314');
INSERT INTO `tutelib_field_data_attachment` VALUES ('88', '0', '0', '', '123.PNG', '20161111\\320124eb637f63f294b184d85f8cb917.PNG', 'png', '2ec58e977ca19268bf177320b3d9fe87bf3afe89', '3287d5c7cb0c19e7c795413ad56b3b40', '25758', 'image/png', '1478816426', '1478816426');
INSERT INTO `tutelib_field_data_attachment` VALUES ('89', '0', '0', '', '8026325182226953.jpg', '20161114\\f562c9f23847c2253c25611eb80b9adb.jpg', 'jpg', 'fc45704c12c8002d13073850b86b83c13decb608', '1598aed548010e1988e5f1693f4f4029', '212181', 'image/jpeg', '1479078243', '1479078243');
INSERT INTO `tutelib_field_data_attachment` VALUES ('90', '0', '0', '', '14336171397634978.jpg', '20161114\\034109c820e2dcda77efeb42e6665e2e.jpg', 'jpg', '33e3ed2e0031999c4f452a1d1850cd0526f98d5a', 'e044329f4943cccfe883e4e8f570c519', '1804225', 'image/png', '1479078273', '1479078273');
INSERT INTO `tutelib_field_data_attachment` VALUES ('91', '0', '0', '', '201510141042001983.jpg', '20161109\\13f7892c4969f039d5183ee0265fc203.jpg', 'jpg', 'd6dd6f7ac04ca6727ba2d268a043abb02f66a7c5', '9acf7c31aaefab81f52edd23d044ffed', '612408', 'image/jpeg', '1479078313', '1479078313');
INSERT INTO `tutelib_field_data_attachment` VALUES ('92', '0', '0', '', 'images.jpg', '20161109\\3b26e9cb5c4578dfa3c642e59fd9573f.jpg', 'jpg', '460964082f71e8d1d71c8111ac01fa0839a9ba1a', 'a41463825944f635ab0cf83a1fcb7931', '4315', 'image/jpeg', '1479078480', '1479078480');
INSERT INTO `tutelib_field_data_attachment` VALUES ('93', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405593', '1480405593');
INSERT INTO `tutelib_field_data_attachment` VALUES ('94', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405617', '1480405617');
INSERT INTO `tutelib_field_data_attachment` VALUES ('95', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405672', '1480405672');
INSERT INTO `tutelib_field_data_attachment` VALUES ('96', '0', '0', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1480405722', '1480405722');
INSERT INTO `tutelib_field_data_attachment` VALUES ('97', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405736', '1480405736');
INSERT INTO `tutelib_field_data_attachment` VALUES ('98', '0', '0', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1480405754', '1480405754');
INSERT INTO `tutelib_field_data_attachment` VALUES ('99', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405837', '1480405837');
INSERT INTO `tutelib_field_data_attachment` VALUES ('100', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405866', '1480405866');
INSERT INTO `tutelib_field_data_attachment` VALUES ('101', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1480405909', '1480405909');
INSERT INTO `tutelib_field_data_attachment` VALUES ('102', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480405976', '1480405976');
INSERT INTO `tutelib_field_data_attachment` VALUES ('103', '0', '0', '', 'Hydrangeas.jpg', '20161129\\66ab1a57206c28c36f6659a29d56e2f6.jpg', 'jpg', 'd997e1c37edc05ad87d03603e32ad495ee2cfce1', 'bdf3bf1da3405725be763540d6601144', '595284', 'he', '1480405984', '1480405984');
INSERT INTO `tutelib_field_data_attachment` VALUES ('104', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1480406004', '1480406004');
INSERT INTO `tutelib_field_data_attachment` VALUES ('105', '0', '0', '', 'Hydrangeas.jpg', '20161129\\66ab1a57206c28c36f6659a29d56e2f6.jpg', 'jpg', 'd997e1c37edc05ad87d03603e32ad495ee2cfce1', 'bdf3bf1da3405725be763540d6601144', '595284', 'he', '1480406010', '1480406010');
INSERT INTO `tutelib_field_data_attachment` VALUES ('106', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1480406091', '1480406091');
INSERT INTO `tutelib_field_data_attachment` VALUES ('107', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480406187', '1480406187');
INSERT INTO `tutelib_field_data_attachment` VALUES ('108', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1480427520', '1480427520');
INSERT INTO `tutelib_field_data_attachment` VALUES ('109', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480427545', '1480427545');
INSERT INTO `tutelib_field_data_attachment` VALUES ('110', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480427613', '1480427613');
INSERT INTO `tutelib_field_data_attachment` VALUES ('111', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480428054', '1480428054');
INSERT INTO `tutelib_field_data_attachment` VALUES ('112', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480428070', '1480428070');
INSERT INTO `tutelib_field_data_attachment` VALUES ('113', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480428803', '1480428803');
INSERT INTO `tutelib_field_data_attachment` VALUES ('114', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480428810', '1480428810');
INSERT INTO `tutelib_field_data_attachment` VALUES ('115', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480428855', '1480428855');
INSERT INTO `tutelib_field_data_attachment` VALUES ('116', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1480428893', '1480428893');
INSERT INTO `tutelib_field_data_attachment` VALUES ('117', '0', '0', '', 'Hydrangeas.jpg', '20161129\\66ab1a57206c28c36f6659a29d56e2f6.jpg', 'jpg', 'd997e1c37edc05ad87d03603e32ad495ee2cfce1', 'bdf3bf1da3405725be763540d6601144', '595284', 'he', '1481704341', '1481704341');
INSERT INTO `tutelib_field_data_attachment` VALUES ('118', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481704370', '1481704370');
INSERT INTO `tutelib_field_data_attachment` VALUES ('119', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481711194', '1481711194');
INSERT INTO `tutelib_field_data_attachment` VALUES ('120', '0', '0', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1481711424', '1481711424');
INSERT INTO `tutelib_field_data_attachment` VALUES ('121', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481711905', '1481711905');
INSERT INTO `tutelib_field_data_attachment` VALUES ('122', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481711978', '1481711978');
INSERT INTO `tutelib_field_data_attachment` VALUES ('123', '0', '0', '', 'Hydrangeas.jpg', '20161129\\66ab1a57206c28c36f6659a29d56e2f6.jpg', 'jpg', 'd997e1c37edc05ad87d03603e32ad495ee2cfce1', 'bdf3bf1da3405725be763540d6601144', '595284', 'he', '1481712045', '1481712045');
INSERT INTO `tutelib_field_data_attachment` VALUES ('124', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481712324', '1481712324');
INSERT INTO `tutelib_field_data_attachment` VALUES ('125', '0', '0', '', 'Hydrangeas.jpg', '20161129\\66ab1a57206c28c36f6659a29d56e2f6.jpg', 'jpg', 'd997e1c37edc05ad87d03603e32ad495ee2cfce1', 'bdf3bf1da3405725be763540d6601144', '595284', 'he', '1481712669', '1481712669');
INSERT INTO `tutelib_field_data_attachment` VALUES ('126', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481713548', '1481713548');
INSERT INTO `tutelib_field_data_attachment` VALUES ('127', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481713618', '1481713618');
INSERT INTO `tutelib_field_data_attachment` VALUES ('128', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481713686', '1481713686');
INSERT INTO `tutelib_field_data_attachment` VALUES ('129', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481713798', '1481713798');
INSERT INTO `tutelib_field_data_attachment` VALUES ('130', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1481722465', '1481722465');
INSERT INTO `tutelib_field_data_attachment` VALUES ('131', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482067598', '1482067598');
INSERT INTO `tutelib_field_data_attachment` VALUES ('132', '0', '0', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1482067710', '1482067710');
INSERT INTO `tutelib_field_data_attachment` VALUES ('133', '2', '4', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1482068351', '1482068891');
INSERT INTO `tutelib_field_data_attachment` VALUES ('134', '2', '4', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1482069593', '1482069596');
INSERT INTO `tutelib_field_data_attachment` VALUES ('135', '2', '4', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482069636', '1482069640');
INSERT INTO `tutelib_field_data_attachment` VALUES ('136', '2', '4', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1482071425', '1482071431');
INSERT INTO `tutelib_field_data_attachment` VALUES ('137', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482071473', '1482071473');
INSERT INTO `tutelib_field_data_attachment` VALUES ('138', '2', '4', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1482071525', '1482071538');
INSERT INTO `tutelib_field_data_attachment` VALUES ('139', '0', '0', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1482071840', '1482071840');
INSERT INTO `tutelib_field_data_attachment` VALUES ('140', '2', '4', '', 'Chrysanthemum.jpg', '20161129\\6f1d607ca102e1d5730e4c501009328e.jpg', 'jpg', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', '879394', 'he', '1482071862', '1482071871');
INSERT INTO `tutelib_field_data_attachment` VALUES ('141', '2', '4', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482071894', '1482071911');
INSERT INTO `tutelib_field_data_attachment` VALUES ('142', '2', '4', '', 'Jellyfish.jpg', '20161129\\e6a8a08fd5e27386957e736b138d96e9.jpg', 'jpg', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', '775702', 'he', '1482158665', '1482158695');
INSERT INTO `tutelib_field_data_attachment` VALUES ('143', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482284358', '1482284358');
INSERT INTO `tutelib_field_data_attachment` VALUES ('144', '0', '0', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482284965', '1482284965');
INSERT INTO `tutelib_field_data_attachment` VALUES ('145', '2', '665', '', 'Lighthouse.jpg', '20161129\\2a4878b244b550274c0ca189fa5585df.jpg', 'jpg', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '8969288f4245120e7c3870287cce0ff3', '561276', 'he', '1482286066', '1482286323');

-- ----------------------------
-- Table structure for tutelib_field_data_body
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_body`;
CREATE TABLE `tutelib_field_data_body` (
  `field_id` int(11) unsigned NOT NULL COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL COMMENT '对应的关键字ID',
  `value` longtext NOT NULL,
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`key_id`,`field_id`,`is_delete`),
  KEY `entity_id` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';

-- ----------------------------
-- Records of tutelib_field_data_body
-- ----------------------------
INSERT INTO `tutelib_field_data_body` VALUES ('0', '0', '   &lt;p&gt; &lt;/p&gt;\r\n', '0', '1481712626', '1481712626');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '1', '&lt;p&gt;这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题这里是关于我们的主题&lt;img alt=&quot;个人真实性核验单 (1)&quot; src=&quot;/yunzhicms/public/upload/20160907/fecddd331f269a93b55fc16c7c742121.png&quot; /&gt;dfds&lt;/p&gt;\r\n', '0', '1479859643', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '2', '   &lt;p&gt;    &lt;p&gt; 新闻通知1新闻通知1新闻通知1新闻通知1新闻通知1&lt;/p&gt;\r\n&lt;/p&gt;\r\n', '0', '1479822517', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('2', '3', '新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2新闻通知2', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '4', '&lt;p&gt;ceshi&lt;/p&gt;&lt;p&gt;这是一fdsf个测试fd&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '0', '1482287850', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '9', '操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '10', '操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '11', '这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '12', '这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '13', '操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '14', '操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '15', '操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '16', '   &lt;p&gt; 操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明&lt;/p&gt;\r\n', '0', '1482288181', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '17', '操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '301', '&lt;p&gt;fds&lt;/p&gt;\r\n', '0', '1479864625', '1479864625');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '302', '&lt;p&gt;操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明操作说明&lt;/p&gt;\r\n', '0', '1479864694', '1479864694');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '303', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864777', '1479864777');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '304', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864801', '1479864801');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '305', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864813', '1479864813');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '306', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864824', '1479864824');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '307', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864833', '1479864833');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '308', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864845', '1479864845');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '309', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/inductive/10.html&quot;&gt;这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明这是一个标题长的操作说明&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1479864854', '1479864854');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '310', '&lt;p&gt;这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题&lt;/p&gt;\r\n', '0', '1479910663', '1479910663');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '311', '&lt;p&gt;&lt;b&gt;这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题&lt;/b&gt;&lt;/p&gt;\r\n', '0', '1479910682', '1479910682');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '313', '&lt;p&gt;这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题&lt;/p&gt;\r\n', '0', '1479911067', '1479911067');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '314', '&lt;p&gt;11这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题&lt;/p&gt;\r\n', '0', '1479912998', '1479911187');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '315', '&lt;p&gt;这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题这是一个很长的标题&lt;/p&gt;\r\n', '0', '1479911203', '1479911203');
INSERT INTO `tutelib_field_data_body` VALUES ('12', '317', '这是一个故障反馈', '0', '0', '0');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '667', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;这是一个新闻内容sd&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '0', '1482287751', '1482285623');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '668', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;/p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;p&gt;&lt;a data-cke-saved-href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot; href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot; style=&quot;background-color: rgb(255, 255, 255);&quot;&gt;这是一个长的新闻标题&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;a data-cke-saved-href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot; href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题&lt;/a&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '0', '1482288231', '1482285698');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '669', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '0', '1482288200', '1482287905');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '670', '&lt;p&gt;这是一个操作说明这是一个操作说明这是一个操作说明&lt;/p&gt;\r\n', '0', '1482287961', '1482287961');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '671', '&lt;p&gt;这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明&lt;/p&gt;\r\n', '0', '1482287972', '1482287972');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '672', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1482288250', '1482288250');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '673', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1482288278', '1482288278');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '674', '&lt;p&gt;&lt;a href=&quot;http://127.0.0.1/tutecms/public/news/665.html&quot;&gt;这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题这是一个长的新闻标题&lt;/a&gt;&lt;/p&gt;\r\n', '0', '1482288292', '1482288292');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '675', '&lt;p&gt;这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明这是一个操作说明&lt;/p&gt;\r\n', '0', '1482289330', '1482289330');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '676', '&lt;p&gt;这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题&lt;/p&gt;\r\n', '0', '1482289364', '1482289364');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '677', '&lt;p&gt;这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题&lt;/p&gt;\r\n', '0', '1482289374', '1482289374');
INSERT INTO `tutelib_field_data_body` VALUES ('1', '678', '&lt;p&gt;这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题&lt;/p&gt;\r\n', '0', '1482289418', '1482289418');
INSERT INTO `tutelib_field_data_body` VALUES ('10', '679', '&lt;p&gt;这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题这是一个新闻标题&lt;/p&gt;\r\n', '0', '1482289446', '1482289446');

-- ----------------------------
-- Table structure for tutelib_field_data_comment_body
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_comment_body`;
CREATE TABLE `tutelib_field_data_comment_body` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';

-- ----------------------------
-- Records of tutelib_field_data_comment_body
-- ----------------------------

-- ----------------------------
-- Table structure for tutelib_field_data_field_image
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_field_image`;
CREATE TABLE `tutelib_field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The test_file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';

-- ----------------------------
-- Records of tutelib_field_data_field_image
-- ----------------------------

-- ----------------------------
-- Table structure for tutelib_field_data_field_tags
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_field_tags`;
CREATE TABLE `tutelib_field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';

-- ----------------------------
-- Records of tutelib_field_data_field_tags
-- ----------------------------

-- ----------------------------
-- Table structure for tutelib_field_data_image
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_image`;
CREATE TABLE `tutelib_field_data_image` (
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
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`) USING BTREE,
  KEY `key_id` (`key_id`) USING BTREE,
  KEY `sha1` (`sha1`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';

-- ----------------------------
-- Records of tutelib_field_data_image
-- ----------------------------
INSERT INTO `tutelib_field_data_image` VALUES ('5', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('6', '0', '0', '', '69947EE9-DD40-427D-8F43-390AED15FE92.png', '20160907/10cc6ec3f5c48ec37c28e9a2787a61de.png', 'png', '7cd5cd6c76fa20156c68dfe296b1443bd066a15e', 'aab1f603556216ac2e5a1b3fc971ca73', '174132', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('7', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('8', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('9', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('10', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('11', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('12', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('13', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('14', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('15', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('16', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('17', '0', '0', '', 'Girl fashion beauty.jpg', '20160907/819029973ba3b6d987748accff729b76.jpg', 'jpg', '7a3b581096d4a97e9ea73bbf10e37723dead9284', '3b3cac76b6d7901de8688bded8b9b37d', '450782', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('18', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('19', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('20', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('21', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('22', '0', '0', '', '69947EE9-DD40-427D-8F43-390AED15FE92.png', '20160907/10cc6ec3f5c48ec37c28e9a2787a61de.png', 'png', '7cd5cd6c76fa20156c68dfe296b1443bd066a15e', 'aab1f603556216ac2e5a1b3fc971ca73', '174132', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('23', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('24', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('25', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('26', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('27', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('28', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('29', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('30', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('31', '0', '0', '', 'Girl fashion beauty.jpg', '20160907/819029973ba3b6d987748accff729b76.jpg', 'jpg', '7a3b581096d4a97e9ea73bbf10e37723dead9284', '3b3cac76b6d7901de8688bded8b9b37d', '450782', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('32', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('33', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('34', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('35', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('36', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('37', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('38', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('39', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('40', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('41', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('42', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('43', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('44', '0', '0', '', '个人真实性核验单 (1).png', '20160907/fecddd331f269a93b55fc16c7c742121.png', 'png', '00155e2f1871ac015ebcd303d7351670fc133e95', '21b7ef3ae5010689b44c482a8d6ba3d3', '187767', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('47', '2', '1', '', 'Girl fashion beauty.jpg', '20160907/819029973ba3b6d987748accff729b76.jpg', 'jpg', '7a3b581096d4a97e9ea73bbf10e37723dead9284', '3b3cac76b6d7901de8688bded8b9b37d', '450782', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('48', '0', '0', '', 'IMG_2897.JPG', '20160907/7b29c9c6b5e03d5f00f95ca2a61e9260.JPG', 'jpg', '6c02ab91d7101a3c60edec84c7a320ba8e56ea60', '23305e519817b6e5f01cfc3e92b8621a', '1908619', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('49', '0', '0', '', '总学习记录下半部分.png', '20160908/d93d0157350f7c4d7f1a63594f9f849e.png', 'png', '8facb43772c0b2df948e7fe05f71e2c1629701f4', '86adb097a89220dee4dbab8d78da32e9', '36666', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('50', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('51', '0', '0', '', 'IMG_2895.JPG', '20160909/c5e1d27c1c5248ec13756ce57e2bfcd0.JPG', 'jpg', '997e230ce0e90ef29f0d0052f21a58bda3342ae1', '335ad910864e3ea73d66fdcc60c1dda2', '1320121', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('52', '0', '0', '', '1m.jpg', '20160909/23ac694c99fe13b03f362e02530d13ae.jpg', 'jpg', '1a3bc3109efc4e177b065d72b14df6d7082d64ef', 'e1ca9dff471ecd40a9e2829643bc2fd4', '42503', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('53', '0', '0', '', '1width.png', '20160909/9b20c13dcb0810348a1750df841403cc.png', 'png', '8e0ac2f0a8d555ea33803c15d512bbbfd497e841', '70bbcbbea1afa862b0e317e886a215c4', '375', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('54', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('55', '0', '0', '', '2widtd.png', '20160909/b672ff9123a4e9167347f4ca9fc474b5.png', 'png', '18c08e0f6ae27d10f7d7b713f3dc67f7ebd75e01', '5162364abf3c8a1690706912714137df', '419', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('56', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('57', '0', '0', '', 'learning.png', '20160909/f7eb789c334bab6a43be3484a4baffd2.png', 'png', 'd2c112c31cded22cbf822c7aac535ea56e5d393e', 'df6ee7fdde85079a49cf8fc24a8e9796', '61370', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('58', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('59', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('60', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('61', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('62', '0', '0', '', 'tp5.png', '20160909/46ed1f6f05dfbc1210a90c61031daaf9.png', 'png', 'a833c6d35f642086d8b4ea5204440627980e10f9', 'b54e7831eb87550ef817a9fb2eb85a63', '33862', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('63', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('64', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('65', '0', '0', '', '2widtd.png', '20160909/b672ff9123a4e9167347f4ca9fc474b5.png', 'png', '18c08e0f6ae27d10f7d7b713f3dc67f7ebd75e01', '5162364abf3c8a1690706912714137df', '419', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('66', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('67', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('68', '0', '0', '', 'learning.png', '20160909/f7eb789c334bab6a43be3484a4baffd2.png', 'png', 'd2c112c31cded22cbf822c7aac535ea56e5d393e', 'df6ee7fdde85079a49cf8fc24a8e9796', '61370', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('69', '0', '0', '', '1m.jpg', '20160909/23ac694c99fe13b03f362e02530d13ae.jpg', 'jpg', '1a3bc3109efc4e177b065d72b14df6d7082d64ef', 'e1ca9dff471ecd40a9e2829643bc2fd4', '42503', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('70', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('71', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('72', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('73', '0', '0', '', '公司logo.jpg', '20160909/2306d21d8e8d62744fe35c221c1359b9.jpg', 'jpg', '2bf82667d21fea68d0090fd8ca7804867d1467d0', '7f9f9f6ed57b0e3bea46bd4b066fd01b', '28097', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('74', '0', '0', '', '970width.png', '20160909/a07ac25db4da1af8fed3d3a3905cea07.png', 'png', '4229b0890d79caae845ec73e96b5a809b333d06f', 'da1babe7ae1b59a147a57b71da486fc3', '57951', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('75', '0', '0', '', '1m.jpg', '20160909/23ac694c99fe13b03f362e02530d13ae.jpg', 'jpg', '1a3bc3109efc4e177b065d72b14df6d7082d64ef', 'e1ca9dff471ecd40a9e2829643bc2fd4', '42503', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('76', '0', '0', '', '1m.jpg', '20160909/23ac694c99fe13b03f362e02530d13ae.jpg', 'jpg', '1a3bc3109efc4e177b065d72b14df6d7082d64ef', 'e1ca9dff471ecd40a9e2829643bc2fd4', '42503', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('77', '0', '0', '', '111.png', '20160908/65923c474c4d104c49e5bed5854eb771.png', 'png', 'e87cad1414a01a15906d91d274d7e24694e26885', '4b980346129bc1c6d4ae9fca1876c04d', '194950', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('78', '0', '0', '', '1m.jpg', '20160909/23ac694c99fe13b03f362e02530d13ae.jpg', 'jpg', '1a3bc3109efc4e177b065d72b14df6d7082d64ef', 'e1ca9dff471ecd40a9e2829643bc2fd4', '42503', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('79', '0', '0', '', 'learning.png', '20160909/f7eb789c334bab6a43be3484a4baffd2.png', 'png', 'd2c112c31cded22cbf822c7aac535ea56e5d393e', 'df6ee7fdde85079a49cf8fc24a8e9796', '61370', 'image/png', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('80', '0', '0', '', '1.jpg', '20160912/4816be8aab31bc3dd96a068babf7b3f1.jpg', 'jpg', 'c4eb60cb8d93c641d7968f06901b3c333f421962', 'de32827c690341063cc912de9045be0e', '30641', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('81', '0', '0', '', '88-20151030101118.jpg', '20160912/167b5f27e87081f4545c14c29b869964.jpg', 'jpg', 'cca18b443fe9a6be89f9fecbd858e48767863b89', '54fe7a710948136957ae5552fa9d3d45', '75156', 'image/jpeg', '0', '0');
INSERT INTO `tutelib_field_data_image` VALUES ('82', '0', '0', '', '3.jpg', '20160912/53b68492cfa0c681e9a7d54f74d3fecb.jpg', 'jpg', '37f43a9f43a06c1da330b4f19e67155cdcbb8c5c', '58c61881873640a1f7daca1e6850cc1f', '640535', 'image/jpeg', '0', '0');

-- ----------------------------
-- Table structure for tutelib_field_data_images
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_images`;
CREATE TABLE `tutelib_field_data_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk ...',
  `user_name` varchar(40) NOT NULL COMMENT 'fk user',
  `value` varchar(4096) NOT NULL DEFAULT '',
  `update_time` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='多图片字段.使用json格式进行存储';

-- ----------------------------
-- Records of tutelib_field_data_images
-- ----------------------------
INSERT INTO `tutelib_field_data_images` VALUES ('2', '5', '2', '', '[\"\\/yunzhicms\\/public\\/upload\\/20160912\\/53b68492cfa0c681e9a7d54f74d3fecb.jpg\",\"\\/yunzhicms\\/public\\/upload\\/20160912\\/4816be8aab31bc3dd96a068babf7b3f1.jpg\",\"\"]', '1481711142', '0');
INSERT INTO `tutelib_field_data_images` VALUES ('6', '2', '4', '', '\"132\"', '1482068287', '1482068264');

-- ----------------------------
-- Table structure for tutelib_field_data_json
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_json`;
CREATE TABLE `tutelib_field_data_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk ...',
  `user_name` varchar(40) NOT NULL COMMENT 'fk user',
  `value` varchar(4096) NOT NULL DEFAULT '',
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_field_data_json
-- ----------------------------
INSERT INTO `tutelib_field_data_json` VALUES ('1', '4', '2', '', '[\"\\u8fd9\\u662f\\u4e3b\\u6807\\u98981\",\"\\u8fd9\\u662f\\u4e3b\\u6807\\u9898\",\"\\u8fd9\\u662f\\u4e3b\\u9898\\u4e09\"]', '1481711142');
INSERT INTO `tutelib_field_data_json` VALUES ('2', '5', '2', '', '[\"\\u94fe\\u63a51\",\"\\u5730\\u57404\",\"\"]', '0');
INSERT INTO `tutelib_field_data_json` VALUES ('3', '6', '2', '', '[\"http:\\/\\/www.mengyunzhi.com\",\"http:\\/\\/www.scse.hebut.edu.cn\",\"http:\\/\\/www.scse.hebut.edu.cn\"]', '1481711142');
INSERT INTO `tutelib_field_data_json` VALUES ('4', '7', '2', '', '[\"\\u8fd9\\u662f\\u526f\\u6807\\u98981\",\"\\u8fd9\\u662f\\u526f\\u6807\\u98982\",\"\\u8fd9\\u662f\\u526f\\u6807\\u98983\"]', '1481711142');
INSERT INTO `tutelib_field_data_json` VALUES ('5', '8', '2', '', '[\"\\u8fd9\\u91cc\\u662f\\u63cf\\u8ff0\\u4fe1\\u606f\\uff1a\\u56fe\\u7247\\u4e0a\\u4f20\\u7684\\u89c4\\u683c\\u4e3a1920*500, \\u975e\\u8be5\\u89c4\\u683c\\u4f1a\\u8fdb\\u884c\\u81ea\\u52a8\\u7684\\u62c9\\u4f38\\u3002\\u5982\\u679c\\u56fe\\u7247\\u4e0a\\u4f20\\u540e\\u6709\\u4e9b\\u6697\\uff0c\\u662f\\u6b63\\u5e38\\u73b0\\u8c61\\u3002\\u8bf7\\u589e\\u52a0\\u4eae\\u5ea6\\u540e\\u91cd\\u65b0\\u4e0a\\u4f20\\u3002\",\"\\u7531\\u4e8e\\u5b57\\u4f53\\u4e3a\\u767d\\u8272\\uff0c\\u6240\\u4ee5\\u6211\\u4eec\\u5bf9\\u56fe\\u7247\\u8fdb\\u884c\\u4e86\\u8499\\u677f\\u5904\\u7406\\u3002\\u4e0a\\u4f20\\u56fe\\u7247\\u540e\\uff0c\\u5c06\\u4f1a\\u770b\\u5230\\u56fe\\u7247\\u4e0a\\u65b9\\u6709\\u4e00\\u5c42\\u534a\\u900f\\u660e\\u7684\\u8499\\u677f\\uff0c\\u8fd9\\u662f\\u6b63\\u5e38\\u7684\\u73b0\\u8c61\\u3002\\u5f53\\u7136\\u4e86\\uff0c\\u5373\\u4f7f\\u662f\\u8fd9\\u6837\\uff0c\\u6211\\u4eec\\u4e5f\\u5e76\\u4e0d\\u63a8\\u8350\\u4f7f\\u7528\\u767d\\u8272\\u7684\\u80cc\\u666f\\u56fe\\u7247\\u3002\",\"\\u6d4b\\u8bd5\"]', '1481711142');

-- ----------------------------
-- Table structure for tutelib_field_data_text
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_data_text`;
CREATE TABLE `tutelib_field_data_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk field',
  `key_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'fk ...',
  `user_name` varchar(40) NOT NULL COMMENT 'fk user',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutelib_field_data_text
-- ----------------------------

-- ----------------------------
-- Table structure for tutelib_field_type
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_field_type`;
CREATE TABLE `tutelib_field_type` (
  `name` varchar(40) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0启用，1禁用',
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字段类型表';

-- ----------------------------
-- Records of tutelib_field_type
-- ----------------------------
INSERT INTO `tutelib_field_type` VALUES ('body', '0', '富文本', '');
INSERT INTO `tutelib_field_type` VALUES ('image', '0', '图片', '');
INSERT INTO `tutelib_field_type` VALUES ('text', '0', '文本', '');

-- ----------------------------
-- Table structure for tutelib_filter
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_filter`;
CREATE TABLE `tutelib_filter` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='过滤器表';

-- ----------------------------
-- Records of tutelib_filter
-- ----------------------------
INSERT INTO `tutelib_filter` VALUES ('System', 'makeFrontpageContentUrl', '[]', '首页新闻链接', '直接生成首页新闻链接（直接链接到 Content组件）', '梦云智', '1.0.0', 'http://www.mengyunzhi.com', 'http://www.mengyunzhi.com', '3792535@qq.com');
INSERT INTO `tutelib_filter` VALUES ('System', 'makeCurrentMenuReadUrl', '[]', '生成菜单URL', '生成菜单对应的路由URL信息', '', '', '', '', '');
INSERT INTO `tutelib_filter` VALUES ('String', 'substr', '{\"length\":{\"value\":40,\"title\":\"\\u622a\\u53d6\\u957f\\u5ea6\",\"type\":\"text\",\"description\":\"\\u622a\\u53d6\\u7684UTF8\\u7f16\\u7801\\u7684\\u957f\\u5ea6\"},\"ext\":{\"value\":\"...\",\"title\":\"\\u540e\\u7f00\",\"type\":\"text\",\"description\":\"\\u5c06\\u53d1\\u751f\\u622a\\u53d6\\u64cd\\u4f5c\\u540e\\uff0c\\u586b\\u5145\\u5728\\u6807\\u9898\\u540e\\u9762\\u7684\\u540e\\u7f00\\u4fe1\\u606f\"}}', '标题截取', '对UTF8编码的标题进行截取', '', '', '', '', '');
INSERT INTO `tutelib_filter` VALUES ('Date', 'format', '{\"dateFormat\":{\"value\":\"Y-m-d\",\"title\":\"\\u65f6\\u95f4\\u6233\\u683c\\u5f0f\\u5316\",\"description\":\"\\u5bf9\\u65f6\\u95f4\\u6233\\u8fdb\\u884c\\u683c\\u5f0f\\u5316\",\"type\":\"text\"}}', '时间戳格式化', '时间戳格式化', '', '', '', '', '');
INSERT INTO `tutelib_filter` VALUES ('System', 'makeContentReadUrl', '[]', '生成新闻读链接', '根据新闻对应的类别信息，取类别的URL信息，生成LCURD路由', '', '', '', '', '');
INSERT INTO `tutelib_filter` VALUES ('System', 'makeInductiveContentUrl', '[]', '生成操作说明的链接', '直接生成操作说明的链接', '', '', '', '', '');

-- ----------------------------
-- Table structure for tutelib_menu
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_menu`;
CREATE TABLE `tutelib_menu` (
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
  `update_time` smallint(6) unsigned NOT NULL DEFAULT '0',
  `create_time` smallint(6) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `list` (`weight`,`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜单表（每一个菜单对应唯一的一个组件）';

-- ----------------------------
-- Records of tutelib_menu
-- ----------------------------
INSERT INTO `tutelib_menu` VALUES ('1', 'main', 'Home', '首页', '0', '', '0', '0', '首页', '{\"count\":\"6\",\"contentTypeName\":\"inductive\"}', '{\"title\":{\"type\":\"String\",\"function\":\"substr\",\"param\":{\"length\":\"6\",\"ext\":\"...\"}},\"href\":{\"type\":\"System\",\"function\":\"makeInductiveContentUrl\",\"param\":[]}}', '1', '0', '65535', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('2', 'main', 'ContentList', '新闻通知', '0', 'news', '0', '0', '这里是描述信息', '{\"contentTypeName\":\"news\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '{\"title\":{\"type\":\"String\",\"function\":\"substr\",\"param\":{\"length\":\"10\",\"ext\":\"...\"}},\"href\":{\"type\":\"System\",\"function\":\"makeCurrentMenuReadUrl\",\"param\":[]},\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"Y-m-d\"}}}', '0', '0', '65535', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('3', 'main', 'Course', '课表', '0', 'course', '0', '0', '用于学生的课表查询', '{\"contentTypeName\":\"course\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('6', 'main', 'Login', '个人中心', '0', 'login', '1', '0', '用于用户登陆与注销', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('7', 'main', 'FeedBack', '故障反馈', '0', 'feedback', '0', '0', '用于显示用户的故障反馈', '{\"contentTypeName\":\"feedback\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('8', 'main', 'User', '反馈详情', '0', 'feedback/detail', '1', '0', '用于显示用户反馈的详细信息', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('10', 'main', 'ContentList', '院级新闻', '0', 'news/school', '1', '0', '用于显示首页链接的新闻', '{\"contentTypeName\":\"news\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '{\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"m-d\"}},\"href\":{\"type\":\"System\",\"function\":\"makeCurrentMenuReadUrl\",\"param\":[]}}', '0', '0', '65535', '0', '0');
INSERT INTO `tutelib_menu` VALUES ('11', 'main', 'ContentList', '操作说明', '0', 'inductive', '0', '0', '用于显示操作说明', '{\"contentTypeName\":\"inductive\",\"count\":\"1\",\"order\":\"weight desc, id desc\"}', '{\"title\":{\"type\":\"String\",\"function\":\"substr\",\"param\":{\"length\":\"10\",\"ext\":\"...\"}},\"href\":{\"type\":\"System\",\"function\":\"makeCurrentMenuReadUrl\",\"param\":[]},\"date\":{\"type\":\"Date\",\"function\":\"format\",\"param\":{\"dateFormat\":\"Y-m-d\"}}}', '0', '0', '65535', '32767', '0');
INSERT INTO `tutelib_menu` VALUES ('12', 'main', 'Curriculum', '课表信息', '0', 'curriculum', '0', '0', '用于站点编辑人员对课程信息的编辑', '{\"count\":\"10\",\"contentTypeName\":\"inductive\"}', '[]', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tutelib_menu_type
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_menu_type`;
CREATE TABLE `tutelib_menu_type` (
  `name` varchar(40) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单类型表（主要为了可以使用区块进行菜单的调用）';

-- ----------------------------
-- Records of tutelib_menu_type
-- ----------------------------
INSERT INTO `tutelib_menu_type` VALUES ('main', '主菜单', '主菜单', '0');

-- ----------------------------
-- Table structure for tutelib_plugin
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_plugin`;
CREATE TABLE `tutelib_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_type_name` varchar(40) NOT NULL COMMENT 'fk plugin_type 插件类型',
  `position_name` varchar(40) NOT NULL COMMENT 'fk of plugin_position',
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL,
  `config` varchar(4096) NOT NULL DEFAULT '[]',
  `filter` varchar(4096) NOT NULL DEFAULT '[]',
  `weight` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `is_delete` int(2) unsigned zerofill DEFAULT '00',
  `update_time` int(11) unsigned DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of tutelib_plugin
-- ----------------------------
INSERT INTO `tutelib_plugin` VALUES ('1', 'PreNextContent', 'weizhi1', '文章后', '这是描述', '0', '', '{\"href\":{\"name\":\"href\",\"type\":\"System\",\"function\":\"makeContentReadUrl\"}}', '0', '00', '1474704189', null);
INSERT INTO `tutelib_plugin` VALUES ('2', 'PreNextContent', 'weizhi1', '', '', '0', '[]', '[]', '0', '00', '1474709108', '1474709108');
INSERT INTO `tutelib_plugin` VALUES ('3', 'chajianceshi1', 'weizhi2', '测试1', '阿萨', '0', '[]', '[]', '0', '00', '1474709149', '1474709149');
INSERT INTO `tutelib_plugin` VALUES ('4', 'PreNextContent', 'weizhi1', 'sa', 'sa', '0', '[]', '[]', '0', '00', '1474717031', '1474710021');
INSERT INTO `tutelib_plugin` VALUES ('5', 'PreNextContent', 'weizhi1', '', '', '0', '[]', '[]', '0', '00', '1474716952', '1474710204');
INSERT INTO `tutelib_plugin` VALUES ('6', 'chajianceshi1', 'weizhi1', 'haun', 'sdad', '0', '[]', '{\"href\":{\"name\":\"href\",\"type\":\"System\",\"function\":\"makeContentReadUrl\"}}', '0', '00', '1474717237', '1474717103');
INSERT INTO `tutelib_plugin` VALUES ('7', 'PreNextContent', 'weizhi1', '', '', '0', '[]', '{\"href\":{\"name\":\"href\",\"type\":\"System\",\"function\":\"makeContentReadUrl\"}}', '0', '00', '1474717342', '1474717271');

-- ----------------------------
-- Table structure for tutelib_plugin_type
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_plugin_type`;
CREATE TABLE `tutelib_plugin_type` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件类型表';

-- ----------------------------
-- Records of tutelib_plugin_type
-- ----------------------------
INSERT INTO `tutelib_plugin_type` VALUES ('PreNextContent', '上一篇、下一篇文章', '');

-- ----------------------------
-- Table structure for tutelib_position
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_position`;
CREATE TABLE `tutelib_position` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(40) NOT NULL DEFAULT 'blcok' COMMENT '类型: block 区块，plugin 插件',
  `theme_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk of theme',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='位置表，记录着某个主题(theme)下的插件(plugin)及区块(block)位置信息';

-- ----------------------------
-- Records of tutelib_position
-- ----------------------------
INSERT INTO `tutelib_position` VALUES ('main', '位置', '', 'blcok', 'default');
INSERT INTO `tutelib_position` VALUES ('menu', '位置', '', 'blcok', 'default');
INSERT INTO `tutelib_position` VALUES ('weizhi1', '位置', '', 'plugin', 'default');
INSERT INTO `tutelib_position` VALUES ('weizhi2', '位置', '', 'plugin', 'default');

-- ----------------------------
-- Table structure for tutelib_theme
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_theme`;
CREATE TABLE `tutelib_theme` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `is_current` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否激活. 0未激活，1已激活',
  `author` varchar(40) NOT NULL DEFAULT '',
  `version` varchar(40) NOT NULL DEFAULT '',
  `update_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题表';

-- ----------------------------
-- Records of tutelib_theme
-- ----------------------------
INSERT INTO `tutelib_theme` VALUES ('default', '默认主题', '', '0', '梦云智', '', '1475064567', '0');
INSERT INTO `tutelib_theme` VALUES ('ceshi1', '测试主题1', '这是一个测试主题', '0', 'ceshi', '1.0', '1475064567', '0');
INSERT INTO `tutelib_theme` VALUES ('1', '', '', '0', '', '', '0', '0');
INSERT INTO `tutelib_theme` VALUES ('2', '', '', '0', '', '', '0', '0');
INSERT INTO `tutelib_theme` VALUES ('3', '', '', '0', '', '', '0', '0');
INSERT INTO `tutelib_theme` VALUES ('4', '', '', '0', '', '', '0', '0');
INSERT INTO `tutelib_theme` VALUES ('Fantheme', '', '', '0', '', '', '0', '0');
INSERT INTO `tutelib_theme` VALUES ('Chutheme', '', '', '0', '', '', '0', '0');
INSERT INTO `tutelib_theme` VALUES ('tute', 'test', '', '1', '', '', '0', '0');

-- ----------------------------
-- Table structure for tutelib_user
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_user`;
CREATE TABLE `tutelib_user` (
  `id` smallint(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `qq_open_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'qq 认证openid',
  `password` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0正常 1冻结',
  `user_group_name` varchar(40) NOT NULL DEFAULT '' COMMENT 'fk user_group',
  `create_time` smallint(6) unsigned NOT NULL,
  `update_time` smallint(6) unsigned NOT NULL,
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '1已删除',
  `is_admin` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tutelib_user
-- ----------------------------
INSERT INTO `tutelib_user` VALUES ('1', 'admin@admin', '', '', '梦云智', '1', 'admin', '0', '65535', '0', '0');
INSERT INTO `tutelib_user` VALUES ('2', '598545211@qq.com', '', '111', '2', '0', 'admin', '0', '65535', '0', '0');
INSERT INTO `tutelib_user` VALUES ('3', '', '', '', 'f', '0', 'public', '65535', '65535', '1', '0');
INSERT INTO `tutelib_user` VALUES ('4', '59854521111@qq.com', '', '111111', '111', '0', 'public', '65535', '65535', '0', '0');
INSERT INTO `tutelib_user` VALUES ('5', '5985452111111@qq.com', '', '111', '111', '1', 'public', '65535', '65535', '0', '0');
INSERT INTO `tutelib_user` VALUES ('6', '5985www45211@qq.com', '', '111111', '123', '0', 'public', '65535', '65535', '0', '0');
INSERT INTO `tutelib_user` VALUES ('7', 'admin@123', '', 'admin', '', '0', 'editor', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tutelib_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tutelib_user_group`;
CREATE TABLE `tutelib_user_group` (
  `name` varchar(40) NOT NULL,
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` smallint(6) unsigned NOT NULL DEFAULT '0',
  `update_time` smallint(6) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组（用户类型）表';

-- ----------------------------
-- Records of tutelib_user_group
-- ----------------------------
INSERT INTO `tutelib_user_group` VALUES ('admin', '超级管理员', '拥有开发权限', '0', '0', '0');
INSERT INTO `tutelib_user_group` VALUES ('editor', '站点编辑人员', '对站点进行管理', '0', '0', '0');
INSERT INTO `tutelib_user_group` VALUES ('register', '注册用户', '注册用户，拥有对权限新闻的查看权限', '0', '0', '0');
INSERT INTO `tutelib_user_group` VALUES ('public', '公共用户', '浏览网站的用户', '0', '0', '0');

