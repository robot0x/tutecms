/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : yunzhicms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-12-29 14:04:57
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `term_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tutelib_chuhang_curriculum
-- ----------------------------
