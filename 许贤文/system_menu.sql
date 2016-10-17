/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : cemetery

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-10-10 17:22:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` varchar(32) NOT NULL COMMENT 'UUID32位编号',
  `name` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(300) DEFAULT NULL COMMENT '链接地址',
  `sort` int(2) DEFAULT NULL COMMENT '同级排列顺序',
  `parent_id` varchar(32) DEFAULT '0' COMMENT '父菜单编号（默认为顶层菜单0）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单信息';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1001', '系统用户管理', '/system user/list', '0', '0');
INSERT INTO `system_menu` VALUES ('1002', '系统角色管理', '/system role/list', '1', '0');
INSERT INTO `system_menu` VALUES ('1003', '模型分类管理', '/model/list', '2', '0');
INSERT INTO `system_menu` VALUES ('1004', '会员管理', '/memberaccount/memberlist', '3', '0');
INSERT INTO `system_menu` VALUES ('1005', '商品分类管理', '/goodsclassify/list', '4', '0');
INSERT INTO `system_menu` VALUES ('1006', '特殊节日管理', '/specialholiday/list', '5', '0');
INSERT INTO `system_menu` VALUES ('1007', '陵园管理', '/cemetery/list', '6', '0');
INSERT INTO `system_menu` VALUES ('1008', '商品信息管理', '/goods/list', '7', '0');
INSERT INTO `system_menu` VALUES ('1009', '公众人物管理', '/publicFigure/list', '8', '0');
