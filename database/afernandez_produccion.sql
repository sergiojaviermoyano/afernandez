-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-07-2018 a las 19:20:36
-- Versión del servidor: 5.5.20
-- Versión de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `afernandez`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `stockArt`(IN `pArtId` int)
BEGIN
	#Routine body goes here...
	select sum(stkCant) as stock from stock where artId = pArtId ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
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
  KEY `marcaId` (`marcaId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=724 ;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`artId`, `artBarCode`, `artDescription`, `artCoste`, `artMarginMinorista`, `artMarginMinoristaIsPorcent`, `artEstado`, `artMinimo`, `ivaId`, `subrId`, `artMarginMayorista`, `artMarginMayoristaIsPorcent`, `artCosteIsDolar`, `marcaId`) VALUES
(1, '4050300222028', 'Lampara R2', '50.00', '40.00', b'1', 'AC', 4, 4, 2, '30.00', b'1', b'1', 3),
(2, '4897034186772', 'esencia p/cigarro electronico lemon', '66.00', '40.00', b'1', 'AC', 8, 4, 1, '30.00', b'1', b'0', 1),
(3, '6970232212424', 'cigarrillo electronico ancho', '640.00', '40.00', b'0', 'AC', 1, 4, 2, '30.00', b'0', b'0', 2),
(5, '7501037600056', 'Pilas  AA', '4.30', '135.00', b'1', 'AC', 4, 4, 5, '30.00', b'1', b'0', 34),
(6, '7501037600032', 'pila C2', '7.10', '183.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'0', 34),
(7, '8999002672013', 'Pilas AAA', '6.40', '57.00', b'1', 'AC', 4, 4, 5, '30.00', b'1', b'0', 34),
(8, '039800041098', 'Pila LITHIUM 123', '80.00', '50.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'0', 35),
(9, '8888021301502', 'Pilas recargable ENERGIZER  AAA X 2 UNIDADES', '5.25', '50.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'1', 35),
(10, '7501037600018', 'Pilas D2 X2', '40.00', '50.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'0', 34),
(13, '039800011398', 'Pilas ENERGIZER D2 X2', '1.50', '100.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'1', 35),
(14, '8999002671924', 'Pilas ENERGIZER AA X1', '0.33', '100.00', b'1', 'AC', 4, 4, 5, '0.30', b'1', b'1', 35),
(15, '039800052636', 'Pilas AAA X2', '10.00', '100.00', b'1', 'AC', 4, 4, 5, '30.00', b'1', b'0', 34),
(16, '039800013613', 'BATERIA 9V ENERGIZER', '1.19', '50.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'1', 35),
(17, '8888021300369', 'PILA ENERGIZER A27', '0.70', '80.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'1', 35),
(18, '008562010208', 'Pilas recargables AAA ', '25.00', '100.00', b'1', 'AC', 1, 4, 5, '30.00', b'1', b'0', 2),
(19, '6936709099868', 'Pilas SIN MERCURIO AA X4', '1.50', '100.00', b'1', 'AC', 4, 4, 5, '30.00', b'1', b'1', 43),
(20, '023942440833', 'Tarjeta de memoria  32gb Verbatim', '17.42', '40.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 30),
(21, '619659066918', 'Tarjeta de memoria 32GB Sandisk', '13.00', '40.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 32),
(22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '6.42', '35.00', b'1', 'AC', 4, 4, 4, '25.00', b'1', b'1', 31),
(23, '740617198256', 'Pendrive 16 GB Kingston', '166.66', '50.00', b'1', 'AC', 4, 4, 4, '30.00', b'1', b'0', 31),
(24, '619659000424', 'Pendrive 8GB SanDisk', '121.21', '65.00', b'1', 'AC', 4, 4, 4, '30.00', b'1', b'0', 32),
(25, '760557827962', 'PENDRIVE 32GB Transcend', '370.00', '40.00', b'1', 'AC', 1, 4, 4, '30.00', b'1', b'0', 44),
(26, '740617210712', 'Pendrive 64GB kingston', '406.90', '45.00', b'1', 'AC', 2, 4, 4, '30.00', b'1', b'0', 31),
(27, '8888021300161', 'PILA ENERGIZER CR2025', '0.51', '100.00', b'1', 'AC', 10, 4, 5, '30.00', b'1', b'1', 35),
(28, '8888021300185', 'PILA ENERGIZER  CR2032', '0.62', '100.00', b'1', 'AC', 0, 4, 5, '30.00', b'1', b'1', 35),
(29, '4902580131333', 'Pilas CR1620', '15.00', '100.00', b'1', 'AC', 5, 4, 5, '30.00', b'1', b'0', 37),
(30, '8888021300192', 'PILA ENERGIZER CR2016', '0.60', '100.00', b'1', 'AC', 5, 4, 5, '40.00', b'1', b'1', 35),
(31, '6932667300800', 'Baterias P/Tel inalambricos Ni-Cd', '45.00', '100.00', b'1', 'AC', 1, 4, 6, '30.00', b'1', b'0', 46),
(32, '6957207500847', 'Bateria P/Tel inalambrico P-958 800 mAh', '100.00', '100.00', b'1', 'AC', 2, 4, 6, '30.00', b'1', b'0', 45),
(33, '008562009714', 'Pilas CR2450', '38.00', '100.00', b'1', 'AC', 2, 4, 5, '30.00', b'1', b'0', 2),
(34, '6290132547601', 'Tarjeta de sonido  USB 5.1 ST-3051', '1.60', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'1', 15),
(35, '091163227885', 'Mouse optico mini notebook negro', '50.00', '100.00', b'0', 'AC', 2, 4, 7, '30.00', b'0', b'0', 47),
(36, '4710268228691', 'Mouse Optico rojo Either Hand', '75.00', '100.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 47),
(37, '091163228684', 'Mouse Optico gris ', '75.00', '100.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 47),
(38, '7798135464196', 'Mouse Optico negro eurocase', '62.50', '100.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 48),
(39, '6290132547175', 'Mouse inalambrico ST-2018', '75.00', '100.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 15),
(40, '6933138610282', 'CARGADOR  P/AUTO 2 USB BLANCO', '90.00', '100.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'0', 49),
(41, '6933138610237', 'Cargador p/auto USB negro DL-C23', '70.00', '100.00', b'0', 'AC', 4, 4, 8, '30.00', b'0', b'0', 49),
(42, 'CAR-ECO', 'Cargador P/auto economico V8', '40.00', '100.00', b'1', 'AC', 4, 4, 4, '30.00', b'1', b'0', 50),
(43, '8684121022381', 'Cargador p/celurar fast charger', '75.00', '100.00', b'1', 'AC', 4, 4, 4, '30.00', b'1', b'0', 51),
(44, 'CARG', 'Cargador p/celular sony', '75.00', '100.00', b'1', 'AC', 2, 4, 4, '30.00', b'1', b'0', 2),
(46, '7798318653058', 'cargador p/celular 3.1A', '75.00', '100.00', b'1', 'AC', 4, 4, 4, '30.00', b'1', b'0', 38),
(47, '6333', 'LLAVERO AUTO ', '45.00', '100.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(48, '5740', 'LLLAVERO AUTO RESPUESTOS', '45.00', '100.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(49, '4911546781284', 'Memory card Play station 64 MB', '100.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 52),
(50, '6958858521472', 'Timbre Inalambrico', '4.40', '100.00', b'1', 'AC', 2, 4, 6, '30.00', b'1', b'1', 54),
(51, '7428325564589', 'Foco led 7w blanco frio 6500k', '34.37', '60.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 55),
(52, '6942626020335', 'Soporte universal  Cel GPS', '2.00', '100.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'1', 56),
(53, '6917573231028', 'Cargador Universal Lcd P/celular', '45.00', '100.00', b'1', 'AC', 2, 4, 4, '30.00', b'1', b'0', 52),
(54, 'CAR', 'Adaptador Internacional', '50.00', '100.00', b'1', 'AC', 2, 4, 6, '30.00', b'1', b'0', 52),
(55, '6926801908267', 'Calculadora KK-826C', '1.90', '100.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 57),
(56, '7794122005250', 'Pegamento sintetico fastix', '40.62', '60.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 58),
(57, '7794122001870', 'Masilla 2 componentes poxilina', '42.50', '100.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 60),
(58, 'LED1', 'led programable ventilador USB', '181.25', '60.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'0', 52),
(59, '271', 'Control Remoto TV 271', '60.00', '100.00', b'1', 'AC', 5, 4, 3, '30.00', b'1', b'0', 16),
(60, '303', 'Control Remoto Tv 303', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(61, '103', 'Control Remoto TV 103', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(62, '304', 'Control Remoto TV 304', '50.00', '100.00', b'1', 'AC', 3, 4, 8, '30.00', b'1', b'0', 16),
(63, '138', 'Control Remoto TV 138', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(64, '331', 'Control Remoto 331', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(65, '250', 'Control remoto tv 250', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(66, '291', 'control remoto tv 291', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(67, '619', 'Control remoto tv 619', '60.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(68, '322', 'Control remoto tv 322 CEGESA GRIS', '60.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(69, '337', 'Control remoto tv 337 TOP HOUSE', '60.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(70, '729', 'Control remoto tV LED729', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(71, '333', 'Control remoto tv 333', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(72, '292', 'CONTROL REMOTO TV 292', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '3.00', b'1', b'0', 16),
(73, '633', 'Control remoto Tv led 633', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(74, '342', 'control remoto Tv 425', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(75, 'ADSY100', 'cONTROL REMOTO AUDIO SONY', '90.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(76, '255', 'CONTROL REMOTO tV 255', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(77, '733', 'Control Remoto tv led 733', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(78, '377', 'Control Remoto Tv 377', '72.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(79, '145', 'Control remoto tv 145', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(80, '110', 'control remo tv 110', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(81, '127', 'Control remoto tv127', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(82, '111', 'Control remoto tv 111', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(83, '117', 'Control remoto tv117', '60.00', '100.00', b'1', 'AC', 5, 4, 3, '30.00', b'1', b'0', 16),
(84, '278', 'Control remoto tv', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(85, '375', 'Control remoto tv 375', '72.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(87, '296 ', 'Control remoto TV Ken Brown Planos', '60.00', '100.00', b'1', 'AC', 5, 4, 3, '30.00', b'1', b'0', 16),
(88, '279', 'Control Remoto TV 279', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(91, '713', 'Control Remoto Tv Led 713', '120.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(92, '734', 'Control Remoto Tv led 734', '120.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(93, '611', 'Control Remoto TV led 611', '120.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(94, '720', 'Control Remoto Tv led 720', '64.60', '280.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(95, '641', 'Control Remoto Tv Led 641', '76.65', '230.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(96, '725', 'Control Remoto Tv Led 725', '120.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(97, '128', 'Control Remoto Tv 128', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(98, '105', 'Control Remoto TV crown Mustang', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(99, '107', 'Control Remoto Tv Crown', '60.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(100, '131', 'Control remoto Tv 131', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(102, '289', 'Control remoto Tv telefunken', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(103, '118', 'Control Remoto TV Hitachi', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(104, '294', 'Control Remoto Tv Global Home/lynx/HISHI', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(105, '133', 'ccontrol Remoto TV Philco', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(106, '202', 'Control Remoto TV admiral', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(107, '305', 'Control Remoto  TV  TCL 29', '52.56', '130.00', b'1', 'AC', 5, 4, 3, '30.00', b'1', b'0', 16),
(111, '295', 'Control Remoto Tv Hitachi1', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(112, '300', 'Control Remoto Tv PHILIPS', '72.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(113, '248', 'Control remoto tv Talent/CCE/Top House', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(114, '381', 'Control Remoto Tv Thoshiba', '60.00', '100.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'0', 16),
(115, '612', 'Control remoto Tv LCD samsung', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(116, '614', 'Control Remoto Tv LCD Sanyo/Philco', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(117, '6965468454557', 'Cable UBS 1.30mts rosa', '20.00', '30.00', b'1', 'AC', 10, 4, 4, '300.00', b'1', b'0', 61),
(118, '7798161081275', 'Parlante Blauline 6" B-1602k', '408.78', '51.50', b'1', 'AC', 4, 4, 2, '30.00', b'1', b'0', 23),
(119, '7790368006488', 'Parlante B52 4', '456.66', '50.00', b'1', 'AC', 2, 4, 2, '30.00', b'1', b'0', 10),
(120, '050036322362', 'Parlante JBL sistema GX600c', '3130.00', '30.00', b'1', 'AC', 0, 4, 8, '50.00', b'1', b'0', 17),
(121, 'P36713715F', 'Parlante SONY XS-FB1630  6"', '57.00', '50.00', b'1', 'AC', 4, 4, 1, '30.00', b'1', b'1', 2),
(122, 'P36713915H', 'Parlante 4"', '620.00', '30.00', b'1', 'AC', 4, 4, 8, '50.00', b'1', b'0', 2),
(123, '642', 'Control Remoto tv LCD Hisense/telefunken/noblex/ph', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(124, '644', 'Control Remoto TV LCD Bgh/hisense/telefunken/philc', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(125, '701', 'ConTrol remoto TV Led USB-Noblex', '120.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(126, '710', 'Control Remoto TV Smart LEd SAMSUNG', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(127, '613', 'Control Remoto TV  LCD Samsung', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(128, '214', 'Control Remoto Tv Generico ', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(129, '219', 'Control Remoto TV Noblex', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(130, '302', 'Control Remoto TV Sanyo/Noblex/philco/Top House', '60.00', '100.00', b'1', 'AC', 4, 4, 3, '30.00', b'1', b'0', 16),
(132, '227', 'Control REmoto Tv Philips Ps266', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(133, '104', 'Control Remoto TV Noblex/Admiral', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(135, 'HY296', 'Control REmoto Tv hundy', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(136, '277', 'ControlRemoto TV TCL/GE/BGH/Sanyo/Firsline/noblex', '60.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 16),
(137, '231', 'Control Remoto TV sony1', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(138, '153', 'Control REmoto TV Telefunken RC1123', '60.00', '100.00', b'0', 'AC', 1, 4, 3, '30.00', b'0', b'0', 16),
(139, 'CO NOG', 'Control Remoto TV Conversor Noga', '60.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(141, '244', 'Control Remoto TV  Noblex', '60.00', '100.00', b'0', 'AC', 1, 4, 3, '30.00', b'0', b'0', 16),
(142, '609', 'Control Remoto TV LCD PHILIPS', '56.02', '114.20', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(143, '639', 'Control Remoto TV LCD Philips 639', '141.48', '69.63', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(144, '625', 'Control Remoto LCD telefunken/noblex/BGH', '120.00', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(145, '711', 'Control Remoto Led Smart LG', '100.00', '100.00', b'1', 'AC', 2, 4, 13, '30.00', b'1', b'0', 16),
(146, '6934086689733', 'Control Remoto LED/LCD LG (varios modelos)', '100.00', '100.00', b'1', 'AC', 2, 4, 13, '30.00', b'1', b'0', 16),
(149, '622', 'Control Remoto Tv lcd Philips1', '100.00', '100.00', b'0', 'AC', 2, 4, 13, '30.00', b'0', b'0', 16),
(150, '634', 'Control Remoto TV LCD LG1', '10.00', '100.00', b'1', 'AC', 2, 4, 13, '30.00', b'1', b'0', 16),
(151, '812313013208', 'Auricular p/Play Station III buetooh', '150.00', '100.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 52),
(152, '6921338619051', 'Control Remoto Aire Acondicionado Universal', '100.00', '100.00', b'1', 'AC', 3, 4, 14, '30.00', b'1', b'0', 52),
(153, '6927259110189', 'Control Remoto Aire  acondicionado Universal ', '130.00', '100.00', b'0', 'AC', 3, 4, 14, '30.00', b'1', b'0', 52),
(154, '6921338623003', 'Control Remoto Universal DVD', '100.00', '100.00', b'1', 'AC', 1, 4, 15, '30.00', b'1', b'0', 52),
(155, '7798075660030', 'Soporte TV/DVD para pared AKTOM AKT2', '6.50', '100.00', b'1', 'AC', 1, 4, 16, '30.00', b'1', b'1', 52),
(156, '6925749763372', 'Cable video  P/PLAY STATIN 2', '30.00', '100.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 52),
(157, '7898556841412', 'Antena Electronica P/Auto UNIversal P/parabrisa', '157.68', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(158, 'ZESO0050', 'Soporte  LCD y Pantallas LED 13 a 37', '7.00', '100.00', b'1', 'AC', 2, 4, 16, '30.00', b'1', b'1', 39),
(159, 'ZESO0100', 'Soporte  LCD Y LED  hasta 42', '7.14', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 39),
(160, '897208001652', 'Soporte LCD /  LED 37 a 70 ', '12.50', '100.00', b'1', 'AC', 2, 4, 16, '30.00', b'1', b'1', 52),
(161, '1234567804095', 'Soporte para LED/LCD univ 14 a 32', '4.00', '100.00', b'1', 'AC', 2, 4, 16, '30.00', b'1', b'1', 16),
(162, '7798137380791', 'Fuente multiple univ noganet', '170.68', '40.00', b'1', 'AC', 3, 4, 3, '30.00', b'1', b'0', 6),
(163, 'E', 'Estaño bobina 60/40  1 mm  500 grs', '522.31', '50.00', b'1', 'AC', 1, 4, 17, '30.00', b'1', b'0', 62),
(164, '7798137388353', 'Joystick  noganet P/PC analogo/digital NG-2131', '182.91', '50.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 6),
(165, '6902361201321', 'Radio Winco W-9913', '19.32', '40.00', b'1', 'AC', 1, 4, 19, '30.00', b'1', b'1', 26),
(166, '6902361204223', 'Radio de mesa dual AM/FM  W-2005', '15.00', '40.00', b'1', 'AC', 2, 4, 19, '30.00', b'1', b'1', 26),
(167, '6902361204032', 'Radiode mesa winco Dual w-2004', '13.00', '45.00', b'1', 'AC', 2, 4, 19, '30.00', b'1', b'1', 26),
(168, 'Z', 'Zapatilla 5 Tomas c/tecla y cable 1.5mts M-IB11', '3.30', '70.00', b'1', 'AC', 2, 4, 3, '50.00', b'1', b'1', 52),
(169, '21813', 'Zapatilla 5 tomas c/tecla y cable 3 mts', '4.30', '60.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(170, '095225336003', 'Cable armado  Y 1RCAH/2RCAM', '45.30', '50.00', b'1', 'AC', 5, 4, 9, '30.00', b'1', b'0', 63),
(171, '7895870038269', 'Kit Trabapuerta Tragial/ONIX-NOVO PRISMA', '1317.00', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(172, '6928026420517', 'Pinza FORD  Univ 6', '4.50', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(173, 'G', 'Guitarra Clasica N8 tapa de abedul', '1420.13', '54.85', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 52),
(174, 'GUI', 'Guitarra clasica N8 color tapa abedul', '1466.60', '55.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 52),
(175, '884938369749', 'Estereo Pioneer DEH-X10', '138.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(176, '884938369350', 'Estereo PIoneer  MVH-X30BT', '152.46', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(177, '884938311496', 'Parlante 6 1/2', '2337.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'0', 1),
(178, '884938311465', 'Parlante Pioneer  6 1/2 TS -A1676S', '68.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(179, '884938265799', 'Parlante Pioneer  5 TS-G1345R', '48.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(180, '884938265669', 'Parlante Pioneer 4 TS-G1015R', '33.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(181, '884938234825', 'Driver Pioneer 200W TS-DR250PRO', '47.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(182, '4905524971170p36713815gs010000000t', 'Parlante Sony XS-FB1330  5" 1/4', '44.90', '50.00', b'1', 'AC', 2, 4, 2, '30.00', b'1', b'1', 2),
(183, '4905524971163', 'Parlante Sony 6', '1200.00', '50.00', b'1', 'AC', 2, 4, 2, '30.00', b'1', b'0', 2),
(184, '050036322362  500363223622 GX600C ES0079''FE0004525', 'Sistema de sonido JBL 210W 6', '145.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 17),
(185, '884938309325', 'Estereo Pioneer DEH-X1850UB', '105.00', '40.00', b'1', 'AC', 2, 4, 1, '30.00', b'1', b'1', 1),
(186, '884938309561', 'Estereo Pioneer DEH-X4850BT', '175.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(187, '884938344883', 'Estereo Pioneer AVH-295BT', '390.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(188, '050036322140 500363221406 GT7''6C ME3046''GE0006708', 'Sistema JBL GT7-6C', '145.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 17),
(189, '050036322119 500363221192 GT7''96 ME3043''JF0022428', 'Parlante  JBL 6 x 9', '1600.00', '50.00', b'1', 'AC', 2, 4, 2, '30.00', b'1', b'0', 17),
(190, 'P36713515D S010000000T 4905524971118', 'Parlante Sony XS-FB6930 6 x 9', '68.00', '50.00', b'1', 'AC', 2, 4, 2, '30.00', b'1', b'1', 2),
(192, '884938311649', 'Parlante Pioneer TS-A6976S 550W', '73.00', '50.00', b'1', 'AC', 4, 4, 9, '30.00', b'1', b'1', 1),
(193, '884938311625', 'Parlante Pioneer  6 x 9 TS-A6966S', '68.00', '50.00', b'1', 'AC', 4, 4, 9, '30.00', b'1', b'1', 1),
(194, '4010001049423', 'Parlante Blaupunkt  4"x 6" GTx 462 SC 160W', '650.00', '50.00', b'1', 'AC', 1, 4, 2, '30.00', b'1', b'0', 20),
(195, '696859263927', 'Estereo DTI mod-CE6113BT', '52.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 52),
(196, '12v-46', 'Bateria auto champion 190x175x175', '1999.99', '25.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 28),
(197, '12v-60', 'Bateria auto champions 240x175x175', '1784.25', '25.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 28),
(198, '12v-70', 'Bateria auto champion 240x175x175', '2055.55', '33.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 28),
(199, '12v-75', 'Bateria auto champions 260x175x175', '2220.75', '33.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 54),
(200, '12v-85', 'Bateria auto champions (toyota)260x170x205', '2816.25', '34.00', b'1', 'AC', 1, 4, 12, '15.00', b'1', b'0', 28),
(201, '12v-90', 'Bateria auto champions (4x4)300x170x200', '3105.75', '33.88', b'1', 'AC', 1, 4, 12, '15.00', b'1', b'0', 28),
(202, '12v-90AMAROK', 'Bateria auto champion (amarok) 300x170x200 ', '3435.00', '35.00', b'1', 'AC', 1, 4, 12, '15.00', b'1', b'0', 28),
(203, '12v-100Mb', 'Bateria auto champion 335x165x186', '3966.75', '34.00', b'1', 'AC', 1, 4, 12, '15.00', b'1', b'0', 28),
(204, '7798318655977', 'Foco led c/efecto luminosos inova', '3.00', '140.00', b'1', 'AC', 5, 4, 20, '40.00', b'1', b'1', 38),
(205, '12V-100I', 'Bateria auto champion 350x175x210', '3999.45', '34.00', b'1', 'AC', 1, 4, 12, '10.00', b'1', b'0', 28),
(206, '12v-110 cat', 'Bateria auto champions 330x175x220', '3874.75', '35.00', b'1', 'AC', 1, 4, 12, '15.00', b'1', b'0', 28),
(207, '12v-46HARBAT', 'Bat. auto HARBAT 190X175X175', '1495.50', '33.58', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 29),
(208, '12V-55HARBAT', 'Bat .auto HARBAT 240X175X175', '1365.75', '35.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 29),
(209, '12V-70HARBAT', 'Bat.auto HARBAT 240x175x175', '1461.00', '35.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 29),
(210, '12v-70R', 'Bat.auto HARDBAT reforzada 240x175x175', '1658.25', '35.00', b'1', 'AC', 2, 4, 12, '15.00', b'1', b'0', 29),
(211, '12501000', 'Sirena piezo electrica POSITRON SI700', '6.00', '65.00', b'1', 'AC', 2, 4, 23, '30.00', b'1', b'1', 12),
(212, '7897789643114 ', 'Alarma para auto cyber Px 360BT EXP PST', '1511.40', '45.00', b'1', 'AC', 2, 4, 24, '30.00', b'1', b'0', 12),
(213, '7897789643121', 'Alarma para auto Cyber FX 360 EXP pst', '1269.12', '45.00', b'1', 'AC', 2, 4, 24, '30.00', b'1', b'0', 12),
(214, 'CONTR', 'Controlador GBR PRO DJ 100 MK II', '3888.94', '40.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'0', 7),
(215, 'CONTR DJ', 'Controlador  GBR PRO DJ 200', '6148.01', '40.00', b'1', 'AC', 1, 4, 48, '30.00', b'1', b'0', 7),
(216, 'BA', 'Bafle  GBR  2 vias 15', '5065.06', '40.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'0', 7),
(217, '740617245974', 'Tarjeta de memoria 16 GB Kingston', '7.89', '40.00', b'1', 'AC', 4, 4, 6, '25.00', b'1', b'1', 31),
(218, '798302055766 1154U5170605608', 'Router inalambrico  NEXXT mod-NyX150', '14.00', '45.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 52),
(219, '798302055780 4904U3170601214', 'Router Inalmb. NEXXT nebula1200AC', '41.55', '40.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 52),
(220, '619659067021', 'Tarjeta de memoria 8GB SanDisk', '6.00', '40.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 32),
(221, '5907581253031', 'Fuente  switching 9 v 1500 mA mod FS91500', '151.00', '50.00', b'1', 'AC', 2, 4, 18, '30.00', b'1', b'0', 52),
(222, '6932667300794', 'Bateria FOREVER TELEFONICAS  3 AA3.6V 700mH', '68.00', '50.00', b'1', 'AC', 1, 4, 6, '30.00', b'1', b'0', 46),
(223, 'TL640', 'Bateria de gel  6V TELONG', '112.31', '50.00', b'1', 'AC', 2, 4, 12, '30.00', b'1', b'0', 52),
(224, 'CA', 'Cable rextone plug 6.5 mn a plug 6.5 mn 6 mts', '140.60', '50.00', b'1', 'AC', 2, 4, 1, '30.00', b'1', b'0', 42),
(225, 'ZM', 'Zapatilla multiforma INDEPLAS S/Cable', '3.30', '50.00', b'1', 'AC', 4, 4, 5, '30.00', b'1', b'1', 52),
(226, 'PI', 'Pinza Grimpar de impacto TOBAX  TBX-HY5085', '6.22', '50.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'1', 52),
(227, '4971850135562', 'Calculadora cientifica CASIO FX-95MS 244 funciones', '444.00', '40.00', b'1', 'AC', 2, 4, 7, '20.00', b'1', b'0', 19),
(228, '4971850137931', 'Calculadora Cientifica CASIO FX-82MS 240 Func.', '357.13', '50.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 19),
(229, 'DFE11170924', 'Potencia digital DK600 Soung Magus', '136.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 22),
(230, 'MICRO1', 'Microfono inalambrico GBR PRO-158', '1479.83', '50.00', b'1', 'SU', 2, 4, 48, '30.00', b'1', b'0', 7),
(231, 'MICRO2', 'Microfono inalambrico GBR PRO-258', '2226.40', '50.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'0', 7),
(232, '7798130906530', 'Celular PANACOM MP-1103', '449.99', '90.00', b'1', 'AC', 2, 4, 30, '30.00', b'1', b'0', 64),
(233, '7798130906387', 'celular PANACOM  MP-1103 ', '449.99', '90.00', b'1', 'AC', 2, 4, 30, '45.00', b'1', b'0', 64),
(234, 'LU', 'Luces efecto multicolor 18l OSR', '340.00', '135.00', b'1', 'AC', 2, 4, 20, '45.00', b'1', b'0', 52),
(235, 'AKTOM', 'Soporte TV y Video 42', '14.50', '60.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 52),
(236, 'CON', 'Consola Mixer 4 Canales 4150UB', '2580.00', '55.00', b'1', 'AC', 2, 4, 31, '30.00', b'1', b'0', 52),
(237, '7897789624526', 'Control P/alarma auto PST UNIV', '18.67', '50.00', b'1', 'AC', 3, 4, 8, '30.00', b'1', b'1', 12),
(238, '4050300001470', ' Lamparas p/auto OSRAM H4 60/55 W P43t- 64193- 472', '57.40', '60.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'0', 3),
(239, '5907738195037', 'Lampara KOBO H11   12v 55w', '87.93', '60.00', b'1', 'AC', 2, 4, 8, '79.58', b'1', b'0', 52),
(240, '4008321650894', 'Lampara H4 COOL BLUE INTENSE  60/55W 12v 60/55w', '9.50', '40.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'1', 3),
(241, '7798036029548', 'Escobilla  16', '72.67', '55.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(242, '7798036029586', 'Escobilla de 19', '70.58', '70.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(243, '7798036029579', 'Escobilla de 18', '76.80', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(244, '7798036029609', 'Escobilla de 21', '96.31', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(245, '7798036029616', 'Escobilla de 22 Universal', '105.17', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(246, 'CN-07', 'Conectores CN-07 multiples usos', '26.62', '50.00', b'1', 'AC', 10, 4, 8, '30.00', b'1', b'0', 16),
(247, 'CN-03', ' Adapatador Estereo auto DOBLE MACHO ISODIN', '15.99', '245.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'0', 16),
(248, 'FU', 'Portafusible trooner ', '2.50', '65.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'1', 16),
(249, 'PUL', 'Pulsadores trooner  AP-13 ', '1.10', '50.00', b'1', 'AC', 5, 4, 8, '30.00', b'1', b'1', 16),
(250, 'PUL7', 'Pulsadores trooner AP-07', '1.10', '50.00', b'1', 'AC', 5, 4, 8, '30.00', b'1', b'1', 16),
(251, 'PUL3', 'Pulsadores trooner AP-03', '1.10', '50.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'1', 16),
(252, 'GAV', 'Gaveta Ecosport-ford', '136.00', '50.00', b'0', 'AC', 3, 4, 8, '30.00', b'0', b'0', 16),
(253, 'TER', 'Termocontrible ATC1', '0.89', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'1', 16),
(254, 'TER2', 'Termocontraible ATC2', '1.00', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'1', 16),
(255, 'FP', 'Frente estero CHevrolet-aveo/captiva/lova/ gentra ', '425.00', '50.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'0', 16),
(256, '254', 'Control remoto TV LG 2453', '48.61', '150.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 16),
(257, 'PC1080', 'Tweeters TROONER bocina rectang. HL 338', '3.00', '100.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'1', 52),
(258, 'PC1090', 'tweerters TROONER bocina rectang 265 x 100', '3.30', '100.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'1', 16),
(259, '7912103007196', 'baliza bici  JPK-719', '15.00', '100.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(260, '869767142924', 'Lector de tarjeta SIYOTEAM USB', '30.00', '100.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(261, 'FPA-15', 'Parlante FOXTEX 15', '538.61', '86.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(262, 'COR', 'Corneta/bocina  p/driver LC14-25 larga roja', '99.31', '51.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'0', 52),
(263, 'COA', 'Corneta/bocina p/driver larga  amarilla', '93.20', '60.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'0', 52),
(264, 'COB', 'Corneta/bocina p/ driver  larga blanca', '93.20', '61.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'0', 52),
(265, 'COV', 'Corneta/bocina PERMAK p/driver larga verde', '93.20', '61.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(266, 'CORN', 'Corneta/bocina p/driver  PERMAK corta negra', '55.45', '170.50', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(267, 'COCR', 'Corneta/bocina p/driver corta roja', '93.20', '61.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(268, 'COCA', 'Corneta/bocina p/driver corta azul', '93.20', '61.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(269, 'COCAM', 'Corneta/bocina p/driver corta amarilla', '93.20', '61.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(271, 'COCB', 'Corneta/bocina/p/driver corta blanca', '93.20', '61.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(272, '7897183020351', 'DRIVER BOMBER  DB200X o omhs 100w 75rms', '13.85', '50.00', b'1', 'AC', 4, 4, 9, '30.00', b'1', b'1', 11),
(273, 'FBLAULINE', 'Portafusible BLAULINE   KTB-106', '4.00', '72.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 23),
(274, 'F001', 'Portafusible BLAULINE  KTB-001 4GA', '7.32', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 23),
(275, 'MHUMO', 'Maquina de humo macrolite DF-900 led 900w', '1916.61', '40.00', b'1', 'AC', 1, 4, 20, '30.00', b'1', b'0', 52),
(276, 'FP-8', 'Parlante FOXTEX 8 "', '192.91', '107.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'0', 52),
(277, 'FU150A', 'Fusible blauline KTB-048 150 A', '26.90', '78.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'0', 23),
(278, '7798137388544 EK''1021', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '62.00', '50.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'1', 6),
(279, 'COLN', 'Corneta/bocina p/driver  larga negra', '57.81', '160.00', b'1', 'AC', 4, 4, 8, '30.00', b'1', b'0', 52),
(280, '707565003940', 'Decodificar p/TDA  MEGALITE', '744.77', '103.00', b'1', 'AC', 2, 4, 3, '20.00', b'1', b'0', 52),
(281, 'H-163', 'Receptor Bluetooth h-163', '4.00', '130.00', b'1', 'AC', 4, 4, 8, '50.00', b'1', b'1', 52),
(282, '7798130906394', 'Celular panacom  MP-1103 azul', '450.00', '90.00', b'1', 'AC', 2, 4, 4, '40.00', b'1', b'0', 64),
(283, 'BC', 'Fuente de alimentacion 6 V 0.5A Zurich', '192.00', '50.00', b'1', 'AC', 2, 4, 32, '25.00', b'1', b'0', 52),
(284, 'F15', 'Fuente de alimenTacion 15 V 2.0A APD', '230.00', '55.00', b'1', 'AC', 1, 4, 18, '25.00', b'1', b'0', 52),
(285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '68.00', b'1', 'AC', 1, 4, 8, '35.00', b'1', b'0', 2),
(286, '7790368024765', 'Auriculares profe. SKP  PH-350', '16.80', '50.00', b'1', 'AC', 2, 4, 48, '35.00', b'1', b'1', 4),
(287, '7790368029906', ' Parlantes  6x9 B-52', '1000.00', '50.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'0', 10),
(288, '7790368023560', 'Potencia   SKP audio-pro MAXG-1220x', '320.00', '50.00', b'1', 'AC', 1, 4, 48, '40.00', b'1', b'1', 4),
(289, '7790368029890', ' Parlante  6" B52  WA-6192', '556.48', '50.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'0', 10),
(290, '7790368027384', 'Consola amplificada SKP VZ-40 II 1600 W', '218.00', '50.00', b'1', 'AC', 1, 4, 48, '40.00', b'1', b'1', 4),
(291, 'AUTOCAR020', 'Motor p/porton  500 classic-SEG', '3049.62', '40.00', b'1', 'AC', 2, 4, 34, '30.00', b'1', b'0', 52),
(292, 'AUTAAC091', 'Control p/porton electrico  SMD 3 BOT', '148.99', '40.00', b'1', 'AC', 2, 4, 35, '30.00', b'1', b'0', 52),
(293, 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '40.00', b'1', 'AC', 2, 4, 35, '30.00', b'1', b'0', 52),
(294, 'HUECO1.7', 'PLug hueco 1.7 mm plastico c/colita', '0.39', '40.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 52),
(295, 'HUECO2.5CH', 'jack Chasis 2.5 plastico', '0.25', '150.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 52),
(296, 'MIC-M-CH', 'canon macho a chasis 3 patas', '1.50', '40.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 52),
(297, '7798161081282', 'parlante blauline 6x9 b6902', '720.24', '50.00', b'1', 'AC', 4, 4, 9, '30.00', b'1', b'0', 23),
(298, '884938373654', 'parlante pioneer ts-300d4', '87.35', '50.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'1', 1),
(299, '49322347', 'parlante pioneer chato ts-sw3002s4', '153.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(301, '884938171281', 'parlante pioneer 12 TS-W1200PRO 1', '100.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 1),
(302, 'SNCK179331421200254715442352456', 'parlante mtx  12" RTS12-04', '2964.00', '50.00', b'1', 'AC', 0, 4, 9, '30.00', b'1', b'0', 1),
(303, '7790368029975', 'parlante B52 12" sw1250', '1235.00', '50.00', b'1', 'AC', 0, 4, 9, '30.00', b'1', b'0', 10),
(304, '7790368018641', 'parlante b-52 12" FLM812', '1950.00', '50.00', b'1', 'AC', 0, 4, 9, '30.00', b'1', b'0', 10),
(305, '784644227046', 'parlante 5x7 audiopipe csl5703r', '37.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 41),
(306, '884938311632', 'parlante 6x9 pioneer tsa 6976r', '73.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(307, ' DK201C convertidor audio digital', 'convertidor digital ARWEN DK201C', '500.00', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 5),
(308, '6900579151193', 'TV BOX  4K', '35.70', '50.00', b'1', 'AC', 0, 4, 3, '30.00', b'1', b'1', 61),
(309, '884938125673', 'SISTEMA 5 TS-A1304C', '127.00', '50.00', b'1', 'AC', 0, 4, 9, '30.00', b'1', b'1', 1),
(310, '884938367851', 'ESTEREO PIONEER AVH-A205BT', '390.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(311, 'PRO-158', 'micrfono inalambrico gbr VHF', '1491.93', '50.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'0', 7),
(312, '7790368011574', 'microfono inalambrico SKP UHF 261', '105.00', '50.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'1', 4),
(313, 'PRO-258H', 'microfono inalambrico gbr vhf', '2226.40', '50.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'0', 7),
(314, '7790368291785', 'MICROFONO SKP PRO 20 ', '11.40', '50.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'1', 4),
(315, 'BETA-49', 'MICROFONO  gbr beta -49', '444.07', '50.00', b'1', 'AC', 2, 4, 48, '30.00', b'1', b'0', 7),
(316, '7798137710550', 'MICROFONO NOGA NG-MI120C ', '200.00', '50.00', b'1', 'AC', 2, 4, 27, '30.00', b'1', b'0', 6),
(317, 'DM810', 'MICROFONO DE MESA ', '900.00', '50.00', b'1', 'AC', 1, 4, 29, '30.00', b'1', b'0', 52),
(318, 'r215e0317', 'R21 microfono samson', '82.00', '50.00', b'1', 'AC', 1, 4, 27, '30.00', b'1', b'1', 8),
(319, 'MS-106BT', 'PARLANTE PORTATIL BLUETOOH MS-106BT-A', '23.00', '80.00', b'1', 'AC', 4, 4, 32, '30.00', b'1', b'1', 52),
(320, 'MS183BT', 'PARLANTE PORTATIL BT MS183BT', '419.55', '50.00', b'1', 'AC', 4, 4, 32, '30.00', b'1', b'0', 52),
(321, 'MS-184BT', 'PARLANTE PORTATIL BT MS184BT', '419.55', '80.00', b'1', 'AC', 4, 4, 32, '30.00', b'1', b'0', 52),
(322, 'MS-203BT', 'PARLANTE PORTATIL MS203BT MS200BT', '376.23', '75.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(323, 'HBS500', 'AURICULARES BLUETOOTH DEPORTIVO', '206.05', '75.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(324, 'S-360-12', 'FUENTE METALICA P/ILUMINACION Y SEG. 12V 30AMP', '530.40', '70.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(325, 'HT-118E', 'OTG ENCHUFE ADAPATDOR V8', '9.39', '330.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(326, '6933138602225', 'CARGADOR P/AUTO 12V ', '95.31', '80.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(327, 'SM-SC28', 'CARGADOR 12V LDNIO + 2 PUERTOS USB +CABLE', '111.88', '80.00', b'1', 'AC', 8, 4, 32, '30.00', b'1', b'0', 52),
(328, '6926556542327', 'JOYSTICK INALAMBRICO PS4', '758.03', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(329, '6290132555033', 'TIRA LED 5050 BLANCO FRIO EXTERIOR 5mts', '5.50', '150.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 52),
(330, 'CK-10M', 'CABLE DE RED 10 MTS (INTERNET)', '33.11', '200.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(331, 'NW-4014', 'PLANCHA LED 4014 BLANCO FRIO ', '12.50', '85.00', b'1', 'AC', 10, 4, 32, '40.00', b'1', b'1', 52),
(332, '6290132555019', 'TIRA LED  MODELO 2835 60 W 5 MTS', '5.50', '150.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(333, '7798161081046', 'KIT CABLE BLAULINE K-009', '33.83', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'1', 23),
(334, '6942687608602', 'LUZ DE EMERGENCIA SONEX HB-860', '350.00', '50.00', b'1', 'AC', 2, 4, 20, '30.00', b'1', b'0', 52),
(335, 'LPA51-443', 'SOPORTE LED/LCD ARTICULADO  VT-BRACKET', '26.44', '50.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 52),
(336, 'DT-890-G', 'TESTER DIGITAL C/BUZER', '13.00', '52.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(337, '8887549526251 ', 'REPRODUCTOR DVD PANASONIC DVD-S700', '57.00', '40.00', b'1', 'AC', 1, 4, 3, '30.00', b'1', b'1', 52),
(338, '884938311670', 'PARLANTES PIONEER 6X9 TS A6986S ', '101.00', '45.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(340, 'PDT-100-LED', 'AFINADOR  DE GUITARRA PRO LOK CROMATICO', '133.54', '50.00', b'1', 'AC', 4, 4, 32, '30.00', b'1', b'0', 52),
(341, 'LP-1009', 'REPUESTO DRIVER LP-1009', '7.50', '50.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'1', 52),
(342, 'LP-1007', 'REPUESTO DRIVER LP-1007', '6.00', '50.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'1', 52),
(343, 'GS-312', 'SOPORTE PARA GUITARRA', '8.70', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(344, 'Q35', 'BATERIA QUICKTENSION 5 CUERPOS  Q35', '297.00', '50.00', b'1', 'AC', 1, 4, 49, '40.00', b'1', b'1', 52),
(345, 'K322 ', 'KIT CIERRE 4 P TOYOTA HILUX ', '1470.00', '50.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'0', 65),
(346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 65),
(347, '4918410209820', 'AURICULAR CON CIERRE ', '30.60', '195.00', b'1', 'AC', 5, 4, 38, '30.00', b'1', b'0', 52),
(348, '7891766030751', 'ADAPATADOR HDMI 1 A 2', '72.42', '110.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 52),
(349, '8567000012423', 'CABLE ADAPATDOR  VGA 1M/2H', '92.82', '105.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 52),
(350, 'HVGA', 'ADAPTADOR HDMI A VGA ', '112.20', '100.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 52),
(351, 'V-13', ' CABLE USB V8 SUPERIOR QUALITY', '21.42', '290.00', b'1', 'AC', 5, 4, 4, '30.00', b'1', b'0', 52),
(352, '6900004560088', 'AURICULAR BUETOOTH AMW-10', '214.20', '65.00', b'1', 'AC', 2, 4, 4, '30.00', b'1', b'0', 52),
(353, 'OR867', 'PAVA ELECTRICA ORYX', '14.75', '75.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(354, '6935364070533 845973070533  217a426009867', 'ROUTER INALAMBRICO TP-LINK', '18.00', '40.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 52),
(355, '6055R-COOL', 'PANEL DE LUZ LED EXTERIOR ', '175.00', '100.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'0', 52),
(356, '7798318653065', 'CARGADOR INOVA  CAR-2006 3.1A', '66.30', '130.00', b'1', 'AC', 5, 4, 4, '30.00', b'1', b'0', 38),
(357, '8567000012485', 'ANTENA USB WIFFI 1248', '130.82', '65.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'0', 52),
(358, '6953156216433', 'LINTERNA  COB WORK 815', '111.18', '130.00', b'1', 'AC', 2, 4, 39, '30.00', b'1', b'0', 52),
(359, '695666823515', 'AURICULAR GEORMAX AD-280', '36.06', '150.00', b'1', 'AC', 5, 4, 38, '30.00', b'1', b'0', 52),
(360, '6989693896234', 'CABLE USB 2 EN 1 V8/IPHONE6 CC701', '34.67', '200.00', b'1', 'AC', 5, 4, 4, '50.00', b'1', b'0', 52),
(361, 'BY-003', 'AURICULAR BLUETOOTH SHOLELACE ', '195.57', '85.00', b'1', 'AC', 2, 4, 4, '30.00', b'1', b'0', 52),
(362, 'MX-112', 'BALANZA ELECTRONICA ', '1406.58', '75.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(364, '4892218048204', 'RADIO WINCO  W-1912 CD/MP3/USB/SD', '51.00', '50.00', b'1', 'AC', 1, 4, 19, '30.00', b'1', b'1', 26),
(365, '885170317550', 'PARLANTE ACTIVO  PANASONIC SC-UA3', '5499.21', '50.00', b'1', 'AC', 1, 4, 2, '30.00', b'1', b'0', 25),
(366, '15587', 'BATERIA DE GEL 12 V 7 A ', '14.39', '50.00', b'1', 'AC', 5, 4, 41, '30.00', b'1', b'1', 52),
(367, 'CAJA', 'CAJA DOBLE ALFOMBRADO  BOMBER C/ 12 CARBON 250W', '160.00', '50.00', b'1', 'AC', 1, 4, 2, '30.00', b'1', b'1', 11),
(368, 'MS-510', 'ATRIL DIRECTOR LIVIANO -LIGIRO PLEGABLE', '278.22', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(369, '095225336249 330917079230104368', 'TWEETER BALA DS-18 PRO-TW210 225 RMS ALUMINIO', '35.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 63),
(370, 'PRO-TW410', 'TWEETER BALA DS-18 PRO-TW410 400RMS ', '38.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 63),
(371, '029882493014', 'TWEETER BALA  DS-18 GEN-TWR11 TITANIO 150RMS', '28.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 63),
(372, 'TSP-003e', 'TWEETER SEMTONI MINI X 2', '2.00', '100.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 52),
(373, '5025232279531 %8bakh499026  ', 'TELEFONO DE MESA PANASONIC KX-TS500 N', '15.00', '60.00', b'1', 'AC', 1, 4, 6, '30.00', b'1', b'1', 25),
(377, 'DGJJ100L6', 'CABLE REXTONE  PLUG 6.5-PLUG 6.5 6 MTS', '225.94', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 42),
(378, 'DMXX200L6', 'CABLE REXTONE  CANON MACHO -CANON HEMBRA 6 MT', '256.26', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 42),
(379, 'SMXJ210L6', 'CABLE  PLUG 6.5 -CANON HEMBRA 6 MTS', '9.80', '40.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 42),
(380, 'SMXJ250L3', 'CABLE REXTONE PLUG 6.5 CANON MACHO 3 MTS', '132.38', '52.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 42),
(381, '8887549612626', 'CARGADOR CON 4 PILAS  PANASONIC ', '408.38', '50.00', b'1', 'AC', 1, 4, 5, '30.00', b'1', b'0', 25),
(382, '663593057747 330217079010107315', 'DRIVER DS-18 PRO PRO-DR350 200 RMS', '759.81', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'0', 63),
(383, '095225336225  ', 'TWEETER BALA DS-18 PRO-TW310', '35.00', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 63),
(384, '663593063397', 'TWEETWR DS-18 PRO-TW100B', '34.40', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'1', 63),
(385, 'LED ', 'LUZ DE POSICION 6 ', '15.58', '50.00', b'0', 'AC', 4, 4, 8, '30.00', b'1', b'0', 52),
(386, 'LED13', 'LUZ  DE POSICION  LED 13', '45.90', '50.00', b'1', 'AC', 3, 4, 8, '30.00', b'1', b'0', 52),
(387, 'LED13A', 'LUZ DE POSICION LED 13 AMARILLO', '28.34', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(388, 'LED13R', 'LUZ POSICION LED 13 ROJO ', '28.34', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'0', 52),
(390, 'CABLEPARLANTE', 'CABLE PARLANTE BICOLOR 2X1 MM', '6.36', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(391, '081159065799', 'CABLE ALIMENTACION  8GA 76 MTS', '32.52', '55.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'0', 63),
(392, '081159065782', 'CABLE DE ALIMENTACION 4GA 30 MTS', '94.54', '50.00', b'1', 'AC', 1, 4, 9, '30.00', b'1', b'0', 63),
(393, '6914197252033', 'Balanza de joyeria (precision)', '100.00', '100.00', b'1', 'AC', 4, 4, 40, '30.00', b'1', b'0', 52),
(394, '6951548168254', 'Linterna recargables SPARK  7 led', '95.00', '60.00', b'1', 'AC', 4, 4, 32, '40.00', b'1', b'0', 52),
(395, '541', 'RELOJ CUERDA ', '2.50', '100.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(396, 'OSR100', 'REFLECTOR LED 100W', '650.00', '100.00', b'1', 'AC', 1, 4, 44, '50.00', b'1', b'0', 52),
(397, '6902801919991', 'RELOJ DE PARED ', '4.00', '100.00', b'1', 'AC', 2, 4, 42, '50.00', b'1', b'1', 52),
(398, 'OSR200', 'REFLECTOR LED 200W', '1200.00', '100.00', b'1', 'AC', 2, 4, 44, '50.00', b'1', b'0', 52),
(399, '7798137711922 ', 'TABLET NOGA NET 7', '48.00', '50.00', b'1', 'AC', 2, 4, 47, '30.00', b'1', b'1', 6),
(400, '5059R-WARM', 'PANEL LUZ INTERIOR 18 W', '150.00', '100.00', b'1', 'AC', 2, 4, 44, '50.00', b'1', b'0', 52),
(401, 'SOR100WCOB', 'REFLECTOR COB 100W', '1000.00', '100.00', b'1', 'AC', 1, 4, 44, '50.00', b'1', b'0', 52),
(402, '7896359508341', 'driver JBL D250X', '650.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'0', 17),
(403, 'KIT CABLE 4AUGE 2400 W ', 'KIT DE CABLE RACING 4 AUGE ', '420.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'0', 52),
(404, 'AIK-888', 'KIT CABLE 1500W RACING ', '345.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'0', 52),
(405, '784644226681', 'REPUESTO BOBINA AUDIOPIPE ADR -250-VC', '6.75', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 41),
(406, '7897183019584', 'BOMBER BICHO PAPAO 12 800wts 4+4', '128.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 11),
(407, '7897183019546', 'BOMBER BICHO PAPAO 12 600wts 4+4', '100.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 11),
(408, '67882', 'BOMBER SUBWOOFER  15" UPGRADE 350W', '85.00', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 11),
(409, 'USBA-MI5A', 'CABLE USB -V3', '40.00', '100.00', b'1', 'AC', 5, 4, 43, '30.00', b'1', b'0', 52),
(410, 'USB-AB-2.0/2M', 'CABLE USB IMPRESORA ', '70.00', '72.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(411, 'ZD-760', 'SOLDADOR P/ELECTRONICA', '6.00', '50.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'1', 52),
(412, 'TP-03', 'TWEETER SUMISHI TP-03 300 WATTS', '3.50', '58.00', b'1', 'AC', 5, 4, 9, '30.00', b'1', b'1', 52),
(413, '6873', 'AMPLIFICADOR  20 Db tres salida', '315.00', '55.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 5),
(414, '6290132547960', 'CABLE DE RED', '20.00', '100.00', b'1', 'AC', 4, 4, 43, '50.00', b'1', b'0', 15),
(415, 'CB192', 'CABLE HDMI/HDMI+ADAPT MINI/MICRO HDMI', '100.00', '55.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'0', 52),
(416, '7798137697660', 'CABLE HDMI  10 MTS NOGA', '180.00', '40.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'0', 6),
(417, '24K', 'CABLE HDMI /VGA/DVI SD305 A PLUG SVGA/2JACK 0.2', '220.00', '45.40', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'0', 52),
(418, 'HDMIV1.3B', 'CABLE VGA/ 3 RCA', '150.00', '40.00', b'1', 'AC', 1, 4, 43, '30.00', b'1', b'0', 52),
(419, 'C-55', 'CABLE 3RCAM / 3RCAH', '40.00', '64.90', b'1', 'AC', 3, 4, 43, '30.00', b'1', b'0', 5),
(420, 'MYE-3102', 'CABLE VGA M/VGA M  4.3 MTS', '160.00', '40.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'0', 52),
(421, 'HDMI5RCA', 'CABLE HDMI A 5 RCA 1.3 MTS SEISA', '280.00', '50.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'0', 15),
(422, 'INTERLOCK', 'CABLE INTERLOCK ECONOMICO', '40.00', '100.00', b'1', 'AC', 5, 4, 43, '50.00', b'1', b'0', 52),
(423, '6290132556221', 'CABLE HDMI/HDMI XC-W3012C SEISA', '90.00', '50.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'0', 15),
(424, '6290132556238', 'CABLE HDMI/HDMI 5 MTS SEISA ', '95.00', '75.00', b'1', 'AC', 1, 4, 43, '30.00', b'1', b'0', 15),
(425, 'C-64-4M-N', 'CABLE PLUG 6.5 MN A 6.5 MN  4MTS', '50.00', '100.00', b'1', 'AC', 3, 4, 43, '50.00', b'1', b'0', 5),
(426, '717669446574', 'CORREA PARA GUITARRA  FENDER', '170.00', '65.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'0', 52),
(427, '7790368024994', 'CABLE 2 RCAM / 2 RCAM  SKP', '150.00', '50.00', b'1', 'AC', 1, 4, 48, '30.00', b'1', b'0', 4),
(428, '784644741122', 'CABLE 2 RCA M/ 2 PLUG 6.5 M 2 MTS  STUDIOZ', '200.00', '90.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'0', 52),
(429, '6290132547984', 'CABLE  DE RED MODELO :CK-5M ', '40.00', '50.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 15),
(430, '6290132547991', 'CABLE DE RED MODELO:CK 10M ', '67.00', '50.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 15),
(431, 'FXC-61414', 'CABLE 6.5MN A 6.5 MN 20 CM', '20.00', '150.00', b'1', 'AC', 1, 4, 43, '50.00', b'1', b'0', 13),
(432, 'P-FUSE-P', 'PORTAFUSIBLE TIPO PALETA P/AUTO', '1.00', '100.00', b'1', 'AC', 3, 4, 8, '50.00', b'1', b'1', 5),
(433, 'MT-MT-1M', 'CABLE FIBRA OPTICA MACHO/MACHO STOLINK', '3.57', '80.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'1', 5),
(434, '784644719978', 'CABLE ROJO Y NEGRO IDEAL P/POTENCIA', '5.45', '40.00', b'0', 'AC', 1, 4, 43, '30.00', b'0', b'1', 41),
(435, '784644743669', 'CABLE P/TESTER PREMIUM CON FICHA BANANA', '3.90', '50.00', b'1', 'AC', 1, 4, 43, '30.00', b'1', b'1', 52),
(437, '097855063953 1750hs04xb39', 'MOUSE OPTICO M100', '125.20', '40.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 52),
(438, '798302165137', 'MOUSE OPTICO  XTM-195', '41.55', '40.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 52),
(439, '798302167551 inc1708664160', 'TECLADO USB XTK-090S', '3.57', '40.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 52),
(440, '798302161405 xth51012170481', 'AURICULARES XTECH  XTH510', '421.20', '40.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 52),
(441, '619659070632', 'PENDRIVE  CRUZER FIT 16 GB', '221.50', '40.00', b'1', 'AC', 5, 4, 7, '30.00', b'1', b'0', 32),
(442, '012502639749 84ue0300631', 'IMPRESORA  HL-1200 LASER MONOCROMATICA ', '90.06', '40.00', b'1', 'AC', 1, 4, 7, '30.00', b'1', b'1', 52),
(443, 'xtm''1952017083104135', 'MOUSE XTM195 XTECH ', '37.60', '50.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 52),
(444, '097855124180', 'MOUSE INALAMBRICO M-170', '132.60', '51.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'0', 52),
(445, '097855102355', 'MOUSE C/ CABLE M-90', '40.00', '80.00', b'0', 'AC', 2, 4, 7, '30.00', b'1', b'0', 52),
(446, 'WF-0096', 'CARGADOR P/AUTO  3 EN 1 + USB', '60.00', '55.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(447, 'cable aux', 'cable 3.5 st a 3.5 st', '25.00', '100.00', b'1', 'AC', 20, 4, 32, '40.00', b'1', b'0', 52),
(448, 'soldadura', 'reparacion de cables', '20.00', '100.00', b'1', 'AC', 0, 4, 32, '100.00', b'1', b'0', 52),
(449, 'WS-887', 'PARLANTE MINI SPEAKER', '162.00', '85.20', b'1', 'AC', 5, 4, 32, '40.00', b'1', b'0', 52),
(450, '332', 'PARLANTE MUSIC MINI TAMBOR', '147.90', '103.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(451, 'NGS-025 ', 'PARLANTE NOGA GO CHICO', '165.24', '81.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(452, 'BO-Q9', 'PARLANTE MUSIC/NEGRA', '187.00', '98.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(453, 'SS-4628', 'AURICULAR CIERRE CAJA AMARILLA', '31.00', '198.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(454, '1085', 'AURICULAR EF6108 EFFECT', '29.78', '202.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(455, 'EF6613', 'AURICULAR EFFECT MANOS LIBRES ', '37.59', '140.00', b'1', 'AC', 5, 4, 32, '50.00', b'1', b'0', 52);
INSERT INTO `articles` (`artId`, `artBarCode`, `artDescription`, `artCoste`, `artMarginMinorista`, `artMarginMinoristaIsPorcent`, `artEstado`, `artMinimo`, `ivaId`, `subrId`, `artMarginMayorista`, `artMarginMayoristaIsPorcent`, `artCosteIsDolar`, `marcaId`) VALUES
(456, 'EF6609', 'AURICULAR EFFECT MANOS LIBRES1', '37.59', '140.00', b'1', 'AC', 5, 4, 32, '50.00', b'1', b'0', 52),
(457, 'K2', 'AURICULAR BASS ACRILICO ', '37.78', '138.00', b'1', 'AC', 5, 4, 32, '50.00', b'1', b'0', 52),
(458, 'EX-850', 'AURICULAR  EXTRA BASS PREMIUM', '32.78', '185.00', b'1', 'AC', 4, 4, 32, '50.00', b'1', b'0', 52),
(459, '6956686622569', 'AURICULARES GEORMAX Q-25', '37.15', '142.50', b'1', 'AC', 4, 4, 32, '45.00', b'1', b'0', 52),
(460, '6910400021304', 'AURICULARES MANOS L GEORMAX EX-13', '37.15', '142.50', b'1', 'AC', 5, 4, 32, '50.00', b'1', b'0', 52),
(461, 'EX-110', 'AURICULARES M/LIBRES GEORMAX', '38.24', '136.00', b'1', 'AC', 5, 4, 32, '50.00', b'1', b'0', 52),
(462, 'AZ-002', 'AURICULAR SUPER BASS', '31.62', '185.00', b'1', 'AC', 4, 4, 32, '40.00', b'1', b'0', 52),
(463, '8023277092297', 'PLANCHITA CERAMICA GAMMA MINI ', '18.00', '92.61', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(464, '7798318654208', 'CABLE AUXILIAR INOVA CAB-020', '14.27', '251.00', b'1', 'AC', 5, 4, 43, '50.00', b'1', b'0', 38),
(465, 'K16A-172', 'CABLE RCA A PLUG 1.5M', '10.91', '360.00', b'1', 'AC', 5, 4, 43, '150.00', b'1', b'0', 52),
(467, '6701', 'PARALANTE PC C/CONTROL - BT  USBF-601', '378.42', '112.00', b'1', 'AC', 1, 4, 32, '50.00', b'1', b'0', 52),
(468, 'K16A-32', 'PARLANTE PC ', '54.63', '179.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(469, 'G-005', 'PARLANTE PC G-SYSTEM 7286 10X5CM', '93.45', '175.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'0', 52),
(470, 'G-116', 'PARLANTE  PC G-SYSTEM  7283 10X10CM', '94.86', '169.00', b'1', 'AC', 2, 4, 32, '60.00', b'1', b'0', 52),
(471, 'SP0108', 'VINCHA BEATS C/BLANCA 6218', '2.75', '150.00', b'1', 'AC', 5, 4, 32, '65.00', b'1', b'1', 52),
(472, 'MS-174', 'AURICULAR VINCHAS VIPSON', '54.62', '190.00', b'1', 'AC', 4, 4, 32, '80.00', b'1', b'0', 52),
(473, 'X-2670', 'AURICULAR VINCHA M/LIBRES NOGA X-2670', '5.10', '120.00', b'1', 'AC', 2, 4, 32, '60.00', b'1', b'1', 52),
(474, 'K16A-210', ' AURICULAR VINCHA MAGENA S8288', '92.87', '100.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(475, 'YS-003-5577', 'AURICULAR SONY VINCHA MONITOR', '5.50', '100.00', b'1', 'AC', 4, 4, 32, '45.00', b'1', b'1', 52),
(476, '1635-1641', 'TECLADO MINI KEYBOARD P/SMART TV', '9.55', '80.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(477, '336', 'BATERIA POWER BANK22000 MAH SOLMA 336', '187.68', '80.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(478, 'T-304', 'LICUADORA DE MANO TOWER HOME', '336.00', '100.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(479, '3.5 ST MET', 'FICHA PLUG 3.5 ST METALICO', '13.83', '50.00', b'1', 'AC', 10, 4, 32, '30.00', b'1', b'0', 52),
(480, '6.5 MN MET', 'FICHA PLUG 6.5 MN METAL', '18.44', '50.00', b'1', 'AC', 10, 4, 32, '30.00', b'1', b'0', 52),
(481, '6.5 ST CODM', 'FICHA PLUG 6.5 ST METAL ACODADO', '25.20', '40.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(482, 'AU 18', 'ADAPTADOR 6.5 MN/2H 6.5MN', '23.05', '50.00', b'1', 'AC', 6, 4, 32, '30.00', b'1', b'0', 52),
(483, 'MRS-101/N', 'TECLA INTERRUPTORA 3A 2P ON OFF NEGRO', '0.50', '100.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'1', 52),
(484, '244/59R', 'DIVISOR 4 VIAS COMP C/F59R Y CAP', '56.13', '53.00', b'1', 'AC', 4, 4, 32, '30.00', b'1', b'0', 52),
(485, 'DSU 3/59RG', 'DIV 3V BAJA PERDIDA C/F59R GOLD', '102.44', '50.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(486, 'DSU 4/59RG ', 'DIVISOR 4 VIAS BAJA PERDIDA C/F59R GOLD', '109.46', '50.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(487, 'DSU 6/59RG', 'DIVISOR 6 V BAJA PERDIDA C/F59RG GOLD', '224.54', '35.00', b'1', 'AC', 3, 4, 32, '20.00', b'1', b'0', 52),
(488, 'USB-AM/AH', 'CABLE USB TIPO A MACH/HEMB 2 M', '61.47', '50.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(489, 'USBAMAH-2.0/2M', 'CABLE USB 2.0 MACHO A HEMBRA A 2 MTS AZ', '70.69', '55.00', b'1', 'AC', 4, 4, 32, '30.00', b'1', b'0', 52),
(490, '784644214213', 'JUEGO DE TWEETER PIEZO XXX NTC-2200', '212.06', '50.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(491, '784644214220', 'JUEGO DE TWEETER 250W NTC-4400', '193.60', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(492, '784644735442', 'ARMONICA 10 CELDAS', '199.77', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(493, '784644734506', 'PANDERETA PROF. MEDIALUNA ZUL', '304.27', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(494, '784644734520', 'PANDERETA PROF.MEDIA LUNA ROJA', '304.27', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(495, '784644734650', 'PANDERETA  PEZ  BLANCA', '242.80', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(496, '784644734544', 'PANDERETA PROFESIONAL AZUL', '273.53', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(497, 'MTNR-7CLIP', 'AFINADOR P/GUITARRA CLIP', '599.31', '35.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(498, 'A507 SL', 'CUERDAS P/GUITARRA ELECTRICA', '169.04', '50.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(499, 'DS-M5A', 'BAQUETA /PALILLOS P/ BATERIA  5A MAPLE', '76.83', '50.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(500, 'DSU 2/59RG', 'DIVISOR 2 V  BAJA PERDIDA C/F59RG GOLD', '75.78', '50.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(501, '7790368031534', 'MICROFONO PRO-MIC500', '205.58', '75.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(502, '7790368024277', 'CONSOLA MEZCLADORA 12 CH VZ-12.4', '291.00', '60.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 4),
(503, 's2170754 ', 'CONSOLA 12 CANALES MIXER SOUNCRAFT SX1202FX', '9014.38', '50.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(504, '7798137699947', 'JOYSTICK NOGANET NG-3009 BT P/PLAY 3', '428.67', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(505, 'CASIO', 'TECLADO CASIO CTK-2500 61 TECLAS  400 TONOS', '185.00', '55.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 19),
(506, 'PAISTE', 'PLATILLO PAISTE 101 UNIVERSAL SET ', '233.00', '35.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(507, 'CAPO', 'CAPOTRASTE P/ GUITARRA STAGG SCPX-FL', '289.99', '36.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(508, 'TRAS', 'TRANSPORTE DENVER /ALICE A007D CAPO', '8.40', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(509, 'CAMP', 'CUERDA GUITARRA CAMPANA DORADA', '149.99', '100.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'0', 52),
(510, 'BAT', 'HIHAT  ', '2369.00', '35.00', b'1', 'AC', 1, 4, 32, '20.00', b'1', b'0', 52),
(511, 'BAT1', 'CRASH 16 "', '1679.00', '35.00', b'1', 'AC', 1, 4, 32, '20.00', b'1', b'0', 52),
(512, 'BAT2', 'RAID', '100.00', '35.00', b'1', 'AC', 1, 4, 32, '20.00', b'1', b'1', 52),
(513, 'DTIG4/8GB', 'PENDRIVE  8GB', '160.43', '40.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(514, 'N3350 4GB', 'NOTBOOK 320 14" CELERON N', '7352.43', '40.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'0', 52),
(515, 'MONITOR', 'MONITOR LED 19 PHILIPS 193v5lsv SMART CONTROL', '99.61', '40.00', b'1', 'AC', 1, 4, 32, '30.00', b'1', b'1', 52),
(516, 'KIT', 'KIT RACING 4 GAUGE', '417.00', '65.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(517, 'MP-200', 'SIRENA DE  EXTERIOR ALONSO ', '28.50', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(518, 'ANTENA', 'ANTENA PARA TV DIGITAL', '278.58', '65.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(519, 'CR-123', 'BATERIA SONY FOTOGRAFICA', '112.26', '52.00', b'1', 'AC', 3, 4, 32, '30.00', b'1', b'0', 52),
(520, 'SMS SP88B 2 MT', 'SOPORTE P/BAFLE CON SOMBRERO', '19.50', '50.00', b'1', 'AC', 0, 4, 32, '30.00', b'1', b'1', 52),
(521, '039800099099', 'PILAS ALCALINA AAA ENERGIZER', '14.35', '40.00', b'1', 'AC', 5, 4, 32, '30.00', b'1', b'0', 52),
(522, '884938313360', 'ESTEREO PIONEER MVH-85UB', '84.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(523, '884938343442', 'ESTEREO PIONEER MVH-295BT', '124.00', '40.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 1),
(524, '740617220445', 'PEN DRIVE KINGSTON 8GB DTIG4/8GB', '174.00', '40.00', b'1', 'AC', 10, 4, 32, '30.00', b'1', b'0', 31),
(525, 'FIRE LED', 'LUZ LED GBR  FIRE LED ', '1253.56', '45.00', b'1', 'AC', 0, 4, 48, '30.00', b'1', b'0', 7),
(526, 'PARLANTE 18 GBR', 'PARLANTE 18 GBR HP -18 PRO', '3908.30', '45.00', b'1', 'AC', 0, 4, 48, '30.00', b'1', b'0', 7),
(527, 'PARLANTE GBR 12', 'PARLANTE GBR 12 HP-15 PRO', '3162.94', '45.00', b'1', 'AC', 0, 4, 48, '30.00', b'1', b'0', 7),
(528, 'PARLANTE 12 GBR', 'PARLANTE 12 GBR PASIVO PL1240', '124.63', '50.00', b'1', 'AC', 1, 4, 48, '40.00', b'1', b'1', 7),
(529, 'LIQUIDO PARA HUMO X 1 LTS', 'LIQUIDO GBR X 1LTRS', '102.85', '50.00', b'1', 'AC', 5, 4, 48, '30.00', b'1', b'0', 7),
(530, 'CONSOLA MIXER', 'CONSOLA GBR BAT2000MP3', '94.08', '50.00', b'1', 'AC', 1, 4, 48, '40.00', b'1', b'1', 7),
(531, 'LUCES GBR FIRE BALL', 'LUZ GBR FIRE BALL', '1558.48', '45.00', b'1', 'AC', 1, 4, 48, '30.00', b'1', b'0', 7),
(532, 'potencia skp max 720', 'potencia skp max 720 ', '200.00', '50.00', b'1', 'AC', 1, 4, 48, '40.00', b'1', b'1', 4),
(533, '5110219', 'CAJA SKP SK-4P ACTIVA 15', '230.00', '50.00', b'1', 'AC', 1, 4, 48, '30.00', b'1', b'1', 4),
(534, 'CAJA 15 NOVIK EVO', 'CAJA 15 NOVIK EVO-350AUSB ROJA', '8380.00', '45.00', b'1', 'AC', 1, 4, 48, '30.00', b'1', b'0', 74),
(535, 'kx''tgb210agw', 'TELEFONO PANASONIC KX-TGB210', '28.57', '50.00', b'1', 'AC', 2, 4, 6, '30.00', b'1', b'1', 25),
(536, 'kx''tg1711agb', 'TELEFONO PANASONIC KX-TG1711', '28.57', '60.00', b'1', 'AC', 2, 4, 6, '30.00', b'1', b'1', 25),
(537, 'CARGADOR UNIVERSAL PARA PC', 'CARGADOR UNIV POWER P/ PC 96W HC-5808', '7.00', '100.00', b'1', 'AC', 2, 4, 7, '50.00', b'1', b'1', 52),
(538, '6944363939505', 'LINTERNA OSR-8881 9LED 17HS 1100MAH', '4.00', '100.00', b'1', 'AC', 2, 4, 39, '30.00', b'1', b'1', 52),
(539, 'MDP 100W', 'REFLECTOR MDP LED 100WTS  2LED', '27.77', '80.00', b'1', 'AC', 2, 4, 20, '30.00', b'1', b'1', 52),
(540, '84727', 'FUNDA GUITARRA CRIOLLA FRISELINA ACOLCHADA CON MAN', '18.00', '60.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(541, '7798042301058', 'ESTABILIZADOR PRYMO 1000 NEGRO', '43.00', '30.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 52),
(542, '21850', 'ZAPATILLA 5 TOMAS C/TECLA COMUN SIN CABLE', '2.80', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(543, '21809', 'ZAPATILLA ENROLLABLE 4 TOMAS 10 MTRS INDELPLAS', '18.55', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(544, 'LCD-503A', 'SOPORTE VT-BRACKET 23-42 MOVIL', '21.78', '50.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 52),
(545, 'KL22-44T', 'SOPORTE VT-BRACKET 32-55 FIJO', '9.68', '50.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 52),
(546, 'SP-55', 'SOPORTE IOFI HASTA 42"', '7.87', '50.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 52),
(547, 'v3', 'CABLE USB V3 ', '1.33', '100.00', b'1', 'AC', 10, 4, 32, '40.00', b'1', b'1', 52),
(548, 'TRASFORMADOR 220V A 110V 200W', 'TRANSFORMADOR ARVOX 110V 200W', '17.80', '50.00', b'1', 'AC', 2, 4, 32, '30.00', b'1', b'1', 52),
(549, 'TRASFORMADOR 220V 110V 50W', 'TRANSFORMADOR ARVOX 110V 50W', '2.85', '130.00', b'1', 'AC', 2, 4, 32, '80.00', b'1', b'1', 52),
(550, 'SJ-802', 'JOYSTICK PS2 SEISA C/CABLE', '4.00', '70.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 15),
(551, 'SJ-803', 'JOYSTICK sj-803 seisa ps2', '4.50', '70.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 15),
(552, 'XC-FH5001', 'CABLE HDMI MALLADO SEISA 5MTS', '2.50', '200.00', b'1', 'AC', 2, 4, 3, '50.00', b'1', b'1', 15),
(553, 'MS-158BT', 'PARLANTE PORTATIL BLUETOOTH MS-158', '28.00', '70.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 15),
(554, 'MS-205BT', 'PARLANTE PORTATIL MS-205BT', '13.80', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(555, 'MS-221BT', 'PARLANTE PORTATIL MS-221BT', '20.00', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(556, 'MS-278BT', 'PARLANTE PORTATIL MS-278BT', '15.50', '70.00', b'1', 'AC', 0, 4, 32, '40.00', b'1', b'1', 15),
(557, 'OM-819BT', 'PARLANTE PORTATIL OM-819BT CON MICROFONO', '59.00', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(558, 'MS-199BT', 'PARLANTE PORTATIL MS-199BT', '13.75', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(559, 'MS-200BT', 'PARLANTE PORTATIL MS-200BT', '13.75', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(560, 'MS-254BT', 'PARLANTE PORTATIL MS-254BT', '14.64', '70.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 15),
(561, 'HBS-500', 'AURICULAR BT DEPOTIVO  HBS-500', '6.92', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(563, 'DN-D226', 'TECLADO MULTIMEDIA USB GAMER T/ROJAS DN-D226', '3.89', '70.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(564, 'SM-SC219 DC219 DL-219IP', 'CARGADOR LDNIO DOBLE USB 2.1 IPHONES SM-SC219', '3.85', '80.00', b'1', 'AC', 2, 4, 32, '35.00', b'1', b'1', 15),
(565, 'K-1028E', 'CONTROL REMOTO P/AA K-1028', '3.40', '100.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 15),
(566, 'K-100E', 'CONTROL REMOTO P/AA K-100E', '3.40', '100.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 15),
(567, 'MYE-3101', 'CABLE VGA 1.5MT CON FILTRO BOLSA VERDE', '1.60', '80.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 15),
(568, 'MYE-3101/3.0M', 'CABLE VGA 3MT CON FILTRO BOLSA VERDE', '2.40', '80.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 15),
(569, '67884', 'PARLANTE BOMBER 12" CARBON B/SIMPLE 250WT 4HMS', '60.00', '50.00', b'1', 'AC', 0, 4, 9, '30.00', b'1', b'1', 11),
(570, '120006', 'AFINADOR CREEP CT36 C/PINZA DISPLAY', '6.63', '60.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(571, '120029 AFINADOR', 'AFINADOR CROMATICO CHERUMWST 650C  C/PINZA ', '8.30', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(572, '258101 ', 'CENCERRO PLASTICO MPX BLH-03', '24.20', '50.00', b'1', 'AC', 0, 4, 49, '30.00', b'1', b'1', 52),
(573, '258155', 'CENCERRO BLOK CHICO DENVER BSH 01', '13.91', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(574, '258165', 'CENCERRO BLOCK CHICO DENVER BSL 02', '16.29', '50.00', b'1', 'AC', 1, 4, 49, '30.00', b'1', b'1', 52),
(575, '258206', 'CENCERRO METALICO DENVER CBK06', '9.89', '50.00', b'1', 'AC', 1, 4, 49, '30.00', b'1', b'1', 52),
(576, '258440', 'CENCERRO PLASTICO LAZER 5 FP-240', '12.10', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(577, '258442', 'CENCERRO PLASTICO LAZER 6 FT-242', '14.52', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(578, '258506', 'CENCERRO METALICO MXP 6', '11.13', '50.00', b'1', 'AC', 1, 4, 49, '30.00', b'1', b'1', 52),
(579, '290040', 'CLAVIJERO MANARGUEZ N 40 LIRA NIQ', '5.45', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(580, '290041', 'CLAVIJERO MENARGUEZ N 41 LIRA DORADO', '5.81', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(581, '290050', 'CLAVIJERO MENARGUEZ N 50 CROMADO', '6.78', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(582, '290051', 'CLAVIJERO MENARGUEZ N51 LIRA LUJO', '10.41', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(583, '295207', 'CLAVIJERO MENARGUEZ 207 PASO INT LIRA NIQUEL', '5.32', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(584, '295208', 'CLAVIJERO MENARGUEZ 208 PASO INT CAJA DORADA', '5.75', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(585, '295209', 'CLAVIJERO MENARGUEZ 209', '5.75', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(586, '355007', 'ENCORDADOS CAMPANA', '4.36', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(587, '390007', 'ENCORDADOS M ARTIGAS S/AMARILLO 520 ', '3.39', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(588, '397007', 'ENCORDADOS III MILENIUN M ARTIGAS PLATA 720', '4.84', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(589, '535015', 'ENCORDADOS PARA ACUSTICA FENDER 70XL-010', '9.98', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(590, '580010', 'FLAUTA DULCE YAMAHA YRS23', '9.07', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(591, '600066', 'FUNDA 66 ACUSTICA ACOLCHADA', '15.46', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(592, '635024', 'GUITARRA ALEYMAR 24EQ C/CORTE', '141.57', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(593, '860065', 'TRANSPORTE PINZA ALICE A005MP', '1.45', '50.00', b'1', 'AC', 2, 4, 49, '30.00', b'1', b'1', 52),
(594, '860325', 'COPODASTRO OLYMPIA BCO-001 ', '9.38', '50.00', b'1', 'AC', 1, 4, 49, '30.00', b'1', b'1', 52),
(595, 'DN-A904', 'CARGADOR UNIVERSAL  KIT DN-A904', '18.00', '50.00', b'1', 'AC', 2, 4, 7, '30.00', b'1', b'1', 52),
(596, '119', 'CONTROL HITACHI  CR119', '47.08', '157.00', b'1', 'AC', 0, 4, 13, '30.00', b'1', b'0', 52),
(598, '391', 'CONTROL REMOTO PARA DECO', '32.67', '250.00', b'1', 'AC', 2, 4, 13, '50.00', b'1', b'0', 16),
(599, 'CI-41', 'FICHA ESTEREO SONY CI-41', '54.99', '100.00', b'0', 'AC', 10, 4, 9, '50.00', b'1', b'0', 16),
(600, 'CC003', 'CARGADOR TURBO 2.4 AUTHENTIC 8766', '1.90', '260.00', b'1', 'AC', 2, 4, 6, '60.00', b'1', b'1', 52),
(601, 'MP-H-036', 'PLANCHA CON CEPILLO OM MP-H-036', '21.00', '100.00', b'1', 'AC', 2, 4, 50, '50.00', b'1', b'1', 52),
(602, '1718013', 'AURICULAR SAMSUNG CAJITA', '1.50', '200.00', b'1', 'AC', 2, 4, 6, '60.00', b'1', b'1', 51),
(603, 'OM-2995', 'PLANCHA DE PELO OM OM-2995', '6.50', '100.00', b'1', 'AC', 2, 4, 50, '50.00', b'1', b'1', 52),
(604, '7120', 'SECADOR GAMA EOLIC NANO1300W 7120', '16.14', '100.00', b'1', 'AC', 2, 4, 50, '50.00', b'1', b'1', 52),
(605, '3367', 'GAMA SECADOR POTENZA 2400W', '28.60', '100.00', b'1', 'AC', 2, 4, 50, '50.00', b'1', b'1', 14),
(606, 'V8 NEGRO', 'CABLE V8 NEGRO SAMSUNG ', '1.00', '200.00', b'1', 'AC', 10, 4, 6, '80.00', b'1', b'1', 51),
(607, 'FERNWEH', 'CABLE V8 VARIOS MODELOS', '0.70', '300.00', b'1', 'AC', 10, 4, 6, '100.00', b'1', b'1', 52),
(608, 'K16A-215', 'CABLE USB V8 K16A-215', '0.50', '300.00', b'1', 'AC', 10, 4, 6, '100.00', b'1', b'1', 52),
(609, '9052', 'CABLE V8 BELKIN 1.2M 9052', '1.70', '120.00', b'1', 'AC', 2, 4, 6, '65.00', b'1', b'1', 52),
(610, '2197', 'CABLE  IPHONE 5/ V8 BELKIN CAJA  BLANCA ', '1.53', '150.00', b'1', 'AC', 10, 4, 6, '65.00', b'1', b'1', 52),
(611, 'ECB-DU4AWD', 'CABLE V8 BLANCO ENROLLADO ECB-DU4AWD', '0.80', '250.00', b'1', 'AC', 10, 4, 6, '100.00', b'1', b'1', 52),
(612, '25680', 'CABEZAL SAMSUNG TRABEL  25680', '2.00', '100.00', b'1', 'AC', 10, 4, 6, '40.00', b'1', b'1', 51),
(613, '77302', 'CARGADOR PULPO EFFECT', '1.60', '150.00', b'1', 'AC', 2, 4, 6, '60.00', b'1', b'1', 52),
(614, '2226', 'CARGADOR SAMSUNG S8  C/NEGRA T-50 2226', '2.70', '160.00', b'1', 'AC', 2, 4, 6, '60.00', b'1', b'1', 51),
(615, 'CAR-1004 ', 'INOVA CARGADOR 2.1 A CAR-1008 CAR-1009', '2.10', '150.00', b'1', 'AC', 10, 4, 6, '60.00', b'1', b'1', 52),
(616, 'LMD998', 'DVD PORTATIL 9.8', '56.00', '100.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 52),
(617, '18077', 'CHROMECAST G2 GOOGLR CONVERSOR', '15.00', '100.00', b'1', 'AC', 2, 4, 3, '50.00', b'1', b'1', 52),
(618, 'ESENSIAS ', 'ESENSIAS FRUTALES ', '1.00', '150.00', b'1', 'AC', 10, 4, 32, '50.00', b'1', b'1', 52),
(619, 'KJ-AC02', 'RECEPTOR DE MUSICA BLUETOOTH', '3.03', '135.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(620, 'PS2CABLE', 'JOYSTICK PLAY 2 S/MARCA 8023-24', '3.50', '100.00', b'1', 'AC', 2, 4, 7, '50.00', b'1', b'1', 52),
(621, 'OSR CCTV08', 'KIT DE CAMARAS DE SEGURIDAD  FULL HD  X8 6356A', '123.00', '70.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(622, 'JD PUNTERO', 'JD PUNTERO LASAER COMUN ECOSMART AB3061', '4.00', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(623, '2712', 'LECTOR DE MEMORIA  7126', '0.40', '250.00', b'1', 'AC', 2, 4, 6, '100.00', b'1', b'1', 52),
(624, 'T61', 'LINTERNA RECARG OM ', '7.46', '100.00', b'1', 'AC', 2, 4, 39, '50.00', b'1', b'1', 52),
(625, '5977', 'FOCO GIRATORIO INOVA 4796', '2.46', '190.00', b'1', 'AC', 2, 4, 20, '50.00', b'1', b'1', 38),
(626, 'MJ-205', 'PARLANTE 8', '48.18', '100.00', b'1', 'AC', 2, 4, 2, '50.00', b'1', b'1', 52),
(627, 'MS-233', 'PARLANTE BT C/ROJA FMMS-234235', '10.53', '100.00', b'1', 'AC', 2, 4, 48, '50.00', b'1', b'1', 52),
(628, 'MS-277', 'PARLANTE BT CAJA ROJA FM MS -278-279', '15.32', '100.00', b'1', 'AC', 2, 4, 2, '50.00', b'1', b'1', 52),
(629, 'MS-268-270', 'PARLANTE BT C/ROJA MS-269', '19.96', '100.00', b'1', 'AC', 2, 4, 2, '50.00', b'1', b'1', 52),
(630, 'RC-503', 'AURICULAR ROYALCELLBT  RC-503', '7.87', '100.00', b'1', 'AC', 2, 4, 2, '50.00', b'1', b'1', 52),
(631, 'V33', 'VINCHA ENJOY MUSIC BT V33', '12.21', '100.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 52),
(632, 'ESENCIAS', 'ESENCIAS FRUTALES', '1.00', '160.00', b'1', 'AC', 5, 4, 32, '40.00', b'1', b'1', 52),
(633, 'BOMBO', 'BOMBO METALICO PINTADO 24', '47.19', '60.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(634, 'CORREA', 'CORREA PARA REDOBLANTE O REPIQUE', '1.45', '60.00', b'1', 'AC', 1, 4, 49, '40.00', b'1', b'1', 52),
(635, 'GUIRO ', 'GUIRO ABIERTO CHICO CON PEINE ', '8.95', '60.00', b'1', 'AC', 1, 4, 49, '40.00', b'1', b'1', 52),
(636, 'GUIRO2', 'GUIRO ABIERTO GRANDE CON PEINE', '9.82', '60.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(637, 'MAZO ', 'MAZO DE GOMA EVA PARA BOMBO', '6.53', '60.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(638, 'REPIQUE', 'REPIQUE METALICO PINTADO 10', '21.78', '60.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(639, 'ZURDO', 'ZURDO METALICO PINTADO DE 16" TENSION SIMPLE', '27.83', '60.00', b'1', 'AC', 1, 4, 49, '40.00', b'1', b'1', 52),
(640, '12427', 'SOPORTE LED/LCD LPA51-443 ART.C/BRAZO', '26.45', '50.00', b'1', 'AC', 2, 4, 3, '30.00', b'1', b'1', 52),
(641, '21151', 'CABLE REXTONE PLUG 6.5 DMXJ210L6 CANON H', '9.84', '50.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'1', 42),
(642, '59251', 'RADIO DE MESA DUAL WINCO W-2004', '11.35', '50.00', b'1', 'AC', 1, 4, 19, '30.00', b'1', b'1', 26),
(643, '59252', 'RADIO DE MESA DUAL WINCO W-2005', '12.19', '50.00', b'1', 'AC', 1, 4, 19, '30.00', b'1', b'1', 26),
(644, '59253', 'RADIO WINCO 9913', '17.64', '50.00', b'1', 'AC', 1, 4, 19, '30.00', b'1', b'1', 26),
(645, '67951', 'KIT INSTALACION MAGIXSON K-009', '33.83', '50.00', b'1', 'AC', 2, 4, 9, '30.00', b'1', b'1', 52),
(646, '71421', 'CONECTOR AI ISO DIN CORTO', '0.63', '50.00', b'1', 'AC', 2, 4, 8, '30.00', b'1', b'1', 52),
(647, 'M-7488', 'FRENTE ADAP.PERMAK NFORD FOCUS/89-T', '3.62', '50.00', b'1', 'AC', 1, 4, 8, '30.00', b'1', b'1', 52),
(648, 'dga11171133', 'POTENCIA SOUNDMAGUS DK 1200', '171.00', '50.00', b'1', 'AC', 2, 4, 9, '35.00', b'1', b'1', 79),
(649, 'DFE11170871', 'POTENCIA SOUNDMAGUS DK600', '118.00', '50.00', b'1', 'AC', 2, 4, 9, '35.00', b'1', b'1', 79),
(650, 'SOUNDMAGUS', 'POTENCIA SOUNDMAGUS DK1800', '213.00', '50.00', b'1', 'AC', 1, 4, 9, '35.00', b'1', b'1', 79),
(651, 'KITCUARTA', 'KIT DE EMERGENCIA CON CUARTA', '22.00', '50.00', b'1', 'AC', 2, 4, 8, '40.00', b'1', b'1', 52),
(652, 'BZ2100', 'POTENCIA SPL BZ2100 250W RMS MONO CLASE AB', '84.00', '50.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'1', 52),
(653, 'K-1038E', 'CONTROL REMOTO PARA AIRE K-1038', '3.50', '100.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 52),
(654, '7798130907889', 'PARLANTE PANACOM T50CM', '40.00', '60.00', b'1', 'AC', 2, 4, 2, '40.00', b'1', b'1', 64),
(655, '791489108973', 'CAPACITOR BOSS CAP8', '135.00', '50.00', b'1', 'AC', 1, 4, 9, '40.00', b'1', b'1', 52),
(656, '039800039644', 'PILA ENERGIZER 371', '0.48', '50.00', b'1', 'AC', 2, 4, 5, '40.00', b'1', b'1', 35),
(657, '039800113955', 'PILA ENERGIZER AZ13DPA', '0.48', '50.00', b'1', 'AC', 2, 4, 5, '40.00', b'1', b'1', 35),
(658, '039800113948', 'PILA ENERGIZER AZ10DPA', '0.48', '50.00', b'1', 'AC', 2, 4, 5, '40.00', b'1', b'1', 35),
(659, '8888021300178', 'PILA ENERGIZER A76 BP', '1.13', '50.00', b'1', 'AC', 2, 4, 5, '40.00', b'1', b'1', 35),
(660, '039800111005', 'PILA ENERGIZER 357', '0.76', '50.00', b'1', 'AC', 2, 4, 5, '40.00', b'1', b'1', 35),
(661, '039800091826', 'PILA ENERGIZER  379', '0.25', '150.00', b'1', 'AC', 2, 4, 5, '50.00', b'1', b'1', 35),
(662, '8888021300376', 'PILA ENERGIZER A23', '0.44', '100.00', b'1', 'AC', 2, 4, 5, '50.00', b'1', b'1', 35),
(663, '798302055988', 'EXPANSOR DE WIIFI NEXXT KRONOS301', '19.34', '35.00', b'1', 'AC', 2, 4, 7, '35.00', b'1', b'1', 52),
(664, '798302161511 inc1704988406', 'TECLADO TECH XTK300S', '8.06', '40.00', b'1', 'AC', 2, 4, 7, '35.00', b'1', b'1', 52),
(665, 'wd10ezex''08wn4a0', 'DISCO DURO INTERNO WD10EZEX', '43.57', '40.00', b'1', 'AC', 2, 4, 7, '35.00', b'1', b'1', 52),
(666, '67760', 'PARLANTE 15 BOMBER BICHO SWBP-15-800 4+4', '132.00', '50.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'1', 11),
(667, '58935', 'RADIO DE BOLSILLO PANACOM RF-2030', '7.46', '50.00', b'1', 'AC', 2, 4, 19, '40.00', b'1', b'1', 64),
(668, '7893296071068', 'FRENTE ADAPTADOR TOYOTA HILUX 1 DIN', '8.85', '60.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'1', 52),
(669, '86462', 'CAJA PLASTICA 15 VACIA AI15"', '74.00', '50.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 52),
(670, '9634512470054', 'DECO PRONEXT CONVERSOR DIGITAL XT34', '29.00', '90.00', b'1', 'AC', 2, 4, 3, '50.00', b'1', b'1', 52),
(671, 'SMXX200L6', 'CABLE MIC CANON CANON REXTONE SAMURAI  ', '9.80', '40.00', b'1', 'AC', 2, 4, 43, '30.00', b'1', b'1', 42),
(672, 'BATERIA', 'BATERIA QUIKTENSION  Q23 CHICA PARA NIÑO', '132.00', '50.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(673, 'MEMORIA', 'SD 16GB TRANSDISK MICRO SDHC', '7.04', '50.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 52),
(674, 'MEMORIA 740617128147', 'SD 8GB KINGSTON MICRO CLASE4', '5.92', '50.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 31),
(675, '740617274646', 'SD 16GB KINGSTON CLASE 10', '7.56', '50.00', b'1', 'AC', 2, 4, 4, '40.00', b'1', b'1', 31),
(676, '740617274707', 'SD 32GB KINGSTON CLASE10', '13.78', '50.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 31),
(677, '740617198270', 'PEN DRIVE 16GB KINGSTON METALICO', '7.04', '50.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 31),
(678, '619659000431', 'PEN DRIVE 16GB SANDISK NEGRO', '7.04', '50.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 31),
(679, '619659069193', 'PEN DRIVE 32GB SANDISK NEGRO', '12.66', '50.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 31),
(680, '140000076', 'CABLE USB OTG LION', '1.40', '100.00', b'1', 'AC', 2, 4, 4, '80.00', b'1', b'1', 52),
(681, 'REDOBLANTE', 'REDOBLANTE PINTADO 14', '20.44', '50.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(682, 'TV LED', 'TV LED KEN BROWN 32 SMART ', '195.00', '50.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(683, 'HOME', 'HOME NOGA S2176R 2.2', '57.00', '50.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 6),
(684, 'MIX', 'MIX CONNECT 8 SKP ', '99.00', '50.00', b'1', 'AC', 2, 4, 48, '40.00', b'1', b'1', 4),
(685, 'AUDIOPIPE', 'PARLANTE AUDIO PIPE 18" TXX-BD2W18 1500RMS', '285.00', '50.00', b'1', 'AC', 1, 4, 9, '40.00', b'1', b'1', 41),
(686, 'PARLANTE AUDIO PIPE', 'PARLANTE AUDIOPIPE 15" TXX-BD215 1000RMS', '180.00', '50.00', b'1', 'AC', 1, 4, 9, '40.00', b'1', b'1', 41),
(687, 'PRO15', 'PARLANTE PEAVEY 15" PRO15 400WTS', '62.00', '50.00', b'1', 'AC', 2, 4, 48, '40.00', b'1', b'1', 18),
(688, 'PRO18 ', 'PARLANTE PEAVEY PRO18 18"', '88.00', '50.00', b'1', 'AC', 2, 4, 48, '40.00', b'1', b'1', 18),
(689, '84568', 'GUITARRA MEDIANA Nº 5 NATURAL ', '57.95', '50.00', b'1', 'AC', 1, 4, 49, '40.00', b'1', b'1', 52),
(690, '84569', 'GUITARRA DE NIÑO MINI Nº 4 COLOR', '57.14', '50.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(691, '24160', 'ESTAÑO EXIMETAL BOBINA 60/40 X 1mm 100GRS', '6.13', '50.00', b'1', 'AC', 2, 4, 17, '40.00', b'1', b'1', 62),
(692, '24161', 'ESTAÑO EXIMETAL BOBINA 60/40 250GRS', '14.52', '50.00', b'1', 'AC', 2, 4, 17, '40.00', b'1', b'1', 62),
(693, '84564', 'GUITARRA CLAS CON CORTE COLOR Nº 12 TAPA DE ABEDUL', '73.81', '50.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(694, '84565', 'GUITARRA CLAS CON CORTE Nº12 TAPA PINO', '85.21', '50.00', b'1', 'AC', 2, 4, 49, '40.00', b'1', b'1', 52),
(695, '11019 SPEAK ON', 'FICHA SPEAK ON 4C PA-19', '1.33', '50.00', b'1', 'AC', 2, 4, 48, '40.00', b'1', b'1', 52),
(696, '$s151222061443', 'PORTERO ELECTRICO COMMAX SALIDA PARA CERRADURA', '77.00', '50.00', b'1', 'AC', 1, 4, 32, '40.00', b'1', b'1', 52),
(697, '144165', 'PARLANTE PORTATIL E300 BLUETOOTH ', '10.78', '80.00', b'1', 'AC', 2, 4, 2, '40.00', b'1', b'1', 52),
(698, '144297', 'JUEGO CONSOLA PORTATIL 1.8" SY-888A', '10.32', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(699, '144330', 'JUEGO CONSOLA PORTATIL 2.4" SY-988', '11.82', '80.00', b'1', 'AC', 2, 4, 32, '40.00', b'1', b'1', 52),
(700, '122924', 'MAUSE MINI RETRACTIL OPTICO SEISA DN-K215', '1.84', '80.00', b'1', 'AC', 2, 4, 7, '40.00', b'1', b'1', 15),
(701, '142845', 'MINI TECLADO INALAMBRICO PARA SMART KP21T', '15.00', '80.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(702, '141228', 'MINI TECLADO PARA SMART  ILUMINADO KP21SDL-RGB', '13.85', '80.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(703, '141195', 'MINI TECLADO INALAMBRICO TV KP09S', '13.85', '80.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(704, '141998', 'CARGADOR PORTATIL 6000MAH 925C', '6.78', '80.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(705, '106028', 'CAPTURADORA DE VIDEO EASYCAP DC60-007', '6.00', '80.00', b'1', 'AC', 2, 4, 3, '40.00', b'1', b'1', 52),
(706, '1054453', 'PARLANTE 6X9 B-52 WA-9312', '34.57', '50.00', b'1', 'AC', 2, 4, 9, '40.00', b'1', b'1', 10),
(707, '8888021301410', 'PILA RECARGABLE AA ENERGIZER X 2 UNIDADES', '4.84', '50.00', b'1', 'AC', 2, 4, 5, '40.00', b'1', b'1', 35),
(708, 'FICHA ', 'FICHA ESTEREO PIONEER SONY UNIVERSAL', '2.78', '100.00', b'1', 'AC', 2, 4, 9, '50.00', b'1', b'1', 52),
(709, 'M801', 'CABLE V8 COMUN CON LUZ J-17', '1.11', '150.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 52),
(710, 'KK-8202-12', 'CALCULADORA DOBLE VISOR', '3.11', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 57),
(711, '7495', 'CARGADOR  2.5 X7MM ', '2.50', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(712, '6607', 'CABEZAL TRAVEL BLANCO 6607 1A', '0.78', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(713, 'JAC-2002', 'CARGADOR PARA AUTO V8 CS205', '4.25', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(714, '6402', 'CARGADOR SAMSUNG BLISTER ORIG 2A', '4.10', '100.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 51),
(715, 'G22', 'CARGADOR INOVA 3.1A DUAL G22', '2.30', '100.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 38),
(716, 'W-34', 'PLANCHA A VAPOR WINCO', '20.25', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 26),
(717, '0006', 'SACACORCHO AUTOMATICO', '10.35', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(718, 'SJ-913', 'JOYSTICK  INALAMBRICO 6 EN 1', '7.90', '100.00', b'1', 'AC', 2, 4, 7, '50.00', b'1', b'1', 52),
(719, 'JR071602', 'AUTO ROBOT RACES CAR', '8.40', '100.00', b'1', 'AC', 2, 4, 32, '50.00', b'1', b'1', 52),
(720, 'JAC-1003', 'PAWER BANK 9600MAH REAL DAMACO 0038', '4.85', '100.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 52),
(721, 'TCL-1500', 'TECLADO MINI DINAX INALAMBRICO', '12.00', '100.00', b'1', 'AC', 2, 4, 3, '50.00', b'1', b'1', 52),
(722, 'SM2305', 'CABEZAL 1 MAH REAL 4227', '0.87', '100.00', b'1', 'AC', 2, 4, 6, '50.00', b'1', b'1', 52),
(723, 'LED T-10', 'LED POSICION 5 PUNTAS T-10 SMD-5050', '0.50', '100.00', b'1', 'AC', 10, 4, 12, '40.00', b'1', b'1', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE IF NOT EXISTS `cajas` (
  `cajaId` int(11) NOT NULL AUTO_INCREMENT,
  `cajaApertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cajaCierre` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `cajaImpApertura` decimal(10,2) NOT NULL,
  `cajaImpVentas` decimal(10,2) DEFAULT NULL,
  `cajaImpRendicion` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cajaId`),
  KEY `usrId` (`usrId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`cajaId`, `cajaApertura`, `cajaCierre`, `usrId`, `cajaImpApertura`, `cajaImpVentas`, `cajaImpRendicion`) VALUES
(1, '2018-05-04 03:02:49', '2018-05-04 00:17:16', 9, '1.00', '3052.32', '10.00'),
(2, '2018-05-04 03:18:19', '2018-05-08 21:59:50', 9, '0.01', '13579.03', '0.01'),
(3, '2018-05-09 01:00:04', '2018-06-01 13:20:41', 9, '600.00', '353.83', '600.00'),
(4, '2018-06-01 16:21:45', '2018-06-01 22:46:07', 4, '850.00', '3898.16', '22.22'),
(5, '2018-06-02 01:48:15', '2018-06-05 19:19:19', 4, '10.00', '43.00', '0.01'),
(6, '2018-06-05 22:23:53', '2018-06-15 12:41:23', 4, '0.33', '0.00', '0.33'),
(7, '2018-06-15 15:42:21', '2018-06-15 12:43:05', 4, '900.00', '0.00', '900.00'),
(8, '2018-06-15 15:43:25', '2018-06-15 13:35:01', 4, '900.00', '1.00', '1000.00'),
(9, '2018-06-15 16:37:35', '2018-06-18 14:18:42', 4, '1000.00', '0.00', '10.00'),
(10, '2018-06-18 17:18:57', '2018-06-21 20:12:03', 4, '100.00', '0.00', '100.00'),
(11, '2018-06-21 23:12:19', '2018-06-29 21:17:04', 4, '1000.00', '15.00', '100.00'),
(12, '2018-06-30 12:40:03', '2018-07-05 09:47:20', 4, '800.00', '0.00', '1000.00'),
(13, '2018-07-05 12:48:09', '2018-07-06 09:33:50', 4, '2000.00', '49.50', '2049.50'),
(14, '2018-07-06 12:34:18', NULL, 4, '1500.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
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
  UNIQUE KEY `docId` (`docId`,`cliDocumento`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliId`, `cliNombre`, `cliApellido`, `docId`, `cliDocumento`, `cliDomicilio`, `cliTelefono`, `cliMail`, `cliEstado`, `cliDefault`) VALUES
