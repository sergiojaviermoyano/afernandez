/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : elgallo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-02-23 15:32:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for receptions
-- ----------------------------
DROP TABLE IF EXISTS `receptions`;
CREATE TABLE `receptions` (
  `recId` int(11) NOT NULL AUTO_INCREMENT,
  `recFecha` datetime NOT NULL,
  `recEstado` varchar(2) NOT NULL,
  `prvId` int(11) NOT NULL,
  `recObservacion` varchar(250) DEFAULT NULL,
  `tcId` int(11) DEFAULT NULL,
  `tcNumero` varchar(12) DEFAULT NULL,
  `tcImporte` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`recId`),
  KEY `prvId` (`prvId`) USING BTREE,
  KEY `tcId` (`tcId`) USING BTREE,
  CONSTRAINT `receptions_ibfk_1` FOREIGN KEY (`prvId`) REFERENCES `proveedores` (`prvId`) ON UPDATE CASCADE,
  CONSTRAINT `receptions_ibfk_2` FOREIGN KEY (`tcId`) REFERENCES `tipo_comprobante` (`tcId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
