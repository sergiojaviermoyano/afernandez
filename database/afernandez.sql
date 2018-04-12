/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : afernandez

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-04-12 17:34:59
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
  KEY `marcaId` (`marcaId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`ivaId`) REFERENCES `ivaalicuotas` (`ivaId`) ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`subrId`) REFERENCES `subrubros` (`subrId`) ON UPDATE CASCADE,
  CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`marcaId`) REFERENCES `marcaart` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('571', '1234567890', 'Estereo', '10.00', '33.00', '', 'AC', '5', '4', '9', '10.00', '', '', '1');
INSERT INTO `articles` VALUES ('572', '1234567899', 'Parlantes', '10.00', '20.00', '\0', 'AC', '6', '4', '9', '10.00', '\0', '', '1');

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `cajaId` int(11) NOT NULL AUTO_INCREMENT,
  `cajaApertura` datetime NOT NULL,
  `cajaCierre` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `cajaImpApertura` decimal(10,2) NOT NULL,
  `cajaImpVentas` decimal(10,2) DEFAULT NULL,
  `cajaImpRendicion` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cajaId`),
  KEY `usrId` (`usrId`) USING BTREE,
  CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES ('1', '0000-00-00 00:00:00', null, '4', '0.00', '100.00', '200.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Consumidor Final', '', '1', '99999999', '', '', '', 'AC', '');
