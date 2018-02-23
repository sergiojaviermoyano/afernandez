/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : elgallo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-02-23 15:32:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for receptionsdetail
-- ----------------------------
DROP TABLE IF EXISTS `receptionsdetail`;
CREATE TABLE `receptionsdetail` (
  `recdId` int(11) NOT NULL AUTO_INCREMENT,
  `recId` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `recdCant` int(11) NOT NULL,
  PRIMARY KEY (`recdId`),
  KEY `recId` (`recId`) USING BTREE,
  KEY `artId` (`artId`) USING BTREE,
  CONSTRAINT `receptionsdetail_ibfk_1` FOREIGN KEY (`recId`) REFERENCES `receptions` (`recId`) ON UPDATE CASCADE,
  CONSTRAINT `receptionsdetail_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
