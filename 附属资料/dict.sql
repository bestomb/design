/*
Navicat MySQL Data Transfer

Source Server         : 百思陵园
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : cemetery

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-10-29 16:21:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_type` varchar(20) NOT NULL,
  `dict_desc` varchar(100) DEFAULT NULL,
  `dict_code` int(11) NOT NULL,
  `dict_value` varchar(200) NOT NULL,
  `p_dict_code` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`dict_type`,`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'goodsType', '商品类型', '1', '陵园装饰主题', null, '1');
INSERT INTO `dict` VALUES ('2', 'goodsType', '商品类型', '2', '陵园', null, '2');
INSERT INTO `dict` VALUES ('3', 'goodsType', '商品类型', '3', '陵园存储', null, '3');
INSERT INTO `dict` VALUES ('4', 'goodsType', '商品类型', '4', '交易币', null, '4');
INSERT INTO `dict` VALUES ('5', 'goodsType', '商品类型', '5', '动物', null, '5');
INSERT INTO `dict` VALUES ('6', 'goodsType', '商品类型', '6', '植物', null, '6');
INSERT INTO `dict` VALUES ('7', 'sex', '性别', '1', '男', null, '1');
INSERT INTO `dict` VALUES ('8', 'sex', '性别', '2', '女', null, '2');
INSERT INTO `dict` VALUES ('9', 'goodsBelongs', '商品所属', '1', '会员商品', null, '1');
INSERT INTO `dict` VALUES ('10', 'goodsBelongs', '商品所属', '2', '系统商品', null, '2');
INSERT INTO `dict` VALUES ('11', 'orderStatus', '订单状态', '1', '未支付', null, '1');
INSERT INTO `dict` VALUES ('12', 'orderStatus', '订单状态', '2', '已支付', null, '2');
INSERT INTO `dict` VALUES ('13', 'orderStatus', '订单状态', '-1', '已过期', null, '3');
INSERT INTO `dict` VALUES ('14', 'orderType', '订单类型', '1', '会员购物订单', null, '1');
INSERT INTO `dict` VALUES ('15', 'orderType', '订单类型', '2', '会员店铺订单', null, '2');
INSERT INTO `dict` VALUES ('16', 'orderType', '订单类型', '3', '系统订单', null, '3');
INSERT INTO `dict` VALUES ('17', 'cemeteryIsOpen', '陵园是否公开', '1', '公开', null, '1');
INSERT INTO `dict` VALUES ('18', 'cemeteryIsOpen', '陵园是否公开', '0', '不公开', null, '2');
INSERT INTO `dict` VALUES ('19', 'musicType', '音乐类型', '1', '公司内部管理', null, '1');
INSERT INTO `dict` VALUES ('20', 'musicType', '音乐类型', '2', '会员维护', null, '2');
INSERT INTO `dict` VALUES ('21', 'tombstoneType', '墓碑类型', '1', '单人碑', null, '1');
INSERT INTO `dict` VALUES ('22', 'tombstoneType', '墓碑类型', '2', '双人碑', null, '2');
INSERT INTO `dict` VALUES ('23', 'species', '墓碑种类', '1', '人类', null, '1');
INSERT INTO `dict` VALUES ('24', 'species', '墓碑种类', '2', '宠物', null, '2');
INSERT INTO `dict` VALUES ('25', 'auditResult', '审核结果', '1', '同意', null, '1');
INSERT INTO `dict` VALUES ('26', 'auditResult', '审核结果', '2', '不同意', null, '2');
