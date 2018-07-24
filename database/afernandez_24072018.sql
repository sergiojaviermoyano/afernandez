/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : afernandez

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-07-24 15:32:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `artId` int(11) NOT NULL AUTO_INCREMENT,
  `artBarCode` varchar(50) NOT NULL,
  `artDescription` varchar(50) NOT NULL,
  `artCoste` decimal(14,2) NOT NULL,
  `artMarginMinorista` decimal(10,2) NOT NULL,
  `artMarginMinoristaIsPorcent` bit(1) NOT NULL,
  `artEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `artMinimo` int(11) DEFAULT '0',
  `ivaId` int(11) NOT NULL DEFAULT '4',
  `subrId` int(11) NOT NULL,
  `artMarginMayorista` decimal(14,2) NOT NULL DEFAULT '0.00',
  `artMarginMayoristaIsPorcent` bit(1) NOT NULL,
  `artCosteIsDolar` bit(1) NOT NULL,
  `marcaId` int(11) NOT NULL,
  PRIMARY KEY (`artId`),
  UNIQUE KEY `artBarCode` (`artBarCode`) USING BTREE,
  UNIQUE KEY `artDescription` (`artDescription`) USING BTREE,
  KEY `ivaId` (`ivaId`) USING BTREE,
  KEY `subrId` (`subrId`) USING BTREE,
  KEY `marcaId` (`marcaId`) USING BTREE,
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`ivaId`) REFERENCES `ivaalicuotas` (`ivaId`) ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`subrId`) REFERENCES `subrubros` (`subrId`) ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`marcaId`) REFERENCES `marcaart` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '4050300222028', 'Lampara R2', '50.00', '40.00', '', 'AC', '4', '4', '2', '30.00', '', '', '3');
INSERT INTO `articles` VALUES ('2', '4897034186772', 'esencia p/cigarro electronico lemon', '55.00', '40.00', '', 'AC', '8', '4', '1', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('3', '6970232212424', 'cigarrillo electronico ancho', '640.00', '40.00', '\0', 'AC', '1', '4', '2', '30.00', '\0', '\0', '2');
INSERT INTO `articles` VALUES ('4', 'DK201C', 'conversor digital', '19.50', '50.00', '', 'AC', '4', '4', '3', '35.00', '', '', '5');
INSERT INTO `articles` VALUES ('5', '7501037600056', 'Pilas  AA', '4.30', '135.00', '', 'AC', '4', '4', '5', '30.00', '', '\0', '34');
INSERT INTO `articles` VALUES ('6', '7501037600032', 'pila C2', '7.10', '183.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '34');
INSERT INTO `articles` VALUES ('7', '8999002672013', 'Pilas AAA', '6.40', '57.00', '', 'AC', '4', '4', '5', '30.00', '', '\0', '34');
INSERT INTO `articles` VALUES ('8', '039800041098', 'Pila LITHIUM 123', '80.00', '50.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('9', '8888021301502', 'Pilas recargable AAA X2', '100.00', '80.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('10', '7501037600018', 'Pilas D2 X2', '40.00', '50.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '34');
INSERT INTO `articles` VALUES ('13', '039800011398', 'Pilas ENERGIZER D2 X2', '40.00', '100.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('14', '8999002671924', 'Pilas ENERGIZER AA X1', '7.50', '100.00', '', 'AC', '4', '4', '5', '0.30', '', '\0', '35');
INSERT INTO `articles` VALUES ('15', '039800052636', 'Pilas AAA X2', '10.00', '100.00', '', 'AC', '4', '4', '5', '30.00', '', '\0', '34');
INSERT INTO `articles` VALUES ('16', '039800013613', 'BATERIA 9V ', '22.50', '100.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('17', '8888021300369', 'Pilas A27', '15.00', '100.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('18', '008562010208', 'Pilas recargables AAA ', '25.00', '100.00', '', 'AC', '1', '4', '5', '30.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('19', '6936709099868', 'Pilas SIN MERCURIO AA X4', '30.00', '100.00', '', 'AC', '4', '4', '5', '30.00', '', '\0', '43');
INSERT INTO `articles` VALUES ('20', '023942440833', 'Tarjeta de memoria  32gb Verbatim', '433.29', '50.00', '', 'AC', '2', '4', '4', '30.00', '', '\0', '30');
INSERT INTO `articles` VALUES ('21', '619659066918', 'Tarjeta de memoria 32GB Sandisk', '236.36', '65.00', '', 'AC', '2', '4', '4', '30.00', '', '\0', '32');
INSERT INTO `articles` VALUES ('22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '35.00', '', 'AC', '4', '4', '4', '25.00', '', '\0', '31');
INSERT INTO `articles` VALUES ('23', '740617198256', 'Pendrive 16 GB Kingston', '166.66', '50.00', '', 'AC', '4', '4', '4', '30.00', '', '\0', '31');
INSERT INTO `articles` VALUES ('24', '619659000424', 'Pendrive 8GB SanDisk', '121.21', '65.00', '', 'AC', '4', '4', '4', '30.00', '', '\0', '32');
INSERT INTO `articles` VALUES ('25', '760557827962', 'PENDRIVE 32GB Transcend', '272.73', '65.00', '', 'AC', '1', '4', '4', '30.00', '', '\0', '44');
INSERT INTO `articles` VALUES ('26', '740617210712', 'Pendrive 64GB kingston', '406.90', '45.00', '', 'AC', '2', '4', '4', '30.00', '', '\0', '31');
INSERT INTO `articles` VALUES ('27', '8888021300161', 'Pilas CR2025', '15.00', '100.00', '', 'AC', '10', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('28', '8888021300185', 'Pilas CR2032', '15.00', '100.00', '', 'AC', '0', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('29', '4902580131333', 'Pilas CR1620', '15.00', '100.00', '', 'AC', '5', '4', '5', '30.00', '', '\0', '37');
INSERT INTO `articles` VALUES ('30', '8888021300192', 'Pilas CR2016', '15.00', '100.00', '', 'AC', '5', '4', '5', '30.00', '', '\0', '35');
INSERT INTO `articles` VALUES ('31', '6932667300800', 'Baterias P/Tel inalambricos Ni-Cd', '45.00', '100.00', '', 'AC', '1', '4', '6', '30.00', '', '\0', '46');
INSERT INTO `articles` VALUES ('32', '6957207500847', 'Bateria P/Tel inalambrico P-958 800 mAh', '100.00', '100.00', '', 'AC', '2', '4', '6', '30.00', '', '\0', '45');
INSERT INTO `articles` VALUES ('33', '008562009714', 'Pilas CR2450', '38.00', '100.00', '', 'AC', '2', '4', '5', '30.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('34', '6290132547601', 'Tarjeta de sonido  USB 5.1 ST-3051', '45.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '15');
INSERT INTO `articles` VALUES ('35', '091163227885', 'Mouse optico mini notebook negro', '50.00', '100.00', '\0', 'AC', '2', '4', '7', '30.00', '\0', '\0', '47');
INSERT INTO `articles` VALUES ('36', '4710268228691', 'Mouse Optico rojo Either Hand', '75.00', '100.00', '', 'AC', '2', '4', '7', '30.00', '', '\0', '47');
INSERT INTO `articles` VALUES ('37', '091163228684', 'Mouse Optico gris ', '75.00', '100.00', '', 'AC', '1', '4', '7', '30.00', '', '\0', '47');
INSERT INTO `articles` VALUES ('38', '7798135464196', 'Mouse Optico negro eurocase', '62.50', '100.00', '', 'AC', '1', '4', '7', '30.00', '', '\0', '48');
INSERT INTO `articles` VALUES ('39', '6290132547175', 'Mouse inalambrico ST-2018', '75.00', '100.00', '', 'AC', '1', '4', '7', '30.00', '', '\0', '15');
INSERT INTO `articles` VALUES ('40', '6933138610282', 'CARGADOR  P/AUTO 2 USB BLANCO', '90.00', '100.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '49');
INSERT INTO `articles` VALUES ('41', '6933138610237', 'Cargador p/auto USB negro DL-C23', '70.00', '100.00', '\0', 'AC', '4', '4', '8', '30.00', '\0', '\0', '49');
INSERT INTO `articles` VALUES ('42', 'CAR-ECO', 'Cargador P/auto economico V8', '40.00', '100.00', '', 'AC', '4', '4', '4', '30.00', '', '\0', '50');
INSERT INTO `articles` VALUES ('43', '8684121022381', 'Cargador p/celurar fast charger', '75.00', '100.00', '', 'AC', '4', '4', '4', '30.00', '', '\0', '51');
INSERT INTO `articles` VALUES ('44', 'CARG', 'Cargador p/celular sony', '75.00', '100.00', '', 'AC', '2', '4', '4', '30.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('45', '7798318653072', 'Cargador p/ celular dual Usb Car-2007', '75.00', '100.00', '', 'AC', '4', '4', '4', '30.00', '', '\0', '38');
INSERT INTO `articles` VALUES ('46', '7798318653058', 'cargador p/celular 3.1A', '75.00', '100.00', '', 'AC', '4', '4', '4', '30.00', '', '\0', '38');
INSERT INTO `articles` VALUES ('47', '6333', 'LLAVERO AUTO ', '45.00', '100.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('48', '5740', 'LLLAVERO AUTO RESPUESTOS', '45.00', '100.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('49', '4911546781284', 'Memory card Play station 64 MB', '100.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('50', '6958858521472', 'Timbre Inalambrico', '125.00', '100.00', '', 'AC', '2', '4', '6', '30.00', '', '\0', '54');
INSERT INTO `articles` VALUES ('51', '7428325564589', 'Foco led 7w blanco frio 6500k', '34.37', '60.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '55');
INSERT INTO `articles` VALUES ('52', '6942626020335', 'Soporte universal  Cel GPS', '50.00', '100.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '56');
INSERT INTO `articles` VALUES ('53', '6917573231028', 'Cargador Universal Lcd P/celular', '45.00', '100.00', '', 'AC', '2', '4', '4', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('54', 'CAR', 'Adaptador Internacional', '50.00', '100.00', '', 'AC', '2', '4', '6', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('55', '6926801908267', 'Calculadora KK-826C', '40.00', '100.00', '', 'AC', '2', '4', '7', '30.00', '', '\0', '57');
INSERT INTO `articles` VALUES ('56', '7794122005250', 'Pegamento sintetico fastix', '40.62', '60.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '58');
INSERT INTO `articles` VALUES ('57', '7794122001870', 'Masilla 2 componentes poxilina', '42.50', '100.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '60');
INSERT INTO `articles` VALUES ('58', 'LED1', 'led programable ventilador USB', '181.25', '60.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('59', '271', 'Control Remoto TV 271', '50.00', '100.00', '', 'AC', '5', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('60', '303', 'Control Remoto Tv 303', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('61', '103', 'Control Remoto TV 103', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('62', '304', 'Control Remoto TV 304', '50.00', '100.00', '', 'AC', '3', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('63', '138', 'Control Remoto TV 138', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('64', '331', 'Control Remoto 331', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('65', '250', 'Control remoto tv 250', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('66', '291', 'control remoto tv 291', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('67', '619', 'Control remoto tv 619', '50.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('68', '322', 'Control remoto tv 322 CEGESA GRIS', '50.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('69', '337', 'Control remoto tv 337 TOP HOUSE', '50.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('70', '729', 'Control remoto tV LED729', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('71', '333', 'Control remoto tv 333', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('72', '292', 'CONTROL REMOTO TV 292', '50.00', '100.00', '', 'AC', '4', '4', '3', '3.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('73', '633', 'Control remoto Tv led 633', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('74', '342', 'control remoto Tv 425', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('75', 'ADSY100', 'cONTROL REMOTO AUDIO SONY', '75.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('76', '255', 'CONTROL REMOTO tV 255', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('77', '733', 'Control Remoto tv led 733', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('78', '377', 'Control Remoto Tv 377', '60.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('79', '145', 'Control remoto tv 145', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('80', '110', 'control remo tv 110', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('81', '127', 'Control remoto tv127', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('82', '111', 'Control remoto tv 111', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('83', '117', 'Control remoto tv117', '50.00', '100.00', '', 'AC', '5', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('84', '278', 'Control remoto tv', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('85', '375', 'Control remoto tv 375', '60.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('87', '296 ', 'Control remoto TV Ken Brown Planos', '50.00', '100.00', '', 'AC', '5', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('88', '279', 'Control Remoto TV 279', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('91', '713', 'Control Remoto Tv Led 713', '100.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('92', '734', 'Control Remoto Tv led 734', '100.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('93', '611', 'Control Remoto TV led 611', '100.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('94', '720', 'Control Remoto Tv led 720', '100.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('95', '641', 'Control Remoto Tv Led 641', '100.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('96', '725', 'Control Remoto Tv Led 725', '100.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('97', '128', 'Control Remoto Tv 128', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('98', '105', 'Control Remoto TV crown Mustang', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('99', '107', 'Control Remoto Tv Crown', '50.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('100', '131', 'Control remoto Tv 131', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('102', '289', 'Control remoto Tv telefunken', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('103', '118', 'Control Remoto TV Hitachi', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('104', '294', 'Control Remoto Tv Global Home/lynx/HISHI', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('105', '133', 'ccontrol Remoto TV Philco', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('106', '202', 'Control Remoto TV admiral', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('107', '305', 'Control Remoto  TV  TCL 29', '43.80', '130.00', '', 'AC', '5', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('111', '295', 'Control Remoto Tv Hitachi1', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('112', '300', 'Control Remoto Tv PHILIPS', '60.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('113', '248', 'Control remoto tv Talent/CCE/Top House', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('114', '381', 'Control Remoto Tv Thoshiba', '50.00', '100.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('115', '612', 'Control remoto Tv LCD samsung', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('116', '614', 'Control Remoto Tv LCD Sanyo/Philco', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('117', '6965468454557', 'Cable UBS 1.30mts rosa', '20.00', '30.00', '', 'AC', '10', '4', '4', '300.00', '', '\0', '61');
INSERT INTO `articles` VALUES ('118', '7798161081275', 'Parlante Blauline 6\" B-1602k', '371.62', '51.50', '', 'AC', '4', '4', '2', '30.00', '', '\0', '23');
INSERT INTO `articles` VALUES ('119', '7790368006488', 'Parlante B52 4\" 150W WA 4131', '411.40', '50.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '10');
INSERT INTO `articles` VALUES ('120', '050036322362', 'Parlante JBL sistema GX600c', '3130.00', '30.00', '', 'AC', '0', '4', '8', '50.00', '', '\0', '17');
INSERT INTO `articles` VALUES ('121', 'P36713715F', 'Parlante 6\" xs-fb1630', '1070.00', '35.00', '', 'AC', '4', '4', '1', '50.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('122', 'P36713915H', 'Parlante 4\"', '620.00', '30.00', '', 'AC', '4', '4', '8', '50.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('123', '642', 'Control Remoto tv LCD Hisense/telefunken/noblex/ph', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('124', '644', 'Control Remoto TV LCD Bgh/hisense/telefunken/philc', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('125', '701', 'ConTrol remoto TV Led USB-Noblex', '100.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('126', '710', 'Control Remoto TV Smart LEd SAMSUNG', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('127', '613', 'Control Remoto TV  LCD Samsung', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('128', '214', 'Control Remoto Tv Generico ', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('129', '219', 'Control Remoto TV Noblex', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('130', '302', 'Control Remoto TV Sanyo/Noblex/philco/Top House', '50.00', '100.00', '', 'AC', '4', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('132', '227', 'Control REmoto Tv Philips Ps266', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('133', '104', 'Control Remoto TV Noblex/Admiral', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('135', 'HY296', 'Control REmoto Tv hundy', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('136', '277', 'ControlRemoto TV TCL/GE/BGH/Sanyo/Firsline/noblex', '50.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('137', '231', 'Control Remoto TV sony1', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('138', '153', 'Control REmoto TV Telefunken RC1123', '50.00', '100.00', '\0', 'AC', '1', '4', '3', '30.00', '\0', '\0', '16');
INSERT INTO `articles` VALUES ('139', 'CO NOG', 'Control Remoto TV Conversor Noga', '50.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('141', '244', 'Control Remoto TV  Noblex', '50.00', '100.00', '\0', 'AC', '1', '4', '3', '30.00', '\0', '\0', '16');
INSERT INTO `articles` VALUES ('142', '609', 'Control Remoto TV LCD PHILIPS', '46.68', '114.20', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('143', '639', 'Control Remoto TV LCD Philips 639', '117.90', '69.63', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('144', '625', 'Control Remoto LCD telefunken/noblex/BGH', '100.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('145', '711', 'Control Remoto Led Smart LG', '100.00', '100.00', '', 'AC', '2', '4', '13', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('146', '6934086689733', 'Control Remoto LED/LCD LG (varios modelos)', '100.00', '100.00', '', 'AC', '2', '4', '13', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('149', '622', 'Control Remoto Tv lcd Philips1', '100.00', '100.00', '\0', 'AC', '2', '4', '13', '30.00', '\0', '\0', '16');
INSERT INTO `articles` VALUES ('150', '634', 'Control Remoto TV LCD LG1', '10.00', '100.00', '', 'AC', '2', '4', '13', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('151', '812313013208', 'Auricular p/Play Station III buetooh', '150.00', '100.00', '', 'AC', '1', '4', '7', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('152', '6921338619051', 'Control Remoto Aire Acondicionado Universal', '100.00', '100.00', '', 'AC', '3', '4', '14', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('153', '6927259110189', 'Control Remoto Aire  acondicionado Universal ', '100.00', '100.00', '\0', 'AC', '3', '4', '14', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('154', '6921338623003', 'Control Remoto Universal DVD', '100.00', '100.00', '', 'AC', '1', '4', '15', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('155', '7798075660030', 'Soporte TV/DVD para pared AKTOM AKT2', '175.00', '100.00', '', 'AC', '1', '4', '16', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('156', '6925749763372', 'Cable video  P/PLAY STATIN 2', '30.00', '100.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('157', '7898556841412', 'Antena Electronica P/Auto UNIversal P/parabrisa', '115.00', '100.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('158', 'ZESO0050', 'Soporte  LCD y Pantallas LED 13 a 37\"', '195.00', '100.00', '', 'AC', '2', '4', '16', '30.00', '', '\0', '39');
INSERT INTO `articles` VALUES ('159', 'ZESO0100', 'Soporte  LCD Y LED  hasta 42\"', '200.00', '100.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '39');
INSERT INTO `articles` VALUES ('160', '897208001652', 'Soporte LCD /  LED 37 a 70 \"', '350.00', '100.00', '', 'AC', '2', '4', '16', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('161', '1234567804095', 'Soporte para LED/LCD univ 14 a 32\"', '100.00', '100.00', '', 'AC', '2', '4', '16', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('162', '7798137380791', 'Fuente multiple univ noganet', '170.68', '40.00', '', 'AC', '3', '4', '3', '30.00', '', '\0', '6');
INSERT INTO `articles` VALUES ('163', 'E', 'Estaño bobina 60/40  1 mm  500 grs', '522.31', '50.00', '', 'AC', '1', '4', '17', '30.00', '', '\0', '62');
INSERT INTO `articles` VALUES ('164', '7798137388353', 'Joystick  noganet P/PC analogo/digital', '151.16', '65.00', '', 'AC', '2', '4', '7', '30.00', '', '\0', '6');
INSERT INTO `articles` VALUES ('165', '6902361201321', 'Radio Winco W-9913', '541.10', '40.00', '', 'AC', '1', '4', '19', '30.00', '', '\0', '26');
INSERT INTO `articles` VALUES ('166', '6902361204223', 'Radio de mesa dual AM/FM  W-2005', '387.09', '40.00', '', 'AC', '2', '4', '19', '30.00', '', '\0', '26');
INSERT INTO `articles` VALUES ('167', '6902361204032', 'Radiode mesa winco Dual w-2004', '359.35', '45.00', '', 'AC', '2', '4', '19', '30.00', '', '\0', '26');
INSERT INTO `articles` VALUES ('168', 'Z', 'Zapatilla 5 Tomas c/tecla y cable 1.5mts M-IB11', '87.56', '70.00', '', 'AC', '2', '4', '3', '50.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('169', 'Z3', 'Zapatilla 5 tomas c/tecla y cable 3 mts', '99.26', '80.00', '', 'AC', '2', '4', '3', '50.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('170', '095225336003', 'Cable armado  Y 1RCAH/2RCAM', '45.30', '50.00', '', 'AC', '5', '4', '9', '30.00', '', '\0', '63');
INSERT INTO `articles` VALUES ('171', '7895870038269', 'Kit Trabapuerta Tragial/ONIX-NOVO PRISMA', '1317.00', '50.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('172', '6928026420517', 'Pinza FORD  Univ 6\"', '123.94', '50.00', '\0', 'AC', '1', '4', '8', '30.00', '\0', '\0', '58');
INSERT INTO `articles` VALUES ('173', 'G', 'Guitarra Clasica N8 tapa de abedul', '1420.13', '54.85', '', 'AC', '2', '4', '3', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('174', 'GUI', 'Guitarra clasica N8 color tapa abedul', '1466.60', '55.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('175', '884938369749', 'Estereo Pioneer DEH-X10', '2958.00', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('176', '884938369350', 'Estereo PIoneer  MVH-X30BT', '3118.00', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('177', '884938311496', 'Parlante 6 1/2\" pioneer TS-A1686S 350W', '1850.00', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('178', '884938311465', 'Parlante Pioneer  61/2\" 320 W TS-A1676S', '1600.00', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('179', '884938265799', 'Parlante Pioneer  5\" 250W TS-G1345R', '932.55', '50.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('180', '884938265669', 'Parlante Pioneer 4\" 190W TS-G1015R', '520.00', '50.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('181', '884938234825', 'Driver Pioneer 200W TS-DR250PRO', '1430.00', '50.00', '\0', 'AC', '2', '4', '9', '30.00', '\0', '\0', '1');
INSERT INTO `articles` VALUES ('182', '4905524971170', 'Parlante Sony  51/4\"240w XS-FB1330', '999.90', '50.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('183', '4905524971163', 'Parlante Sony 6\"1/2 270 W XS-FB1630', '1066.00', '50.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('184', '050036322362  500363223622 GX600C ES0079\'FE0004525', 'Sistema de sonido JBL 210W 6\"1/2 GX600C', '3133.33', '50.00', '', 'AC', '1', '4', '9', '30.00', '', '\0', '17');
INSERT INTO `articles` VALUES ('185', '884938309325', 'Estereo Pioneer DEH-X1850UB', '1900.00', '50.00', '', 'AC', '2', '4', '1', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('186', '884938309561', 'Estereo Pioneer DEH-X4850BT', '3400.00', '50.00', '', 'AC', '2', '4', '1', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('187', '884938344883', 'Estereo Pioneer AVH-295BT', '6330.00', '50.00', '', 'AC', '2', '4', '1', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('188', '050036322140 500363221406 GT7\'6C ME3046\'GE0006708', 'Sistema JBL GT7-6C', '2532.00', '50.00', '', 'AC', '1', '4', '9', '30.00', '', '\0', '17');
INSERT INTO `articles` VALUES ('189', '050036322119 500363221192 GT7\'96 ME3043\'JF0022428', 'Parlante  JBL 6 x 9\" GT7-96', '1428.00', '40.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '17');
INSERT INTO `articles` VALUES ('190', 'P36713515D S010000000T 4905524971118', 'Parlante Sony  6 x 9\" XS-FB6930', '1714.00', '40.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('191', '884938311694', 'Parlante Pioneer 6  x 9\" TS-A6996R 650W', '1933.33', '50.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '13');
INSERT INTO `articles` VALUES ('192', '884938311649', 'Parlante Pioneer TS-A6976S 550W', '1666.66', '50.00', '', 'AC', '4', '4', '2', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('193', '884938311625', 'Parlante Pioneer  6 x 9\" TS-A6966S 420W', '1480.00', '50.00', '', 'AC', '4', '4', '2', '30.00', '', '\0', '1');
INSERT INTO `articles` VALUES ('194', '4010001049423', 'Parlante Blaupunkt  4\"x 6\" GTx 462 SC 160W', '650.00', '50.00', '', 'AC', '1', '4', '2', '30.00', '', '\0', '20');
INSERT INTO `articles` VALUES ('195', '696859263927', 'Estereo DTI mod-CE6113BT', '1300.00', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('196', '12v-46', 'Bateria auto champion 190x175x175', '1999.99', '25.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('197', '12v-60', 'Bateria auto champions 240x175x175', '1784.25', '25.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('198', '12v-70', 'Bateria auto champion 240x175x175', '2055.55', '33.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('199', '12v-75', 'Bateria auto champions 260x175x175', '2220.75', '33.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '54');
INSERT INTO `articles` VALUES ('200', '12v-85', 'Bateria auto champions (toyota)260x170x205', '2816.25', '34.00', '', 'AC', '1', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('201', '12v-90', 'Bateria auto champions (4x4)300x170x200', '3105.75', '33.88', '', 'AC', '1', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('202', '12v-90AMAROK', 'Bateria auto champion (amarok) 300x170x200 ', '3435.00', '35.00', '', 'AC', '1', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('203', '12v-100Mb', 'Bateria auto champion 335x165x186', '3966.75', '34.00', '', 'AC', '1', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('204', '7798318655977', 'Foco led c/efecto luminosos inova', '75.00', '166.55', '', 'AC', '5', '4', '20', '30.00', '', '\0', '38');
INSERT INTO `articles` VALUES ('205', '12V-100I', 'Bateria auto champion 350x175x210', '3999.45', '34.00', '', 'AC', '1', '4', '12', '10.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('206', '12v-110 cat', 'Bateria auto champions 330x175x220', '3874.75', '35.00', '', 'AC', '1', '4', '12', '15.00', '', '\0', '28');
INSERT INTO `articles` VALUES ('207', '12v-46HARBAT', 'Bat. auto HARBAT 190X175X175', '1495.50', '33.58', '', 'AC', '2', '4', '12', '15.00', '', '\0', '29');
INSERT INTO `articles` VALUES ('208', '12V-55HARBAT', 'Bat .auto HARBAT 240X175X175', '1365.75', '35.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '29');
INSERT INTO `articles` VALUES ('209', '12V-70HARBAT', 'Bat.auto HARBAT 240x175x175', '1461.00', '35.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '29');
INSERT INTO `articles` VALUES ('210', '12v-70R', 'Bat.auto HARDBAT reforzada 240x175x175', '1658.25', '35.00', '', 'AC', '2', '4', '12', '15.00', '', '\0', '29');
INSERT INTO `articles` VALUES ('211', '12501000', 'Sirena piezo electrica POSITRON SI700', '152.84', '65.00', '', 'AC', '2', '4', '23', '30.00', '', '\0', '12');
INSERT INTO `articles` VALUES ('212', '7897789643114 ', 'Alarma para auto cyber Px 360BT EXP PST', '1511.40', '45.00', '', 'AC', '2', '4', '24', '30.00', '', '\0', '12');
INSERT INTO `articles` VALUES ('213', '7897789643121', 'Alarma para auto Cyber FX 360 EXP pst', '1269.12', '45.00', '', 'AC', '2', '4', '24', '30.00', '', '\0', '12');
INSERT INTO `articles` VALUES ('214', 'CONTR', 'Controlador GBR PRO DJ 100 MK II', '2761.40', '43.00', '', 'AC', '2', '4', '2', '30.00', '', '\0', '7');
INSERT INTO `articles` VALUES ('215', 'CONTR DJ', 'Controlador  GBR PRO DJ 200', '4418.90', '42.00', '', 'AC', '1', '4', '6', '30.00', '', '\0', '7');
INSERT INTO `articles` VALUES ('216', 'BA', 'Bafle  GBR  2 vias 15\" 300W 1BG-PA1570', '3661.30', '50.00', '', 'AC', '2', '4', '19', '30.00', '', '\0', '7');
INSERT INTO `articles` VALUES ('217', '740617245974', 'Tarjeta de memoria 16 GB Kingston', '210.00', '30.00', '', 'AC', '4', '4', '6', '25.00', '', '\0', '31');
INSERT INTO `articles` VALUES ('218', '798302055766 1154U5170605608', 'Router inalambrico  NEXXT mod-NyX150', '296.74', '45.00', '', 'AC', '2', '4', '7', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('219', '798302055780 4904U3170601214', 'Router Inalmb. NEXXT nebula1200AC', '875.30', '45.00', '', 'AC', '2', '4', '7', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('220', '619659067021', 'Tarjeta de memoria 8GB SanDisk', '144.10', '55.90', '\0', 'AC', '5', '4', '4', '25.00', '\0', '\0', '32');
INSERT INTO `articles` VALUES ('221', '5907581253031', 'Fuente  switching 9 v 1500 mA mod FS91500', '151.00', '50.00', '', 'AC', '2', '4', '18', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('222', '6932667300794', 'Bateria FOREVER TELEFONICAS  3 AA3.6V 700mH', '68.00', '50.00', '', 'AC', '1', '4', '6', '30.00', '', '\0', '46');
INSERT INTO `articles` VALUES ('223', 'TL640', 'Bateria de gel  6V TELONG', '112.31', '50.00', '', 'AC', '2', '4', '12', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('224', 'CA', 'Cable rextone plug 6.5 mn a plug 6.5 mn 6 mts', '140.60', '50.00', '', 'AC', '2', '4', '1', '30.00', '', '\0', '42');
INSERT INTO `articles` VALUES ('225', 'ZM', 'Zapatilla multiforma INDEPLAS S/Cable', '86.36', '50.00', '', 'AC', '4', '4', '5', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('226', 'PI', 'Pinza Grimpar de impacto TOBAX  TBX-HY5085', '174.40', '50.00', '', 'AC', '1', '4', '3', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('227', '4971850135562', 'Calculadora cientifica CASIO FX-95MS 244 funciones', '444.00', '40.00', '', 'AC', '2', '4', '7', '20.00', '', '\0', '19');
INSERT INTO `articles` VALUES ('228', '4971850137931', 'Calculadora Cientifica CASIO FX-82MS 240 Func.', '357.13', '50.00', '', 'AC', '1', '4', '7', '30.00', '', '\0', '19');
INSERT INTO `articles` VALUES ('229', 'DFE11170924', 'Potencia digital DK600 Soung Magus', '2668.00', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '22');
INSERT INTO `articles` VALUES ('230', 'MICRO1', 'Microfono inalambrico GBR PRO-158', '993.40', '50.00', '', 'AC', '2', '4', '25', '30.00', '', '\0', '7');
INSERT INTO `articles` VALUES ('231', 'MICRO2', 'Microfono inalambrico GBR PRO-258', '1512.75', '50.00', '', 'AC', '2', '4', '25', '30.00', '', '\0', '7');
INSERT INTO `articles` VALUES ('232', '7798130906530', 'Celular PANACOM MP-1103', '449.99', '90.00', '', 'AC', '2', '4', '30', '30.00', '', '\0', '64');
INSERT INTO `articles` VALUES ('233', '7798130906387', 'celular PANACOM  MP-1103 ', '449.99', '90.00', '', 'AC', '2', '4', '30', '45.00', '', '\0', '64');
INSERT INTO `articles` VALUES ('234', 'LU', 'Luces efecto multicolor 18l OSR', '340.00', '135.00', '', 'AC', '2', '4', '20', '45.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('235', 'AKTOM', 'Soporte TV y Video 42', '390.00', '60.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('236', 'CON', 'Consola Mixer 4 Canales 4150UB', '2580.00', '55.00', '', 'AC', '2', '4', '31', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('237', '7897789624526', 'Control P/alarma auto PST UNIV', '300.00', '50.00', '', 'AC', '3', '4', '8', '40.00', '', '\0', '12');
INSERT INTO `articles` VALUES ('238', '4050300001470', ' Lamparas p/auto OSRAM H4 60/55 W P43t- 64193- 472', '57.40', '60.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '3');
INSERT INTO `articles` VALUES ('239', '5907738195037', 'Lampara KOBO H11   12v 55w', '87.93', '60.00', '', 'AC', '2', '4', '8', '79.58', '', '\0', '52');
INSERT INTO `articles` VALUES ('240', '4008321650894', 'Lampara H4 COOL BLUE INTENSE  60/55W 12v 60/55w', '171.56', '55.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('241', '7798036029548', 'Escobilla  16', '72.67', '55.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('242', '7798036029586', 'Escobilla de 19', '70.58', '70.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('243', '7798036029579', 'Escobilla de 18', '76.80', '50.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('244', '7798036029609', 'Escobilla de 21', '96.31', '50.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('245', '7798036029616', 'Escobilla de 22 Universal', '105.17', '50.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('246', 'CN-07', 'Conectores CN-07 multiples usos', '26.62', '50.00', '', 'AC', '10', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('247', 'CN-03', ' Adapatador Estereo auto DOBLE MACHO ISODIN', '15.99', '245.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('248', 'FU', 'Portafusible trooner ', '68.00', '65.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('249', 'PUL', 'Pulsadores trooner  AP-13 ', '36.30', '50.00', '', 'AC', '5', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('250', 'PUL7', 'Pulsadores trooner AP-07', '29.00', '50.00', '', 'AC', '5', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('251', 'PUL3', 'Pulsadores trooner AP-03', '14.52', '100.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('252', 'GAV', 'Gaveta Ecosport-ford', '136.00', '50.00', '\0', 'AC', '3', '4', '8', '30.00', '\0', '\0', '16');
INSERT INTO `articles` VALUES ('253', 'TER', 'Termocontrible ATC1', '22.90', '50.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('254', 'TER2', 'Termocontraible ATC2', '29.04', '50.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('255', 'FP', 'Frente estero CHevrolet-aveo/captiva/lova/ gentra ', '425.00', '50.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('256', '254', 'Control remoto TV LG 2453', '40.51', '150.00', '', 'AC', '2', '4', '3', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('257', 'PC1080', 'Tweeters  bocina rectang. HL 388', '65.00', '100.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('258', 'PC1090', 'tweerters bocina rectang 265 x 100\"', '69.99', '100.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '16');
INSERT INTO `articles` VALUES ('259', '7912103007196', 'baliza bici  JPK-719', '15.00', '100.00', '', 'AC', '2', '4', '32', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('260', '869767142924', 'Lector de tarjeta SIYOTEAM USB', '30.00', '100.00', '', 'AC', '2', '4', '32', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('261', 'FPA-15', 'Parlante FOXTEX 15', '538.61', '86.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('262', 'COR', 'Corneta/bocina  p/driver LC14-25 larga roja', '99.31', '51.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('263', 'COA', 'Corneta/bocina p/driver larga  amarilla', '93.20', '60.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('264', 'COB', 'Corneta/bocina p/ driver  larga blanca', '93.20', '61.00', '', 'AC', '1', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('265', 'COV', 'Corneta/bocina PERMAK p/driver larga verde', '93.20', '61.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('266', 'CORN', 'Corneta/bocina p/driver  PERMAK corta negra', '55.45', '170.50', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('267', 'COCR', 'Corneta/bocina p/driver corta roja', '93.20', '61.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('268', 'COCA', 'Corneta/bocina p/driver corta azul', '93.20', '61.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('269', 'COCAM', 'Corneta/bocina p/driver corta amarilla', '93.20', '61.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('271', 'COCB', 'Corneta/bocina/p/driver corta blanca', '93.20', '61.00', '', 'AC', '2', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('272', '7897183020351', 'Driver Bomber  DB200X o omhs 100w 75rms', '352.75', '50.00', '', 'AC', '4', '4', '9', '30.00', '', '\0', '11');
INSERT INTO `articles` VALUES ('273', 'FBLAULINE', 'Portafusible BLAULINE   KTB-106', '93.20', '72.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '23');
INSERT INTO `articles` VALUES ('274', 'F001', 'Portafusible BLAULINE  KTB-001 4GA', '171.06', '50.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '23');
INSERT INTO `articles` VALUES ('275', 'MHUMO', 'Maquina de humo macrolite DF-900 led 900w', '1916.61', '40.00', '', 'AC', '1', '4', '20', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('276', 'FP-8', 'Parlante FOXTEX 8 \"', '192.91', '107.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('277', 'FU150A', 'Fusible blauline KTB-048 150 A', '22.42', '78.00', '', 'AC', '2', '4', '9', '30.00', '', '\0', '23');
INSERT INTO `articles` VALUES ('278', '7798137388544 EK\'1021', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '50.00', '', 'AC', '1', '4', '7', '30.00', '', '\0', '6');
INSERT INTO `articles` VALUES ('279', 'COLN', 'Corneta/bocina p/driver  larga negra', '57.81', '160.00', '', 'AC', '4', '4', '8', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('280', '707565003940', 'Decodificar p/TDA  MEGALITE', '744.77', '103.00', '', 'AC', '2', '4', '3', '20.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('281', 'H-163', 'Receptor Bluetooth h-163', '110.00', '130.00', '', 'AC', '4', '4', '8', '50.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('282', '7798130906394', 'Celular panacom  MP-1103 azul', '450.00', '90.00', '', 'AC', '2', '4', '4', '40.00', '', '\0', '64');
INSERT INTO `articles` VALUES ('283', 'BC', 'Fuente de alimentacion 6 V 0.5A Zurich', '192.00', '50.00', '', 'AC', '2', '4', '32', '25.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('284', 'F15', 'Fuente de alimenTacion 15 V 2.0A APD', '230.00', '55.00', '', 'AC', '1', '4', '18', '25.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '68.00', '', 'AC', '1', '4', '8', '35.00', '', '\0', '2');
INSERT INTO `articles` VALUES ('286', '7790368024765', 'Auriculares profe. SKP  PH-350', '471.80', '50.00', '', 'AC', '2', '4', '32', '35.00', '', '\0', '4');
INSERT INTO `articles` VALUES ('287', '7790368029906', ' Parlantes  6x9', '851.70', '50.00', '', 'AC', '2', '4', '9', '40.00', '', '\0', '10');
INSERT INTO `articles` VALUES ('288', '7790368023560', 'Potencia   SKP audio-pro MAXG-1220x', '9316.90', '45.00', '', 'AC', '1', '4', '33', '40.00', '', '\0', '4');
INSERT INTO `articles` VALUES ('289', '7790368029890', ' Parlante  6\" B52  WA-6192', '612.13', '50.00', '', 'AC', '2', '4', '9', '40.00', '', '\0', '10');
INSERT INTO `articles` VALUES ('290', '7790368027384', 'Consola amplificada SKP VZ-40 II 1600 W', '6122.48', '50.00', '', 'AC', '1', '4', '31', '40.00', '', '\0', '4');
INSERT INTO `articles` VALUES ('291', 'AUTOCAR020', 'Motor p/porton  500 classic-SEG', '3049.62', '40.00', '', 'AC', '2', '4', '34', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '40.00', '', 'AC', '2', '4', '35', '30.00', '', '\0', '52');
INSERT INTO `articles` VALUES ('293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '40.00', '', 'AC', '2', '4', '35', '30.00', '', '\0', '52');

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `cajaId` int(11) NOT NULL AUTO_INCREMENT,
  `cajaApertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cajaCierre` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `cajaImpApertura` decimal(10,2) NOT NULL,
  `cajaImpVentas` decimal(10,2) DEFAULT NULL,
  `cajaImpRendicion` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cajaId`),
  KEY `usrId` (`usrId`) USING BTREE,
  CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES ('1', '2018-05-04 00:02:49', '2018-05-04 00:17:16', '9', '1.00', '3052.32', '10.00');