INSERT INTO `clientes` VALUES ('2', 'Sergio', 'Moyano', '1', '31324208', 'Cura Brochero M/F C/19', '123456789', '', 'AC', '\0');
INSERT INTO `clientes` VALUES ('3', 'Marta', 'Perez', '1', '31324209', 'Caucete - San Juan', '123456789', '', 'AC', '\0');
INSERT INTO `clientes` VALUES ('4', 'Rolando', 'Morales', '1', '31324200', 'Caucete', '', '', 'AC', '\0');
INSERT INTO `clientes` VALUES ('5', 'Pedro ', 'Marmol', '1', '31324250', 'caucete - san juan', '', '', 'AC', '\0');
INSERT INTO `clientes` VALUES ('6', 'adolfo', 'fernandez', '1', '3132300', 'sdfsjhfsjk', '23123', '', 'AC', '\0');
INSERT INTO `clientes` VALUES ('7', 'bnbf', 'hnfnyb', '1', '34500000', '', '', '', 'AC', '\0');

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
INSERT INTO `configuracion` VALUES ('5', 'Adolfo', 'Fernandez', '20.50');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuentacorrientecliente
-- ----------------------------
INSERT INTO `cuentacorrientecliente` VALUES ('1', 'Venta: 14', '14', 'VN', '68.00', null, '2018-04-12 14:17:25', '1', '4', null);

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
  CONSTRAINT `cuentacorrienteproveedor_ibfk_1` FOREIGN KEY (`prvId`) REFERENCES `proveedores` (`prvId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE,
  CONSTRAINT `cuentacorrienteproveedor_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuentacorrienteproveedor
-- ----------------------------
INSERT INTO `cuentacorrienteproveedor` VALUES ('17', 'Recepción Factura A número: 1234-456789', '4', 'RC', '70.00', null, '2018-02-16 00:00:00', '7', '4', null);

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
INSERT INTO `listadeprecios` VALUES ('2', 'Tarjeta', '\0', '10.00', 'AC');

-- ----------------------------
-- Table structure for marcaart
-- ----------------------------
DROP TABLE IF EXISTS `marcaart`;
CREATE TABLE `marcaart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of marcaart
-- ----------------------------
INSERT INTO `marcaart` VALUES ('1', 'Pionner');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orden
-- ----------------------------
INSERT INTO `orden` VALUES ('1', '2018-04-11 17:00:50', '2', '10.00', '1', '1', '100.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('2', '2018-04-12 11:29:04', '1', '0.00', '3', '1', '18.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('3', '2018-04-12 11:29:13', '1', '0.00', '3', '1', '18.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('5', '2018-04-12 11:30:03', '1', '0.00', '3', '1', '18.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('6', '2018-04-12 11:30:25', '1', '0.00', '3', '1', '18.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('7', '2018-04-12 11:36:55', '1', '0.00', '2', '1', '46.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('8', '2018-04-12 11:38:55', '1', '0.00', '2', '1', '46.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('9', '2018-04-12 11:45:39', '1', '0.00', '2', '1', '92.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('10', '2018-04-12 12:00:46', '2', '10.00', '3', '1', '40.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('11', '2018-04-12 12:01:19', '2', '10.00', '3', '1', '41.20', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('12', '2018-04-12 12:11:48', '2', '10.00', '3', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('13', '2018-04-12 14:02:07', '2', '10.00', '3', '1', '176.50', '\0', '', '\0', '\0', '1', 'AC');
INSERT INTO `orden` VALUES ('14', '2018-04-12 14:17:25', '1', '0.00', '2', '1', '0.00', '\0', '', '\0', '\0', '1', 'AC');

-- ----------------------------
-- Table structure for ordendetalle
-- ----------------------------
DROP TABLE IF EXISTS `ordendetalle`;
CREATE TABLE `ordendetalle` (
  `odId` int(11) NOT NULL AUTO_INCREMENT,
  `oId` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ordendetalle
-- ----------------------------
INSERT INTO `ordendetalle` VALUES ('1', '5', '571', '1234567890', 'Estereo', '10.00', '272.65', '272.65', '1.00');
INSERT INTO `ordendetalle` VALUES ('2', '5', '572', '1234567899', 'Parlantes', '10.00', '246.00', '246.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('3', '6', '571', '1234567890', 'Estereo', '10.00', '272.65', '272.65', '1.00');
INSERT INTO `ordendetalle` VALUES ('4', '6', '572', '1234567899', 'Parlantes', '10.00', '246.00', '246.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('5', '7', '572', '1234567899', 'Parlantes', '205.00', '246.00', '246.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('6', '8', '572', '1234567899', 'Parlantes', '205.00', '246.00', '246.00', '1.00');
INSERT INTO `ordendetalle` VALUES ('7', '9', '572', '1234567899', 'Parlantes', '205.00', '246.00', '246.00', '2.00');
INSERT INTO `ordendetalle` VALUES ('8', '10', '572', '1234567899', 'Parlantes', '205.00', '270.60', '246.00', '2.00');
INSERT INTO `ordendetalle` VALUES ('9', '11', '572', '1234567899', 'Parlantes', '205.00', '270.60', '246.00', '2.00');
INSERT INTO `ordendetalle` VALUES ('10', '12', '571', '1234567890', 'Estereo', '205.00', '272.65', '272.65', '4.00');
INSERT INTO `ordendetalle` VALUES ('11', '12', '572', '1234567899', 'Parlantes', '205.00', '270.60', '246.00', '2.00');
INSERT INTO `ordendetalle` VALUES ('12', '13', '572', '1234567899', 'Parlantes', '205.00', '270.60', '246.00', '3.00');
INSERT INTO `ordendetalle` VALUES ('13', '14', '572', '1234567899', 'Parlantes', '205.00', '246.00', '246.00', '8.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES ('7', 'proveedor 1', 'proveedor', 'proveedor', '2', '231321546', '', '', 'AC', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receptions
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receptionsdetail
-- ----------------------------

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
  PRIMARY KEY (`rcbId`),
  KEY `oId` (`oId`),
  KEY `medId` (`medId`),
  CONSTRAINT `recibos_ibfk_1` FOREIGN KEY (`oId`) REFERENCES `orden` (`oId`) ON UPDATE CASCADE,
  CONSTRAINT `recibos_ibfk_2` FOREIGN KEY (`medId`) REFERENCES `mediosdepago` (`medId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recibos
-- ----------------------------
INSERT INTO `recibos` VALUES ('1', '13', '1', '100.00', 'AC');
INSERT INTO `recibos` VALUES ('2', '13', '2', '200.00', 'AC');
INSERT INTO `recibos` VALUES ('3', '13', '3', '100.00', 'AC');
INSERT INTO `recibos` VALUES ('4', '13', '4', '5.00', 'AC');
INSERT INTO `recibos` VALUES ('5', '13', '5', '0.80', 'AC');
INSERT INTO `recibos` VALUES ('6', '13', '7', '223.50', 'AC');
INSERT INTO `recibos` VALUES ('7', '13', '6', '6.00', 'AC');
INSERT INTO `recibos` VALUES ('8', '14', '1', '1900.00', 'AC');
INSERT INTO `recibos` VALUES ('9', '14', '7', '68.00', 'AC');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rubros
-- ----------------------------
INSERT INTO `rubros` VALUES ('8', 'Metales', 'AC');
INSERT INTO `rubros` VALUES ('9', 'Cemento', 'AC');
INSERT INTO `rubros` VALUES ('10', 'Contruccion En Seco', 'AC');
INSERT INTO `rubros` VALUES ('11', 'Pinturas', 'AC');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroups
-- ----------------------------
INSERT INTO `sisgroups` VALUES ('2', 'Administrador');
INSERT INTO `sisgroups` VALUES ('5', 'Gerencia');
INSERT INTO `sisgroups` VALUES ('6', 'Pato ');

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
) ENGINE=InnoDB AUTO_INCREMENT=865 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisgroupsactions
-- ----------------------------
INSERT INTO `sisgroupsactions` VALUES ('589', '6', '9');
INSERT INTO `sisgroupsactions` VALUES ('590', '6', '10');
INSERT INTO `sisgroupsactions` VALUES ('591', '6', '12');
INSERT INTO `sisgroupsactions` VALUES ('674', '2', '1');
INSERT INTO `sisgroupsactions` VALUES ('675', '2', '2');
INSERT INTO `sisgroupsactions` VALUES ('676', '2', '3');
INSERT INTO `sisgroupsactions` VALUES ('677', '2', '4');
INSERT INTO `sisgroupsactions` VALUES ('678', '2', '5');
INSERT INTO `sisgroupsactions` VALUES ('679', '2', '6');
INSERT INTO `sisgroupsactions` VALUES ('680', '2', '7');
INSERT INTO `sisgroupsactions` VALUES ('681', '2', '8');
INSERT INTO `sisgroupsactions` VALUES ('682', '2', '9');
INSERT INTO `sisgroupsactions` VALUES ('683', '2', '10');
INSERT INTO `sisgroupsactions` VALUES ('684', '2', '11');
INSERT INTO `sisgroupsactions` VALUES ('685', '2', '12');
INSERT INTO `sisgroupsactions` VALUES ('686', '2', '21');
INSERT INTO `sisgroupsactions` VALUES ('687', '2', '22');
INSERT INTO `sisgroupsactions` VALUES ('688', '2', '23');
INSERT INTO `sisgroupsactions` VALUES ('689', '2', '24');
INSERT INTO `sisgroupsactions` VALUES ('690', '2', '25');
INSERT INTO `sisgroupsactions` VALUES ('691', '2', '26');
INSERT INTO `sisgroupsactions` VALUES ('692', '2', '28');
INSERT INTO `sisgroupsactions` VALUES ('693', '2', '29');
INSERT INTO `sisgroupsactions` VALUES ('694', '2', '30');
INSERT INTO `sisgroupsactions` VALUES ('695', '2', '31');
INSERT INTO `sisgroupsactions` VALUES ('696', '2', '32');
INSERT INTO `sisgroupsactions` VALUES ('697', '2', '33');
INSERT INTO `sisgroupsactions` VALUES ('698', '2', '34');
INSERT INTO `sisgroupsactions` VALUES ('699', '2', '35');
INSERT INTO `sisgroupsactions` VALUES ('700', '2', '36');
INSERT INTO `sisgroupsactions` VALUES ('701', '2', '37');
INSERT INTO `sisgroupsactions` VALUES ('702', '2', '38');
INSERT INTO `sisgroupsactions` VALUES ('703', '2', '39');
INSERT INTO `sisgroupsactions` VALUES ('704', '2', '40');
INSERT INTO `sisgroupsactions` VALUES ('705', '2', '41');
INSERT INTO `sisgroupsactions` VALUES ('706', '2', '42');
INSERT INTO `sisgroupsactions` VALUES ('707', '2', '43');
INSERT INTO `sisgroupsactions` VALUES ('708', '2', '44');
INSERT INTO `sisgroupsactions` VALUES ('709', '2', '45');
INSERT INTO `sisgroupsactions` VALUES ('710', '2', '46');
INSERT INTO `sisgroupsactions` VALUES ('711', '2', '47');
INSERT INTO `sisgroupsactions` VALUES ('712', '2', '64');
INSERT INTO `sisgroupsactions` VALUES ('713', '2', '65');
INSERT INTO `sisgroupsactions` VALUES ('714', '2', '66');
INSERT INTO `sisgroupsactions` VALUES ('715', '2', '67');
INSERT INTO `sisgroupsactions` VALUES ('716', '2', '63');
INSERT INTO `sisgroupsactions` VALUES ('813', '5', '1');
INSERT INTO `sisgroupsactions` VALUES ('814', '5', '2');
INSERT INTO `sisgroupsactions` VALUES ('815', '5', '3');
INSERT INTO `sisgroupsactions` VALUES ('816', '5', '4');
INSERT INTO `sisgroupsactions` VALUES ('817', '5', '5');
INSERT INTO `sisgroupsactions` VALUES ('818', '5', '6');
INSERT INTO `sisgroupsactions` VALUES ('819', '5', '8');
INSERT INTO `sisgroupsactions` VALUES ('820', '5', '48');
INSERT INTO `sisgroupsactions` VALUES ('821', '5', '49');
INSERT INTO `sisgroupsactions` VALUES ('822', '5', '50');
INSERT INTO `sisgroupsactions` VALUES ('823', '5', '51');
INSERT INTO `sisgroupsactions` VALUES ('824', '5', '59');
INSERT INTO `sisgroupsactions` VALUES ('825', '5', '9');
INSERT INTO `sisgroupsactions` VALUES ('826', '5', '10');
INSERT INTO `sisgroupsactions` VALUES ('827', '5', '11');
INSERT INTO `sisgroupsactions` VALUES ('828', '5', '12');
INSERT INTO `sisgroupsactions` VALUES ('829', '5', '21');
INSERT INTO `sisgroupsactions` VALUES ('830', '5', '22');
INSERT INTO `sisgroupsactions` VALUES ('831', '5', '23');
INSERT INTO `sisgroupsactions` VALUES ('832', '5', '24');
INSERT INTO `sisgroupsactions` VALUES ('833', '5', '33');
INSERT INTO `sisgroupsactions` VALUES ('834', '5', '34');
INSERT INTO `sisgroupsactions` VALUES ('835', '5', '35');
INSERT INTO `sisgroupsactions` VALUES ('836', '5', '36');
INSERT INTO `sisgroupsactions` VALUES ('837', '5', '37');
INSERT INTO `sisgroupsactions` VALUES ('838', '5', '38');
INSERT INTO `sisgroupsactions` VALUES ('839', '5', '40');
INSERT INTO `sisgroupsactions` VALUES ('840', '5', '41');
INSERT INTO `sisgroupsactions` VALUES ('841', '5', '42');
INSERT INTO `sisgroupsactions` VALUES ('842', '5', '43');
INSERT INTO `sisgroupsactions` VALUES ('843', '5', '44');
INSERT INTO `sisgroupsactions` VALUES ('844', '5', '45');
INSERT INTO `sisgroupsactions` VALUES ('845', '5', '46');
INSERT INTO `sisgroupsactions` VALUES ('846', '5', '47');
INSERT INTO `sisgroupsactions` VALUES ('847', '5', '72');
INSERT INTO `sisgroupsactions` VALUES ('848', '5', '73');
INSERT INTO `sisgroupsactions` VALUES ('849', '5', '74');
INSERT INTO `sisgroupsactions` VALUES ('850', '5', '75');
INSERT INTO `sisgroupsactions` VALUES ('851', '5', '52');
INSERT INTO `sisgroupsactions` VALUES ('852', '5', '53');
INSERT INTO `sisgroupsactions` VALUES ('853', '5', '54');
INSERT INTO `sisgroupsactions` VALUES ('854', '5', '55');
INSERT INTO `sisgroupsactions` VALUES ('855', '5', '56');
INSERT INTO `sisgroupsactions` VALUES ('856', '5', '57');
INSERT INTO `sisgroupsactions` VALUES ('857', '5', '58');
INSERT INTO `sisgroupsactions` VALUES ('858', '5', '60');
INSERT INTO `sisgroupsactions` VALUES ('859', '5', '61');
INSERT INTO `sisgroupsactions` VALUES ('860', '5', '62');
INSERT INTO `sisgroupsactions` VALUES ('861', '5', '68');
INSERT INTO `sisgroupsactions` VALUES ('862', '5', '69');
INSERT INTO `sisgroupsactions` VALUES ('863', '5', '70');
INSERT INTO `sisgroupsactions` VALUES ('864', '5', '71');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
INSERT INTO `sismenu` VALUES ('18', 'Ventas', 'fa fa-cart-plus', 'sale', 'index', null);
INSERT INTO `sismenu` VALUES ('19', 'Recepción', 'fa fa-fw fa-archive', 'reception', 'index', null);
INSERT INTO `sismenu` VALUES ('20', 'Stock', 'fa fa-fw fa-industry', 'stock', 'index', null);
INSERT INTO `sismenu` VALUES ('21', 'Configuración', 'fa fa-fw fa-cogs', '', '', null);
INSERT INTO `sismenu` VALUES ('22', 'Rubros', '', 'rubro', 'index', '21');
INSERT INTO `sismenu` VALUES ('23', 'Subrubros', '', 'rubro', 'indexSR', '21');
INSERT INTO `sismenu` VALUES ('24', 'Lista_de_Precios', '', 'lista', 'index', '12');
INSERT INTO `sismenu` VALUES ('25', 'Cobranza', 'fa fa-fw fa-dollar', 'sale', 'index', null);
INSERT INTO `sismenu` VALUES ('26', 'Ordenes_de_Compra', 'fa fa-fw fa-shopping-cart', 'order', 'index', null);
INSERT INTO `sismenu` VALUES ('27', 'Actualización_de_Precios', '', 'rubro', 'upgrate', '12');
INSERT INTO `sismenu` VALUES ('28', 'Informes', 'fa fa-fw fa-info', '', '', null);
INSERT INTO `sismenu` VALUES ('29', 'Artículos_Entregados', '', 'article', 'information', '28');
INSERT INTO `sismenu` VALUES ('30', 'Ingresos', '', 'sale', 'data', '28');
INSERT INTO `sismenu` VALUES ('31', 'Cotización_Dolar', 'fa fa-fw fa-dollar', 'configuration', 'getCotizacion', null);
INSERT INTO `sismenu` VALUES ('32', 'Marcas', '', 'brand', 'index', '21');
INSERT INTO `sismenu` VALUES ('33', 'Clientes', 'fa fa-fw fa-users', 'customer', 'index', null);
INSERT INTO `sismenu` VALUES ('34', 'Vendedores', '', 'vendedor', 'index', '21');

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
INSERT INTO `sismenuactions` VALUES ('29', '18', '1');
INSERT INTO `sismenuactions` VALUES ('30', '18', '3');
INSERT INTO `sismenuactions` VALUES ('31', '18', '4');
INSERT INTO `sismenuactions` VALUES ('32', '18', '8');
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
INSERT INTO `sismenuactions` VALUES ('52', '25', '12');
INSERT INTO `sismenuactions` VALUES ('53', '25', '13');
INSERT INTO `sismenuactions` VALUES ('54', '25', '14');
INSERT INTO `sismenuactions` VALUES ('55', '26', '1');
INSERT INTO `sismenuactions` VALUES ('56', '26', '2');
INSERT INTO `sismenuactions` VALUES ('57', '26', '11');
INSERT INTO `sismenuactions` VALUES ('58', '26', '5');
INSERT INTO `sismenuactions` VALUES ('59', '27', '2');
INSERT INTO `sismenuactions` VALUES ('60', '26', '15');
INSERT INTO `sismenuactions` VALUES ('61', '29', '4');
INSERT INTO `sismenuactions` VALUES ('62', '30', '4');
INSERT INTO `sismenuactions` VALUES ('63', '31', '2');
INSERT INTO `sismenuactions` VALUES ('64', '32', '1');
INSERT INTO `sismenuactions` VALUES ('65', '32', '2');
INSERT INTO `sismenuactions` VALUES ('66', '32', '3');
INSERT INTO `sismenuactions` VALUES ('67', '32', '4');
INSERT INTO `sismenuactions` VALUES ('68', '33', '1');
INSERT INTO `sismenuactions` VALUES ('69', '33', '2');
INSERT INTO `sismenuactions` VALUES ('70', '33', '3');
INSERT INTO `sismenuactions` VALUES ('71', '33', '4');
INSERT INTO `sismenuactions` VALUES ('72', '34', '1');
INSERT INTO `sismenuactions` VALUES ('73', '34', '2');
INSERT INTO `sismenuactions` VALUES ('74', '34', '3');
INSERT INTO `sismenuactions` VALUES ('75', '34', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of sisusers
-- ----------------------------
INSERT INTO `sisusers` VALUES ('2', 'admin', 'admin', 'admin', '1', 'bc158e1f09dcb786a98657ba293f279b', '2', '2018-03-23 15:57:03', '0TrNJRR0F8KHjDz8aZYQFl53WRijgdMV18zJtcbIMTYdY1rksEqN664k6G3p1ylySZEDVEVwNIt95ZDq2xS2m12oLQ9R4PJF8YkcLZN3k2hArlgywQVZS9Q8OXvUrq1yepfNLeFUFe80iqNLZGmsLLJ8eBx1LvwTWm59iuzFa99tDmnScpO6yvLdv0eoEknlnTmFVmL50scBOsss9ntFN5JoP9janwUx6MkS7cK5FuzULxLivJYNICrGYdNdur8', '');
INSERT INTO `sisusers` VALUES ('4', 'adolfo', 'Adolfo', 'Fernandez', '1', 'e10adc3949ba59abbe56e057f20f883e', '5', '2018-04-12 14:17:25', '0y8cjE9u9UcCV9vgoStI4eo4wqAmEBTNlq2tT1FiHgQXtpA2srV91JKYzdsq2EoxpXufyabTsdd4814VCfS7THO2AGGPCRpx3ghem4AYIZVA7IW0DoU8Z0Nv35frk4xoPX9kWDG6j9DR4HllfBL0amHYLx66Iyq8GU70yO35yyjVV6sx8hS4EZk8RzX96YLQvxD7q5gOAvwUmdm1WIxw66uFKjxXdMp2SvLPqw73zn6urtkJcRZeuGHsSe698Ab', '\0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', '571', '-4.00', '12', 'VN', '2018-04-12 12:11:48');
INSERT INTO `stock` VALUES ('2', '572', '-2.00', '12', 'VN', '2018-04-12 12:11:48');
INSERT INTO `stock` VALUES ('3', '572', '-3.00', '13', 'VN', '2018-04-12 14:02:07');
INSERT INTO `stock` VALUES ('4', '572', '-8.00', '14', 'VN', '2018-04-12 14:17:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subrubros
-- ----------------------------
INSERT INTO `subrubros` VALUES ('4', 'cemento', '9', 'AC');
INSERT INTO `subrubros` VALUES ('5', 'cal', '9', 'AC');
INSERT INTO `subrubros` VALUES ('6', 'caños laminados', '8', 'AC');
INSERT INTO `subrubros` VALUES ('7', 'hierro corrugado ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('8', 'hierro liso ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('9', 'Alambre Negro', '8', 'AC');
INSERT INTO `subrubros` VALUES ('10', 'Clavos ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('11', 'Chapa Negra ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('12', 'Chapa De Techo ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('13', 'Planchuelas ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('14', 'Electrodos ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('15', 'Perfiles ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('16', 'Angulos ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('17', 'Caños Redondos ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('18', 'Placas', '10', 'AC');
INSERT INTO `subrubros` VALUES ('19', 'Montantes ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('20', 'Soleras ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('21', 'Cintas ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('22', 'Tornillos ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('23', 'Tacos ( tarugos ) ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('24', 'Masillas ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('25', 'Cantonera ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('26', 'Perfil Omega ', '10', 'AC');
INSERT INTO `subrubros` VALUES ('27', 'Planchuelas Perforadas ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('28', 'Chapa Galvanizada Lisa', '8', 'AC');
INSERT INTO `subrubros` VALUES ('29', 'Alambre Tejido Rom', '8', 'AC');
INSERT INTO `subrubros` VALUES ('30', 'Pintura Fondo', '11', 'AC');
INSERT INTO `subrubros` VALUES ('31', 'Discos Corte ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('32', 'Perfiles Aluminio', '8', 'AC');
INSERT INTO `subrubros` VALUES ('33', 'Clavos Espiralados', '8', 'AC');
INSERT INTO `subrubros` VALUES ('34', 'Chapa Acanalada ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('35', 'Mallas Acero', '8', 'AC');
INSERT INTO `subrubros` VALUES ('36', 'Concertina ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('37', 'Cadena Derecha ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('38', 'Tela Mosq. Alum. Refor.', '8', 'AC');
INSERT INTO `subrubros` VALUES ('39', 'Remaches Pop', '8', 'AC');
INSERT INTO `subrubros` VALUES ('40', 'Membrana', '10', 'AC');
INSERT INTO `subrubros` VALUES ('41', 'Chapa Perforada', '8', 'AC');
INSERT INTO `subrubros` VALUES ('42', 'Totora Metalica ', '9', 'AC');
INSERT INTO `subrubros` VALUES ('43', 'Bisagras', '10', 'AC');
INSERT INTO `subrubros` VALUES ('44', 'Cerraduras', '8', 'AC');
INSERT INTO `subrubros` VALUES ('45', 'picaporte', '8', 'AC');
INSERT INTO `subrubros` VALUES ('46', 'Tensores ', '8', 'AC');
INSERT INTO `subrubros` VALUES ('47', 'Hierro Cuadrado', '8', 'AC');
INSERT INTO `subrubros` VALUES ('48', 'Tuercas', '8', 'AC');
INSERT INTO `subrubros` VALUES ('49', 'Ruedas', '8', 'AC');

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
INSERT INTO `tipomediopago` VALUES ('3', 'CRE', 'Credito', 'AC', null, null, null);
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
INSERT INTO `vendedores` VALUES ('1', '100', 'Sergio 1', 'AC');
INSERT INTO `vendedores` VALUES ('2', '002', 'Mauricio 1', 'AC');
INSERT INTO `vendedores` VALUES ('3', '003', 'Tuki', 'AC');

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
