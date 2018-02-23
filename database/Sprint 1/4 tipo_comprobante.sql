/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : elgallo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-02-23 14:03:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tipo_comprobante
-- ----------------------------
DROP TABLE IF EXISTS `tipo_comprobante`;
CREATE TABLE `tipo_comprobante` (
  `tcId` int(11) NOT NULL AUTO_INCREMENT,
  `tcDescripcion` varchar(25) NOT NULL,
  `tcEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`tcId`),
  UNIQUE KEY `tcDescripcion` (`tcDescripcion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_comprobante
-- ----------------------------
INSERT INTO `tipo_comprobante` VALUES ('1', 'Factura A', 'AC');
INSERT INTO `tipo_comprobante` VALUES ('2', 'Factura B', 'AC');
INSERT INTO `tipo_comprobante` VALUES ('3', 'Factura C', 'AC');
INSERT INTO `tipo_comprobante` VALUES ('4', 'Remito X', 'AC');