INSERT INTO `cajas` VALUES ('2', '2018-05-04 00:18:19', '2018-05-14 15:00:50', '9', '0.01', '12543.96', '0.10');
INSERT INTO `cajas` VALUES ('3', '2018-05-14 14:58:40', '2018-05-14 15:00:31', '4', '10.00', '0.00', '11.11');
INSERT INTO `cajas` VALUES ('4', '2018-05-14 14:58:49', '2018-05-14 15:00:39', '4', '100.00', '0.00', '0.11');
INSERT INTO `cajas` VALUES ('5', '2018-05-14 15:00:57', '2018-05-23 10:48:29', '4', '0.10', '4032.00', '700.00');
INSERT INTO `cajas` VALUES ('6', '2018-05-23 11:19:29', '2018-05-23 11:28:55', '4', '700.00', '11208.74', '1900.00');
INSERT INTO `cajas` VALUES ('7', '2018-05-23 14:38:00', '2018-06-01 14:47:11', '4', '10.00', '31745.19', '1.22');
INSERT INTO `cajas` VALUES ('8', '2018-06-01 14:51:47', '2018-06-05 15:07:11', '4', '100.00', '471.31', '1000.00');
INSERT INTO `cajas` VALUES ('9', '2018-06-05 15:07:48', '2018-06-05 15:14:08', '4', '10.00', '0.00', '10.00');
INSERT INTO `cajas` VALUES ('10', '2018-06-05 15:17:02', '2018-06-05 15:55:44', '4', '1.00', '706.08', '100.00');
INSERT INTO `cajas` VALUES ('11', '2018-06-05 15:55:54', '2018-06-05 15:59:13', '4', '300.00', '624.76', '500.00');
INSERT INTO `cajas` VALUES ('12', '2018-06-05 16:18:52', '2018-06-18 12:19:51', '4', '0.01', '0.00', '11.11');
INSERT INTO `cajas` VALUES ('13', '2018-06-18 12:19:59', '2018-06-18 12:21:00', '4', '6.00', '0.00', '1.00');
INSERT INTO `cajas` VALUES ('14', '2018-06-27 14:22:38', null, '4', '0.01', null, null);

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `cliId` int(11) NOT NULL AUTO_INCREMENT,
  `cliNombre` varchar(100) NOT NULL,
  `cliApellido` varchar(100) NOT NULL,
  `docId` int(11) DEFAULT NULL,
  `cliDocumento` varchar(14) DEFAULT NULL,
  `cliDomicilio` varchar(255) DEFAULT NULL,
  `cliTelefono` varchar(255) DEFAULT NULL,
  `cliMail` varchar(100) DEFAULT NULL,
  `cliEstado` varchar(2) DEFAULT NULL,
  `cliDefault` bit(1) DEFAULT b'0',
  PRIMARY KEY (`cliId`),
  UNIQUE KEY `docId` (`docId`,`cliDocumento`) USING BTREE,
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`docId`) REFERENCES `tipos_documentos` (`docId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Consumidor Final', '', '1', '', '', '', '', 'AC', '');
INSERT INTO `clientes` VALUES ('2', 'Sergio', 'Moyano', '1', '31324208', '', '', '', 'AC', '\0');

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `validezpresupuesto` int(11) DEFAULT NULL,
  `title1` varchar(15) DEFAULT NULL,
  `title2` varchar(15) DEFAULT NULL,
  `cotizacionDolar` decimal(10,2) DEFAULT '1.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
INSERT INTO `configuracion` VALUES ('5', 'Adolfo', 'Fernandez', '23.00');

-- ----------------------------
-- Table structure for cuentacorrientecliente
-- ----------------------------
DROP TABLE IF EXISTS `cuentacorrientecliente`;
CREATE TABLE `cuentacorrientecliente` (
  `cctepId` int(11) NOT NULL AUTO_INCREMENT,
  `cctepConcepto` varchar(50) NOT NULL,
  `cctepRef` int(11) DEFAULT NULL,
  `cctepTipo` varchar(2) NOT NULL,
  `cctepDebe` decimal(14,2) DEFAULT NULL,
  `cctepHaber` decimal(14,2) DEFAULT NULL,
  `cctepFecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cliId` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `cajaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cctepId`),
  KEY `cliId` (`cliId`) USING BTREE,
  KEY `usrId` (`usrId`) USING BTREE,
  KEY `cajaId` (`cajaId`),
  CONSTRAINT `cuentacorrientecliente_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `clientes` (`cliId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrientecliente_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrientecliente_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuentacorrientecliente
-- ----------------------------
INSERT INTO `cuentacorrientecliente` VALUES ('1', 'Venta: 14', '14', 'VN', '68.00', null, '2018-04-12 14:17:25', '1', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('2', 'Venta: 15', '15', 'VN', '300.00', null, '2018-04-13 17:32:41', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('3', 'Venta: 15', '15', 'VN', '300.00', null, '2018-04-13 17:32:41', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('4', 'Venta: 16', '16', 'VN', '238.00', null, '2018-04-13 17:45:16', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('5', 'pago', null, 'MN', '0.00', '500.00', '2018-04-17 20:11:15', '2', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('6', 'pago', null, 'MN', '0.00', '150.00', '2018-04-17 20:27:30', '2', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('7', 'prestamo', null, 'MN', '500.00', '0.00', '2018-04-17 20:28:07', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('8', 'pago recibo 12132', null, 'MN', '0.00', '400.00', '2018-04-17 20:50:01', '2', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('9', 'prestam adnansdasd', null, 'MN', '1000.00', '0.00', '2018-04-17 20:50:36', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('10', 'sdfsdf', null, 'MN', '0.00', '2000.00', '2018-04-17 20:51:24', '2', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('11', 'xgdgdgf', null, 'MN', '3000.00', '0.00', '2018-04-17 20:51:59', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('12', 'interes', null, 'MN', '700.00', '0.00', '2018-04-17 20:52:22', '2', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('13', 'Venta: 31', '31', 'VN', '246.00', null, '2018-04-18 17:23:40', '1', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('14', 'Venta: 35', '35', 'VN', '246.00', null, '2018-04-18 17:25:37', '1', '4', null);
INSERT INTO `cuentacorrientecliente` VALUES ('15', 'Venta: 36', '36', 'VN', '246.00', null, '2018-04-18 17:34:18', '1', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('16', 'Venta: 37', '37', 'VN', '246.00', null, '2018-04-18 17:35:11', '1', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('17', 'Venta: 38', '38', 'VN', '246.00', null, '2018-04-18 17:35:54', '1', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('18', 'Venta: 41', '41', 'VN', '246.00', null, '2018-04-18 17:36:54', '1', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('19', 'Venta: 47', '47', 'VN', '272.65', null, '2018-04-18 17:50:01', '1', '4', '1');
INSERT INTO `cuentacorrientecliente` VALUES ('20', 'pago adelantado', null, 'MN', '0.00', '600.00', '2018-05-02 16:34:34', '6', '4', '5');
INSERT INTO `cuentacorrientecliente` VALUES ('21', 'Venta: 72', '72', 'VN', '60.00', null, '2018-05-03 21:39:48', '2', '9', '2');
INSERT INTO `cuentacorrientecliente` VALUES ('22', 'Cancelar', null, 'MN', '0.00', '3048.00', '2018-05-03 21:40:46', '2', '9', '2');
INSERT INTO `cuentacorrientecliente` VALUES ('23', 'Venta: 73', '73', 'VN', '202.50', null, '2018-05-03 21:41:32', '2', '9', '2');
INSERT INTO `cuentacorrientecliente` VALUES ('24', 'Venta: 89', '89', 'VN', '77.24', null, '2018-05-23 11:28:11', '1', '4', '6');
INSERT INTO `cuentacorrientecliente` VALUES ('25', 'Venta: 140', '140', 'VN', '201.60', null, '2018-07-10 19:57:17', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('26', '-1', '145', 'VN', '2087.00', null, '2018-07-20 14:42:05', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('27', '-1', '146', 'VN', '208.70', null, '2018-07-23 10:34:38', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('28', '-1', '147', 'VN', '2822.80', null, '2018-07-23 10:37:28', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('29', '-1', '147', 'VN', '2822.80', null, '2018-07-23 10:37:28', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('30', '-1', '147', 'VN', '2822.80', null, '2018-07-23 10:37:28', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('31', '-1', '148', 'VN', '3993.28', null, '2018-07-23 10:46:17', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('32', '-1', '150', 'VN', '193.69', null, '2018-07-24 14:35:00', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('33', 'Venta: 151', '151', 'VN', '6274.84', null, '2018-07-24 14:42:20', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('34', '-1', '152', 'VN', '162.00', null, '2018-07-24 14:44:11', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('35', 'Venta: 153', '153', 'VN', '162.00', null, '2018-07-24 14:45:27', '2', '4', '14');
INSERT INTO `cuentacorrientecliente` VALUES ('36', 'asdadsa', null, 'MN', '0.00', '122.22', '2018-07-24 14:57:21', '2', '4', '14');

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
  KEY `cajaId` (`cajaId`) USING BTREE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_1` FOREIGN KEY (`prvId`) REFERENCES `proveedores` (`prvId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuentacorrienteproveedor
-- ----------------------------
INSERT INTO `cuentacorrienteproveedor` VALUES ('1', 'Recepción Remito X número: 1', '4', 'RC', '0.00', null, '2018-02-28 00:00:00', '1', '4', null);
INSERT INTO `cuentacorrienteproveedor` VALUES ('2', 'Recepción Factura A número: 0003-0008195', '5', 'RC', '1679.93', null, '2018-02-23 00:00:00', '2', '9', null);
INSERT INTO `cuentacorrienteproveedor` VALUES ('3', 'Recepción Factura A número: 0002-0002890', '32', 'RC', '29397.59', null, '2018-04-10 00:00:00', '16', '4', null);
INSERT INTO `cuentacorrienteproveedor` VALUES ('4', 'Pago ', null, 'MN', '0.00', '123.33', '2018-07-11 16:37:16', '16', '4', '14');
INSERT INTO `cuentacorrienteproveedor` VALUES ('5', 'Recepción Factura A número: 0016-0003250', '31', 'RC', '45748.60', null, '2018-04-10 00:00:00', '15', '4', null);
INSERT INTO `cuentacorrienteproveedor` VALUES ('6', 'asdqwqe', null, 'MN', '0.00', '1233.33', '2018-07-24 14:40:13', '15', '4', '14');

-- ----------------------------
-- Table structure for ivaalicuotas
-- ----------------------------
DROP TABLE IF EXISTS `ivaalicuotas`;
CREATE TABLE `ivaalicuotas` (
  `ivaId` int(11) NOT NULL AUTO_INCREMENT,
  `ivaDescripcion` varchar(20) NOT NULL,
  `ivaPorcentaje` decimal(10,2) NOT NULL,
  `ivaEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `ivaPorDefecto` bigint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ivaId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ivaalicuotas
-- ----------------------------
INSERT INTO `ivaalicuotas` VALUES ('1', 'Exen', '0.00', 'AC', '0');
INSERT INTO `ivaalicuotas` VALUES ('2', 'No Grav', '0.00', 'AC', '0');
INSERT INTO `ivaalicuotas` VALUES ('3', '10,5%', '10.50', 'AC', '0');
INSERT INTO `ivaalicuotas` VALUES ('4', '21%', '21.00', 'AC', '1');
INSERT INTO `ivaalicuotas` VALUES ('5', '27%', '27.00', 'AC', '0');

-- ----------------------------
-- Table structure for listadeprecios
-- ----------------------------
DROP TABLE IF EXISTS `listadeprecios`;
CREATE TABLE `listadeprecios` (
  `lpId` int(11) NOT NULL AUTO_INCREMENT,
  `lpDescripcion` varchar(50) NOT NULL,
  `lpDefault` bit(1) NOT NULL DEFAULT b'0',
  `lpMargen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lpEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`lpId`),
  UNIQUE KEY `lpDescripcion` (`lpDescripcion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listadeprecios
-- ----------------------------
INSERT INTO `listadeprecios` VALUES ('1', 'Contado', '', '0.00', 'AC');
INSERT INTO `listadeprecios` VALUES ('2', 'Visa x 3', '\0', '20.00', 'AC');

-- ----------------------------
-- Table structure for marcaart
-- ----------------------------
DROP TABLE IF EXISTS `marcaart`;
CREATE TABLE `marcaart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of marcaart
-- ----------------------------
INSERT INTO `marcaart` VALUES ('53', '6333');
INSERT INTO `marcaart` VALUES ('5', 'ARWEN');
INSERT INTO `marcaart` VALUES ('41', 'AUDIOPIPE');
INSERT INTO `marcaart` VALUES ('10', 'B52');
INSERT INTO `marcaart` VALUES ('23', 'BLAULINE');
INSERT INTO `marcaart` VALUES ('20', 'BLAUPUNKT');
INSERT INTO `marcaart` VALUES ('11', 'BOMBER');
INSERT INTO `marcaart` VALUES ('19', 'CASIO');
INSERT INTO `marcaart` VALUES ('28', 'CHAMPION');
INSERT INTO `marcaart` VALUES ('54', 'DOORBELL');
INSERT INTO `marcaart` VALUES ('63', 'DS18');
INSERT INTO `marcaart` VALUES ('35', 'ENERGIZER');
INSERT INTO `marcaart` VALUES ('48', 'EUROCASE');
INSERT INTO `marcaart` VALUES ('34', 'EVERADY');
INSERT INTO `marcaart` VALUES ('62', 'EXIMETAL');
INSERT INTO `marcaart` VALUES ('58', 'FASTIX');
INSERT INTO `marcaart` VALUES ('46', 'FOREVER');
INSERT INTO `marcaart` VALUES ('43', 'FULLTOTAL');
INSERT INTO `marcaart` VALUES ('14', 'GAMA');
INSERT INTO `marcaart` VALUES ('7', 'GBR');
INSERT INTO `marcaart` VALUES ('47', 'GENIUS');
INSERT INTO `marcaart` VALUES ('59', 'GOTITA');
INSERT INTO `marcaart` VALUES ('29', 'HARDBAT');
INSERT INTO `marcaart` VALUES ('56', 'HOLDER');
INSERT INTO `marcaart` VALUES ('38', 'INOVA');
INSERT INTO `marcaart` VALUES ('17', 'JBL');
INSERT INTO `marcaart` VALUES ('57', 'KARUIDA');
INSERT INTO `marcaart` VALUES ('31', 'KINGSTON');
INSERT INTO `marcaart` VALUES ('49', 'LDNIO');
INSERT INTO `marcaart` VALUES ('9', 'LG');
INSERT INTO `marcaart` VALUES ('40', 'lOCH');
INSERT INTO `marcaart` VALUES ('55', 'MACROLED');
INSERT INTO `marcaart` VALUES ('36', 'MAKAO');
INSERT INTO `marcaart` VALUES ('21', 'MATRIX');
INSERT INTO `marcaart` VALUES ('37', 'MAXELL');
INSERT INTO `marcaart` VALUES ('45', 'MEGALITE');
INSERT INTO `marcaart` VALUES ('27', 'MOURA');
INSERT INTO `marcaart` VALUES ('6', 'NOGA');
INSERT INTO `marcaart` VALUES ('3', 'OSRAM');
INSERT INTO `marcaart` VALUES ('64', 'PANACOM');
INSERT INTO `marcaart` VALUES ('25', 'PANASONIC');
INSERT INTO `marcaart` VALUES ('18', 'PEAVY');
INSERT INTO `marcaart` VALUES ('24', 'PHILIPS');
INSERT INTO `marcaart` VALUES ('1', 'PIONEER');
INSERT INTO `marcaart` VALUES ('12', 'POSITRON');
INSERT INTO `marcaart` VALUES ('60', 'POXILINA');
INSERT INTO `marcaart` VALUES ('42', 'REXTONE');
INSERT INTO `marcaart` VALUES ('8', 'SAMSON');
INSERT INTO `marcaart` VALUES ('51', 'SAMSUNG');
INSERT INTO `marcaart` VALUES ('32', 'SANDISK');
INSERT INTO `marcaart` VALUES ('15', 'SEISA');
INSERT INTO `marcaart` VALUES ('61', 'sin marca');
INSERT INTO `marcaart` VALUES ('4', 'SKP');
INSERT INTO `marcaart` VALUES ('2', 'SONY');
INSERT INTO `marcaart` VALUES ('22', 'SOUND MAGUS');
INSERT INTO `marcaart` VALUES ('33', 'SPEAKER');
INSERT INTO `marcaart` VALUES ('44', 'TRANSCEND');
INSERT INTO `marcaart` VALUES ('16', 'TROONER');
INSERT INTO `marcaart` VALUES ('52', 'VARIAS');
INSERT INTO `marcaart` VALUES ('30', 'VERBATIM');
INSERT INTO `marcaart` VALUES ('50', 'WGMCELL');
INSERT INTO `marcaart` VALUES ('26', 'WINCO');
INSERT INTO `marcaart` VALUES ('13', 'ZEBRA');
INSERT INTO `marcaart` VALUES ('39', 'ZELTA');

-- ----------------------------
-- Table structure for mediosdepago
-- ----------------------------
DROP TABLE IF EXISTS `mediosdepago`;
CREATE TABLE `mediosdepago` (
  `medId` int(11) NOT NULL AUTO_INCREMENT,
  `medCodigo` varchar(3) NOT NULL,
  `medDescripcion` varchar(50) NOT NULL,
  `tmpId` int(11) NOT NULL,
  `medEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`medId`),
  UNIQUE KEY `medCodigo` (`medCodigo`) USING BTREE,
  UNIQUE KEY `medDescripcion` (`medDescripcion`) USING BTREE,
  KEY `tmpId` (`tmpId`) USING BTREE,
  CONSTRAINT `mediosdepago_ibfk_1` FOREIGN KEY (`tmpId`) REFERENCES `tipomediopago` (`tmpId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mediosdepago
-- ----------------------------
INSERT INTO `mediosdepago` VALUES ('1', 'EFE', 'Efectivo', '1', 'AC');
INSERT INTO `mediosdepago` VALUES ('2', 'VIS', 'Visa', '2', 'AC');
INSERT INTO `mediosdepago` VALUES ('3', 'MAS', 'MasterCard', '2', 'AC');
INSERT INTO `mediosdepago` VALUES ('4', 'NEV', 'Nevada', '2', 'AC');
INSERT INTO `mediosdepago` VALUES ('5', 'DAT', 'Data', '2', 'AC');
INSERT INTO `mediosdepago` VALUES ('6', 'CRA', 'Credito Argentino', '3', 'AC');
INSERT INTO `mediosdepago` VALUES ('7', 'CCT', 'Cuenta Corriente', '4', 'AC');

-- ----------------------------
-- Table structure for orden
-- ----------------------------
DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `oFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lpId` int(11) NOT NULL,
  `lpPorcentaje` decimal(10,2) NOT NULL,
  `venId` int(11) NOT NULL,
  `cliId` int(11) NOT NULL,
  `oDescuento` decimal(14,2) NOT NULL DEFAULT '0.00',
  `oEsPresupuesto` bit(1) DEFAULT NULL,
  `oEsVenta` bit(1) DEFAULT NULL,
  `oEsPlanReserva` bit(1) DEFAULT NULL,
  `oEsMayorista` bit(1) DEFAULT NULL,
  `cajaId` int(11) DEFAULT NULL,
  `oEstado` varchar(2) DEFAULT 'AC',
  PRIMARY KEY (`oId`),
  KEY `lpId` (`lpId`),
  KEY `venId` (`venId`),
  KEY `cliId` (`cliId`),
  KEY `cajaId` (`cajaId`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`lpId`) REFERENCES `listadeprecios` (`lpId`) ON UPDATE CASCADE,
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`venId`) REFERENCES `vendedores` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`cliId`) REFERENCES `clientes` (`cliId`) ON UPDATE CASCADE,
  CONSTRAINT `orden_ibfk_4` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orden
-- ----------------------------
INSERT INTO `orden` VALUES ('54', '2018-05-03 21:09:19', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('55', '2018-05-03 21:10:56', '1', '0.00', '2', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('56', '2018-05-03 21:11:10', '1', '0.00', '2', '1', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('57', '2018-05-03 21:11:46', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('58', '2018-05-03 21:11:47', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('59', '2018-05-03 21:11:49', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('60', '2018-05-03 21:11:50', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('61', '2018-05-03 21:11:52', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('62', '2018-05-03 21:11:53', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('63', '2018-05-03 21:11:55', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('64', '2018-05-03 21:11:57', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('65', '2018-05-03 21:11:58', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('66', '2018-05-03 21:12:00', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('67', '2018-05-03 21:21:23', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('68', '2018-05-03 21:23:22', '1', '0.00', '3', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('69', '2018-05-03 21:29:25', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('70', '2018-05-03 21:31:35', '1', '0.00', '3', '1', '2.50', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('71', '2018-05-03 21:36:15', '2', '20.00', '1', '1', '43.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('72', '2018-05-03 21:39:48', '1', '0.00', '3', '2', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('73', '2018-05-03 21:41:32', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('74', '2018-05-04 17:28:25', '1', '0.00', '3', '2', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('75', '2018-05-04 17:45:56', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('76', '2018-05-04 17:46:34', '1', '0.00', '3', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('77', '2018-05-04 17:47:00', '1', '0.00', '2', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('78', '2018-05-04 17:48:59', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('79', '2018-05-04 17:50:41', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('80', '2018-05-04 17:50:58', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('81', '2018-05-04 17:51:14', '1', '0.00', '3', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('82', '2018-05-07 17:22:36', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '2', 'AC');
INSERT INTO `orden` VALUES ('83', '2018-05-08 09:53:42', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '', '2', 'AC');
INSERT INTO `orden` VALUES ('84', '2018-05-22 15:40:39', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '5', 'AC');
INSERT INTO `orden` VALUES ('85', '2018-05-23 11:22:03', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '', '6', 'AC');
INSERT INTO `orden` VALUES ('86', '2018-05-23 11:22:44', '1', '0.00', '2', '1', '0.00', '\0', '', '\0', '', '6', 'AC');
INSERT INTO `orden` VALUES ('87', '2018-05-23 11:23:35', '1', '0.00', '2', '1', '0.00', '\0', '', '\0', '', '6', 'AC');
INSERT INTO `orden` VALUES ('88', '2018-05-23 11:27:12', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '', '6', 'AC');
INSERT INTO `orden` VALUES ('89', '2018-05-23 11:28:11', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '6', 'AC');
INSERT INTO `orden` VALUES ('90', '2018-05-29 12:39:29', '2', '20.00', '1', '1', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('91', '2018-05-29 13:03:06', '2', '20.00', '1', '2', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('92', '2018-05-29 13:06:25', '1', '0.00', '1', '2', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('93', '2018-05-29 14:47:18', '1', '0.00', '2', '1', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('94', '2018-05-29 14:47:37', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '7', 'AC');
INSERT INTO `orden` VALUES ('95', '2018-05-29 15:02:29', '2', '20.00', '2', '2', '0.00', '', '\0', '\0', '\0', null, 'FA');
INSERT INTO `orden` VALUES ('96', '2018-05-29 15:00:17', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '7', 'AC');
INSERT INTO `orden` VALUES ('97', '2018-05-29 15:05:20', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '\0', null, 'FA');
INSERT INTO `orden` VALUES ('98', '2018-05-29 15:04:49', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '7', 'AC');
INSERT INTO `orden` VALUES ('99', '2018-06-05 15:57:39', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '\0', '11', 'FA');
INSERT INTO `orden` VALUES ('100', '2018-05-29 15:09:24', '1', '0.00', '3', '1', '0.00', '\0', '', '\0', '\0', '7', 'FA');
INSERT INTO `orden` VALUES ('101', '2018-05-29 16:18:27', '1', '0.00', '1', '2', '0.00', '', '\0', '\0', '', null, 'FA');
INSERT INTO `orden` VALUES ('102', '2018-05-29 16:18:06', '2', '20.00', '2', '2', '0.00', '', '\0', '\0', '', null, 'FA');
INSERT INTO `orden` VALUES ('103', '2018-05-29 16:19:55', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '', '7', 'FA');
INSERT INTO `orden` VALUES ('104', '2018-05-30 14:54:49', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '\0', null, 'FA');
INSERT INTO `orden` VALUES ('105', '2018-05-30 14:57:34', '1', '0.00', '3', '1', '0.00', '', '\0', '\0', '\0', '7', 'FA');
INSERT INTO `orden` VALUES ('106', '2018-05-30 14:57:15', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '7', 'FA');
INSERT INTO `orden` VALUES ('107', '2018-05-30 16:05:25', '1', '0.00', '3', '1', '0.00', '\0', '\0', '', '\0', '7', 'AC');
INSERT INTO `orden` VALUES ('108', '2018-06-04 16:50:13', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '8', 'FA');
INSERT INTO `orden` VALUES ('109', '2018-06-04 17:09:57', '2', '20.00', '3', '1', '0.00', '\0', '\0', '', '\0', '8', 'AC');
INSERT INTO `orden` VALUES ('110', '2018-06-05 12:09:18', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '8', 'FA');
INSERT INTO `orden` VALUES ('111', '2018-06-05 12:12:32', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '8', 'FA');
INSERT INTO `orden` VALUES ('112', '2018-06-05 12:11:20', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '8', 'FA');
INSERT INTO `orden` VALUES ('113', '2018-06-05 15:58:29', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '8', 'FA');
INSERT INTO `orden` VALUES ('114', '2018-06-05 14:47:11', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '8', 'FA');
INSERT INTO `orden` VALUES ('115', '2018-06-05 15:17:54', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '10', 'FA');
INSERT INTO `orden` VALUES ('116', '2018-06-05 15:18:20', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '10', 'FA');
INSERT INTO `orden` VALUES ('117', '2018-06-05 15:19:03', '1', '0.00', '3', '1', '0.00', '\0', '', '\0', '\0', '10', 'FA');
INSERT INTO `orden` VALUES ('118', '2018-06-05 15:19:22', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '10', 'AC');
INSERT INTO `orden` VALUES ('119', '2018-06-05 15:56:20', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '11', 'FA');
INSERT INTO `orden` VALUES ('120', '2018-06-05 15:57:00', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '11', 'FA');
INSERT INTO `orden` VALUES ('121', '2018-06-27 14:23:27', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('122', '2018-06-27 14:23:48', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('127', '2018-06-27 14:59:16', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('128', '2018-06-27 14:59:28', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('131', '2018-06-27 15:10:34', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('132', '2018-06-27 15:22:25', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '14', 'AC');
INSERT INTO `orden` VALUES ('133', '2018-06-27 15:46:06', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('134', '2018-06-27 15:49:58', '1', '0.00', '1', '1', '0.00', '', '\0', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('135', '2018-06-27 15:51:57', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('136', '2018-06-27 15:53:09', '1', '0.00', '1', '1', '0.00', '\0', '\0', '', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('137', '2018-06-29 19:44:40', '1', '0.00', '3', '1', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('138', '2018-06-29 19:46:17', '1', '0.00', '3', '1', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('139', '2018-07-10 19:56:26', '2', '20.00', '1', '1', '16.20', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('140', '2018-07-10 19:57:17', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('141', '2018-07-11 16:31:20', '1', '0.00', '1', '1', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('142', '2018-07-11 16:51:45', '1', '0.00', '1', '2', '0.00', '', '\0', '\0', '\0', null, 'AC');
INSERT INTO `orden` VALUES ('143', '2018-07-11 17:13:38', '1', '0.00', '1', '2', '0.00', '', '\0', '\0', '', null, 'AC');
INSERT INTO `orden` VALUES ('144', '2018-07-11 17:34:31', '1', '0.00', '1', '2', '0.00', '\0', '\0', '', '\0', '14', 'AC');
INSERT INTO `orden` VALUES ('145', '2018-07-20 14:42:05', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('146', '2018-07-23 10:34:38', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('147', '2018-07-23 10:37:28', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('148', '2018-07-23 10:46:17', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('149', '2018-07-23 15:46:47', '1', '0.00', '2', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('150', '2018-07-24 14:35:00', '1', '0.00', '3', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('151', '2018-07-24 14:42:20', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '\0', '14', 'FA');
INSERT INTO `orden` VALUES ('152', '2018-07-24 14:44:11', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '', '14', 'FA');
INSERT INTO `orden` VALUES ('153', '2018-07-24 14:45:27', '1', '0.00', '1', '2', '0.00', '\0', '', '\0', '', '14', 'FA');

-- ----------------------------
-- Table structure for ordendetalle
-- ----------------------------
DROP TABLE IF EXISTS `ordendetalle`;
CREATE TABLE `ordendetalle` (
  `odId` int(11) NOT NULL AUTO_INCREMENT,
  `oId` int(11) NOT NULL,
  `artId` int(11) DEFAULT NULL,
  `artCode` varchar(20) DEFAULT NULL,
  `artDescripcion` varchar(200) NOT NULL,
  `artCosto` decimal(14,2) NOT NULL,
  `artVenta` decimal(14,2) NOT NULL,
  `artVentaSD` decimal(14,2) NOT NULL,
  `artCant` decimal(14,2) NOT NULL,
  PRIMARY KEY (`odId`),
  KEY `artId` (`artId`),
  KEY `ordId` (`odId`) USING BTREE,
  KEY `oId` (`oId`),
  CONSTRAINT `ordendetalle_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON UPDATE CASCADE,
  CONSTRAINT `ordendetalle_ibfk_3` FOREIGN KEY (`oId`) REFERENCES `orden` (`oId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ordendetalle
-- ----------------------------
INSERT INTO `ordendetalle` VALUES ('56', '54', '289', '7790368029890', ' Parlante  6\" B52  WA-6192', '556.48', '834.72', '834.72', '1.00');
INSERT INTO `ordendetalle` VALUES ('57', '55', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('58', '56', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('59', '56', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('60', '57', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('61', '58', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('62', '59', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('63', '60', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('64', '61', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('65', '62', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('66', '63', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('67', '64', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('68', '65', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('69', '66', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('70', '67', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('71', '67', '74', '342', 'control remoto Tv 425', '50.00', '100.00', '100.00', '5.00');
INSERT INTO `ordendetalle` VALUES ('72', '68', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('73', '69', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('74', '69', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('75', '69', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('76', '69', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('77', '69', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('78', '70', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('79', '71', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '243.00', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('80', '72', '260', '869767142924', 'Lector de tarjeta SIYOTEAM USB', '30.00', '60.00', '60.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('81', '73', '22', '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00');
INSERT INTO `ordendetalle` VALUES ('82', '74', '289', '7790368029890', ' Parlante  6\" B52  WA-6192', '556.48', '834.72', '834.72', '1.00');
INSERT INTO `ordendetalle` VALUES ('83', '75', '289', '7790368029890', ' Parlante  6\" B52  WA-6192', '556.48', '834.72', '834.72', '1.00');
INSERT INTO `ordendetalle` VALUES ('84', '76', '287', '7790368029906', ' Parlantes  6x9', '774.27', '1161.40', '1161.40', '1.00');
INSERT INTO `ordendetalle` VALUES ('85', '77', '278', '7798137388544 EK\'102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1920.00', '1920.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('86', '78', '287', '7790368029906', ' Parlantes  6x9', '774.27', '1161.40', '1161.40', '1.00');
INSERT INTO `ordendetalle` VALUES ('87', '79', '289', '7790368029890', ' Parlante  6\" B52  WA-6192', '556.48', '834.72', '834.72', '1.00');
INSERT INTO `ordendetalle` VALUES ('88', '80', '187', '884938344883', 'Estereo Pioneer AVH-295BT', '6330.00', '9495.00', '9495.00', '2.00');
INSERT INTO `ordendetalle` VALUES ('89', '81', '58', 'LED1', 'led programable ventilador USB', '181.25', '290.00', '290.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('90', '82', '278', '7798137388544 EK\'102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1920.00', '1920.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('91', '83', '278', '7798137388544 EK\'102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1664.00', '1664.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('92', '84', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '20.00');
INSERT INTO `ordendetalle` VALUES ('93', '85', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '4.00');
INSERT INTO `ordendetalle` VALUES ('94', '86', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '193.69', '193.69', '8.00');
INSERT INTO `ordendetalle` VALUES ('95', '87', '287', '7790368029906', ' Parlantes  6x9', '774.27', '1083.98', '1083.98', '1.00');
INSERT INTO `ordendetalle` VALUES ('96', '88', '2', '4897034186772', 'esencia p/cigarro electronico lemon', '55.00', '71.50', '71.50', '100.00');
INSERT INTO `ordendetalle` VALUES ('97', '89', '225', 'ZM', 'Zapatilla multiforma INDEPLAS S/Cable', '86.36', '129.54', '129.54', '6.00');
INSERT INTO `ordendetalle` VALUES ('98', '90', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '2.00');
INSERT INTO `ordendetalle` VALUES ('99', '91', '33', '008562009714', 'Pilas CR2450', '38.00', '76.00', '76.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('100', '91', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('101', '92', '33', '008562009714', 'Pilas CR2450', '38.00', '76.00', '76.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('102', '92', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('103', '93', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '10.00');
INSERT INTO `ordendetalle` VALUES ('104', '94', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '100.00');
INSERT INTO `ordendetalle` VALUES ('105', '95', '225', 'ZM', 'Zapatilla multiforma INDEPLAS S/Cable', '86.36', '129.54', '129.54', '10.00');
INSERT INTO `ordendetalle` VALUES ('106', '95', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '2.00');
INSERT INTO `ordendetalle` VALUES ('107', '96', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '12.00');
INSERT INTO `ordendetalle` VALUES ('108', '96', '225', 'ZM', 'Zapatilla multiforma INDEPLAS S/Cable', '86.36', '129.54', '129.54', '1.00');
INSERT INTO `ordendetalle` VALUES ('109', '97', '233', '7798130906387', 'celular PANACOM  MP-1103 ', '449.99', '854.98', '854.98', '5.00');
INSERT INTO `ordendetalle` VALUES ('110', '97', '282', '7798130906394', 'Celular panacom  MP-1103 azul', '450.00', '855.00', '855.00', '10.00');
INSERT INTO `ordendetalle` VALUES ('111', '98', '233', '7798130906387', 'celular PANACOM  MP-1103 ', '449.99', '854.98', '854.98', '3.00');
INSERT INTO `ordendetalle` VALUES ('112', '98', '282', '7798130906394', 'Celular panacom  MP-1103 azul', '450.00', '855.00', '855.00', '7.00');
INSERT INTO `ordendetalle` VALUES ('113', '99', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('114', '100', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '208.59', '208.59', '18.00');
INSERT INTO `ordendetalle` VALUES ('115', '101', '154', '6921338623003', 'Control Remoto Universal DVD', '100.00', '130.00', '130.00', '10.00');
INSERT INTO `ordendetalle` VALUES ('116', '102', '154', '6921338623003', 'Control Remoto Universal DVD', '100.00', '156.00', '130.00', '7.00');
INSERT INTO `ordendetalle` VALUES ('117', '103', '154', '6921338623003', 'Control Remoto Universal DVD', '100.00', '130.00', '130.00', '3.00');
INSERT INTO `ordendetalle` VALUES ('118', '104', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('119', '105', '256', '254', 'Control remoto TV LG 2453', '40.51', '101.28', '101.28', '1.00');
INSERT INTO `ordendetalle` VALUES ('120', '106', '256', '254', 'Control remoto TV LG 2453', '40.51', '101.28', '101.28', '1.00');
INSERT INTO `ordendetalle` VALUES ('121', '107', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '208.59', '208.59', '1.00');
INSERT INTO `ordendetalle` VALUES ('122', '108', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('123', '109', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '269.71', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('124', '110', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('125', '111', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '208.59', '208.59', '1.00');
INSERT INTO `ordendetalle` VALUES ('126', '112', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '208.59', '208.59', '1.00');
INSERT INTO `ordendetalle` VALUES ('127', '113', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('128', '114', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('129', '115', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('130', '116', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('131', '117', '256', '254', 'Control remoto TV LG 2453', '40.51', '101.28', '101.28', '1.00');
INSERT INTO `ordendetalle` VALUES ('132', '118', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('133', '119', '152', '6921338619051', 'Control Remoto Aire Acondicionado Universal', '100.00', '200.00', '200.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('134', '120', '153', '6927259110189', 'Control Remoto Aire  acondicionado Universal ', '100.00', '200.00', '200.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('135', '121', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '10.00');
INSERT INTO `ordendetalle` VALUES ('136', '122', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '5.00');
INSERT INTO `ordendetalle` VALUES ('145', '127', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('146', '127', null, '-', 'instala', '45.60', '45.60', '45.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('147', '128', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('148', '128', null, '-', 'instala', '45.60', '45.60', '45.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('153', '131', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '208.70', '208.70', '1.00');
INSERT INTO `ordendetalle` VALUES ('154', '131', null, '-', 'instal', '45.36', '45.36', '45.36', '1.00');
INSERT INTO `ordendetalle` VALUES ('155', '132', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('156', '132', null, '-', 'instala', '10.00', '10.00', '10.00', '0.10');
INSERT INTO `ordendetalle` VALUES ('157', '133', '213', '7897789643121', 'Alarma para auto Cyber FX 360 EXP pst', '1269.12', '1840.22', '1840.22', '1.00');
INSERT INTO `ordendetalle` VALUES ('158', '133', null, '-', 'instalacion', '455.32', '455.32', '455.32', '2.00');
INSERT INTO `ordendetalle` VALUES ('159', '134', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('160', '134', null, '-', 'instala', '10.00', '10.00', '10.00', '10.00');
INSERT INTO `ordendetalle` VALUES ('161', '135', null, '-', 'instalacion ', '102.23', '102.23', '102.23', '1.00');
INSERT INTO `ordendetalle` VALUES ('162', '135', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('163', '136', null, '-', 'instalacion', '500.00', '500.00', '500.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('164', '136', '195', '696859263927', 'Estereo DTI mod-CE6113BT', '1300.00', '1950.00', '1950.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('165', '137', null, '-', 'instalacion', '500.00', '500.00', '500.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('166', '137', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('167', '138', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '8.00');
INSERT INTO `ordendetalle` VALUES ('168', '139', '247', 'CN-03', ' Adapatador Estereo auto DOBLE MACHO ISODIN', '15.99', '66.20', '55.17', '1.00');
INSERT INTO `ordendetalle` VALUES ('169', '140', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00');
INSERT INTO `ordendetalle` VALUES ('170', '141', '247', 'CN-03', ' Adapatador Estereo auto DOBLE MACHO ISODIN', '15.99', '55.17', '55.17', '1.00');
INSERT INTO `ordendetalle` VALUES ('171', '142', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('172', '143', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('173', '144', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00');
INSERT INTO `ordendetalle` VALUES ('174', '145', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '208.70', '208.70', '10.00');
INSERT INTO `ordendetalle` VALUES ('175', '146', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '208.70', '208.70', '1.00');
INSERT INTO `ordendetalle` VALUES ('176', '147', '278', '7798137388544 EK\'102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1664.00', '1664.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('177', '147', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '2.00');
INSERT INTO `ordendetalle` VALUES ('178', '147', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '208.70', '208.70', '4.00');
INSERT INTO `ordendetalle` VALUES ('179', '148', '169', 'Z3', 'Zapatilla 5 tomas c/tecla y cable 3 mts', '99.26', '148.89', '148.89', '8.00');
INSERT INTO `ordendetalle` VALUES ('180', '148', '287', '7790368029906', ' Parlantes  6x9', '851.70', '1192.38', '1192.38', '2.00');
INSERT INTO `ordendetalle` VALUES ('181', '148', '293', 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '208.70', '208.70', '2.00');
INSERT INTO `ordendetalle` VALUES ('182', '149', '225', 'ZM', 'Zapatilla multiforma INDEPLAS S/Cable', '86.36', '112.27', '112.27', '1.00');
INSERT INTO `ordendetalle` VALUES ('183', '149', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '193.69', '193.69', '2.00');
INSERT INTO `ordendetalle` VALUES ('184', '150', '292', 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '193.69', '193.69', '1.00');
INSERT INTO `ordendetalle` VALUES ('185', '151', '215', 'CONTR DJ', 'Controlador  GBR PRO DJ 200', '4418.90', '6274.84', '6274.84', '1.00');
INSERT INTO `ordendetalle` VALUES ('186', '152', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('187', '153', '285', 'CAR-702', 'Control remoto estereo SONY ', '120.00', '162.00', '162.00', '1.00');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `prvId` int(11) NOT NULL AUTO_INCREMENT,
  `prvNombre` varchar(100) DEFAULT NULL,
  `prvApellido` varchar(100) DEFAULT NULL,
  `prvRazonSocial` varchar(100) DEFAULT NULL,
  `docId` int(11) NOT NULL,
  `prvDocumento` varchar(13) NOT NULL,
  `prvDomicilio` varchar(250) DEFAULT NULL,
  `prvMail` varchar(50) DEFAULT NULL,
  `prvEstado` varchar(2) DEFAULT NULL,
  `prvTelefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prvId`),
  UNIQUE KEY `docId` (`docId`,`prvDocumento`) USING BTREE,
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`docId`) REFERENCES `tipos_documentos` (`docId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES ('1', 'Sergio', 'Salvatella', 'PINI', '1', '1', 'mendoza', '', 'AC', '');
INSERT INTO `proveedores` VALUES ('2', 'Jorge ', 'Trodler', 'TROONER', '2', '20045435653', 'Leiva 4710 (1427) Capital Federal', 'pedidos@trooner.com.ar', 'AC', '48542158');
INSERT INTO `proveedores` VALUES ('3', 'Marcos', 'S.A', 'AUDIOINSUMOS', '2', '30711875669', 'Lucio Mansilla 502', 'ventas@audio-insumos.com.ar', 'AC', '02614321900-4311576');
INSERT INTO `proveedores` VALUES ('4', 'Cristian Enrique', 'Mercado', 'INGETEC', '2', '20-24662997-9', 'Gral.Pedernera 576 Vª Madero Bs As', 'ventas@ingetec.com.ar', 'AC', '54932137051');
INSERT INTO `proveedores` VALUES ('5', 'CRISTIAN', 'ARMELLINI', 'CRISTIAN ARMELLINI', '2', '1', '1', '1', 'AC', '1');
INSERT INTO `proveedores` VALUES ('6', 'Franklin Eduardo', 'Vidal', 'antyca (Mario Rivero)', '2', '20-10870907-8', 'Liniers 830 Bº Cofico Cordoba', '1', 'AC', '3514731322 / 4731307');
INSERT INTO `proveedores` VALUES ('7', 'DAGHER', 'S.A', 'KOL RAM', '2', '30-63313914-4', 'Luzuriaga 38 Bs.As ', 'Info@kolram.com.ar', 'AC', '011 43063006 fax 4306420');
INSERT INTO `proveedores` VALUES ('8', 'Nicolas', 'Zartaryan', 'MEGA-IMPORT', '2', '20-27658911-4', 'AV.Santa Fe 2847 PB  \"B\" Bs As', '1', 'AC', '1');
INSERT INTO `proveedores` VALUES ('9', '', '', 'ELIT MENDOZA', '2', '30651655516', 'Eusebio Blanco  3696 ', '', 'AC', '26104202678');
INSERT INTO `proveedores` VALUES ('10', 'RETHYMNOS', 'S.A', '348 IMPORT-EXPORT', '2', '307089559932', 'Pasteur 348 BS AS', '', 'AC', '01149517549');
INSERT INTO `proveedores` VALUES ('11', 'Carlos Gustavo', 'Gonzales', 'CG AUTOPARTES', '2', '23-14696455-9', 'Aberastain 1093 sur  SAN JUAN', 'autopartesg@hotmail.com', 'AC', '0264-4226322');
INSERT INTO `proveedores` VALUES ('12', 'Santiago', 'SIMONINI', 'MARIMOM ELECTRONICA', '2', '23-23146549-9', 'AV.Hipolito Yrigoyen  9257 LOmas de Zamora', '', 'AC', '');
INSERT INTO `proveedores` VALUES ('13', 'Leonardo Antonio', 'Lopez', 'ELECTROMEMO (MERC.LIBRE)', '2', '20-29205584-7', 'Av.Rivadavia 5512 2 piso local 56', '', 'AC', '011-44317025');
INSERT INTO `proveedores` VALUES ('14', '.', '.', 'ELECTRONICA SAN JUAN  S.R.L', '2', '.', 'Av. COrdoba 402 E ', 'elec_sj@infovia.com.ar', 'AC', '4274012');
INSERT INTO `proveedores` VALUES ('15', '.', '.', 'SOMECO ELECTRONICS', '2', '30-70217915-3', 'Pte. Saenz Peña 788 piso 9', '.', 'AC', '011-46553333');
INSERT INTO `proveedores` VALUES ('16', 'Maretec', 's.r.l', 'SEG', '2', '30707551611', 'AV . Bartolome  Mitre 1416 florida Oeste ', '', 'AC', '01147617661');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receptions
-- ----------------------------
INSERT INTO `receptions` VALUES ('4', '2018-02-28 00:00:00', 'CF', '1', '', '4', '1', '0.00');
INSERT INTO `receptions` VALUES ('5', '2018-02-23 00:00:00', 'CF', '2', '', '1', '0003-0008195', '1679.93');
INSERT INTO `receptions` VALUES ('6', '2018-03-06 00:00:00', 'DS', '3', 'p', '1', '0003-0000121', '27725.02');
INSERT INTO `receptions` VALUES ('7', '2018-03-06 00:00:00', 'AC', '3', 'DEBO AL 11/03', '1', '000300001210', '27725.02');
INSERT INTO `receptions` VALUES ('8', '2018-03-05 00:00:00', 'AC', '4', 'falta factura A', '4', '0011-0000001', '23100.00');
INSERT INTO `receptions` VALUES ('9', '2018-03-13 00:00:00', 'AC', '5', ' A PAGAR DENTRO DE 15 DIAS A PARTIR DE LA FECHA', '4', '1', '75.00');
INSERT INTO `receptions` VALUES ('10', '2018-03-06 00:00:00', 'AC', '6', 'la factura se aduada al 14/03/18', '1', '0004-0000327', '17242.35');
INSERT INTO `receptions` VALUES ('11', '2018-03-07 00:00:00', 'AC', '7', 'Pago de contado', '4', '9999-0000354', '33996.68');
INSERT INTO `receptions` VALUES ('12', '2018-03-14 00:00:00', 'DS', '8', 'Pagado', '1', '0004-0000005', '17999.96');
INSERT INTO `receptions` VALUES ('13', '2018-03-12 00:00:00', 'AC', '9', '', '4', '0013-0011172', '13066.05');
INSERT INTO `receptions` VALUES ('14', '2018-03-12 00:00:00', 'AC', '9', 'adeuda  remito hasta el dia 14/03', '4', '0013-0011172', '13066.05');
INSERT INTO `receptions` VALUES ('15', '2018-03-12 00:00:00', 'DS', '3', 'Pagado', '1', '0003-0000130', '10053.97');
INSERT INTO `receptions` VALUES ('16', '2018-03-12 00:00:00', 'DS', '3', 'Pagado', '1', '0003-0000130', '10053.97');
INSERT INTO `receptions` VALUES ('17', '2018-03-13 00:00:00', 'AC', '3', 'se debe hasta el 14/03', '1', '0003-0000131', '10671.88');
INSERT INTO `receptions` VALUES ('18', '2018-03-12 00:00:00', 'AC', '3', '', '1', '0003-0000130', '9485.49');
INSERT INTO `receptions` VALUES ('19', '2018-03-13 00:00:00', 'AC', '7', '10.5 % (IVA) PAGADO', '4', '000800002429', '16465.68');
INSERT INTO `receptions` VALUES ('20', '2018-03-13 00:00:00', 'AC', '10', '359551075932466 359551076134476 359551076138931 359551075936921 359551076103745359551075901735 359551075925890 359551076127900', '1', '0003-0000101', '1800.00');
INSERT INTO `receptions` VALUES ('21', '2018-03-13 00:00:00', 'AC', '10', 'PAGADO', '4', '0000-0000000', '2492.00');
INSERT INTO `receptions` VALUES ('22', '2018-03-14 00:00:00', 'DS', '11', '', '1', '0002-0000130', '2435.42');
INSERT INTO `receptions` VALUES ('23', '2018-03-14 00:00:00', 'AC', '3', '', '1', '0002-0000130', '2435.42');
INSERT INTO `receptions` VALUES ('24', '2018-03-14 00:00:00', 'AC', '11', '', '4', '00016301', '1677.46');
INSERT INTO `receptions` VALUES ('25', '2018-03-27 00:00:00', 'AC', '2', 'se adeuda al dia de la fecha 27/03/2018', '1', '0003-0000825', '9695.75');
INSERT INTO `receptions` VALUES ('26', '2018-03-27 00:00:00', 'DS', '3', '', '4', '0212-0002930', '11418.36');
INSERT INTO `receptions` VALUES ('27', '2018-03-27 00:00:00', 'AC', '3', 'total $11418.36 NOTA DE CREDITO -$745.60', '4', '0212-0002930', '10672.76');
INSERT INTO `receptions` VALUES ('28', '2018-03-27 00:00:00', 'AC', '3', '', '4', '0212-0002930', '346.86');
INSERT INTO `receptions` VALUES ('29', '2018-04-10 00:00:00', 'AC', '13', 'cancelado x mercado pago', '1', '0002-0000440', '2200.01');
INSERT INTO `receptions` VALUES ('30', '2018-04-10 00:00:00', 'AC', '14', '', '4', '01', '1528.00');
INSERT INTO `receptions` VALUES ('31', '2018-04-10 00:00:00', 'CF', '15', 'falta cargar a la lista parlante b52 6 \" cantidad 10 ', '1', '0016-0003250', '45748.60');
INSERT INTO `receptions` VALUES ('32', '2018-04-10 00:00:00', 'CF', '16', '', '1', '0002-0002890', '29397.59');

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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receptionsdetail
-- ----------------------------
INSERT INTO `receptionsdetail` VALUES ('1', '4', '1', '12');
INSERT INTO `receptionsdetail` VALUES ('2', '4', '3', '20');
INSERT INTO `receptionsdetail` VALUES ('3', '5', '143', '10');
INSERT INTO `receptionsdetail` VALUES ('4', '5', '142', '10');
INSERT INTO `receptionsdetail` VALUES ('5', '6', '169', '10');
INSERT INTO `receptionsdetail` VALUES ('6', '6', '168', '10');
INSERT INTO `receptionsdetail` VALUES ('7', '6', '162', '10');
INSERT INTO `receptionsdetail` VALUES ('8', '7', '171', '2');
INSERT INTO `receptionsdetail` VALUES ('9', '7', '170', '20');
INSERT INTO `receptionsdetail` VALUES ('10', '7', '174', '2');
INSERT INTO `receptionsdetail` VALUES ('11', '7', '173', '1');
INSERT INTO `receptionsdetail` VALUES ('12', '7', '175', '2');
INSERT INTO `receptionsdetail` VALUES ('13', '7', '176', '2');
INSERT INTO `receptionsdetail` VALUES ('14', '7', '165', '1');
INSERT INTO `receptionsdetail` VALUES ('15', '7', '166', '1');
INSERT INTO `receptionsdetail` VALUES ('16', '7', '167', '1');
INSERT INTO `receptionsdetail` VALUES ('17', '7', '164', '4');
INSERT INTO `receptionsdetail` VALUES ('18', '7', '172', '1');
INSERT INTO `receptionsdetail` VALUES ('19', '7', '163', '4');
INSERT INTO `receptionsdetail` VALUES ('20', '7', '169', '10');
INSERT INTO `receptionsdetail` VALUES ('21', '7', '168', '10');
INSERT INTO `receptionsdetail` VALUES ('22', '7', '162', '10');
INSERT INTO `receptionsdetail` VALUES ('23', '8', '186', '4');
INSERT INTO `receptionsdetail` VALUES ('24', '8', '185', '5');
INSERT INTO `receptionsdetail` VALUES ('25', '9', '204', '10');
INSERT INTO `receptionsdetail` VALUES ('26', '10', '212', '2');
INSERT INTO `receptionsdetail` VALUES ('27', '10', '213', '10');
INSERT INTO `receptionsdetail` VALUES ('28', '10', '211', '10');
INSERT INTO `receptionsdetail` VALUES ('29', '11', '216', '6');
INSERT INTO `receptionsdetail` VALUES ('30', '11', '215', '2');
INSERT INTO `receptionsdetail` VALUES ('31', '11', '214', '1');
INSERT INTO `receptionsdetail` VALUES ('32', '12', '217', '50');
INSERT INTO `receptionsdetail` VALUES ('33', '12', '22', '50');
INSERT INTO `receptionsdetail` VALUES ('34', '13', '218', '5');
INSERT INTO `receptionsdetail` VALUES ('35', '14', '219', '5');
INSERT INTO `receptionsdetail` VALUES ('36', '14', '218', '5');
INSERT INTO `receptionsdetail` VALUES ('37', '15', '224', '10');
INSERT INTO `receptionsdetail` VALUES ('38', '15', '221', '10');
INSERT INTO `receptionsdetail` VALUES ('39', '15', '223', '10');
INSERT INTO `receptionsdetail` VALUES ('40', '15', '222', '5');
INSERT INTO `receptionsdetail` VALUES ('41', '16', '227', '4');
INSERT INTO `receptionsdetail` VALUES ('42', '16', '228', '4');
INSERT INTO `receptionsdetail` VALUES ('43', '16', '226', '1');
INSERT INTO `receptionsdetail` VALUES ('44', '16', '225', '20');
INSERT INTO `receptionsdetail` VALUES ('45', '16', '224', '10');
INSERT INTO `receptionsdetail` VALUES ('46', '16', '221', '10');
INSERT INTO `receptionsdetail` VALUES ('47', '16', '223', '10');
INSERT INTO `receptionsdetail` VALUES ('48', '16', '222', '5');
INSERT INTO `receptionsdetail` VALUES ('49', '17', '229', '4');
INSERT INTO `receptionsdetail` VALUES ('50', '18', '227', '4');
INSERT INTO `receptionsdetail` VALUES ('51', '18', '228', '4');
INSERT INTO `receptionsdetail` VALUES ('52', '18', '226', '1');
INSERT INTO `receptionsdetail` VALUES ('53', '18', '225', '20');
INSERT INTO `receptionsdetail` VALUES ('54', '18', '224', '10');
INSERT INTO `receptionsdetail` VALUES ('55', '18', '221', '10');
INSERT INTO `receptionsdetail` VALUES ('56', '18', '223', '10');
INSERT INTO `receptionsdetail` VALUES ('57', '18', '222', '5');
INSERT INTO `receptionsdetail` VALUES ('58', '19', '231', '6');
INSERT INTO `receptionsdetail` VALUES ('59', '19', '230', '6');
INSERT INTO `receptionsdetail` VALUES ('60', '20', '233', '1');
INSERT INTO `receptionsdetail` VALUES ('61', '20', '232', '3');
INSERT INTO `receptionsdetail` VALUES ('62', '21', '236', '8');
INSERT INTO `receptionsdetail` VALUES ('63', '21', '235', '4');
INSERT INTO `receptionsdetail` VALUES ('64', '21', '234', '8');
INSERT INTO `receptionsdetail` VALUES ('65', '22', '240', '5');
INSERT INTO `receptionsdetail` VALUES ('66', '22', '238', '5');
INSERT INTO `receptionsdetail` VALUES ('67', '23', '245', '3');
INSERT INTO `receptionsdetail` VALUES ('68', '23', '244', '3');
INSERT INTO `receptionsdetail` VALUES ('69', '23', '243', '2');
INSERT INTO `receptionsdetail` VALUES ('70', '23', '241', '2');
INSERT INTO `receptionsdetail` VALUES ('71', '23', '239', '2');
INSERT INTO `receptionsdetail` VALUES ('72', '23', '240', '5');
INSERT INTO `receptionsdetail` VALUES ('73', '23', '238', '5');
INSERT INTO `receptionsdetail` VALUES ('74', '24', '242', '3');
INSERT INTO `receptionsdetail` VALUES ('75', '24', '243', '2');
INSERT INTO `receptionsdetail` VALUES ('76', '24', '241', '2');
INSERT INTO `receptionsdetail` VALUES ('77', '24', '239', '2');
INSERT INTO `receptionsdetail` VALUES ('78', '24', '240', '5');
INSERT INTO `receptionsdetail` VALUES ('79', '24', '240', '5');
INSERT INTO `receptionsdetail` VALUES ('80', '25', '250', '10');
INSERT INTO `receptionsdetail` VALUES ('81', '25', '251', '10');
INSERT INTO `receptionsdetail` VALUES ('82', '25', '249', '30');
INSERT INTO `receptionsdetail` VALUES ('83', '25', '254', '10');
INSERT INTO `receptionsdetail` VALUES ('84', '25', '253', '10');
INSERT INTO `receptionsdetail` VALUES ('85', '25', '252', '5');
INSERT INTO `receptionsdetail` VALUES ('86', '25', '255', '2');
INSERT INTO `receptionsdetail` VALUES ('87', '25', '248', '10');
INSERT INTO `receptionsdetail` VALUES ('88', '25', '246', '20');
INSERT INTO `receptionsdetail` VALUES ('89', '25', '246', '50');
INSERT INTO `receptionsdetail` VALUES ('90', '25', '258', '3');
INSERT INTO `receptionsdetail` VALUES ('91', '25', '257', '3');
INSERT INTO `receptionsdetail` VALUES ('92', '25', '116', '10');
INSERT INTO `receptionsdetail` VALUES ('93', '25', '107', '20');
INSERT INTO `receptionsdetail` VALUES ('94', '25', '60', '20');
INSERT INTO `receptionsdetail` VALUES ('95', '25', '84', '5');
INSERT INTO `receptionsdetail` VALUES ('96', '25', '84', '10');
INSERT INTO `receptionsdetail` VALUES ('97', '25', '256', '10');
INSERT INTO `receptionsdetail` VALUES ('98', '25', '79', '5');
INSERT INTO `receptionsdetail` VALUES ('99', '25', '97', '10');
INSERT INTO `receptionsdetail` VALUES ('100', '26', '271', '2');
INSERT INTO `receptionsdetail` VALUES ('101', '26', '269', '2');
INSERT INTO `receptionsdetail` VALUES ('102', '26', '268', '2');
INSERT INTO `receptionsdetail` VALUES ('103', '26', '267', '2');
INSERT INTO `receptionsdetail` VALUES ('104', '26', '266', '6');
INSERT INTO `receptionsdetail` VALUES ('105', '26', '265', '6');
INSERT INTO `receptionsdetail` VALUES ('106', '26', '264', '2');
INSERT INTO `receptionsdetail` VALUES ('107', '26', '263', '2');
INSERT INTO `receptionsdetail` VALUES ('108', '26', '262', '2');
INSERT INTO `receptionsdetail` VALUES ('109', '26', '272', '20');
INSERT INTO `receptionsdetail` VALUES ('110', '26', '261', '4');
INSERT INTO `receptionsdetail` VALUES ('111', '27', '271', '2');
INSERT INTO `receptionsdetail` VALUES ('112', '27', '269', '2');
INSERT INTO `receptionsdetail` VALUES ('113', '27', '268', '2');
INSERT INTO `receptionsdetail` VALUES ('114', '27', '266', '6');
INSERT INTO `receptionsdetail` VALUES ('115', '27', '264', '2');
INSERT INTO `receptionsdetail` VALUES ('116', '27', '263', '2');
INSERT INTO `receptionsdetail` VALUES ('117', '27', '262', '2');
INSERT INTO `receptionsdetail` VALUES ('118', '27', '261', '4');
INSERT INTO `receptionsdetail` VALUES ('119', '27', '272', '20');
INSERT INTO `receptionsdetail` VALUES ('120', '28', '279', '6');
INSERT INTO `receptionsdetail` VALUES ('121', '29', '281', '20');
INSERT INTO `receptionsdetail` VALUES ('122', '30', '285', '1');
INSERT INTO `receptionsdetail` VALUES ('123', '30', '284', '2');
INSERT INTO `receptionsdetail` VALUES ('124', '30', '283', '4');
INSERT INTO `receptionsdetail` VALUES ('125', '31', '288', '2');
INSERT INTO `receptionsdetail` VALUES ('126', '31', '290', '2');
INSERT INTO `receptionsdetail` VALUES ('127', '31', '286', '5');
INSERT INTO `receptionsdetail` VALUES ('128', '31', '287', '8');
INSERT INTO `receptionsdetail` VALUES ('129', '32', '292', '5');
INSERT INTO `receptionsdetail` VALUES ('130', '32', '291', '10');

-- ----------------------------
-- Table structure for recibos
-- ----------------------------
DROP TABLE IF EXISTS `recibos`;
CREATE TABLE `recibos` (
  `rcbId` int(11) NOT NULL AUTO_INCREMENT,
  `oId` int(11) NOT NULL,
  `medId` int(11) NOT NULL,
  `rcbImporte` decimal(14,2) NOT NULL,
  `rcbEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `rcbFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cajaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rcbId`),
  KEY `medId` (`medId`) USING BTREE,
  KEY `oId` (`oId`) USING BTREE,
  KEY `cajaId` (`cajaId`),
  CONSTRAINT `recibos_ibfk_1` FOREIGN KEY (`oId`) REFERENCES `orden` (`oId`) ON UPDATE CASCADE,
  CONSTRAINT `recibos_ibfk_2` FOREIGN KEY (`medId`) REFERENCES `mediosdepago` (`medId`) ON UPDATE CASCADE,
  CONSTRAINT `recibos_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recibos
-- ----------------------------
INSERT INTO `recibos` VALUES ('90', '115', '1', '201.60', 'AC', '2018-06-05 15:17:54', '10');
INSERT INTO `recibos` VALUES ('91', '116', '1', '100.00', 'AC', '2018-06-05 15:18:20', '10');
INSERT INTO `recibos` VALUES ('92', '116', '3', '101.60', 'AC', '2018-06-05 15:18:20', '10');
INSERT INTO `recibos` VALUES ('93', '117', '3', '101.28', 'AC', '2018-06-05 15:19:03', '10');
INSERT INTO `recibos` VALUES ('94', '118', '1', '201.00', 'AC', '2018-06-05 15:30:01', '10');
INSERT INTO `recibos` VALUES ('95', '119', '1', '200.00', 'AC', '2018-06-05 15:56:20', '11');
INSERT INTO `recibos` VALUES ('96', '120', '1', '50.00', 'AC', '2018-06-05 15:57:00', '11');
INSERT INTO `recibos` VALUES ('97', '120', '2', '150.00', 'AC', '2018-06-05 15:57:00', '11');
INSERT INTO `recibos` VALUES ('98', '99', '1', '224.76', 'AC', '2018-06-05 15:57:39', '11');
INSERT INTO `recibos` VALUES ('99', '113', '1', '100.00', 'AC', '2018-06-05 15:58:29', '11');
INSERT INTO `recibos` VALUES ('100', '113', '2', '101.60', 'AC', '2018-06-05 15:58:29', '11');
INSERT INTO `recibos` VALUES ('101', '121', '1', '2247.60', 'AC', '2018-06-27 14:23:27', '14');
INSERT INTO `recibos` VALUES ('102', '122', '1', '1008.00', 'AC', '2018-06-27 14:23:48', '14');
INSERT INTO `recibos` VALUES ('107', '127', '1', '247.20', 'AC', '2018-06-27 14:59:16', '14');
INSERT INTO `recibos` VALUES ('108', '127', '1', '247.20', 'AC', '2018-06-27 14:59:16', '14');
INSERT INTO `recibos` VALUES ('109', '128', '1', '247.20', 'AC', '2018-06-27 14:59:28', '14');
INSERT INTO `recibos` VALUES ('110', '128', '1', '247.20', 'AC', '2018-06-27 14:59:28', '14');
INSERT INTO `recibos` VALUES ('113', '131', '1', '254.06', 'AC', '2018-06-27 15:10:34', '14');
INSERT INTO `recibos` VALUES ('114', '131', '1', '254.06', 'AC', '2018-06-27 15:10:34', '14');
INSERT INTO `recibos` VALUES ('115', '132', '1', '100.00', 'AC', '2018-06-27 15:22:25', '14');
INSERT INTO `recibos` VALUES ('116', '132', '1', '100.00', 'AC', '2018-06-27 15:22:25', '14');
INSERT INTO `recibos` VALUES ('126', '133', '1', '2750.86', 'AC', '2018-06-27 15:46:06', '14');
INSERT INTO `recibos` VALUES ('127', '133', '1', '2750.86', 'AC', '2018-06-27 15:46:06', '14');
INSERT INTO `recibos` VALUES ('128', '134', '1', '262.00', 'AC', '2018-06-27 15:49:58', '14');
INSERT INTO `recibos` VALUES ('129', '134', '1', '262.00', 'AC', '2018-06-27 15:49:58', '14');
INSERT INTO `recibos` VALUES ('130', '135', '1', '264.23', 'AC', '2018-06-27 15:51:57', '14');
INSERT INTO `recibos` VALUES ('131', '135', '1', '264.23', 'AC', '2018-06-27 15:51:57', '14');
INSERT INTO `recibos` VALUES ('132', '136', '1', '450.00', 'AC', '2018-06-27 15:52:49', '14');
INSERT INTO `recibos` VALUES ('133', '136', '1', '2000.00', 'AC', '2018-06-27 15:53:09', '14');
INSERT INTO `recibos` VALUES ('134', '138', '1', '1612.80', 'AC', '2018-06-29 19:46:17', '14');
INSERT INTO `recibos` VALUES ('135', '139', '1', '40.00', 'AC', '2018-07-10 19:56:26', '14');
INSERT INTO `recibos` VALUES ('136', '139', '2', '10.00', 'AC', '2018-07-10 19:56:26', '14');
INSERT INTO `recibos` VALUES ('137', '140', '7', '201.60', 'AC', '2018-07-10 19:57:17', '14');
INSERT INTO `recibos` VALUES ('138', '141', '1', '55.17', 'AC', '2018-07-11 16:31:20', '14');
INSERT INTO `recibos` VALUES ('139', '145', '7', '2087.00', 'AC', '2018-07-20 14:42:05', '14');
INSERT INTO `recibos` VALUES ('140', '146', '7', '208.70', 'AC', '2018-07-23 10:34:38', '14');
INSERT INTO `recibos` VALUES ('141', '147', '7', '2822.80', 'AC', '2018-07-23 10:37:28', '14');
INSERT INTO `recibos` VALUES ('142', '147', '7', '2822.80', 'AC', '2018-07-23 10:37:28', '14');
INSERT INTO `recibos` VALUES ('143', '147', '7', '2822.80', 'AC', '2018-07-23 10:37:28', '14');
INSERT INTO `recibos` VALUES ('144', '148', '7', '3993.28', 'AC', '2018-07-23 10:46:17', '14');
INSERT INTO `recibos` VALUES ('145', '149', '1', '499.65', 'AC', '2018-07-23 15:46:47', '14');
INSERT INTO `recibos` VALUES ('146', '150', '7', '193.69', 'AC', '2018-07-24 14:35:00', '14');
INSERT INTO `recibos` VALUES ('147', '151', '7', '6274.84', 'AC', '2018-07-24 14:42:20', '14');
INSERT INTO `recibos` VALUES ('148', '152', '7', '162.00', 'AC', '2018-07-24 14:44:11', '14');
INSERT INTO `recibos` VALUES ('149', '153', '7', '162.00', 'AC', '2018-07-24 14:45:27', '14');

-- ----------------------------
-- Table structure for retiros
-- ----------------------------
DROP TABLE IF EXISTS `retiros`;
CREATE TABLE `retiros` (
  `retId` int(11) NOT NULL AUTO_INCREMENT,
  `retFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usrId` int(11) NOT NULL,
  `retImporte` decimal(10,2) NOT NULL,
  `retDescripcion` varchar(100) DEFAULT NULL,
  `cajaId` int(11) NOT NULL,
  PRIMARY KEY (`retId`),
  KEY `usrId` (`usrId`),
  KEY `cajaId` (`cajaId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of retiros
-- ----------------------------
INSERT INTO `retiros` VALUES ('1', '2018-06-21 14:40:07', '4', '6000.00', 'asdasda', '6');
INSERT INTO `retiros` VALUES ('2', '2018-06-01 14:52:19', '4', '700.00', 'adsasd asdasda d', '8');

-- ----------------------------
-- Table structure for rubros
-- ----------------------------
DROP TABLE IF EXISTS `rubros`;
CREATE TABLE `rubros` (
  `rubId` int(11) NOT NULL AUTO_INCREMENT,
  `rubDescripcion` varchar(30) NOT NULL,
  `rubEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`rubId`),
  UNIQUE KEY `rubDescripcion` (`rubDescripcion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rubros
-- ----------------------------
INSERT INTO `rubros` VALUES ('1', 'Audio', 'AC');
INSERT INTO `rubros` VALUES ('2', 'ACCESORIOS', 'AC');
INSERT INTO `rubros` VALUES ('4', 'MICROFONOS', 'AC');
INSERT INTO `rubros` VALUES ('7', 'BATERIAS ', 'AC');
INSERT INTO `rubros` VALUES ('8', 'Radio', 'AC');
INSERT INTO `rubros` VALUES ('9', 'LUCES LED', 'AC');
INSERT INTO `rubros` VALUES ('10', 'FOCOS', 'AC');
INSERT INTO `rubros` VALUES ('11', 'ALARMAS', 'AC');
INSERT INTO `rubros` VALUES ('12', 'CELULARES', 'AC');
INSERT INTO `rubros` VALUES ('13', 'AUDIO PRO', 'AC');
INSERT INTO `rubros` VALUES ('14', 'MOTORES', 'AC');

-- ----------------------------
-- Table structure for sisactions
-- ----------------------------
DROP TABLE IF EXISTS `sisactions`;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisactions
-- ----------------------------
INSERT INTO `sisactions` VALUES ('1', 'Add', 'Agregar');
INSERT INTO `sisactions` VALUES ('2', 'Edit', 'Editar');
INSERT INTO `sisactions` VALUES ('3', 'Del', 'Eliminar');
INSERT INTO `sisactions` VALUES ('4', 'View', 'Consultar');
INSERT INTO `sisactions` VALUES ('5', 'Imprimir', 'Imprimir');
INSERT INTO `sisactions` VALUES ('6', 'Saldo', 'Consultar Saldo');
INSERT INTO `sisactions` VALUES ('7', 'Close', 'Cerrar');
INSERT INTO `sisactions` VALUES ('8', 'Box', 'Caja');
INSERT INTO `sisactions` VALUES ('9', 'Conf', 'Confirmar');
INSERT INTO `sisactions` VALUES ('10', 'Disc', 'Descartar');
INSERT INTO `sisactions` VALUES ('11', 'Budget', 'Presupuesto');
INSERT INTO `sisactions` VALUES ('12', 'Cob', 'Cobrar');
INSERT INTO `sisactions` VALUES ('13', 'Anu', 'Anular');
INSERT INTO `sisactions` VALUES ('14', 'AyC', 'Ap. y Cier. de Caja');
INSERT INTO `sisactions` VALUES ('15', 'Ent', 'Entregar');

-- ----------------------------
-- Table structure for sisgroups
-- ----------------------------
DROP TABLE IF EXISTS `sisgroups`;
CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroups
-- ----------------------------
INSERT INTO `sisgroups` VALUES ('5', 'Administrador');

-- ----------------------------
-- Table structure for sisgroupsactions
-- ----------------------------
DROP TABLE IF EXISTS `sisgroupsactions`;
CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`) USING BTREE,
  KEY `menuAccId` (`menuAccId`) USING BTREE,
  CONSTRAINT `sisgroupsactions_ibfk_1` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE,
  CONSTRAINT `sisgroupsactions_ibfk_2` FOREIGN KEY (`menuAccId`) REFERENCES `sismenuactions` (`menuAccId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1290 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroupsactions
-- ----------------------------
INSERT INTO `sisgroupsactions` VALUES ('1222', '5', '1');
INSERT INTO `sisgroupsactions` VALUES ('1223', '5', '2');
INSERT INTO `sisgroupsactions` VALUES ('1224', '5', '3');
INSERT INTO `sisgroupsactions` VALUES ('1225', '5', '4');
INSERT INTO `sisgroupsactions` VALUES ('1226', '5', '5');
INSERT INTO `sisgroupsactions` VALUES ('1227', '5', '6');
INSERT INTO `sisgroupsactions` VALUES ('1228', '5', '7');
INSERT INTO `sisgroupsactions` VALUES ('1229', '5', '8');
INSERT INTO `sisgroupsactions` VALUES ('1230', '5', '48');
INSERT INTO `sisgroupsactions` VALUES ('1231', '5', '49');
INSERT INTO `sisgroupsactions` VALUES ('1232', '5', '50');
INSERT INTO `sisgroupsactions` VALUES ('1233', '5', '51');
INSERT INTO `sisgroupsactions` VALUES ('1234', '5', '59');
INSERT INTO `sisgroupsactions` VALUES ('1235', '5', '9');
INSERT INTO `sisgroupsactions` VALUES ('1236', '5', '10');
INSERT INTO `sisgroupsactions` VALUES ('1237', '5', '11');
INSERT INTO `sisgroupsactions` VALUES ('1238', '5', '12');
INSERT INTO `sisgroupsactions` VALUES ('1239', '5', '21');
INSERT INTO `sisgroupsactions` VALUES ('1240', '5', '22');
INSERT INTO `sisgroupsactions` VALUES ('1241', '5', '23');
INSERT INTO `sisgroupsactions` VALUES ('1242', '5', '24');
INSERT INTO `sisgroupsactions` VALUES ('1243', '5', '25');
INSERT INTO `sisgroupsactions` VALUES ('1244', '5', '26');
INSERT INTO `sisgroupsactions` VALUES ('1245', '5', '28');
INSERT INTO `sisgroupsactions` VALUES ('1246', '5', '33');
INSERT INTO `sisgroupsactions` VALUES ('1247', '5', '34');
INSERT INTO `sisgroupsactions` VALUES ('1248', '5', '35');
INSERT INTO `sisgroupsactions` VALUES ('1249', '5', '36');
INSERT INTO `sisgroupsactions` VALUES ('1250', '5', '37');
INSERT INTO `sisgroupsactions` VALUES ('1251', '5', '38');
INSERT INTO `sisgroupsactions` VALUES ('1252', '5', '39');
INSERT INTO `sisgroupsactions` VALUES ('1253', '5', '40');
INSERT INTO `sisgroupsactions` VALUES ('1254', '5', '41');
INSERT INTO `sisgroupsactions` VALUES ('1255', '5', '42');
INSERT INTO `sisgroupsactions` VALUES ('1256', '5', '43');
INSERT INTO `sisgroupsactions` VALUES ('1257', '5', '44');
INSERT INTO `sisgroupsactions` VALUES ('1258', '5', '45');
INSERT INTO `sisgroupsactions` VALUES ('1259', '5', '46');
INSERT INTO `sisgroupsactions` VALUES ('1260', '5', '47');
INSERT INTO `sisgroupsactions` VALUES ('1261', '5', '64');
INSERT INTO `sisgroupsactions` VALUES ('1262', '5', '65');
INSERT INTO `sisgroupsactions` VALUES ('1263', '5', '66');
INSERT INTO `sisgroupsactions` VALUES ('1264', '5', '67');
INSERT INTO `sisgroupsactions` VALUES ('1265', '5', '82');
INSERT INTO `sisgroupsactions` VALUES ('1266', '5', '83');
INSERT INTO `sisgroupsactions` VALUES ('1267', '5', '84');
INSERT INTO `sisgroupsactions` VALUES ('1268', '5', '85');
INSERT INTO `sisgroupsactions` VALUES ('1269', '5', '63');
INSERT INTO `sisgroupsactions` VALUES ('1270', '5', '68');
INSERT INTO `sisgroupsactions` VALUES ('1271', '5', '69');
INSERT INTO `sisgroupsactions` VALUES ('1272', '5', '70');
INSERT INTO `sisgroupsactions` VALUES ('1273', '5', '71');
INSERT INTO `sisgroupsactions` VALUES ('1274', '5', '72');
INSERT INTO `sisgroupsactions` VALUES ('1275', '5', '73');
INSERT INTO `sisgroupsactions` VALUES ('1276', '5', '74');
INSERT INTO `sisgroupsactions` VALUES ('1277', '5', '75');
INSERT INTO `sisgroupsactions` VALUES ('1278', '5', '76');
INSERT INTO `sisgroupsactions` VALUES ('1279', '5', '77');
INSERT INTO `sisgroupsactions` VALUES ('1280', '5', '78');
INSERT INTO `sisgroupsactions` VALUES ('1281', '5', '79');
INSERT INTO `sisgroupsactions` VALUES ('1282', '5', '80');
INSERT INTO `sisgroupsactions` VALUES ('1283', '5', '81');
INSERT INTO `sisgroupsactions` VALUES ('1284', '5', '86');
INSERT INTO `sisgroupsactions` VALUES ('1285', '5', '87');
INSERT INTO `sisgroupsactions` VALUES ('1286', '5', '88');
INSERT INTO `sisgroupsactions` VALUES ('1287', '5', '89');
INSERT INTO `sisgroupsactions` VALUES ('1288', '5', '90');
INSERT INTO `sisgroupsactions` VALUES ('1289', '5', '91');

-- ----------------------------
-- Table structure for sismenu
-- ----------------------------
DROP TABLE IF EXISTS `sismenu`;
CREATE TABLE `sismenu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuIcon` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuController` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuView` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuFather` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `menuFather` (`menuFather`) USING BTREE,
  CONSTRAINT `sismenu_ibfk_1` FOREIGN KEY (`menuFather`) REFERENCES `sismenu` (`menuId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sismenu
-- ----------------------------
INSERT INTO `sismenu` VALUES ('9', 'Seguridad', 'fa fa-key', '', '', null);
INSERT INTO `sismenu` VALUES ('10', 'Usuarios', '', 'user', 'index', '9');
INSERT INTO `sismenu` VALUES ('11', 'Grupos', '', 'group', 'index', '9');
INSERT INTO `sismenu` VALUES ('12', 'Administración', 'fa fa-fw fa-cogs', '', '', null);
INSERT INTO `sismenu` VALUES ('13', 'Artículos', 'fa fa-cart-plus', 'article', 'index', null);
INSERT INTO `sismenu` VALUES ('16', 'Proveedores', 'fa fa-truck', 'provider', 'index', null);
INSERT INTO `sismenu` VALUES ('17', 'Cajas', 'fa fa-money', 'box', 'index', null);
INSERT INTO `sismenu` VALUES ('19', 'Recepción', 'fa fa-fw fa-archive', 'reception', 'index', null);
INSERT INTO `sismenu` VALUES ('20', 'Stock', 'fa fa-fw fa-industry', 'stock', 'index', null);
INSERT INTO `sismenu` VALUES ('21', 'Configuración', 'fa fa-fw fa-cogs', '', '', null);
INSERT INTO `sismenu` VALUES ('22', 'Rubros', '', 'rubro', 'index', '21');
INSERT INTO `sismenu` VALUES ('23', 'Subrubros', '', 'rubro', 'indexSR', '21');
INSERT INTO `sismenu` VALUES ('24', 'Lista_de_Precios', '', 'lista', 'index', '12');
INSERT INTO `sismenu` VALUES ('27', 'Actualización_de_Precios', '', 'rubro', 'upgrate', '12');
INSERT INTO `sismenu` VALUES ('31', 'Cotización_Dolar', 'fa fa-fw fa-dollar', 'configuration', 'getCotizacion', null);
INSERT INTO `sismenu` VALUES ('32', 'Marcas', '', 'brand', 'index', '21');
INSERT INTO `sismenu` VALUES ('33', 'Cuenta_Corriente', 'fa fa-fw fa-line-chart', ' ', ' ', null);
INSERT INTO `sismenu` VALUES ('34', 'Cta_Cte_Proveedores', '', 'cuentacorriente', 'indexp', '33');
INSERT INTO `sismenu` VALUES ('35', 'Cta_Cte_Clientes', '', 'cuentacorriente', 'indexc', '33');
INSERT INTO `sismenu` VALUES ('36', 'Ventas_Minoristas', 'fa fa-fw fa-info', 'sale', 'listado_minorista', null);
INSERT INTO `sismenu` VALUES ('37', 'Ventas_Mayoristas', 'fa fa-fw fa-info', 'sale', 'listado_mayorista', null);
INSERT INTO `sismenu` VALUES ('38', 'Vendedores', '', 'vendedor', 'index', '21');
INSERT INTO `sismenu` VALUES ('39', 'Faltantes', 'fa fa-fw fa-bell', 'article', 'faltante', null);
INSERT INTO `sismenu` VALUES ('40', 'Ventas_Reservas', 'fa fa-fw fa-info', 'sale', 'listado_reserva', null);

-- ----------------------------
-- Table structure for sismenuactions
-- ----------------------------
DROP TABLE IF EXISTS `sismenuactions`;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`),
  KEY `menuId` (`menuId`) USING BTREE,
  KEY `actId` (`actId`) USING BTREE,
  CONSTRAINT `sismenuactions_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `sismenu` (`menuId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `sismenuactions_ibfk_2` FOREIGN KEY (`actId`) REFERENCES `sisactions` (`actId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sismenuactions
-- ----------------------------
INSERT INTO `sismenuactions` VALUES ('1', '10', '1');
INSERT INTO `sismenuactions` VALUES ('2', '10', '2');
INSERT INTO `sismenuactions` VALUES ('3', '10', '3');
INSERT INTO `sismenuactions` VALUES ('4', '10', '4');
INSERT INTO `sismenuactions` VALUES ('5', '11', '1');
INSERT INTO `sismenuactions` VALUES ('6', '11', '2');
INSERT INTO `sismenuactions` VALUES ('7', '11', '3');
INSERT INTO `sismenuactions` VALUES ('8', '11', '4');
INSERT INTO `sismenuactions` VALUES ('9', '13', '1');
INSERT INTO `sismenuactions` VALUES ('10', '13', '2');
INSERT INTO `sismenuactions` VALUES ('11', '13', '3');
INSERT INTO `sismenuactions` VALUES ('12', '13', '4');
INSERT INTO `sismenuactions` VALUES ('21', '16', '1');
INSERT INTO `sismenuactions` VALUES ('22', '16', '2');
INSERT INTO `sismenuactions` VALUES ('23', '16', '3');
INSERT INTO `sismenuactions` VALUES ('24', '16', '4');
INSERT INTO `sismenuactions` VALUES ('25', '17', '1');
INSERT INTO `sismenuactions` VALUES ('26', '17', '7');
INSERT INTO `sismenuactions` VALUES ('28', '17', '4');
INSERT INTO `sismenuactions` VALUES ('33', '19', '1');
INSERT INTO `sismenuactions` VALUES ('34', '19', '9');
INSERT INTO `sismenuactions` VALUES ('35', '19', '10');
INSERT INTO `sismenuactions` VALUES ('36', '19', '4');
INSERT INTO `sismenuactions` VALUES ('37', '20', '1');
INSERT INTO `sismenuactions` VALUES ('38', '20', '4');
INSERT INTO `sismenuactions` VALUES ('39', '20', '5');
INSERT INTO `sismenuactions` VALUES ('40', '22', '1');
INSERT INTO `sismenuactions` VALUES ('41', '22', '2');
INSERT INTO `sismenuactions` VALUES ('42', '22', '3');
INSERT INTO `sismenuactions` VALUES ('43', '22', '4');
INSERT INTO `sismenuactions` VALUES ('44', '23', '1');
INSERT INTO `sismenuactions` VALUES ('45', '23', '2');
INSERT INTO `sismenuactions` VALUES ('46', '23', '3');
INSERT INTO `sismenuactions` VALUES ('47', '23', '4');
INSERT INTO `sismenuactions` VALUES ('48', '24', '1');
INSERT INTO `sismenuactions` VALUES ('49', '24', '2');
INSERT INTO `sismenuactions` VALUES ('50', '24', '3');
INSERT INTO `sismenuactions` VALUES ('51', '24', '4');
INSERT INTO `sismenuactions` VALUES ('59', '27', '2');
INSERT INTO `sismenuactions` VALUES ('63', '31', '2');
INSERT INTO `sismenuactions` VALUES ('64', '32', '1');
INSERT INTO `sismenuactions` VALUES ('65', '32', '2');
INSERT INTO `sismenuactions` VALUES ('66', '32', '3');
INSERT INTO `sismenuactions` VALUES ('67', '32', '4');
INSERT INTO `sismenuactions` VALUES ('68', '34', '1');
INSERT INTO `sismenuactions` VALUES ('69', '34', '4');
INSERT INTO `sismenuactions` VALUES ('70', '35', '1');
INSERT INTO `sismenuactions` VALUES ('71', '35', '4');
INSERT INTO `sismenuactions` VALUES ('72', '36', '1');
INSERT INTO `sismenuactions` VALUES ('73', '36', '2');
INSERT INTO `sismenuactions` VALUES ('74', '36', '3');
INSERT INTO `sismenuactions` VALUES ('75', '36', '4');
INSERT INTO `sismenuactions` VALUES ('76', '36', '5');
INSERT INTO `sismenuactions` VALUES ('77', '37', '1');
INSERT INTO `sismenuactions` VALUES ('78', '37', '2');
INSERT INTO `sismenuactions` VALUES ('79', '37', '3');
INSERT INTO `sismenuactions` VALUES ('80', '37', '4');
INSERT INTO `sismenuactions` VALUES ('81', '37', '5');
INSERT INTO `sismenuactions` VALUES ('82', '38', '1');
INSERT INTO `sismenuactions` VALUES ('83', '38', '2');
INSERT INTO `sismenuactions` VALUES ('84', '38', '3');
INSERT INTO `sismenuactions` VALUES ('85', '38', '4');
INSERT INTO `sismenuactions` VALUES ('86', '39', '4');
INSERT INTO `sismenuactions` VALUES ('87', '40', '1');
INSERT INTO `sismenuactions` VALUES ('88', '40', '2');
INSERT INTO `sismenuactions` VALUES ('89', '40', '3');
INSERT INTO `sismenuactions` VALUES ('90', '40', '4');
INSERT INTO `sismenuactions` VALUES ('91', '40', '5');

-- ----------------------------
-- Table structure for sisusers
-- ----------------------------
DROP TABLE IF EXISTS `sisusers`;
CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrLastAcces` datetime DEFAULT NULL,
  `usrToken` text COLLATE utf8_spanish_ci,
  `usrEsAdmin` bit(1) DEFAULT b'0',
  PRIMARY KEY (`usrId`),
  UNIQUE KEY `usrNick` (`usrNick`) USING BTREE,
  KEY `grpId` (`grpId`) USING BTREE,
  CONSTRAINT `sisusers_ibfk_1` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisusers
-- ----------------------------
INSERT INTO `sisusers` VALUES ('4', 'adolfo', 'Adolfo', 'Fernandez', '1', 'e10adc3949ba59abbe56e057f20f883e', '5', '2018-07-24 15:26:29', 'phIgZLicNd1xEiceZ4f7WNc9KQoXMuaSJBCFgwMggRuCT93A9z33oKUqJ6T3SZeIyb8NcJEdgC5WxTvcejIlQgwRMXBdWkZTDzGf1FcMy1P2ZG2zOwZsoxzlr52LAUjRbYGNc8vnHhItYC6kOs4MkGZC8Cj4cZs9Bzin5cwjZG5ceahUBNUPGrwv5Kd2am6gl9NQcXGw47FpNLUgnlkmItqQawQIKP4giWVfwYUAg6z34gWcPEiZ0SwEznApUle', '\0');
INSERT INTO `sisusers` VALUES ('9', 'delfi', 'Delfina', 'Fernandez', '1', 'e10adc3949ba59abbe56e057f20f883e', '5', '2018-05-22 11:40:24', '603pZdO5TFypzd4cpBwBvNSRmOQGxVBEcpxX16f1BwJxRyFZ8r6B0pdo8aDPznTaZrs5pnImYDwfO8mLFiQ79SOF7Z0EHWCaNm9AidFmniiHbnal6XjsoFx9HAfpqXoNlnrr4IxQEuLpzLyhfYaN3BlR3fIzJK9PQlg3b37iklXjQfodFIa19HeMZGtUMozg6xTe5gWtYoaaZpylWosYDswWGQlUM5yUhWvpMZAYpekBqywtcylg9zTwf2BnmTA', '\0');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `artId` int(11) NOT NULL,
  `stkCant` decimal(10,2) NOT NULL,
  `refId` int(11) DEFAULT NULL,
  `stkOrigen` varchar(2) NOT NULL DEFAULT 'RC',
  `stkFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stkId`),
  KEY `artId` (`artId`) USING BTREE,
  KEY `recId` (`refId`) USING BTREE,
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('6', '289', '-1.00', '54', 'VN', '2018-05-03 21:09:19');
INSERT INTO `stock` VALUES ('7', '285', '-1.00', '55', 'VN', '2018-05-03 21:10:56');
INSERT INTO `stock` VALUES ('8', '285', '-1.00', '57', 'VN', '2018-05-03 21:11:46');
INSERT INTO `stock` VALUES ('9', '285', '-1.00', '58', 'VN', '2018-05-03 21:11:47');
INSERT INTO `stock` VALUES ('10', '285', '-1.00', '59', 'VN', '2018-05-03 21:11:49');
INSERT INTO `stock` VALUES ('11', '285', '-1.00', '60', 'VN', '2018-05-03 21:11:50');
INSERT INTO `stock` VALUES ('12', '285', '-1.00', '61', 'VN', '2018-05-03 21:11:52');
INSERT INTO `stock` VALUES ('13', '285', '-1.00', '62', 'VN', '2018-05-03 21:11:53');
INSERT INTO `stock` VALUES ('14', '285', '-1.00', '63', 'VN', '2018-05-03 21:11:55');
INSERT INTO `stock` VALUES ('15', '285', '-1.00', '64', 'VN', '2018-05-03 21:11:57');
INSERT INTO `stock` VALUES ('16', '285', '-1.00', '65', 'VN', '2018-05-03 21:11:58');
INSERT INTO `stock` VALUES ('17', '285', '-1.00', '66', 'VN', '2018-05-03 21:12:00');
INSERT INTO `stock` VALUES ('18', '22', '-1.00', '68', 'VN', '2018-05-03 21:23:22');
INSERT INTO `stock` VALUES ('19', '22', '-1.00', '69', 'VN', '2018-05-03 21:29:25');
INSERT INTO `stock` VALUES ('20', '22', '-1.00', '69', 'VN', '2018-05-03 21:29:25');
INSERT INTO `stock` VALUES ('21', '22', '-1.00', '69', 'VN', '2018-05-03 21:29:25');
INSERT INTO `stock` VALUES ('22', '22', '-1.00', '69', 'VN', '2018-05-03 21:29:25');
INSERT INTO `stock` VALUES ('23', '22', '-1.00', '69', 'VN', '2018-05-03 21:29:25');
INSERT INTO `stock` VALUES ('24', '22', '-1.00', '70', 'VN', '2018-05-03 21:31:35');
INSERT INTO `stock` VALUES ('25', '22', '-1.00', '71', 'VN', '2018-05-03 21:36:15');
INSERT INTO `stock` VALUES ('26', '22', '18.00', null, 'AJ', '2018-05-03 21:37:58');
INSERT INTO `stock` VALUES ('27', '260', '-1.00', '72', 'VN', '2018-05-03 21:39:48');
INSERT INTO `stock` VALUES ('28', '22', '-1.00', '73', 'VN', '2018-05-03 21:41:32');
INSERT INTO `stock` VALUES ('29', '289', '-1.00', '74', 'VN', '2018-05-04 17:28:25');
INSERT INTO `stock` VALUES ('30', '289', '-1.00', '75', 'VN', '2018-05-04 17:45:56');
INSERT INTO `stock` VALUES ('31', '287', '-1.00', '76', 'VN', '2018-05-04 17:46:34');
INSERT INTO `stock` VALUES ('32', '278', '-1.00', '77', 'VN', '2018-05-04 17:47:00');
INSERT INTO `stock` VALUES ('33', '287', '-1.00', '78', 'VN', '2018-05-04 17:48:59');
INSERT INTO `stock` VALUES ('34', '289', '-1.00', '79', 'VN', '2018-05-04 17:50:41');
INSERT INTO `stock` VALUES ('35', '58', '-1.00', '81', 'VN', '2018-05-04 17:51:14');
INSERT INTO `stock` VALUES ('36', '278', '-1.00', '82', 'VN', '2018-05-07 17:22:36');
INSERT INTO `stock` VALUES ('37', '278', '-1.00', '83', 'VN', '2018-05-08 09:53:42');
INSERT INTO `stock` VALUES ('38', '285', '-4.00', '85', 'VN', '2018-05-23 11:22:03');
INSERT INTO `stock` VALUES ('39', '292', '-8.00', '86', 'VN', '2018-05-23 11:22:44');
INSERT INTO `stock` VALUES ('40', '287', '-1.00', '87', 'VN', '2018-05-23 11:23:35');
INSERT INTO `stock` VALUES ('41', '2', '-100.00', '88', 'VN', '2018-05-23 11:27:12');
INSERT INTO `stock` VALUES ('42', '225', '-6.00', '89', 'VN', '2018-05-23 11:28:11');
INSERT INTO `stock` VALUES ('43', '285', '-100.00', '94', 'VN', '2018-05-29 14:47:37');
INSERT INTO `stock` VALUES ('44', '293', '-12.00', '96', 'VN', '2018-05-29 15:00:17');
INSERT INTO `stock` VALUES ('45', '225', '-1.00', '96', 'VN', '2018-05-29 15:00:17');
INSERT INTO `stock` VALUES ('47', '225', '-10.00', null, 'VN', '2018-05-29 15:02:29');
INSERT INTO `stock` VALUES ('48', '293', '-2.00', null, 'VN', '2018-05-29 15:02:29');
INSERT INTO `stock` VALUES ('49', '225', '-10.00', '95', 'VN', '2018-05-29 15:02:56');
INSERT INTO `stock` VALUES ('50', '293', '-2.00', '95', 'VN', '2018-05-29 15:02:56');
INSERT INTO `stock` VALUES ('51', '225', '-10.00', '95', 'VN', '2018-05-29 15:03:24');
INSERT INTO `stock` VALUES ('52', '293', '-2.00', '95', 'VN', '2018-05-29 15:03:24');
INSERT INTO `stock` VALUES ('53', '233', '-3.00', '98', 'VN', '2018-05-29 15:04:49');
INSERT INTO `stock` VALUES ('54', '282', '-7.00', '98', 'VN', '2018-05-29 15:04:49');
INSERT INTO `stock` VALUES ('55', '233', '-5.00', '97', 'VN', '2018-05-29 15:05:20');
INSERT INTO `stock` VALUES ('56', '282', '-10.00', '97', 'VN', '2018-05-29 15:05:20');
INSERT INTO `stock` VALUES ('57', '292', '-18.00', '100', 'VN', '2018-05-29 15:09:24');
INSERT INTO `stock` VALUES ('58', '154', '-7.00', '102', 'VN', '2018-05-29 16:18:06');
INSERT INTO `stock` VALUES ('59', '154', '-10.00', '101', 'VN', '2018-05-29 16:18:27');
INSERT INTO `stock` VALUES ('60', '154', '-3.00', '103', 'VN', '2018-05-29 16:19:55');
INSERT INTO `stock` VALUES ('61', '285', '-1.00', '104', 'VN', '2018-05-30 14:54:49');
INSERT INTO `stock` VALUES ('62', '256', '-1.00', '106', 'VN', '2018-05-30 14:57:15');
INSERT INTO `stock` VALUES ('63', '256', '-1.00', '105', 'VN', '2018-05-30 14:57:34');
INSERT INTO `stock` VALUES ('64', '293', '-1.00', '108', 'VN', '2018-06-04 16:50:13');
INSERT INTO `stock` VALUES ('65', '293', '0.00', '110', 'VN', '2018-06-05 12:09:18');
INSERT INTO `stock` VALUES ('66', '293', '-1.00', '110', 'VN', '2018-06-05 12:09:51');
INSERT INTO `stock` VALUES ('67', '293', '0.00', '110', 'VN', '2018-06-05 12:09:51');
INSERT INTO `stock` VALUES ('68', '292', '-1.00', '112', 'VN', '2018-06-05 12:11:20');
INSERT INTO `stock` VALUES ('69', '292', '-1.00', '111', 'VN', '2018-06-05 12:12:32');
INSERT INTO `stock` VALUES ('70', '293', '-1.00', '114', 'VN', '2018-06-05 14:47:11');
INSERT INTO `stock` VALUES ('71', '285', '-1.00', '115', 'VN', '2018-06-05 15:17:54');
INSERT INTO `stock` VALUES ('72', '285', '-1.00', '116', 'VN', '2018-06-05 15:18:20');
INSERT INTO `stock` VALUES ('73', '256', '-1.00', '117', 'VN', '2018-06-05 15:19:03');
INSERT INTO `stock` VALUES ('74', '152', '-1.00', '119', 'VN', '2018-06-05 15:56:20');
INSERT INTO `stock` VALUES ('75', '153', '-1.00', '120', 'VN', '2018-06-05 15:57:00');
INSERT INTO `stock` VALUES ('76', '293', '-1.00', '99', 'VN', '2018-06-05 15:57:39');
INSERT INTO `stock` VALUES ('77', '285', '-1.00', '113', 'VN', '2018-06-05 15:58:29');
INSERT INTO `stock` VALUES ('78', '293', '-10.00', '121', 'VN', '2018-06-27 14:23:27');
INSERT INTO `stock` VALUES ('79', '285', '-5.00', '122', 'VN', '2018-06-27 14:23:48');
INSERT INTO `stock` VALUES ('84', '285', '-1.00', '127', 'VN', '2018-06-27 14:59:16');
INSERT INTO `stock` VALUES ('85', '285', '-1.00', '128', 'VN', '2018-06-27 14:59:28');
INSERT INTO `stock` VALUES ('88', '293', '-1.00', '131', 'VN', '2018-06-27 15:10:34');
INSERT INTO `stock` VALUES ('107', '213', '-1.00', '133', 'VN', '2018-06-27 15:46:06');
INSERT INTO `stock` VALUES ('108', '285', '-1.00', '134', 'VN', '2018-06-27 15:49:58');
INSERT INTO `stock` VALUES ('109', '285', '-1.00', '135', 'VN', '2018-06-27 15:51:57');
INSERT INTO `stock` VALUES ('110', '195', '-1.00', '136', 'VN', '2018-06-27 15:53:09');
INSERT INTO `stock` VALUES ('111', '285', '-8.00', '138', 'VN', '2018-06-29 19:46:17');
INSERT INTO `stock` VALUES ('112', '247', '-1.00', '139', 'VN', '2018-07-10 19:56:26');
INSERT INTO `stock` VALUES ('113', '285', '-1.00', '140', 'VN', '2018-07-10 19:57:17');
INSERT INTO `stock` VALUES ('114', '247', '-1.00', '141', 'VN', '2018-07-11 16:31:20');
INSERT INTO `stock` VALUES ('115', '292', '5.00', '32', 'RC', '2018-07-11 16:31:43');
INSERT INTO `stock` VALUES ('116', '291', '10.00', '32', 'RC', '2018-07-11 16:31:43');
INSERT INTO `stock` VALUES ('117', '293', '-10.00', '145', 'VN', '2018-07-20 14:42:05');
INSERT INTO `stock` VALUES ('118', '293', '-1.00', '146', 'VN', '2018-07-23 10:34:38');
INSERT INTO `stock` VALUES ('119', '278', '-1.00', '147', 'VN', '2018-07-23 10:37:28');
INSERT INTO `stock` VALUES ('120', '285', '-2.00', '147', 'VN', '2018-07-23 10:37:28');
INSERT INTO `stock` VALUES ('121', '293', '-4.00', '147', 'VN', '2018-07-23 10:37:28');
INSERT INTO `stock` VALUES ('122', '169', '-8.00', '148', 'VN', '2018-07-23 10:46:17');
INSERT INTO `stock` VALUES ('123', '287', '-2.00', '148', 'VN', '2018-07-23 10:46:17');
INSERT INTO `stock` VALUES ('124', '293', '-2.00', '148', 'VN', '2018-07-23 10:46:17');
INSERT INTO `stock` VALUES ('125', '225', '-1.00', '149', 'VN', '2018-07-23 15:46:47');
INSERT INTO `stock` VALUES ('126', '292', '-2.00', '149', 'VN', '2018-07-23 15:46:47');
INSERT INTO `stock` VALUES ('127', '288', '2.00', '31', 'RC', '2018-07-24 14:22:38');
INSERT INTO `stock` VALUES ('128', '290', '2.00', '31', 'RC', '2018-07-24 14:22:38');
INSERT INTO `stock` VALUES ('129', '286', '5.00', '31', 'RC', '2018-07-24 14:22:38');
INSERT INTO `stock` VALUES ('130', '287', '8.00', '31', 'RC', '2018-07-24 14:22:38');
INSERT INTO `stock` VALUES ('131', '292', '-1.00', '150', 'VN', '2018-07-24 14:35:00');
INSERT INTO `stock` VALUES ('132', '215', '-1.00', '151', 'VN', '2018-07-24 14:42:20');
INSERT INTO `stock` VALUES ('133', '285', '-1.00', '152', 'VN', '2018-07-24 14:44:11');
INSERT INTO `stock` VALUES ('134', '285', '-1.00', '153', 'VN', '2018-07-24 14:45:27');

-- ----------------------------
-- Table structure for stockreserva
-- ----------------------------
DROP TABLE IF EXISTS `stockreserva`;
CREATE TABLE `stockreserva` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `artId` int(11) NOT NULL,
  `stkCant` decimal(10,2) NOT NULL,
  `refId` int(11) DEFAULT NULL,
  `stkOrigen` varchar(2) NOT NULL DEFAULT 'RC',
  `stkFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stkId`),
  KEY `artId` (`artId`) USING BTREE,
  KEY `recId` (`refId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stockreserva
-- ----------------------------
INSERT INTO `stockreserva` VALUES ('1', '285', '20.00', '84', 'VN', '2018-05-22 15:40:39');
INSERT INTO `stockreserva` VALUES ('2', '292', '1.00', '107', 'VN', '2018-05-30 16:05:25');
INSERT INTO `stockreserva` VALUES ('3', '293', '1.00', '109', 'VN', '2018-06-04 17:09:57');
INSERT INTO `stockreserva` VALUES ('4', '293', '1.00', '110', 'VN', '2018-06-04 17:58:10');
INSERT INTO `stockreserva` VALUES ('5', '292', '1.00', '111', 'VN', '2018-06-05 09:59:38');
INSERT INTO `stockreserva` VALUES ('6', '292', '1.00', '112', 'VN', '2018-06-05 10:01:35');
INSERT INTO `stockreserva` VALUES ('7', '293', '0.00', '110', 'VN', '2018-06-05 12:09:18');
INSERT INTO `stockreserva` VALUES ('8', '293', '-1.00', '110', 'VN', '2018-06-05 12:09:51');
INSERT INTO `stockreserva` VALUES ('9', '293', '0.00', '110', 'VN', '2018-06-05 12:09:51');
INSERT INTO `stockreserva` VALUES ('10', '292', '-1.00', '112', 'VN', '2018-06-05 12:11:20');
INSERT INTO `stockreserva` VALUES ('11', '292', '-1.00', '111', 'VN', '2018-06-05 12:12:32');
INSERT INTO `stockreserva` VALUES ('12', '285', '1.00', '113', 'VN', '2018-06-05 12:20:24');
INSERT INTO `stockreserva` VALUES ('13', '285', '1.00', '118', 'VN', '2018-06-05 15:19:22');
INSERT INTO `stockreserva` VALUES ('14', '285', '-1.00', '113', 'VN', '2018-06-05 15:58:29');
INSERT INTO `stockreserva` VALUES ('15', '285', '1.00', '132', 'VN', '2018-06-27 15:22:25');
INSERT INTO `stockreserva` VALUES ('16', '195', '1.00', '136', 'VN', '2018-06-27 15:52:37');
INSERT INTO `stockreserva` VALUES ('17', '195', '-1.00', '136', 'VN', '2018-06-27 15:53:09');
INSERT INTO `stockreserva` VALUES ('18', '293', '1.00', '144', 'VN', '2018-07-11 17:34:31');

-- ----------------------------
-- Table structure for subrubros
-- ----------------------------
DROP TABLE IF EXISTS `subrubros`;
CREATE TABLE `subrubros` (
  `subrId` int(11) NOT NULL AUTO_INCREMENT,
  `subrDescripcion` varchar(30) NOT NULL,
  `rubId` int(11) NOT NULL,
  `subrEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`subrId`),
  UNIQUE KEY `subrDescripcion` (`subrDescripcion`) USING BTREE,
  UNIQUE KEY `subrDescripcion_3` (`subrDescripcion`) USING BTREE,
  UNIQUE KEY `subrDescripcion_4` (`subrDescripcion`) USING BTREE,
  UNIQUE KEY `subrDescripcion_5` (`subrDescripcion`) USING BTREE,
  UNIQUE KEY `subrDescripcion_7` (`subrDescripcion`) USING BTREE,
  KEY `rubId` (`rubId`) USING BTREE,
  KEY `subrDescripcion_2` (`subrDescripcion`) USING BTREE,
  KEY `subrDescripcion_6` (`subrDescripcion`) USING BTREE,
  CONSTRAINT `subrubros_ibfk_1` FOREIGN KEY (`rubId`) REFERENCES `rubros` (`rubId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subrubros
-- ----------------------------
INSERT INTO `subrubros` VALUES ('1', 'Estereos', '1', 'AC');
INSERT INTO `subrubros` VALUES ('2', 'Parlantes Chicos', '1', 'AC');
INSERT INTO `subrubros` VALUES ('3', 'TV', '2', 'AC');
INSERT INTO `subrubros` VALUES ('4', 'CELULARES', '2', 'AC');
INSERT INTO `subrubros` VALUES ('5', 'Pilas', '2', 'AC');
INSERT INTO `subrubros` VALUES ('6', 'Telefonia', '2', 'AC');
INSERT INTO `subrubros` VALUES ('7', 'Computacion', '2', 'AC');
INSERT INTO `subrubros` VALUES ('8', 'Auto', '2', 'AC');
INSERT INTO `subrubros` VALUES ('9', 'Audio Cars', '1', 'AC');
INSERT INTO `subrubros` VALUES ('12', 'Autos', '7', 'AC');
INSERT INTO `subrubros` VALUES ('13', 'Controles TV', '2', 'AC');
INSERT INTO `subrubros` VALUES ('14', 'Controles Aire acondicionado', '2', 'AC');
INSERT INTO `subrubros` VALUES ('15', 'Controles DVD UNIV', '2', 'AC');
INSERT INTO `subrubros` VALUES ('16', 'Soporte TV/LCD', '2', 'AC');
INSERT INTO `subrubros` VALUES ('17', 'Estaño', '2', 'AC');
INSERT INTO `subrubros` VALUES ('18', 'Fuentes Universales', '2', 'AC');
INSERT INTO `subrubros` VALUES ('19', 'Radio', '2', 'AC');
INSERT INTO `subrubros` VALUES ('20', 'FOCOS PARTY', '9', 'AC');
INSERT INTO `subrubros` VALUES ('23', 'sirena', '11', 'AC');
INSERT INTO `subrubros` VALUES ('24', 'para autos', '11', 'AC');
INSERT INTO `subrubros` VALUES ('25', 'INALAMBRICOS', '4', 'AC');
INSERT INTO `subrubros` VALUES ('26', 'VINCHA', '4', 'AC');
INSERT INTO `subrubros` VALUES ('27', 'LINEA', '4', 'AC');
INSERT INTO `subrubros` VALUES ('28', 'CORBATERO', '4', 'AC');
INSERT INTO `subrubros` VALUES ('29', 'MESA', '4', 'AC');
INSERT INTO `subrubros` VALUES ('30', 'Básicos', '12', 'AC');
INSERT INTO `subrubros` VALUES ('31', 'CONSOLAS', '13', 'AC');
INSERT INTO `subrubros` VALUES ('32', 'varios', '2', 'AC');
INSERT INTO `subrubros` VALUES ('33', 'potencias', '13', 'AC');
INSERT INTO `subrubros` VALUES ('34', 'P/PORTONES', '14', 'AC');
INSERT INTO `subrubros` VALUES ('35', 'controles', '14', 'AC');

-- ----------------------------
-- Table structure for tipomediopago
-- ----------------------------
DROP TABLE IF EXISTS `tipomediopago`;
CREATE TABLE `tipomediopago` (
  `tmpId` int(11) NOT NULL AUTO_INCREMENT,
  `tmpCodigo` varchar(3) NOT NULL,
  `tmpDescripción` varchar(50) NOT NULL,
  `tmpEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `tmpDescripcion1` varchar(50) DEFAULT NULL,
  `tmpDescripcion2` varchar(50) DEFAULT NULL,
  `tmpDescripcion3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tmpId`),
  UNIQUE KEY `tmpCodigo` (`tmpCodigo`) USING BTREE,
  UNIQUE KEY `tmpDescripciÃ³n` (`tmpDescripción`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipomediopago
-- ----------------------------
INSERT INTO `tipomediopago` VALUES ('1', 'EFE', 'Efectivo', 'AC', null, null, null);
INSERT INTO `tipomediopago` VALUES ('2', 'TJT', 'Tarjeta', 'AC', 'N° Lote', 'N° Autorización', 'Cuotas');
INSERT INTO `tipomediopago` VALUES ('3', 'CRE', 'Credito Argentino', 'AC', null, null, null);
INSERT INTO `tipomediopago` VALUES ('4', 'CCT', 'Cuenta Corriente', 'AC', null, null, null);

-- ----------------------------
-- Table structure for tipos_documentos
-- ----------------------------
DROP TABLE IF EXISTS `tipos_documentos`;
CREATE TABLE `tipos_documentos` (
  `docId` int(11) NOT NULL AUTO_INCREMENT,
  `docDescripcion` varchar(50) NOT NULL,
  `docTipo` varchar(2) NOT NULL,
  `docEstado` varchar(2) NOT NULL,
  PRIMARY KEY (`docId`),
  UNIQUE KEY `docDescripcion` (`docDescripcion`,`docTipo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipos_documentos
-- ----------------------------
INSERT INTO `tipos_documentos` VALUES ('1', 'DNI', 'DP', 'AC');
INSERT INTO `tipos_documentos` VALUES ('2', 'CUIT', 'DP', 'AC');
INSERT INTO `tipos_documentos` VALUES ('3', 'LC', 'DP', 'AC');
INSERT INTO `tipos_documentos` VALUES ('4', 'LE', 'DP', 'AC');

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

-- ----------------------------
-- Table structure for vendedores
-- ----------------------------
DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  UNIQUE KEY `nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vendedores
-- ----------------------------
INSERT INTO `vendedores` VALUES ('1', '100', 'Adolfo', 'AC');
INSERT INTO `vendedores` VALUES ('2', '002', 'Natalia', 'AC');
INSERT INTO `vendedores` VALUES ('3', '003', 'Daniel', 'AC');

-- ----------------------------
-- Procedure structure for stockArt
-- ----------------------------
DROP PROCEDURE IF EXISTS `stockArt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stockArt`(IN `pArtId` int)
BEGIN
	#Routine body goes here...
	select sum(stkCant) as stock from stock where artId = pArtId ;
END
;;
DELIMITER ;