(1, 'Consumidor Final', '', 1, '', '', '', '', 'AC', b'1'),
(2, 'Sergio', 'Moyano', 1, '31324208', '', '', '', 'AC', b'0'),
(3, 'adolfo', 'fern', 1, '286916506', 'justo castro 4', '', '', 'AC', b'0'),
(4, 'PABLO ', 'FIGUEROA', 1, '26791993', '', '', '', 'AC', b'0'),
(5, 'BLAS ', 'AVILA', 1, '42799255', '', '', '', 'AC', b'0'),
(6, 'NATALIA ', 'LEGLISE', 1, '29977604', '', '', '', 'AC', b'0'),
(7, 'SERGIO ', 'CORDOBA', 1, '27651456', '', '', '', 'AC', b'0'),
(8, 'RAUL LEONARDO', 'BAIGORRIA', 1, '26399329', '', '2644842816', '', 'AC', b'0'),
(9, 'CESAR ', 'FERNANDEZ', 1, '28888888', '', '', '', 'AC', b'0'),
(10, 'CRISTIAN ', 'REINOSO', 1, '29999999', '', '', '', 'AC', b'0'),
(11, 'Usuario', 'Prueba', 1, '1111', '', '', '', 'AC', b'0'),
(12, 'PETE ', 'FERNANDEZ', 1, '28691687', '', '', '', 'AC', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `validezpresupuesto` int(11) DEFAULT NULL,
  `title1` varchar(15) DEFAULT NULL,
  `title2` varchar(15) DEFAULT NULL,
  `cotizacionDolar` decimal(10,2) DEFAULT '1.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`validezpresupuesto`, `title1`, `title2`, `cotizacionDolar`) VALUES
(5, 'Adolfo', 'Fernandez', '28.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacorrientecliente`
--

CREATE TABLE IF NOT EXISTS `cuentacorrientecliente` (
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
  KEY `cajaId` (`cajaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Volcado de datos para la tabla `cuentacorrientecliente`
--

INSERT INTO `cuentacorrientecliente` (`cctepId`, `cctepConcepto`, `cctepRef`, `cctepTipo`, `cctepDebe`, `cctepHaber`, `cctepFecha`, `cliId`, `usrId`, `cajaId`) VALUES
(1, 'Venta: 14', 14, 'VN', '68.00', NULL, '2018-04-12 17:17:25', 1, 4, NULL),
(2, 'Venta: 15', 15, 'VN', '300.00', NULL, '2018-04-13 20:32:41', 2, 4, NULL),
(3, 'Venta: 15', 15, 'VN', '300.00', NULL, '2018-04-13 20:32:41', 2, 4, NULL),
(4, 'Venta: 16', 16, 'VN', '238.00', NULL, '2018-04-13 20:45:16', 2, 4, NULL),
(5, 'pago', NULL, 'MN', '0.00', '500.00', '2018-04-17 23:11:15', 2, 4, 1),
(6, 'pago', NULL, 'MN', '0.00', '150.00', '2018-04-17 23:27:30', 2, 4, 1),
(7, 'prestamo', NULL, 'MN', '500.00', '0.00', '2018-04-17 23:28:07', 2, 4, NULL),
(8, 'pago recibo 12132', NULL, 'MN', '0.00', '400.00', '2018-04-17 23:50:01', 2, 4, 1),
(9, 'prestam adnansdasd', NULL, 'MN', '1000.00', '0.00', '2018-04-17 23:50:36', 2, 4, NULL),
(10, 'sdfsdf', NULL, 'MN', '0.00', '2000.00', '2018-04-17 23:51:24', 2, 4, 1),
(11, 'xgdgdgf', NULL, 'MN', '3000.00', '0.00', '2018-04-17 23:51:59', 2, 4, NULL),
(12, 'interes', NULL, 'MN', '700.00', '0.00', '2018-04-17 23:52:22', 2, 4, NULL),
(13, 'Venta: 31', 31, 'VN', '246.00', NULL, '2018-04-18 20:23:40', 1, 4, NULL),
(14, 'Venta: 35', 35, 'VN', '246.00', NULL, '2018-04-18 20:25:37', 1, 4, NULL),
(15, 'Venta: 36', 36, 'VN', '246.00', NULL, '2018-04-18 20:34:18', 1, 4, 1),
(16, 'Venta: 37', 37, 'VN', '246.00', NULL, '2018-04-18 20:35:11', 1, 4, 1),
(17, 'Venta: 38', 38, 'VN', '246.00', NULL, '2018-04-18 20:35:54', 1, 4, 1),
(18, 'Venta: 41', 41, 'VN', '246.00', NULL, '2018-04-18 20:36:54', 1, 4, 1),
(19, 'Venta: 47', 47, 'VN', '272.65', NULL, '2018-04-18 20:50:01', 1, 4, 1),
(20, 'pago adelantado', NULL, 'MN', '0.00', '600.00', '2018-05-02 19:34:34', 6, 4, 5),
(21, 'Venta: 72', 72, 'VN', '60.00', NULL, '2018-05-04 00:39:48', 2, 9, 2),
(22, 'Cancelar', NULL, 'MN', '0.00', '3048.00', '2018-05-04 00:40:46', 2, 9, 2),
(23, 'Venta: 73', 73, 'VN', '202.50', NULL, '2018-05-04 00:41:32', 2, 9, 2),
(24, 'Venta: 86', 86, 'VN', '153.84', NULL, '2018-05-08 22:03:11', 3, 9, 3),
(25, 'Venta: 86', 86, 'VN', '153.84', NULL, '2018-05-08 22:03:11', 3, 9, 3),
(26, 'entrega a cuenta', NULL, 'MN', '0.00', '58.00', '2018-05-08 22:03:58', 3, 9, 3),
(27, 'Venta: 97', 97, 'VN', '28688.00', NULL, '2018-06-01 23:25:10', 1, 4, 5),
(28, 'Venta: 98', 98, 'VN', '11475.20', NULL, '2018-06-01 23:28:15', 2, 4, 5),
(29, 'Venta: 99', 99, 'VN', '2868.80', NULL, '2018-06-01 23:33:16', 2, 4, 5),
(30, '-1', 111, 'VN', '1203.90', NULL, '2018-07-07 00:54:32', 5, 4, 14),
(31, 'Venta: 112', 112, 'VN', '2868.58', NULL, '2018-07-07 01:00:36', 6, 4, 14),
(32, 'CONCELA', NULL, 'MN', '0.00', '2268.58', '2018-07-07 01:01:28', 6, 4, 14),
(33, 'entrega x saldo estereo pioneer', NULL, 'MN', '0.00', '600.00', '2018-07-15 01:14:54', 5, 4, 14),
(34, 'Venta: 118', 118, 'VN', '1420.86', NULL, '2018-07-19 15:16:31', 8, 4, 14),
(35, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(36, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(37, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(38, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(39, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(40, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(41, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(42, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(43, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(44, '-1', 119, 'VN', '4726.19', NULL, '2018-07-20 16:20:05', 9, 4, 14),
(45, '-1', 120, 'VN', '2292.23', NULL, '2018-07-20 16:26:46', 9, 4, 14),
(46, '-1', 120, 'VN', '2292.23', NULL, '2018-07-20 16:26:46', 9, 4, 14),
(47, '-1', 120, 'VN', '2292.23', NULL, '2018-07-20 16:26:46', 9, 4, 14),
(48, '-1', 120, 'VN', '2292.23', NULL, '2018-07-20 16:26:46', 9, 4, 14),
(49, '-1', 120, 'VN', '2292.23', NULL, '2018-07-20 16:26:46', 9, 4, 14),
(50, 'Venta: 122', 122, 'VN', '10109.40', NULL, '2018-07-21 20:54:40', 10, 4, 14),
(51, 'Venta: 122', 122, 'VN', '10109.40', NULL, '2018-07-21 20:54:40', 10, 4, 14),
(52, '-1', 123, 'VN', '49.01', NULL, '2018-07-23 02:23:06', 11, 4, 14),
(53, '-1', 124, 'VN', '500.00', NULL, '2018-07-23 02:25:55', 11, 4, 14),
(54, '-1', 125, 'VN', '133.28', NULL, '2018-07-23 02:28:05', 11, 4, 14),
(55, '-1', 126, 'VN', '1533.17', NULL, '2018-07-23 13:32:06', 9, 4, 14),
(56, '-1', 126, 'VN', '1533.17', NULL, '2018-07-23 13:32:06', 9, 4, 14),
(57, '-1', 126, 'VN', '1533.17', NULL, '2018-07-23 13:32:06', 9, 4, 14),
(58, '-1', 127, 'VN', '1753.99', NULL, '2018-07-23 13:38:19', 9, 4, 14),
(59, '-1', 127, 'VN', '1753.99', NULL, '2018-07-23 13:38:19', 9, 4, 14),
(60, '-1', 127, 'VN', '1753.99', NULL, '2018-07-23 13:38:19', 9, 4, 14),
(61, '-1', 128, 'VN', '49474.31', NULL, '2018-07-23 13:50:35', 11, 4, 14),
(62, '-1', 129, 'VN', '1085.70', NULL, '2018-07-23 13:52:58', 9, 4, 14),
(63, '-1', 130, 'VN', '4000.00', NULL, '2018-07-23 15:24:32', 12, 4, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacorrienteproveedor`
--

CREATE TABLE IF NOT EXISTS `cuentacorrienteproveedor` (
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
  KEY `cajaId` (`cajaId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cuentacorrienteproveedor`
--

INSERT INTO `cuentacorrienteproveedor` (`cctepId`, `cctepConcepto`, `cctepRef`, `cctepTipo`, `cctepDebe`, `cctepHaber`, `cctepFecha`, `prvId`, `usrId`, `cajaId`) VALUES
(1, 'Recepción Remito X número: 1', 4, 'RC', '0.00', NULL, '2018-02-28 03:00:00', 1, 4, NULL),
(2, 'Recepción Factura A número: 0003-0008195', 5, 'RC', '1679.93', NULL, '2018-02-23 03:00:00', 2, 9, NULL),
(3, 'compra de productos fa 122345455', NULL, 'MN', '6000.00', '0.00', '2018-06-02 01:52:44', 10, 4, NULL),
(4, 'pago a proveedor , recibo 3333', NULL, 'MN', '0.00', '1000.00', '2018-06-02 01:54:38', 10, 4, 5),
(5, 'qweqweqwe', NULL, 'MN', '5000.00', '0.00', '2018-06-02 01:57:06', 10, 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ivaalicuotas`
--

CREATE TABLE IF NOT EXISTS `ivaalicuotas` (
  `ivaId` int(11) NOT NULL AUTO_INCREMENT,
  `ivaDescripcion` varchar(20) NOT NULL,
  `ivaPorcentaje` decimal(10,2) NOT NULL,
  `ivaEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `ivaPorDefecto` bigint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ivaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ivaalicuotas`
--

INSERT INTO `ivaalicuotas` (`ivaId`, `ivaDescripcion`, `ivaPorcentaje`, `ivaEstado`, `ivaPorDefecto`) VALUES
(1, 'Exen', '0.00', 'AC', 0),
(2, 'No Grav', '0.00', 'AC', 0),
(3, '10,5%', '10.50', 'AC', 0),
(4, '21%', '21.00', 'AC', 1),
(5, '27%', '27.00', 'AC', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listadeprecios`
--

CREATE TABLE IF NOT EXISTS `listadeprecios` (
  `lpId` int(11) NOT NULL AUTO_INCREMENT,
  `lpDescripcion` varchar(50) NOT NULL,
  `lpDefault` bit(1) NOT NULL DEFAULT b'0',
  `lpMargen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `lpEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`lpId`),
  UNIQUE KEY `lpDescripcion` (`lpDescripcion`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `listadeprecios`
--

INSERT INTO `listadeprecios` (`lpId`, `lpDescripcion`, `lpDefault`, `lpMargen`, `lpEstado`) VALUES
(1, 'Contado', b'0', '0.00', 'AC'),
(2, 'Visa x 3', b'0', '20.00', 'AC'),
(3, 'VISA X 6', b'0', '30.00', 'AC'),
(4, 'VISA X 12', b'0', '40.00', 'AC'),
(5, 'NEVADA', b'0', '15.00', 'AC'),
(6, 'DATA', b'1', '15.00', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcaart`
--

CREATE TABLE IF NOT EXISTS `marcaart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Volcado de datos para la tabla `marcaart`
--

INSERT INTO `marcaart` (`id`, `descripcion`) VALUES
(53, '6333'),
(5, 'ARWEN'),
(41, 'AUDIOPIPE'),
(10, 'B52'),
(73, 'BATERIA MOURA'),
(23, 'BLAULINE'),
(20, 'BLAUPUNKT'),
(11, 'BOMBER'),
(19, 'CASIO'),
(28, 'CHAMPION'),
(54, 'DOORBELL'),
(63, 'DS18'),
(35, 'ENERGIZER'),
(48, 'EUROCASE'),
(34, 'EVERADY'),
(62, 'EXIMETAL'),
(58, 'FASTIX'),
(46, 'FOREVER'),
(43, 'FULLTOTAL'),
(14, 'GAMA'),
(7, 'GBR'),
(47, 'GENIUS'),
(59, 'GOTITA'),
(29, 'HARDBAT'),
(56, 'HOLDER'),
(38, 'INOVA'),
(17, 'JBL'),
(57, 'KARUIDA'),
(31, 'KINGSTON'),
(49, 'LDNIO'),
(9, 'LG'),
(40, 'lOCH'),
(55, 'MACROLED'),
(36, 'MAKAO'),
(21, 'MATRIX'),
(37, 'MAXELL'),
(45, 'MEGALITE'),
(27, 'MOURA'),
(6, 'NOGA'),
(74, 'NOVIK'),
(3, 'OSRAM'),
(64, 'PANACOM'),
(25, 'PANASONIC'),
(18, 'PEAVY'),
(24, 'PHILIPS'),
(1, 'PIONEER'),
(12, 'POSITRON'),
(60, 'POXILINA'),
(42, 'REXTONE'),
(8, 'SAMSON'),
(51, 'SAMSUNG'),
(32, 'SANDISK'),
(15, 'SEISA'),
(61, 'sin marca'),
(4, 'SKP'),
(2, 'SONY'),
(22, 'SOUND MAGUS'),
(79, 'SOUNDMAGUS'),
(33, 'SPEAKER'),
(44, 'TRANSCEND'),
(16, 'TROONER'),
(52, 'VARIAS'),
(30, 'VERBATIM'),
(50, 'WGMCELL'),
(26, 'WINCO'),
(65, 'X28'),
(13, 'ZEBRA'),
(39, 'ZELTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediosdepago`
--

CREATE TABLE IF NOT EXISTS `mediosdepago` (
  `medId` int(11) NOT NULL AUTO_INCREMENT,
  `medCodigo` varchar(3) NOT NULL,
  `medDescripcion` varchar(50) NOT NULL,
  `tmpId` int(11) NOT NULL,
  `medEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`medId`),
  UNIQUE KEY `medCodigo` (`medCodigo`) USING BTREE,
  UNIQUE KEY `medDescripcion` (`medDescripcion`) USING BTREE,
  KEY `tmpId` (`tmpId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `mediosdepago`
--

INSERT INTO `mediosdepago` (`medId`, `medCodigo`, `medDescripcion`, `tmpId`, `medEstado`) VALUES
(1, 'EFE', 'Efectivo', 1, 'AC'),
(2, 'VIS', 'Visa', 2, 'AC'),
(3, 'MAS', 'MasterCard', 2, 'AC'),
(4, 'NEV', 'Nevada', 2, 'AC'),
(5, 'DAT', 'Data', 2, 'AC'),
(6, 'CRA', 'Credito Argentino', 3, 'AC'),
(7, 'CCT', 'Cuenta Corriente', 4, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE IF NOT EXISTS `orden` (
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
  KEY `cajaId` (`cajaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`oId`, `oFecha`, `lpId`, `lpPorcentaje`, `venId`, `cliId`, `oDescuento`, `oEsPresupuesto`, `oEsVenta`, `oEsPlanReserva`, `oEsMayorista`, `cajaId`, `oEstado`) VALUES
(54, '2018-05-04 00:09:19', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(55, '2018-05-04 00:10:56', 1, '0.00', 2, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(56, '2018-05-04 00:11:10', 1, '0.00', 2, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(57, '2018-05-04 00:11:46', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(58, '2018-05-04 00:11:47', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(59, '2018-05-04 00:11:49', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(60, '2018-05-04 00:11:50', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(61, '2018-05-04 00:11:52', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(62, '2018-05-04 00:11:53', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(63, '2018-05-04 00:11:55', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(64, '2018-05-04 00:11:57', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(65, '2018-05-04 00:11:58', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(66, '2018-05-04 00:12:00', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 1, 'AC'),
(67, '2018-05-04 00:21:23', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(68, '2018-05-04 00:23:22', 1, '0.00', 3, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(69, '2018-05-04 00:29:25', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(70, '2018-05-04 00:31:35', 1, '0.00', 3, 1, '2.50', b'0', b'1', b'0', b'0', 2, 'AC'),
(71, '2018-05-04 00:36:15', 2, '20.00', 1, 1, '43.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(72, '2018-05-04 00:39:48', 1, '0.00', 3, 2, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(73, '2018-05-04 00:41:32', 1, '0.00', 1, 2, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(74, '2018-05-04 20:28:25', 1, '0.00', 3, 2, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(75, '2018-05-04 20:45:56', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(76, '2018-05-04 20:46:34', 1, '0.00', 3, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(77, '2018-05-04 20:47:00', 1, '0.00', 2, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(78, '2018-05-04 20:48:59', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(79, '2018-05-04 20:50:41', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(80, '2018-05-04 20:50:58', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(81, '2018-05-04 20:51:14', 1, '0.00', 3, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(82, '2018-05-07 20:22:36', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(83, '2018-05-08 00:21:49', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 2, 'AC'),
(84, '2018-05-08 00:25:17', 1, '0.00', 3, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(85, '2018-05-08 00:26:52', 1, '0.00', 3, 1, '0.00', b'0', b'1', b'0', b'1', 2, 'AC'),
(86, '2018-05-08 22:03:11', 2, '20.00', 2, 3, '0.00', b'0', b'1', b'0', b'0', 3, 'AC'),
(87, '2018-05-14 21:33:39', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 3, 'AC'),
(88, '2018-06-01 13:39:58', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 4, 'AC'),
(89, '2018-06-01 13:52:31', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 4, 'AC'),
(90, '2018-06-01 14:19:33', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 4, 'AC'),
(91, '2018-06-01 14:27:32', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 4, 'AC'),
(92, '2018-06-01 18:04:17', 1, '0.00', 1, 1, '0.00', b'0', b'0', b'1', b'0', 4, 'AC'),
(93, '2018-06-01 22:31:13', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 4, 'FA'),
(94, '2018-06-05 19:18:08', 1, '0.00', 3, 1, '0.00', b'0', b'0', b'1', b'0', 4, 'FA'),
(95, '2018-06-01 22:35:59', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', 4, 'FA'),
(96, '2018-06-01 22:39:49', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 4, 'FA'),
(97, '2018-06-01 23:25:10', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 5, 'FA'),
(98, '2018-06-01 23:28:15', 1, '0.00', 1, 2, '0.00', b'0', b'1', b'0', b'0', 5, 'FA'),
(99, '2018-06-01 23:33:16', 1, '0.00', 3, 2, '0.00', b'0', b'1', b'0', b'0', 5, 'FA'),
(100, '2018-06-15 13:03:41', 1, '0.00', 1, 1, '98.00', b'0', b'1', b'0', b'0', 8, 'FA'),
(101, '2018-06-25 15:58:44', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(102, '2018-06-25 15:59:21', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(103, '2018-06-25 16:00:29', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(104, '2018-06-25 16:03:23', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(105, '2018-06-25 22:14:26', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(106, '2018-06-25 22:50:17', 1, '0.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 11, 'FA'),
(107, '2018-06-25 23:20:50', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(108, '2018-06-29 22:55:49', 6, '15.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 11, 'FA'),
(109, '2018-07-05 12:51:16', 6, '15.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 13, 'FA'),
(110, '2018-07-06 23:58:17', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(111, '2018-07-07 00:54:32', 1, '0.00', 1, 5, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(112, '2018-07-07 01:00:36', 6, '15.00', 1, 6, '0.00', b'0', b'1', b'0', b'0', 14, 'FA'),
(113, '2018-07-07 12:49:55', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(114, '2018-07-10 23:42:41', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(115, '2018-07-14 22:14:20', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(116, '2018-07-16 21:50:22', 6, '15.00', 1, 1, '0.00', b'1', b'0', b'0', b'0', NULL, 'AC'),
(117, '2018-07-18 15:50:53', 1, '0.00', 1, 1, '0.00', b'1', b'0', b'0', b'1', NULL, 'AC'),
(118, '2018-07-19 15:16:31', 6, '15.00', 1, 8, '0.00', b'0', b'1', b'0', b'0', 14, 'FA'),
(119, '2018-07-20 16:20:04', 6, '15.00', 1, 9, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(120, '2018-07-20 16:26:46', 6, '15.00', 1, 9, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(121, '2018-07-20 23:02:12', 6, '15.00', 1, 1, '0.00', b'0', b'1', b'0', b'0', 14, 'FA'),
(122, '2018-07-21 20:54:40', 6, '15.00', 1, 10, '0.00', b'0', b'1', b'0', b'0', 14, 'FA'),
(123, '2018-07-23 02:23:06', 6, '15.00', 1, 11, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(124, '2018-07-23 02:25:55', 6, '15.00', 3, 11, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(125, '2018-07-23 02:28:05', 6, '15.00', 1, 11, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(126, '2018-07-23 13:32:06', 6, '15.00', 1, 9, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(127, '2018-07-23 13:38:19', 6, '15.00', 1, 9, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(128, '2018-07-23 13:50:35', 6, '15.00', 3, 11, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(129, '2018-07-23 13:52:58', 6, '15.00', 1, 9, '0.00', b'0', b'1', b'0', b'1', 14, 'FA'),
(130, '2018-07-23 15:24:32', 6, '15.00', 1, 12, '644.00', b'0', b'1', b'0', b'1', 14, 'FA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordendetalle`
--

CREATE TABLE IF NOT EXISTS `ordendetalle` (
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
  KEY `oId` (`oId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=222 ;

--
-- Volcado de datos para la tabla `ordendetalle`
--

INSERT INTO `ordendetalle` (`odId`, `oId`, `artId`, `artCode`, `artDescripcion`, `artCosto`, `artVenta`, `artVentaSD`, `artCant`) VALUES
(56, 54, 289, '7790368029890', ' Parlante  6" B52  WA-6192', '556.48', '834.72', '834.72', '1.00'),
(57, 55, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(58, 56, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(59, 56, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(60, 57, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(61, 58, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(62, 59, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(63, 60, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(64, 61, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(65, 62, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(66, 63, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(67, 64, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(68, 65, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(69, 66, 285, 'CAR-702', 'Control remoto estereo SONY ', '120.00', '201.60', '201.60', '1.00'),
(70, 67, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(71, 67, 74, '342', 'control remoto Tv 425', '50.00', '100.00', '100.00', '5.00'),
(72, 68, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(73, 69, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(74, 69, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(75, 69, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(76, 69, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(77, 69, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(78, 70, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(79, 71, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '243.00', '202.50', '1.00'),
(80, 72, 260, '869767142924', 'Lector de tarjeta SIYOTEAM USB', '30.00', '60.00', '60.00', '1.00'),
(81, 73, 22, '740617128147', 'Tarjeta de memoria 8GB Kingston', '150.00', '202.50', '202.50', '1.00'),
(82, 74, 289, '7790368029890', ' Parlante  6" B52  WA-6192', '556.48', '834.72', '834.72', '1.00'),
(83, 75, 289, '7790368029890', ' Parlante  6" B52  WA-6192', '556.48', '834.72', '834.72', '1.00'),
(84, 76, 287, '7790368029906', ' Parlantes  6x9', '774.27', '1161.40', '1161.40', '1.00'),
(85, 77, 278, '7798137388544 EK''102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1920.00', '1920.00', '1.00'),
(86, 78, 287, '7790368029906', ' Parlantes  6x9', '774.27', '1161.40', '1161.40', '1.00'),
(87, 79, 289, '7790368029890', ' Parlante  6" B52  WA-6192', '556.48', '834.72', '834.72', '1.00'),
(88, 80, 187, '884938344883', 'Estereo Pioneer AVH-295BT', '6330.00', '9495.00', '9495.00', '2.00'),
(89, 81, 58, 'LED1', 'led programable ventilador USB', '181.25', '290.00', '290.00', '1.00'),
(90, 82, 278, '7798137388544 EK''102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1920.00', '1920.00', '1.00'),
(91, 83, 278, '7798137388544 EK''102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1920.00', '1920.00', '1.00'),
(92, 84, 278, '7798137388544 EK''102', 'Sistema de parlantes NOGA PC C/C remoto S-2176R', '1280.00', '1920.00', '1920.00', '1.00'),
(93, 85, 289, '7790368029890', ' Parlante  6" B52  WA-6192', '556.48', '779.07', '779.07', '1.00'),
(94, 86, 296, 'MIC-M-CH', 'canon macho a chasis 3 patas', '33.30', '46.62', '46.62', '2.00'),
(95, 86, 294, 'HUECO1.7', 'PLug hueco 1.7 mm plastico c/colita', '8.66', '12.12', '12.12', '5.00'),
(96, 87, 143, '639', 'Control Remoto TV LCD Philips 639', '117.90', '199.99', '199.99', '1.00'),
(97, 88, 447, 'cable aux', 'cable 3.5 st a 3.5 st', '25.00', '50.00', '50.00', '1.00'),
(98, 89, 5, '7501037600056', 'Pilas  AA', '4.30', '10.11', '10.11', '2.00'),
(99, 90, 448, 'soldadura', 'reparacion de cables', '20.00', '40.00', '40.00', '1.00'),
(100, 91, 7, '8999002672013', 'Pilas AAA', '6.40', '10.05', '10.05', '2.00'),
(101, 92, 293, 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00'),
(102, 93, 293, 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '1.00'),
(103, 93, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '10.00'),
(104, 94, 293, 'AUTAAC180', 'Control p/porton electrico 4 canales ZDREMOTE SEG', '160.54', '224.76', '224.76', '3.00'),
(105, 94, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '5.00'),
(106, 95, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '40.00'),
(107, 96, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '1.00'),
(108, 97, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '50.00'),
(109, 98, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '20.00'),
(110, 99, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '5.00'),
(111, 100, 319, 'MS-106BT', 'PARLANTE PORTATIL BLUETOOH MS-106BT-A', '610.00', '1098.00', '1098.00', '1.00'),
(112, 103, 176, '884938369350', 'Estereo PIoneer  MVH-X30BT', '4076.50', '5707.10', '5707.10', '1.00'),
(113, 104, 192, '884938311649', 'Parlante Pioneer TS-A6976S 550W', '2080.00', '3352.96', '3352.96', '1.00'),
(114, 104, 178, '884938311465', 'Parlante Pioneer  6 1/2 TS -A1676S', '2000.00', '2800.00', '2800.00', '1.00'),
(115, 104, 176, '884938369350', 'Estereo PIoneer  MVH-X30BT', '4076.50', '5707.10', '5707.10', '1.00'),
(116, 105, 532, 'potencia skp max 720', 'potencia skp max 720 ', '5500.00', '7975.00', '7975.00', '1.00'),
(117, 105, 216, 'BA', 'Bafle  GBR  2 vias 15', '5065.06', '7091.08', '7091.08', '2.00'),
(118, 106, 216, 'BA', 'Bafle  GBR  2 vias 15', '5065.06', '7091.08', '7091.08', '2.00'),
(119, 107, 216, 'BA', 'Bafle  GBR  2 vias 15', '5065.06', '7091.08', '7091.08', '2.00'),
(120, 108, NULL, '-', 'instalacion', '600.00', '600.00', '600.00', '1.00'),
(121, 108, 346, 'TX4R', 'CONTROL REMOTO P/ALARMA DOMICILIO X28', '382.51', '573.76', '573.76', '1.00'),
(122, 109, 16, '039800013613', 'BATERIA 9V ', '30.00', '49.50', '49.50', '1.00'),
(123, 110, 551, 'SJ-803', 'JOYSTICK', '128.70', '218.79', '218.79', '1.00'),
(124, 110, 550, 'SJ-802', 'JOYSTICK PS2 SEISA C/CABLE', '114.40', '194.48', '194.48', '3.00'),
(125, 110, 555, 'MS-221BT', 'PARLANTE PORTATIL MS-221BT', '572.00', '972.40', '972.40', '3.00'),
(126, 110, 556, 'MS-278BT', 'PARLANTE PORTATIL MS-278BT', '443.30', '753.61', '753.61', '2.00'),
(127, 110, 553, 'MS-158BT', 'PARLANTE PORTATIL BLUETOOTH MS-158', '800.80', '1361.36', '1361.36', '2.00'),
(128, 110, 560, 'MS-254BT', 'PARLANTE PORTATIL MS-254BT', '418.70', '711.80', '711.80', '3.00'),
(129, 110, 554, 'MS-205BT', 'PARLANTE PORTATIL MS-205BT', '394.68', '670.96', '670.96', '2.00'),
(130, 110, 558, 'MS-199BT', 'PARLANTE PORTATIL MS-199BT', '393.25', '668.52', '668.52', '2.00'),
(131, 110, 323, 'HBS500', 'AURICULARES BLUETOOTH DEPORTIVO', '206.05', '360.59', '360.59', '4.00'),
(132, 110, 557, 'OM-819BT', 'PARLANTE PORTATIL OM-819BT CON MICROFONO', '1687.40', '2868.58', '2868.58', '1.00'),
(133, 111, 185, '884938309325', 'Estereo Pioneer DEH-X1850UB', '3003.00', '3903.90', '3903.90', '1.00'),
(134, 112, 557, 'OM-819BT', 'PARLANTE PORTATIL OM-819BT CON MICROFONO', '1687.40', '2868.58', '2868.58', '1.00'),
(135, 113, 586, '355007', 'ENCORDADOS CAMPANA', '124.70', '187.04', '187.04', '5.00'),
(136, 113, 587, '390007', 'ENCORDADOS M ARTIGAS S/AMARILLO 520 ', '96.95', '145.43', '145.43', '4.00'),
(137, 113, 588, '397007', 'ENCORDADOS III MILENIUN M ARTIGAS PLATA 720', '138.42', '207.64', '207.64', '4.00'),
(138, 113, 589, '535015', 'ENCORDADOS PARA ACUSTICA FENDER 70XL-010', '285.43', '428.14', '428.14', '3.00'),
(139, 113, 594, '860325', 'COPODASTRO OLYMPIA BCO-001 ', '268.27', '402.40', '402.40', '1.00'),
(140, 113, 593, '860065', 'TRANSPORTE PINZA ALICE A005MP', '41.47', '62.20', '62.20', '2.00'),
(141, 113, 590, '580010', 'FLAUTA DULCE YAMAHA YRS23', '259.40', '389.10', '389.10', '1.00'),
(142, 113, 570, '120006', 'AFINADOR CREEP CT36 C/PINZA DISPLAY', '189.62', '303.39', '303.39', '4.00'),
(143, 113, 571, '120029 AFINADOR', 'AFINADOR CROMATICO CHERUMWST 650C  C/PINZA ', '237.38', '356.07', '356.07', '2.00'),
(144, 113, 572, '258101 ', 'CENCERRO PLASTICO MPX BLH-03', '692.12', '1038.18', '1038.18', '1.00'),
(145, 113, 573, '258155', 'CENCERRO BLOK CHICO DENVER BSH 01', '397.83', '596.74', '596.74', '1.00'),
(146, 113, 574, '258165', 'CENCERRO BLOCK CHICO DENVER BSL 02', '465.89', '698.84', '698.84', '1.00'),
(147, 113, 575, '258206', 'CENCERRO METALICO DENVER CBK06', '282.85', '424.28', '424.28', '1.00'),
(148, 113, 578, '258506', 'CENCERRO METALICO MXP 6', '318.32', '477.48', '477.48', '1.00'),
(149, 113, 579, '290040', 'CLAVIJERO MANARGUEZ N 40 LIRA NIQ', '155.87', '233.81', '233.81', '1.00'),
(150, 113, 580, '290041', 'CLAVIJERO MENARGUEZ N 41 LIRA DORADO', '166.17', '249.25', '249.25', '1.00'),
(151, 113, 581, '290050', 'CLAVIJERO MENARGUEZ N 50 CROMADO', '193.91', '290.86', '290.86', '1.00'),
(152, 113, 582, '290051', 'CLAVIJERO MENARGUEZ N51 LIRA LUJO', '297.73', '446.59', '446.59', '1.00'),
(153, 113, 583, '295207', 'CLAVIJERO MENARGUEZ 207 PASO INT LIRA NIQUEL', '152.15', '228.23', '228.23', '1.00'),
(154, 113, 584, '295208', 'CLAVIJERO MENARGUEZ 208 PASO INT CAJA DORADA', '164.45', '246.68', '246.68', '1.00'),
(155, 113, 585, '295209', 'CLAVIJERO MENARGUEZ 209', '164.45', '246.68', '246.68', '1.00'),
(156, 114, 605, '3367', 'GAMA SECADOR POTENZA 2400W', '817.96', '1635.92', '1635.92', '1.00'),
(157, 114, 601, 'MP-H-036', 'PLANCHA CON CEPILLO OM MP-H-036', '600.60', '1201.20', '1201.20', '1.00'),
(158, 114, 616, 'LMD998', 'DVD PORTATIL 9.8', '1601.60', '3203.20', '3203.20', '1.00'),
(159, 114, 624, 'T61', 'LINTERNA RECARG OM ', '213.36', '426.71', '426.71', '1.00'),
(160, 114, 473, 'X-2670', 'AURICULAR VINCHA M/LIBRES NOGA X-2670', '145.86', '320.89', '320.89', '1.00'),
(161, 114, 603, 'OM-2995', 'PLANCHA DE PELO OM OM-2995', '185.90', '371.80', '371.80', '1.00'),
(162, 114, 604, '7120', 'SECADOR GAMA EOLIC NANO1300W 7120', '461.60', '923.21', '923.21', '1.00'),
(163, 114, 631, 'V33', 'VINCHA ENJOY MUSIC BT V33', '349.21', '698.41', '698.41', '1.00'),
(164, 114, 614, '2226', 'CARGADOR SAMSUNG S8  C/NEGRA T-50 2226', '77.22', '154.44', '154.44', '4.00'),
(165, 114, 612, '25680', 'CABEZAL SAMSUNG TRABEL  25680', '57.20', '114.40', '114.40', '4.00'),
(166, 114, 623, '2712', 'LECTOR DE MEMORIA  7126', '11.44', '40.04', '40.04', '5.00'),
(167, 114, 608, 'K16A-215', 'CABLE USB V8 K16A-215', '14.30', '42.90', '42.90', '3.00'),
(168, 114, 602, '1718013', 'AURICULAR SAMSUNG CAJITA', '42.90', '107.25', '107.25', '20.00'),
(169, 114, 619, 'KJ-AC02', 'RECEPTOR DE MUSICA BLUETOOTH', '86.66', '173.32', '173.32', '5.00'),
(170, 114, 613, '77302', 'CARGADOR PULPO EFFECT', '45.76', '91.52', '91.52', '2.00'),
(171, 114, 630, 'RC-503', 'AURICULAR ROYALCELLBT  RC-503', '225.08', '450.16', '450.16', '2.00'),
(172, 114, 617, '18077', 'CHROMECAST G2 GOOGLR CONVERSOR', '429.00', '858.00', '858.00', '2.00'),
(173, 115, 516, 'KIT', 'KIT RACING 4 GAUGE', '417.00', '688.05', '688.05', '1.00'),
(174, 115, 367, 'CAJA', 'CAJA DOBLE ALFOMBRADO  BOMBER C/ 12 CARBON 250W', '4480.00', '6720.00', '6720.00', '1.00'),
(175, 116, 635, 'GUIRO ', 'GUIRO ABIERTO CHICO CON PEINE ', '250.60', '400.96', '400.96', '1.00'),
(176, 116, 636, 'GUIRO2', 'GUIRO ABIERTO GRANDE CON PEINE', '248.92', '398.27', '398.27', '1.00'),
(177, 116, 634, 'CORREA', 'CORREA PARA REDOBLANTE O REPIQUE', '40.60', '64.96', '64.96', '1.00'),
(178, 116, 639, 'ZURDO', 'ZURDO METALICO PINTADO DE 16" TENSION SIMPLE', '779.24', '1246.78', '1246.78', '1.00'),
(179, 116, 637, 'MAZO ', 'MAZO DE GOMA EVA PARA BOMBO', '182.84', '292.54', '292.54', '1.00'),
(180, 116, 633, 'BOMBO', 'BOMBO METALICO PINTADO 24', '1321.32', '2114.11', '2114.11', '1.00'),
(181, 116, 638, 'REPIQUE', 'REPIQUE METALICO PINTADO 10', '609.84', '975.74', '975.74', '1.00'),
(182, 117, 132, '227', 'Control REmoto Tv Philips Ps266', '60.00', '78.00', '78.00', '1.00'),
(183, 117, NULL, '-', '3CABLE A/V DRECTV', '60.00', '60.00', '60.00', '3.00'),
(184, 117, 537, 'CARGADOR UNIVERSAL P', 'CARGADOR UNIV POWER P/ PC 96W HC-5808', '196.00', '294.00', '294.00', '1.00'),
(185, 117, 602, '1718013', 'AURICULAR SAMSUNG CAJITA', '42.00', '67.20', '67.20', '4.00'),
(186, 117, 600, 'CC003', 'CARGADOR TURBO 2.4 AUTHENTIC 8766', '53.20', '85.12', '85.12', '4.00'),
(187, 118, 333, '7798161081046', 'KIT CABLE BLAULINE K-009', '947.24', '1420.86', '1420.86', '1.00'),
(188, 119, 52, '6942626020335', 'Soporte universal  Cel GPS', '56.00', '72.80', '72.80', '4.00'),
(189, 119, NULL, '-', 'CARGADOR PORTATIL INOVA PC-03', '140.00', '140.00', '140.00', '2.00'),
(190, 119, 600, 'CC003', 'CARGADOR TURBO 2.4 AUTHENTIC 8766', '53.20', '85.12', '85.12', '4.00'),
(191, 119, NULL, '-', 'CABLE TYPE C', '75.00', '75.00', '75.00', '4.00'),
(192, 119, 623, '2712', 'LECTOR DE MEMORIA  7126', '11.20', '22.40', '22.40', '5.00'),
(193, 119, 356, '7798318653065', 'CARGADOR INOVA  CAR-2006 3.1A', '66.30', '86.19', '86.19', '10.00'),
(194, 119, NULL, '-', 'AURICULAR EXTRA BASS ', '220.00', '220.00', '220.00', '3.00'),
(195, 119, 323, 'HBS500', 'AURICULARES BLUETOOTH DEPORTIVO', '206.05', '267.87', '267.87', '2.00'),
(196, 119, 356, '7798318653065', 'CARGADOR INOVA  CAR-2006 3.1A', '66.30', '86.19', '86.19', '5.00'),
(197, 119, 473, 'X-2670', 'AURICULAR VINCHA M/LIBRES NOGA X-2670', '142.80', '228.48', '228.48', '4.00'),
(198, 120, 524, '740617220445', 'PEN DRIVE KINGSTON 8GB DTIG4/8GB', '174.00', '226.20', '226.20', '2.00'),
(199, 120, 441, '619659070632', 'PENDRIVE  CRUZER FIT 16 GB', '221.50', '287.95', '287.95', '1.00'),
(200, 120, 678, '619659000431', 'PEN DRIVE 16GB SANDISK NEGRO', '197.12', '275.97', '275.97', '2.00'),
(201, 120, 677, '740617198270', 'PEN DRIVE 16GB KINGSTON METALICO', '197.12', '275.97', '275.97', '2.00'),
(202, 120, 611, 'ECB-DU4AWD', 'CABLE V8 BLANCO ENROLLADO ECB-DU4AWD', '22.40', '44.80', '44.80', '10.00'),
(203, 121, NULL, '-', 'INSTALACION', '209.00', '209.00', '209.00', '1.00'),
(204, 121, 522, '884938313360', 'ESTEREO PIONEER MVH-85UB', '2352.00', '3292.80', '3292.80', '1.00'),
(205, 122, 272, '7897183020351', 'DRIVER BOMBER  DB200X o omhs 100w 75rms', '387.80', '581.70', '581.70', '2.00'),
(206, 122, 650, 'SOUNDMAGUS', 'POTENCIA SOUNDMAGUS DK1800', '5964.00', '8946.00', '8946.00', '1.00'),
(207, 123, 598, '391', 'CONTROL REMOTO PARA DECO', '32.67', '49.01', '49.01', '1.00'),
(208, 124, 653, 'K-1038E', 'CONTROL REMOTO PARA AIRE K-1038', '98.00', '137.20', '137.20', '5.00'),
(209, 125, 566, 'K-100E', 'CONTROL REMOTO P/AA K-100E', '95.20', '133.28', '133.28', '1.00'),
(210, 126, 560, 'MS-254BT', 'PARLANTE PORTATIL MS-254BT', '409.92', '573.89', '573.89', '1.00'),
(211, 126, 614, '2226', 'CARGADOR SAMSUNG S8  C/NEGRA T-50 2226', '75.60', '120.96', '120.96', '1.00'),
(212, 126, 629, 'MS-268-270', 'PARLANTE BT C/ROJA MS-269', '558.88', '838.32', '838.32', '1.00'),
(213, 127, 702, '141228', 'MINI TECLADO PARA SMART  ILUMINADO KP21SDL-RGB', '387.80', '542.92', '542.92', '1.00'),
(214, 127, 467, '6701', 'PARALANTE PC C/CONTROL - BT  USBF-601', '378.42', '567.63', '567.63', '1.00'),
(215, 127, 628, 'MS-277', 'PARLANTE BT CAJA ROJA FM MS -278-279', '428.96', '643.44', '643.44', '1.00'),
(216, 128, 214, 'CONTR', 'Controlador GBR PRO DJ 100 MK II', '3888.94', '5055.62', '5055.62', '5.00'),
(217, 128, 688, 'PRO18 ', 'PARLANTE PEAVEY PRO18 18"', '2464.00', '3449.60', '3449.60', '7.00'),
(218, 128, 598, '391', 'CONTROL REMOTO PARA DECO', '32.67', '49.01', '49.01', '1.00'),
(219, 129, 627, 'MS-233', 'PARLANTE BT C/ROJA FMMS-234235', '294.84', '442.26', '442.26', '1.00'),
(220, 129, 628, 'MS-277', 'PARLANTE BT CAJA ROJA FM MS -278-279', '428.96', '643.44', '643.44', '1.00'),
(221, 130, 682, 'TV LED', 'TV LED KEN BROWN 32 SMART ', '5460.00', '7644.00', '7644.00', '1.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
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
  UNIQUE KEY `docId` (`docId`,`prvDocumento`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`prvId`, `prvNombre`, `prvApellido`, `prvRazonSocial`, `docId`, `prvDocumento`, `prvDomicilio`, `prvMail`, `prvEstado`, `prvTelefono`) VALUES
(1, 'Sergio', 'Salvatella', 'PINI', 1, '1', 'mendoza', '', 'AC', ''),
(2, 'Jorge ', 'Trodler', 'TROONER', 2, '20045435653', 'Leiva 4710 (1427) Capital Federal', 'pedidos@trooner.com.ar', 'AC', '48542158'),
(3, 'Marcos', 'S.A', 'AUDIOINSUMOS', 2, '30711875669', 'Lucio Mansilla 502', 'ventas@audio-insumos.com.ar', 'AC', '02614321900-4311576'),
(4, 'Cristian Enrique', 'Mercado', 'INGETEC', 2, '20-24662997-9', 'Gral.Pedernera 576 Vª Madero Bs As', 'ventas@ingetec.com.ar', 'AC', '54932137051'),
(5, 'CRISTIAN', 'ARMELLINI', 'CRISTIAN ARMELLINI', 2, '1', '1', '1', 'AC', '1'),
(6, 'Franklin Eduardo', 'Vidal', 'antyca (Mario Rivero)', 2, '20-10870907-8', 'Liniers 830 Bº Cofico Cordoba', '1', 'AC', '3514731322 / 4731307'),
(7, 'DAGHER', 'S.A', 'KOL RAM', 2, '30-63313914-4', 'Luzuriaga 38 Bs.As ', 'Info@kolram.com.ar', 'AC', '011 43063006 fax 4306420'),
(8, 'Nicolas', 'Zartaryan', 'MEGA-IMPORT', 2, '20-27658911-4', 'AV.Santa Fe 2847 PB  "B" Bs As', '1', 'AC', '1'),
(9, '', '', 'ELIT MENDOZA', 2, '30651655516', 'Eusebio Blanco  3696 ', '', 'AC', '26104202678'),
(10, 'RETHYMNOS', 'S.A', '348 IMPORT-EXPORT', 2, '307089559932', 'Pasteur 348 BS AS', '', 'AC', '01149517549'),
(11, 'Carlos Gustavo', 'Gonzales', 'CG AUTOPARTES', 2, '23-14696455-9', 'Aberastain 1093 sur  SAN JUAN', 'autopartesg@hotmail.com', 'AC', '0264-4226322'),
(12, 'Santiago', 'SIMONINI', 'MARIMOM ELECTRONICA', 2, '23-23146549-9', 'AV.Hipolito Yrigoyen  9257 LOmas de Zamora', '', 'AC', ''),
(13, 'Leonardo Antonio', 'Lopez', 'ELECTROMEMO (MERC.LIBRE)', 2, '20-29205584-7', 'Av.Rivadavia 5512 2 piso local 56', '', 'AC', '011-44317025'),
(14, '.', '.', 'ELECTRONICA SAN JUAN  S.R.L', 2, '.', 'Av. COrdoba 402 E ', 'elec_sj@infovia.com.ar', 'AC', '4274012'),
(15, '.', '.', 'SOMECO ELECTRONICS', 2, '30-70217915-3', 'Pte. Saenz Peña 788 piso 9', '.', 'AC', '011-46553333'),
(16, 'Maretec', 's.r.l', 'SEG', 2, '30707551611', 'AV . Bartolome  Mitre 1416 florida Oeste ', '', 'AC', '01147617661'),
(17, 'ALI BABA', '', 'ALI BABA', 1, '28888888', '11', '', 'AC', ''),
(18, 'MARCELO GUSTAVO', 'CAMPOS', 'ALEYMAR', 2, '20-22812837-7', '', '', 'AC', ''),
(19, 'JORGE C', 'CANALES ARTEGAS', 'IMPOTECNO', 2, '20957035346', 'SARMIENTO 2872 BS AS', '', 'AC', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptions`
--

CREATE TABLE IF NOT EXISTS `receptions` (
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
  KEY `tcId` (`tcId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `receptions`
--

INSERT INTO `receptions` (`recId`, `recFecha`, `recEstado`, `prvId`, `recObservacion`, `tcId`, `tcNumero`, `tcImporte`) VALUES
(4, '2018-02-28 00:00:00', 'CF', 1, '', 4, '1', '0.00'),
(5, '2018-02-23 00:00:00', 'CF', 2, '', 1, '0003-0008195', '1679.93'),
(6, '2018-03-06 00:00:00', 'DS', 3, 'p', 1, '0003-0000121', '27725.02'),
(7, '2018-03-06 00:00:00', 'AC', 3, 'DEBO AL 11/03', 1, '000300001210', '27725.02'),
(8, '2018-03-05 00:00:00', 'AC', 4, 'falta factura A', 4, '0011-0000001', '23100.00'),
(9, '2018-03-13 00:00:00', 'AC', 5, ' A PAGAR DENTRO DE 15 DIAS A PARTIR DE LA FECHA', 4, '1', '75.00'),
(10, '2018-03-06 00:00:00', 'AC', 6, 'la factura se aduada al 14/03/18', 1, '0004-0000327', '17242.35'),
(11, '2018-03-07 00:00:00', 'AC', 7, 'Pago de contado', 4, '9999-0000354', '33996.68'),
(12, '2018-03-14 00:00:00', 'DS', 8, 'Pagado', 1, '0004-0000005', '17999.96'),
(13, '2018-03-12 00:00:00', 'AC', 9, '', 4, '0013-0011172', '13066.05'),
(14, '2018-03-12 00:00:00', 'AC', 9, 'adeuda  remito hasta el dia 14/03', 4, '0013-0011172', '13066.05'),
(15, '2018-03-12 00:00:00', 'DS', 3, 'Pagado', 1, '0003-0000130', '10053.97'),
(16, '2018-03-12 00:00:00', 'DS', 3, 'Pagado', 1, '0003-0000130', '10053.97'),
(17, '2018-03-13 00:00:00', 'AC', 3, 'se debe hasta el 14/03', 1, '0003-0000131', '10671.88'),
(18, '2018-03-12 00:00:00', 'AC', 3, '', 1, '0003-0000130', '9485.49'),
(19, '2018-03-13 00:00:00', 'AC', 7, '10.5 % (IVA) PAGADO', 4, '000800002429', '16465.68'),
(20, '2018-03-13 00:00:00', 'AC', 10, '359551075932466 359551076134476 359551076138931 359551075936921 359551076103745359551075901735 359551075925890 359551076127900', 1, '0003-0000101', '1800.00'),
(21, '2018-03-13 00:00:00', 'AC', 10, 'PAGADO', 4, '0000-0000000', '2492.00'),
(22, '2018-03-14 00:00:00', 'DS', 11, '', 1, '0002-0000130', '2435.42'),
(23, '2018-03-14 00:00:00', 'AC', 3, '', 1, '0002-0000130', '2435.42'),
(24, '2018-03-14 00:00:00', 'AC', 11, '', 4, '00016301', '1677.46'),
(25, '2018-03-27 00:00:00', 'AC', 2, 'se adeuda al dia de la fecha 27/03/2018', 1, '0003-0000825', '9695.75'),
(26, '2018-03-27 00:00:00', 'DS', 3, '', 4, '0212-0002930', '11418.36'),
(27, '2018-03-27 00:00:00', 'AC', 3, 'total $11418.36 NOTA DE CREDITO -$745.60', 4, '0212-0002930', '10672.76'),
(28, '2018-03-27 00:00:00', 'AC', 3, '', 4, '0212-0002930', '346.86'),
(29, '2018-04-10 00:00:00', 'AC', 13, 'cancelado x mercado pago', 1, '0002-0000440', '2200.01'),
(30, '2018-04-10 00:00:00', 'AC', 14, '', 4, '01', '1528.00'),
(31, '2018-04-10 00:00:00', 'AC', 15, 'falta cargar a la lista parlante b52 6 " cantidad 10 ', 1, '0016-0003250', '45748.60'),
(32, '2018-04-10 00:00:00', 'AC', 16, '', 1, '0002-0002890', '29397.59'),
(33, '2018-05-11 00:00:00', 'DS', 3, '', 1, '0003-0000212', '18945.24'),
(34, '2018-06-29 00:00:00', 'AC', 18, '', 4, 'X', '22855.41'),
(35, '2018-07-05 00:00:00', 'AC', 19, 'PAGADO', 4, 'OC0212', '63397.61'),
(36, '2018-07-05 00:00:00', 'AC', 19, 'ADJ.RCEPCION ANTERIOR $63397.61', 4, '', '0.00'),
(37, '2018-07-06 00:00:00', 'AC', 3, '', 4, '0212-0003087', '24403.90');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptionsdetail`
--

CREATE TABLE IF NOT EXISTS `receptionsdetail` (
  `recdId` int(11) NOT NULL AUTO_INCREMENT,
  `recId` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `recdCant` int(11) NOT NULL,
  PRIMARY KEY (`recdId`),
  KEY `recId` (`recId`) USING BTREE,
  KEY `artId` (`artId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=207 ;

--
-- Volcado de datos para la tabla `receptionsdetail`
--

INSERT INTO `receptionsdetail` (`recdId`, `recId`, `artId`, `recdCant`) VALUES
(1, 4, 1, 12),
(2, 4, 3, 20),
(3, 5, 143, 10),
(4, 5, 142, 10),
(5, 6, 169, 10),
(6, 6, 168, 10),
(7, 6, 162, 10),
(8, 7, 171, 2),
(9, 7, 170, 20),
(10, 7, 174, 2),
(11, 7, 173, 1),
(12, 7, 175, 2),
(13, 7, 176, 2),
(14, 7, 165, 1),
(15, 7, 166, 1),
(16, 7, 167, 1),
(17, 7, 164, 4),
(18, 7, 172, 1),
(19, 7, 163, 4),
(20, 7, 169, 10),
(21, 7, 168, 10),
(22, 7, 162, 10),
(23, 8, 186, 4),
(24, 8, 185, 5),
(25, 9, 204, 10),
(26, 10, 212, 2),
(27, 10, 213, 10),
(28, 10, 211, 10),
(29, 11, 216, 6),
(30, 11, 215, 2),
(31, 11, 214, 1),
(32, 12, 217, 50),
(33, 12, 22, 50),
(34, 13, 218, 5),
(35, 14, 219, 5),
(36, 14, 218, 5),
(37, 15, 224, 10),
(38, 15, 221, 10),
(39, 15, 223, 10),
(40, 15, 222, 5),
(41, 16, 227, 4),
(42, 16, 228, 4),
(43, 16, 226, 1),
(44, 16, 225, 20),
(45, 16, 224, 10),
(46, 16, 221, 10),
(47, 16, 223, 10),
(48, 16, 222, 5),
(49, 17, 229, 4),
(50, 18, 227, 4),
(51, 18, 228, 4),
(52, 18, 226, 1),
(53, 18, 225, 20),
(54, 18, 224, 10),
(55, 18, 221, 10),
(56, 18, 223, 10),
(57, 18, 222, 5),
(58, 19, 231, 6),
(59, 19, 230, 6),
(60, 20, 233, 1),
(61, 20, 232, 3),
(62, 21, 236, 8),
(63, 21, 235, 4),
(64, 21, 234, 8),
(65, 22, 240, 5),
(66, 22, 238, 5),
(67, 23, 245, 3),
(68, 23, 244, 3),
(69, 23, 243, 2),
(70, 23, 241, 2),
(71, 23, 239, 2),
(72, 23, 240, 5),
(73, 23, 238, 5),
(74, 24, 242, 3),
(75, 24, 243, 2),
(76, 24, 241, 2),
(77, 24, 239, 2),
(78, 24, 240, 5),
(79, 24, 240, 5),
(80, 25, 250, 10),
(81, 25, 251, 10),
(82, 25, 249, 30),
(83, 25, 254, 10),
(84, 25, 253, 10),
(85, 25, 252, 5),
(86, 25, 255, 2),
(87, 25, 248, 10),
(88, 25, 246, 20),
(89, 25, 246, 50),
(90, 25, 258, 3),
(91, 25, 257, 3),
(92, 25, 116, 10),
(93, 25, 107, 20),
(94, 25, 60, 20),
(95, 25, 84, 5),
(96, 25, 84, 10),
(97, 25, 256, 10),
(98, 25, 79, 5),
(99, 25, 97, 10),
(100, 26, 271, 2),
(101, 26, 269, 2),
(102, 26, 268, 2),
(103, 26, 267, 2),
(104, 26, 266, 6),
(105, 26, 265, 6),
(106, 26, 264, 2),
(107, 26, 263, 2),
(108, 26, 262, 2),
(109, 26, 272, 20),
(110, 26, 261, 4),
(111, 27, 271, 2),
(112, 27, 269, 2),
(113, 27, 268, 2),
(114, 27, 266, 6),
(115, 27, 264, 2),
(116, 27, 263, 2),
(117, 27, 262, 2),
(118, 27, 261, 4),
(119, 27, 272, 20),
(120, 28, 279, 6),
(121, 29, 281, 20),
(122, 30, 285, 1),
(123, 30, 284, 2),
(124, 30, 283, 4),
(125, 31, 288, 2),
(126, 31, 290, 2),
(127, 31, 286, 5),
(128, 31, 287, 8),
(129, 32, 292, 5),
(130, 32, 291, 10),
(131, 33, 344, 1),
(132, 33, 343, 2),
(133, 33, 342, 6),
(134, 33, 341, 6),
(135, 33, 340, 10),
(136, 33, 338, 2),
(137, 33, 192, 2),
(138, 33, 337, 2),
(139, 33, 336, 5),
(140, 33, 335, 4),
(141, 34, 594, 5),
(142, 34, 593, 5),
(143, 34, 592, 1),
(144, 34, 591, 2),
(145, 34, 590, 2),
(146, 34, 589, 5),
(147, 34, 588, 10),
(148, 34, 587, 10),
(149, 34, 586, 10),
(150, 34, 585, 2),
(151, 34, 584, 2),
(152, 34, 583, 2),
(153, 34, 582, 2),
(154, 34, 581, 2),
(155, 34, 580, 2),
(156, 34, 579, 2),
(157, 34, 578, 2),
(158, 34, 577, 2),
(159, 34, 576, 2),
(160, 34, 575, 2),
(161, 34, 574, 2),
(162, 34, 573, 1),
(163, 34, 572, 2),
(164, 34, 571, 5),
(165, 34, 570, 10),
(166, 35, 473, 20),
(167, 35, 631, 2),
(168, 35, 630, 4),
(169, 35, 629, 10),
(170, 35, 628, 10),
(171, 35, 627, 10),
(172, 35, 626, 4),
(173, 35, 625, 30),
(174, 35, 624, 10),
(175, 35, 623, 50),
(176, 35, 622, 10),
(177, 35, 621, 2),
(178, 35, 620, 20),
(179, 35, 619, 10),
(180, 35, 617, 5),
(181, 35, 616, 2),
(182, 35, 615, 20),
(183, 35, 614, 10),
(184, 35, 613, 5),
(185, 35, 612, 20),
(186, 35, 611, 50),
(187, 35, 610, 45),
(188, 35, 609, 5),
(189, 35, 608, 5),
(190, 35, 607, 50),
(191, 35, 606, 20),
(192, 35, 605, 4),
(193, 35, 604, 4),
(194, 35, 603, 2),
(195, 35, 602, 50),
(196, 35, 601, 4),
(197, 35, 600, 50),
(198, 36, 618, 50),
(199, 37, 647, 10),
(200, 37, 646, 20),
(201, 37, 645, 10),
(202, 37, 644, 2),
(203, 37, 643, 2),
(204, 37, 642, 2),
(205, 37, 641, 30),
(206, 37, 640, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibos`
--

CREATE TABLE IF NOT EXISTS `recibos` (
  `rcbId` int(11) NOT NULL AUTO_INCREMENT,
  `oId` int(11) NOT NULL,
  `medId` int(11) NOT NULL,
  `rcbImporte` decimal(14,2) NOT NULL,
  `rcbEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `rcbFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cajaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rcbId`),
  KEY `medId` (`medId`) USING BTREE,
  KEY `oId` (`oId`) USING BTREE,
  KEY `cajaId` (`cajaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Volcado de datos para la tabla `recibos`
--

INSERT INTO `recibos` (`rcbId`, `oId`, `medId`, `rcbImporte`, `rcbEstado`, `rcbFecha`, `cajaId`) VALUES
(1, 54, 1, '834.72', 'AC', '2018-06-05 19:15:22', NULL),
(2, 55, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(3, 57, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(4, 58, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(5, 59, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(6, 60, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(7, 61, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(8, 62, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(9, 63, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(10, 64, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(11, 65, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(12, 66, 1, '201.60', 'AC', '2018-06-05 19:15:22', NULL),
(13, 68, 1, '202.50', 'AC', '2018-06-05 19:15:22', NULL),
(14, 69, 1, '100.00', 'AC', '2018-06-05 19:15:22', NULL),
(15, 69, 2, '400.00', 'AC', '2018-06-05 19:15:22', NULL),
(16, 69, 3, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(17, 69, 4, '312.50', 'AC', '2018-06-05 19:15:22', NULL),
(18, 69, 1, '100.00', 'AC', '2018-06-05 19:15:22', NULL),
(19, 69, 2, '400.00', 'AC', '2018-06-05 19:15:22', NULL),
(20, 69, 3, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(21, 69, 4, '312.50', 'AC', '2018-06-05 19:15:22', NULL),
(22, 69, 1, '100.00', 'AC', '2018-06-05 19:15:22', NULL),
(23, 69, 2, '400.00', 'AC', '2018-06-05 19:15:22', NULL),
(24, 69, 3, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(25, 69, 4, '312.50', 'AC', '2018-06-05 19:15:22', NULL),
(26, 69, 1, '100.00', 'AC', '2018-06-05 19:15:22', NULL),
(27, 69, 2, '400.00', 'AC', '2018-06-05 19:15:22', NULL),
(28, 69, 3, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(29, 69, 4, '312.50', 'AC', '2018-06-05 19:15:22', NULL),
(30, 69, 1, '100.00', 'AC', '2018-06-05 19:15:22', NULL),
(31, 69, 2, '400.00', 'AC', '2018-06-05 19:15:22', NULL),
(32, 69, 3, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(33, 69, 4, '312.50', 'AC', '2018-06-05 19:15:22', NULL),
(34, 70, 1, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(35, 71, 5, '200.00', 'AC', '2018-06-05 19:15:22', NULL),
(36, 72, 7, '60.00', 'AC', '2018-06-05 19:15:22', NULL),
(37, 73, 7, '202.50', 'AC', '2018-06-05 19:15:22', NULL),
(38, 74, 1, '834.72', 'AC', '2018-06-05 19:15:22', NULL),
(39, 75, 1, '834.72', 'AC', '2018-06-05 19:15:22', NULL),
(40, 76, 1, '1161.40', 'AC', '2018-06-05 19:15:22', NULL),
(41, 77, 1, '1920.00', 'AC', '2018-06-05 19:15:22', NULL),
(42, 78, 1, '1161.40', 'AC', '2018-06-05 19:15:22', NULL),
(43, 79, 1, '834.72', 'AC', '2018-06-05 19:15:22', NULL),
(44, 81, 1, '290.00', 'AC', '2018-06-05 19:15:22', NULL),
(45, 82, 1, '1920.00', 'AC', '2018-06-05 19:15:22', NULL),
(46, 83, 1, '1920.00', 'AC', '2018-06-05 19:15:22', NULL),
(47, 85, 1, '779.07', 'AC', '2018-06-05 19:15:22', NULL),
(48, 86, 7, '153.84', 'AC', '2018-06-05 19:15:22', NULL),
(49, 86, 7, '153.84', 'AC', '2018-06-05 19:15:22', NULL),
(50, 87, 1, '199.99', 'AC', '2018-06-05 19:15:22', NULL),
(51, 88, 1, '50.00', 'AC', '2018-06-05 19:15:22', NULL),
(52, 89, 1, '20.22', 'AC', '2018-06-05 19:15:22', NULL),
(53, 90, 1, '40.00', 'AC', '2018-06-05 19:15:22', NULL),
(54, 91, 1, '20.10', 'AC', '2018-06-05 19:15:22', NULL),
(55, 92, 1, '220.00', 'AC', '2018-06-05 19:15:22', NULL),
(56, 93, 1, '5962.36', 'AC', '2018-06-05 19:15:22', NULL),
(57, 93, 1, '5962.36', 'AC', '2018-06-05 19:15:22', NULL),
(58, 94, 1, '500.00', 'AC', '2018-06-05 19:15:22', NULL),
(59, 94, 1, '500.00', 'AC', '2018-06-05 19:15:22', NULL),
(60, 95, 1, '22950.40', 'AC', '2018-06-05 19:15:22', NULL),
(61, 96, 1, '573.76', 'AC', '2018-06-05 19:15:22', NULL),
(62, 97, 7, '28688.00', 'AC', '2018-06-05 19:15:22', NULL),
(63, 98, 7, '11475.20', 'AC', '2018-06-05 19:15:22', NULL),
(64, 99, 7, '2868.80', 'AC', '2018-06-05 19:15:22', NULL),
(65, 94, 1, '2000.00', 'AC', '2018-06-05 19:17:53', 5),
(66, 94, 1, '543.08', 'AC', '2018-06-05 19:18:08', 5),
(67, 100, 1, '1000.00', 'AC', '2018-06-15 13:03:41', 8),
(68, 106, 1, '14182.16', 'AC', '2018-06-25 22:50:17', 11),
(69, 108, 1, '1173.76', 'AC', '2018-06-29 22:55:49', 11),
(70, 108, 1, '1173.76', 'AC', '2018-06-29 22:55:49', 11),
(71, 109, 1, '49.50', 'AC', '2018-07-05 12:51:16', 13),
(72, 111, 1, '2700.00', 'AC', '2018-07-07 00:54:32', 14),
(73, 111, 7, '1203.90', 'AC', '2018-07-07 00:54:32', 14),
(74, 112, 7, '2868.58', 'AC', '2018-07-07 01:00:36', 14),
(75, 118, 7, '1420.86', 'AC', '2018-07-19 15:16:31', 14),
(76, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:04', 14),
(77, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(78, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(79, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(80, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(81, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(82, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(83, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(84, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(85, 119, 7, '4726.19', 'AC', '2018-07-20 16:20:05', 14),
(86, 120, 7, '2292.23', 'AC', '2018-07-20 16:26:46', 14),
(87, 120, 7, '2292.23', 'AC', '2018-07-20 16:26:46', 14),
(88, 120, 7, '2292.23', 'AC', '2018-07-20 16:26:46', 14),
(89, 120, 7, '2292.23', 'AC', '2018-07-20 16:26:46', 14),
(90, 120, 7, '2292.23', 'AC', '2018-07-20 16:26:46', 14),
(91, 121, 1, '3501.80', 'AC', '2018-07-20 23:02:12', 14),
(92, 121, 1, '3501.80', 'AC', '2018-07-20 23:02:12', 14),
(93, 122, 7, '10109.40', 'AC', '2018-07-21 20:54:40', 14),
(94, 122, 7, '10109.40', 'AC', '2018-07-21 20:54:40', 14),
(95, 123, 7, '49.01', 'AC', '2018-07-23 02:23:06', 14),
(96, 124, 1, '186.00', 'AC', '2018-07-23 02:25:55', 14),
(97, 124, 7, '500.00', 'AC', '2018-07-23 02:25:55', 14),
(98, 125, 7, '133.28', 'AC', '2018-07-23 02:28:05', 14),
(99, 126, 7, '1533.17', 'AC', '2018-07-23 13:32:06', 14),
(100, 126, 7, '1533.17', 'AC', '2018-07-23 13:32:06', 14),
(101, 126, 7, '1533.17', 'AC', '2018-07-23 13:32:06', 14),
(102, 127, 7, '1753.99', 'AC', '2018-07-23 13:38:19', 14),
(103, 127, 7, '1753.99', 'AC', '2018-07-23 13:38:19', 14),
(104, 127, 7, '1753.99', 'AC', '2018-07-23 13:38:19', 14),
(105, 128, 7, '49474.31', 'AC', '2018-07-23 13:50:35', 14),
(106, 129, 7, '1085.70', 'AC', '2018-07-23 13:52:58', 14),
(107, 130, 1, '3000.00', 'AC', '2018-07-23 15:24:32', 14),
(108, 130, 7, '4000.00', 'AC', '2018-07-23 15:24:32', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiros`
--

CREATE TABLE IF NOT EXISTS `retiros` (
  `retId` int(11) NOT NULL AUTO_INCREMENT,
  `retFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usrId` int(11) NOT NULL,
  `retImporte` decimal(10,2) NOT NULL,
  `retDescripcion` varchar(100) DEFAULT NULL,
  `cajaId` int(11) NOT NULL,
  PRIMARY KEY (`retId`),
  KEY `usrId` (`usrId`),
  KEY `cajaId` (`cajaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `retiros`
--

INSERT INTO `retiros` (`retId`, `retFecha`, `usrId`, `retImporte`, `retDescripcion`, `cajaId`) VALUES
(1, '2018-06-01 17:55:19', 4, '50.00', 'semitas', 4),
(2, '2018-06-01 23:02:19', 4, '100.00', 'Agua para negocio 2', 5),
(3, '2018-06-01 23:02:32', 4, '30.00', 'Semitas', 5),
(4, '2018-06-01 23:05:19', 4, '80.00', 'par la coca', 5),
(5, '2018-06-05 19:24:58', 4, '200.00', 'ok', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE IF NOT EXISTS `rubros` (
  `rubId` int(11) NOT NULL AUTO_INCREMENT,
  `rubDescripcion` varchar(30) NOT NULL,
  `rubEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`rubId`),
  UNIQUE KEY `rubDescripcion` (`rubDescripcion`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`rubId`, `rubDescripcion`, `rubEstado`) VALUES
(1, 'Audio', 'AC'),
(2, 'ACCESORIOS', 'AC'),
(4, 'MICROFONOS', 'AC'),
(7, 'BATERIAS ', 'AC'),
(8, 'Radio', 'AC'),
(9, 'LUCES LED', 'AC'),
(10, 'FOCOS', 'AC'),
(11, 'ALARMAS', 'AC'),
(12, 'CELULARES', 'AC'),
(13, 'AUDIO PRO', 'AC'),
(14, 'MOTORES', 'AC'),
(15, 'AURICULARES', 'AC'),
(16, 'INSTRUMENTOS', 'AC'),
(17, 'BELLEZA', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisactions`
--

CREATE TABLE IF NOT EXISTS `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `sisactions`
--

INSERT INTO `sisactions` (`actId`, `actDescription`, `actDescriptionSpanish`) VALUES
(1, 'Add', 'Agregar'),
(2, 'Edit', 'Editar'),
(3, 'Del', 'Eliminar'),
(4, 'View', 'Consultar'),
(5, 'Imprimir', 'Imprimir'),
(6, 'Saldo', 'Consultar Saldo'),
(7, 'Close', 'Cerrar'),
(8, 'Box', 'Caja'),
(9, 'Conf', 'Confirmar'),
(10, 'Disc', 'Descartar'),
(11, 'Budget', 'Presupuesto'),
(12, 'Cob', 'Cobrar'),
(13, 'Anu', 'Anular'),
(14, 'AyC', 'Ap. y Cier. de Caja'),
(15, 'Ent', 'Entregar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroups`
--

CREATE TABLE IF NOT EXISTS `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `sisgroups`
--

INSERT INTO `sisgroups` (`grpId`, `grpName`) VALUES
(5, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroupsactions`
--

CREATE TABLE IF NOT EXISTS `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`) USING BTREE,
  KEY `menuAccId` (`menuAccId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1102 ;

--
-- Volcado de datos para la tabla `sisgroupsactions`
--

INSERT INTO `sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES
(1034, 5, 1),
(1035, 5, 2),
(1036, 5, 3),
(1037, 5, 4),
(1038, 5, 5),
(1039, 5, 6),
(1040, 5, 7),
(1041, 5, 8),
(1042, 5, 48),
(1043, 5, 49),
(1044, 5, 50),
(1045, 5, 51),
(1046, 5, 59),
(1047, 5, 9),
(1048, 5, 10),
(1049, 5, 11),
(1050, 5, 12),
(1051, 5, 21),
(1052, 5, 22),
(1053, 5, 23),
(1054, 5, 24),
(1055, 5, 25),
(1056, 5, 26),
(1057, 5, 28),
(1058, 5, 33),
(1059, 5, 34),
(1060, 5, 35),
(1061, 5, 36),
(1062, 5, 37),
(1063, 5, 38),
(1064, 5, 39),
(1065, 5, 40),
(1066, 5, 41),
(1067, 5, 42),
(1068, 5, 43),
(1069, 5, 44),
(1070, 5, 45),
(1071, 5, 46),
(1072, 5, 47),
(1073, 5, 64),
(1074, 5, 65),
(1075, 5, 66),
(1076, 5, 67),
(1077, 5, 82),
(1078, 5, 83),
(1079, 5, 84),
(1080, 5, 85),
(1081, 5, 63),
(1082, 5, 68),
(1083, 5, 69),
(1084, 5, 70),
(1085, 5, 71),
(1086, 5, 72),
(1087, 5, 73),
(1088, 5, 74),
(1089, 5, 75),
(1090, 5, 76),
(1091, 5, 77),
(1092, 5, 78),
(1093, 5, 79),
(1094, 5, 80),
(1095, 5, 81),
(1096, 5, 91),
(1097, 5, 86),
(1098, 5, 87),
(1099, 5, 88),
(1100, 5, 89),
(1101, 5, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenu`
--

CREATE TABLE IF NOT EXISTS `sismenu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuIcon` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuController` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuView` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `menuFather` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `menuFather` (`menuFather`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `sismenu`
--

INSERT INTO `sismenu` (`menuId`, `menuName`, `menuIcon`, `menuController`, `menuView`, `menuFather`) VALUES
(9, 'Seguridad', 'fa fa-key', '', '', NULL),
(10, 'Usuarios', '', 'user', 'index', 9),
(11, 'Grupos', '', 'group', 'index', 9),
(12, 'Administración', 'fa fa-fw fa-cogs', '', '', NULL),
(13, 'Artículos', 'fa fa-cart-plus', 'article', 'index', NULL),
(16, 'Proveedores', 'fa fa-truck', 'provider', 'index', NULL),
(17, 'Cajas', 'fa fa-money', 'box', 'index', NULL),
(19, 'Recepción', 'fa fa-fw fa-archive', 'reception', 'index', NULL),
(20, 'Stock', 'fa fa-fw fa-industry', 'stock', 'index', NULL),
(21, 'Configuración', 'fa fa-fw fa-cogs', '', '', NULL),
(22, 'Rubros', '', 'rubro', 'index', 21),
(23, 'Subrubros', '', 'rubro', 'indexSR', 21),
(24, 'Lista_de_Precios', '', 'lista', 'index', 12),
(27, 'Actualización_de_Precios', '', 'rubro', 'upgrate', 12),
(31, 'Cotización_Dolar', 'fa fa-fw fa-dollar', 'configuration', 'getCotizacion', NULL),
(32, 'Marcas', '', 'brand', 'index', 21),
(33, 'Cuenta_Corriente', 'fa fa-fw fa-line-chart', ' ', ' ', NULL),
(34, 'Cta_Cte_Proveedores', '', 'cuentacorriente', 'indexp', 33),
(35, 'Cta_Cte_Clientes', '', 'cuentacorriente', 'indexc', 33),
(36, 'Ventas_Minoristas', 'fa fa-fw fa-info', 'sale', 'listado_minorista', NULL),
(37, 'Ventas_Mayoristas', 'fa fa-fw fa-info', 'sale', 'listado_mayorista', NULL),
(38, 'Vendedores', '', 'vendedor', 'index', 21),
(39, 'Faltantes', 'fa fa-fw fa-bell', 'article', 'faltante', NULL),
(40, 'Ventas_Reservas', 'fa fa-fw fa-info', 'sale', 'listado_reserva', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenuactions`
--

CREATE TABLE IF NOT EXISTS `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`),
  KEY `menuId` (`menuId`) USING BTREE,
  KEY `actId` (`actId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=92 ;

--
-- Volcado de datos para la tabla `sismenuactions`
--

INSERT INTO `sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES
(1, 10, 1),
(2, 10, 2),
(3, 10, 3),
(4, 10, 4),
(5, 11, 1),
(6, 11, 2),
(7, 11, 3),
(8, 11, 4),
(9, 13, 1),
(10, 13, 2),
(11, 13, 3),
(12, 13, 4),
(21, 16, 1),
(22, 16, 2),
(23, 16, 3),
(24, 16, 4),
(25, 17, 1),
(26, 17, 7),
(28, 17, 4),
(33, 19, 1),
(34, 19, 9),
(35, 19, 10),
(36, 19, 4),
(37, 20, 1),
(38, 20, 4),
(39, 20, 5),
(40, 22, 1),
(41, 22, 2),
(42, 22, 3),
(43, 22, 4),
(44, 23, 1),
(45, 23, 2),
(46, 23, 3),
(47, 23, 4),
(48, 24, 1),
(49, 24, 2),
(50, 24, 3),
(51, 24, 4),
(59, 27, 2),
(63, 31, 2),
(64, 32, 1),
(65, 32, 2),
(66, 32, 3),
(67, 32, 4),
(68, 34, 1),
(69, 34, 4),
(70, 35, 1),
(71, 35, 4),
(72, 36, 1),
(73, 36, 2),
(74, 36, 3),
(75, 36, 4),
(76, 36, 5),
(77, 37, 1),
(78, 37, 2),
(79, 37, 3),
(80, 37, 4),
(81, 37, 5),
(82, 38, 1),
(83, 38, 2),
(84, 38, 3),
(85, 38, 4),
(86, 40, 1),
(87, 40, 2),
(88, 40, 3),
(89, 40, 4),
(90, 40, 5),
(91, 39, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisusers`
--

CREATE TABLE IF NOT EXISTS `sisusers` (
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
  KEY `grpId` (`grpId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `sisusers`
--

INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrLastAcces`, `usrToken`, `usrEsAdmin`) VALUES
(4, 'adolfo', 'Adolfo', 'Fernandez', 1, 'e10adc3949ba59abbe56e057f20f883e', 5, '2018-07-24 19:19:04', '8bsFNkfcrfOhXvGP3MGOulAejREkF1EFtWfBYAi9L0NrDWBn4IYNW7qyHPgXyWPTcM9QhqooTYE827A3ycp6rAJzWvi1tH1mxeuzZ8ydG9UJ5bLCLKeF4hDZMsX5goEAR8zAcamBmJWNQux0PGpnVzxPNWXdCgS2TzT7TAgXu3XdldKGdnwouXbLeA8o8G3yzCK906tmuqGLIO20k41PSsYsCC1NFNks6IHGFjbZJaVkUVArZKKropFoVrzS5BR', b'0'),
(9, 'delfi', 'Delfina', 'Fernandez', 1, 'e10adc3949ba59abbe56e057f20f883e', 5, '2018-07-18 18:58:10', '9nPsQ89fY9hjF6soF9XcSoBICjPqxf9UmWHmc6UYQPP6gKeBdE3L9hHIOAF5Z7nzEuJhIEK8lhzZ1w0ID6CFrPTkwNmREORV9sgfyU1vUJzrJIofZVXVZHqkXYiJT8lO7mjfr63tj9GqwCHtcF72hfedn3YfR5brwyeoby53CtdRXnxFA4rufFqsw4CVrFgyl2R1cvjnmD1vgLpqSZsOqZ6lvYhWbzZSFXQsVemCXWR6AsZsfxuq2qpHmqtRcog', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `artId` int(11) NOT NULL,
  `stkCant` decimal(10,2) NOT NULL,
  `refId` int(11) DEFAULT NULL,
  `stkOrigen` varchar(2) NOT NULL DEFAULT 'RC',
  `stkFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stkId`),
  KEY `artId` (`artId`) USING BTREE,
  KEY `recId` (`refId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`stkId`, `artId`, `stkCant`, `refId`, `stkOrigen`, `stkFecha`) VALUES
(6, 289, '-1.00', 54, 'VN', '2018-05-04 00:09:19'),
(7, 285, '-1.00', 55, 'VN', '2018-05-04 00:10:56'),
(8, 285, '-1.00', 57, 'VN', '2018-05-04 00:11:46'),
(9, 285, '-1.00', 58, 'VN', '2018-05-04 00:11:47'),
(10, 285, '-1.00', 59, 'VN', '2018-05-04 00:11:49'),
(11, 285, '-1.00', 60, 'VN', '2018-05-04 00:11:50'),
(12, 285, '-1.00', 61, 'VN', '2018-05-04 00:11:52'),
(13, 285, '-1.00', 62, 'VN', '2018-05-04 00:11:53'),
(14, 285, '-1.00', 63, 'VN', '2018-05-04 00:11:55'),
(15, 285, '-1.00', 64, 'VN', '2018-05-04 00:11:57'),
(16, 285, '-1.00', 65, 'VN', '2018-05-04 00:11:58'),
(17, 285, '-1.00', 66, 'VN', '2018-05-04 00:12:00'),
(18, 22, '-1.00', 68, 'VN', '2018-05-04 00:23:22'),
(19, 22, '-1.00', 69, 'VN', '2018-05-04 00:29:25'),
(20, 22, '-1.00', 69, 'VN', '2018-05-04 00:29:25'),
(21, 22, '-1.00', 69, 'VN', '2018-05-04 00:29:25'),
(22, 22, '-1.00', 69, 'VN', '2018-05-04 00:29:25'),
(23, 22, '-1.00', 69, 'VN', '2018-05-04 00:29:25'),
(24, 22, '-1.00', 70, 'VN', '2018-05-04 00:31:35'),
(25, 22, '-1.00', 71, 'VN', '2018-05-04 00:36:15'),
(26, 22, '18.00', NULL, 'AJ', '2018-05-04 00:37:58'),
(27, 260, '-1.00', 72, 'VN', '2018-05-04 00:39:48'),
(28, 22, '-1.00', 73, 'VN', '2018-05-04 00:41:32'),
(29, 289, '-1.00', 74, 'VN', '2018-05-04 20:28:25'),
(30, 289, '-1.00', 75, 'VN', '2018-05-04 20:45:56'),
(31, 287, '-1.00', 76, 'VN', '2018-05-04 20:46:34'),
(32, 278, '-1.00', 77, 'VN', '2018-05-04 20:47:00'),
(33, 287, '-1.00', 78, 'VN', '2018-05-04 20:48:59'),
(34, 289, '-1.00', 79, 'VN', '2018-05-04 20:50:41'),
(35, 58, '-1.00', 81, 'VN', '2018-05-04 20:51:14'),
(36, 278, '-1.00', 82, 'VN', '2018-05-07 20:22:36'),
(37, 278, '-1.00', 83, 'VN', '2018-05-08 00:21:49'),
(38, 289, '-1.00', 85, 'VN', '2018-05-08 00:26:52'),
(39, 296, '-2.00', 86, 'VN', '2018-05-08 22:03:11'),
(40, 294, '-5.00', 86, 'VN', '2018-05-08 22:03:11'),
(41, 143, '-1.00', 87, 'VN', '2018-05-14 21:33:40'),
(42, 319, '10.00', NULL, 'AJ', '2018-05-15 22:10:21'),
(43, 321, '10.00', NULL, 'AJ', '2018-05-15 22:13:18'),
(44, 447, '-1.00', 88, 'VN', '2018-06-01 13:39:58'),
(45, 5, '-2.00', 89, 'VN', '2018-06-01 13:52:31'),
(46, 448, '-1.00', 90, 'VN', '2018-06-01 14:19:33'),
(47, 7, '-2.00', 91, 'VN', '2018-06-01 14:27:32'),
(48, 293, '-1.00', 93, 'VN', '2018-06-01 22:31:13'),
(49, 346, '-10.00', 93, 'VN', '2018-06-01 22:31:13'),
(50, 346, '-40.00', 95, 'VN', '2018-06-01 22:35:59'),
(51, 346, '-1.00', 96, 'VN', '2018-06-01 22:39:49'),
(52, 346, '-50.00', 97, 'VN', '2018-06-01 23:25:10'),
(53, 346, '-20.00', 98, 'VN', '2018-06-01 23:28:15'),
(54, 346, '-5.00', 99, 'VN', '2018-06-01 23:33:16'),
(55, 293, '-3.00', 94, 'VN', '2018-06-05 19:18:08'),
(56, 346, '-5.00', 94, 'VN', '2018-06-05 19:18:08'),
(57, 319, '-1.00', 100, 'VN', '2018-06-15 13:03:41'),
(58, 216, '-2.00', 106, 'VN', '2018-06-25 22:50:17'),
(59, 346, '-1.00', 108, 'VN', '2018-06-29 22:55:49'),
(60, 16, '-1.00', 109, 'VN', '2018-07-05 12:51:16'),
(61, 185, '-1.00', 111, 'VN', '2018-07-07 00:54:32'),
(62, 557, '-1.00', 112, 'VN', '2018-07-07 01:00:36'),
(63, 333, '-1.00', 118, 'VN', '2018-07-19 15:16:31'),
(64, 52, '-4.00', 119, 'VN', '2018-07-20 16:20:04'),
(65, 600, '-4.00', 119, 'VN', '2018-07-20 16:20:05'),
(66, 623, '-5.00', 119, 'VN', '2018-07-20 16:20:05'),
(67, 356, '-10.00', 119, 'VN', '2018-07-20 16:20:05'),
(68, 323, '-2.00', 119, 'VN', '2018-07-20 16:20:05'),
(69, 356, '-5.00', 119, 'VN', '2018-07-20 16:20:05'),
(70, 473, '-4.00', 119, 'VN', '2018-07-20 16:20:05'),
(71, 524, '-2.00', 120, 'VN', '2018-07-20 16:26:46'),
(72, 441, '-1.00', 120, 'VN', '2018-07-20 16:26:46'),
(73, 678, '-2.00', 120, 'VN', '2018-07-20 16:26:46'),
(74, 677, '-2.00', 120, 'VN', '2018-07-20 16:26:46'),
(75, 611, '-10.00', 120, 'VN', '2018-07-20 16:26:46'),
(76, 522, '-1.00', 121, 'VN', '2018-07-20 23:02:12'),
(77, 272, '-2.00', 122, 'VN', '2018-07-21 20:54:40'),
(78, 650, '-1.00', 122, 'VN', '2018-07-21 20:54:40'),
(79, 598, '-1.00', 123, 'VN', '2018-07-23 02:23:06'),
(80, 653, '-5.00', 124, 'VN', '2018-07-23 02:25:55'),
(81, 566, '-1.00', 125, 'VN', '2018-07-23 02:28:05'),
(82, 560, '-1.00', 126, 'VN', '2018-07-23 13:32:06'),
(83, 614, '-1.00', 126, 'VN', '2018-07-23 13:32:06'),
(84, 629, '-1.00', 126, 'VN', '2018-07-23 13:32:06'),
(85, 702, '-1.00', 127, 'VN', '2018-07-23 13:38:19'),
(86, 467, '-1.00', 127, 'VN', '2018-07-23 13:38:19'),
(87, 628, '-1.00', 127, 'VN', '2018-07-23 13:38:19'),
(88, 214, '-5.00', 128, 'VN', '2018-07-23 13:50:35'),
(89, 688, '-7.00', 128, 'VN', '2018-07-23 13:50:35'),
(90, 598, '-1.00', 128, 'VN', '2018-07-23 13:50:35'),
(91, 627, '-1.00', 129, 'VN', '2018-07-23 13:52:58'),
(92, 628, '-1.00', 129, 'VN', '2018-07-23 13:52:58'),
(93, 682, '-1.00', 130, 'VN', '2018-07-23 15:24:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stockreserva`
--

CREATE TABLE IF NOT EXISTS `stockreserva` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `artId` int(11) NOT NULL,
  `stkCant` decimal(10,2) NOT NULL,
  `refId` int(11) DEFAULT NULL,
  `stkOrigen` varchar(2) NOT NULL DEFAULT 'RC',
  `stkFecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stkId`),
  KEY `artId` (`artId`) USING BTREE,
  KEY `recId` (`refId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `stockreserva`
--

INSERT INTO `stockreserva` (`stkId`, `artId`, `stkCant`, `refId`, `stkOrigen`, `stkFecha`) VALUES
(1, 293, '1.00', 92, 'VN', '2018-06-01 18:04:17'),
(2, 293, '3.00', 94, 'VN', '2018-06-01 22:32:16'),
(3, 346, '5.00', 94, 'VN', '2018-06-01 22:32:16'),
(4, 293, '-3.00', 94, 'VN', '2018-06-05 19:18:08'),
(5, 346, '-5.00', 94, 'VN', '2018-06-05 19:18:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrubros`
--

CREATE TABLE IF NOT EXISTS `subrubros` (
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
  KEY `subrDescripcion_6` (`subrDescripcion`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Volcado de datos para la tabla `subrubros`
--

INSERT INTO `subrubros` (`subrId`, `subrDescripcion`, `rubId`, `subrEstado`) VALUES
(1, 'Estereos', 1, 'AC'),
(2, 'Parlantes Chicos', 1, 'AC'),
(3, 'TV', 2, 'AC'),
(4, 'CELULARES', 2, 'AC'),
(5, 'Pilas', 2, 'AC'),
(6, 'Telefonia', 2, 'AC'),
(7, 'Computacion', 2, 'AC'),
(8, 'Auto', 2, 'AC'),
(9, 'Audio Cars', 1, 'AC'),
(12, 'Autos', 7, 'AC'),
(13, 'Controles TV', 2, 'AC'),
(14, 'Controles Aire acondicionado', 2, 'AC'),
(15, 'Controles DVD UNIV', 2, 'AC'),
(16, 'Soporte TV/LCD', 2, 'AC'),
(17, 'Estaño', 2, 'AC'),
(18, 'Fuentes Universales', 2, 'AC'),
(19, 'Radio', 2, 'AC'),
(20, 'FOCOS PARTY', 9, 'AC'),
(23, 'sirena', 11, 'AC'),
(24, 'para autos', 11, 'AC'),
(25, 'INALAMBRICOS', 4, 'AC'),
(26, 'VINCHA', 4, 'AC'),
(27, 'LINEA', 4, 'AC'),
(28, 'CORBATERO', 4, 'AC'),
(29, 'MESA', 4, 'AC'),
(30, 'Básicos', 12, 'AC'),
(31, 'CONSOLAS', 13, 'AC'),
(32, 'varios', 2, 'AC'),
(33, 'potencias', 13, 'AC'),
(34, 'P/PORTONES', 14, 'AC'),
(35, 'controles', 14, 'AC'),
(38, 'AURICULARES', 2, 'AC'),
(39, 'LINTERNAS', 2, 'AC'),
(40, 'BALANZAS', 2, 'AC'),
(41, ' BATERIAS GEL 6 V 12 V ', 7, 'AC'),
(42, 'Relojes varios', 2, 'AC'),
(43, 'Cables usb/aux/canon , etc', 2, 'AC'),
(44, 'Luces varias', 2, 'AC'),
(47, 'TABLETS', 2, 'AC'),
(48, 'Audio pro', 13, 'AC'),
(49, 'INSTRUMENTO', 16, 'AC'),
(50, 'BELLEZA', 17, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomediopago`
--

CREATE TABLE IF NOT EXISTS `tipomediopago` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipomediopago`
--

INSERT INTO `tipomediopago` (`tmpId`, `tmpCodigo`, `tmpDescripción`, `tmpEstado`, `tmpDescripcion1`, `tmpDescripcion2`, `tmpDescripcion3`) VALUES
(1, 'EFE', 'Efectivo', 'AC', NULL, NULL, NULL),
(2, 'TJT', 'Tarjeta', 'AC', 'N° Lote', 'N° Autorización', 'Cuotas'),
(3, 'CRE', 'Credito Argentino', 'AC', NULL, NULL, NULL),
(4, 'CCT', 'Cuenta Corriente', 'AC', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

CREATE TABLE IF NOT EXISTS `tipos_documentos` (
  `docId` int(11) NOT NULL AUTO_INCREMENT,
  `docDescripcion` varchar(50) NOT NULL,
  `docTipo` varchar(2) NOT NULL,
  `docEstado` varchar(2) NOT NULL,
  PRIMARY KEY (`docId`),
  UNIQUE KEY `docDescripcion` (`docDescripcion`,`docTipo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`docId`, `docDescripcion`, `docTipo`, `docEstado`) VALUES
(1, 'DNI', 'DP', 'AC'),
(2, 'CUIT', 'DP', 'AC'),
(3, 'LC', 'DP', 'AC'),
(4, 'LE', 'DP', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobante`
--

CREATE TABLE IF NOT EXISTS `tipo_comprobante` (
  `tcId` int(11) NOT NULL AUTO_INCREMENT,
  `tcDescripcion` varchar(25) NOT NULL,
  `tcEstado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`tcId`),
  UNIQUE KEY `tcDescripcion` (`tcDescripcion`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_comprobante`
--

INSERT INTO `tipo_comprobante` (`tcId`, `tcDescripcion`, `tcEstado`) VALUES
(1, 'Factura A', 'AC'),
(2, 'Factura B', 'AC'),
(3, 'Factura C', 'AC'),
(4, 'Remito X', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE IF NOT EXISTS `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  UNIQUE KEY `nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id`, `codigo`, `nombre`, `estado`) VALUES
(1, '100', 'Adolfo', 'AC'),
(2, '002', 'Natalia', 'AC'),
(3, '003', 'Daniel', 'AC');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`ivaId`) REFERENCES `ivaalicuotas` (`ivaId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`subrId`) REFERENCES `subrubros` (`subrId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`marcaId`) REFERENCES `marcaart` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`docId`) REFERENCES `tipos_documentos` (`docId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentacorrientecliente`
--
ALTER TABLE `cuentacorrientecliente`
  ADD CONSTRAINT `cuentacorrientecliente_ibfk_1` FOREIGN KEY (`cliId`) REFERENCES `clientes` (`cliId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentacorrientecliente_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentacorrientecliente_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentacorrienteproveedor`
--
ALTER TABLE `cuentacorrienteproveedor`
  ADD CONSTRAINT `cuentacorrienteproveedor_ibfk_1` FOREIGN KEY (`prvId`) REFERENCES `proveedores` (`prvId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentacorrienteproveedor_ibfk_2` FOREIGN KEY (`usrId`) REFERENCES `sisusers` (`usrId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentacorrienteproveedor_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mediosdepago`
--
ALTER TABLE `mediosdepago`
  ADD CONSTRAINT `mediosdepago_ibfk_1` FOREIGN KEY (`tmpId`) REFERENCES `tipomediopago` (`tmpId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`lpId`) REFERENCES `listadeprecios` (`lpId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`venId`) REFERENCES `vendedores` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`cliId`) REFERENCES `clientes` (`cliId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_4` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  ADD CONSTRAINT `ordendetalle_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ordendetalle_ibfk_3` FOREIGN KEY (`oId`) REFERENCES `orden` (`oId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`docId`) REFERENCES `tipos_documentos` (`docId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `receptions`
--
ALTER TABLE `receptions`
  ADD CONSTRAINT `receptions_ibfk_1` FOREIGN KEY (`prvId`) REFERENCES `proveedores` (`prvId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receptions_ibfk_2` FOREIGN KEY (`tcId`) REFERENCES `tipo_comprobante` (`tcId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `receptionsdetail`
--
ALTER TABLE `receptionsdetail`
  ADD CONSTRAINT `receptionsdetail_ibfk_1` FOREIGN KEY (`recId`) REFERENCES `receptions` (`recId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receptionsdetail_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD CONSTRAINT `recibos_ibfk_1` FOREIGN KEY (`oId`) REFERENCES `orden` (`oId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recibos_ibfk_2` FOREIGN KEY (`medId`) REFERENCES `mediosdepago` (`medId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recibos_ibfk_3` FOREIGN KEY (`cajaId`) REFERENCES `cajas` (`cajaId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  ADD CONSTRAINT `sisgroupsactions_ibfk_1` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sisgroupsactions_ibfk_2` FOREIGN KEY (`menuAccId`) REFERENCES `sismenuactions` (`menuAccId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sismenu`
--
ALTER TABLE `sismenu`
  ADD CONSTRAINT `sismenu_ibfk_1` FOREIGN KEY (`menuFather`) REFERENCES `sismenu` (`menuId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  ADD CONSTRAINT `sismenuactions_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `sismenu` (`menuId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sismenuactions_ibfk_2` FOREIGN KEY (`actId`) REFERENCES `sisactions` (`actId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `sisusers`
--
ALTER TABLE `sisusers`
  ADD CONSTRAINT `sisusers_ibfk_1` FOREIGN KEY (`grpId`) REFERENCES `sisgroups` (`grpId`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`artId`) REFERENCES `articles` (`artId`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subrubros`
--
ALTER TABLE `subrubros`
  ADD CONSTRAINT `subrubros_ibfk_1` FOREIGN KEY (`rubId`) REFERENCES `rubros` (`rubId`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
