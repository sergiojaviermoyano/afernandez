/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : elgallo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-02-23 15:34:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cuentacorrienteproveedor
-- ----------------------------
DROP TABLE IF EXISTS `cuentacorrienteproveedor`;
CREATE TABLE `cuentacorrienteproveedor` (
  `cctepId` int(11) NOT NULL AUTO_INCREMENT,
  `cctepConcepto` varchar(50) NOT NULL,
  `cctepRef` int(11) DEFAULT NULL,
  `cctepTipo` varchar(2) NOT NULL,
  `cctepDebe` decimal(10,2) DEFAULT NULL,
  `cctepHaber` decimal(10,2) DEFAULT NULL,
  `cctepFecha` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `prvId` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `cajaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cctepId`),
  KEY `prvId` (`prvId`) USING BTREE,
  KEY `usrId` (`usrId`) USING BTREE,
  KEY `cajaId` (`cajaId`),
  CONSTRAINT `cuentacorrienteproveedor_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_1` FOREIGN KEY (`prvId`) REFERENCES `proveedores` (`prvId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
