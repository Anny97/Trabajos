-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sugus
--

CREATE DATABASE IF NOT EXISTS sugus;
USE sugus;

--
-- Temporary table structure for view `compras_no_normalizadas`
--
DROP TABLE IF EXISTS `compras_no_normalizadas`;
DROP VIEW IF EXISTS `compras_no_normalizadas`;
CREATE TABLE `compras_no_normalizadas` (
  `Cuotas` int(10) unsigned,
  `Nombres` varchar(45),
  `Apellido Paterno` varchar(45),
  `Plan` varchar(45),
  `Marca` varchar(45),
  `modelo` varchar(45)
);

--
-- Definition of table `celular`
--

DROP TABLE IF EXISTS `celular`;
CREATE TABLE `celular` (
  `id_celular` int(10) unsigned NOT NULL auto_increment,
  `modelo` varchar(45) NOT NULL,
  `duracion_bateria` int(10) unsigned NOT NULL,
  `pantalla_size` float NOT NULL,
  `sistema_operativo` varchar(45) NOT NULL,
  `id_marca` int(10) unsigned NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY  (`id_celular`),
  KEY `FK_celular_1` (`id_marca`),
  CONSTRAINT `FK_celular_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `celular`
--

/*!40000 ALTER TABLE `celular` DISABLE KEYS */;
INSERT INTO `celular` (`id_celular`,`modelo`,`duracion_bateria`,`pantalla_size`,`sistema_operativo`,`id_marca`,`precio`) VALUES 
 (1,'Galaxy J7 Pro',12,6,'Android Nougat  7.0',1,300),
 (2,'Mate 10',16,8,'Android Marshmellow 6.0',2,400),
 (3,'Galaxy S8+',24,8.3,'Android Nougat 7.2',1,700),
 (4,'iPhone X',8,7,'iOS',3,1000),
 (5,'iPhone 6',7,6.5,'iOS',3,600),
 (6,'Mate 20 Pro',12,7,'Android Nougat 7.0',2,350),
 (7,'iPhone 3',4,5,'iOS',3,200),
 (8,'Galaxy S9 Plus',9,6.2,'Android Oreo',1,628),
 (9,'iPhone 8 Plus',12,4.5,'iOS 10',3,850),
 (10,'Sony Xperia XZ1',24,5.5,'Android 7.1',5,17.999);
/*!40000 ALTER TABLE `celular` ENABLE KEYS */;


--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(10) unsigned NOT NULL auto_increment,
  `cedula` varchar(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellido_p` varchar(45) NOT NULL,
  `apellido_m` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  PRIMARY KEY  (`id_cliente`),
  UNIQUE KEY `Index_2` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cliente`,`cedula`,`nombres`,`apellido_p`,`apellido_m`,`direccion`,`telefono`) VALUES 
 (1,'1316330446','Genesis Jamileth','Lucas','Delgado','Tosagua, Calle 24 de mayo, Ciudadela Santa Teresita','0982320218'),
 (2,'1314245174','Anny Liceth','Reyes','Sánchez','Calle Santa Marianita Frente al Diario ','0983876896'),
 (3,'1313296673','Cynthia Gissela','Mendoza','Molina','Chone, Ciudadela La Floresta','0999999999'),
 (5,'1313810713','Karla Liliana','Vera','Mero','Portoviejo, Tenis club ','0995867423'),
 (6,'1315121345','Gema Lisbeth','Zambrano ','Meza','Rio Chico, Mejia ','0985612356'),
 (7,'1314245166','Ana Elizabeth','Sánchez','Carreño','Portoviejo, Via Manta ','0984657123'),
 (8,'1313142455','Lucia Margarita','Zambrano ','Ponce','Portoviejo, Av. Metropolitana ','0999667755'),
 (9,'1314122451','Luis Antonio','Bravo','Ponce','Portoviejo, Ciudadela California','0958612347'),
 (10,'1313152014','Juan Edison','Meza','Játiva','Portoviejo, Ciudadela Los Olivos','0946852349'),
 (11,'1324367891','Oscar Gabriel','Lopez','Cabrera','Portoviejo, Av. Universitaria','0986574458'),
 (12,'1312545175','Jorge Marcos','Mero','Meza','Portoviejo, Ciudadela las Orquideas','0998568695');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `id_compra` int(10) unsigned NOT NULL auto_increment,
  `fecha` date NOT NULL,
  `pagos` int(10) unsigned NOT NULL,
  `id_cliente` int(10) unsigned NOT NULL,
  `id_plan` int(10) unsigned NOT NULL,
  `id_celular` int(10) unsigned default NULL,
  PRIMARY KEY  (`id_compra`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_plan` (`id_plan`),
  KEY `id_celular` (`id_celular`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_celular`) REFERENCES `celular` (`id_celular`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compra`
--

/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` (`id_compra`,`fecha`,`pagos`,`id_cliente`,`id_plan`,`id_celular`) VALUES 
 (1,'2016-08-30',12,1,2,2),
 (2,'2015-09-01',18,5,6,4),
 (3,'2018-12-25',6,2,1,5),
 (4,'2017-11-17',24,11,8,4),
 (5,'2018-12-11',18,7,9,1),
 (6,'2018-06-13',12,12,4,10),
 (7,'2018-11-27',6,6,3,8),
 (8,'2018-09-25',18,9,10,9),
 (9,'2018-08-29',6,8,5,6),
 (10,'2018-07-12',12,3,7,3);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;


--
-- Definition of table `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `id_marca` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `CEO` varchar(45) default NULL,
  PRIMARY KEY  (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marca`
--

/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`id_marca`,`nombre`,`pais`,`CEO`) VALUES 
 (1,'Samsung Electronics','Corea del Sur','Kim Hyun Suk'),
 (2,'Huawei','China','Ren Zhengfei'),
 (3,'Apple','Estados Unidos','Tim Cook'),
 (4,'Nokia','Finlandia','Rajeev Suri'),
 (5,'Sony','Japon','Kenichiro Yoshida'),
 (6,'Alcatel','Francia','Phillippe Camus'),
 (7,'Microsoft','Estados Unidos','Satya Nadella'),
 (8,'DELL','Estados Unidos ','Michael Dell'),
 (9,'LG','Corea del Sur ','Jo Seong-jin'),
 (10,'ACER','China','Jason Chen');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;


--
-- Definition of table `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id_plan` int(10) unsigned NOT NULL auto_increment,
  `saldo` int(11) NOT NULL,
  `datos` int(11) NOT NULL,
  `redes_sociales` tinyint(1) NOT NULL,
  `sms` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` int(10) unsigned NOT NULL,
  `nombre` varchar(45) default NULL,
  PRIMARY KEY  (`id_plan`),
  UNIQUE KEY `Index_2` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan`
--

/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` (`id_plan`,`saldo`,`datos`,`redes_sociales`,`sms`,`precio`,`descuento`,`nombre`) VALUES 
 (1,10,500,0,-1,15,0,'Normal'),
 (2,20,2000,1,-1,25,10,'Perfecto'),
 (3,-1,-1,1,-1,50,20,'Deluxe'),
 (4,30,1000,2,-1,60,20,'Plus'),
 (5,20,1000,1,10,30,10,'Banda Ancha'),
 (6,30,5000,3,10,55,10,'Gigas'),
 (7,50,20,0,50,15,0,'Voz'),
 (8,50,4500,3,50,80,20,'Pospago'),
 (9,30,2000,2,10,50,10,'Prepago'),
 (10,10,1000,2,-1,20,0,'Economico');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;


--
-- Definition of view `compras_no_normalizadas`
--

DROP TABLE IF EXISTS `compras_no_normalizadas`;
DROP VIEW IF EXISTS `compras_no_normalizadas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `compras_no_normalizadas` AS select `compra`.`pagos` AS `Cuotas`,`cmp`.`nombres` AS `Nombres`,`cmp`.`apellido_p` AS `Apellido Paterno`,`plan`.`nombre` AS `Plan`,`marca`.`nombre` AS `Marca`,`celular`.`modelo` AS `modelo` from ((((`compra` join `cliente` `cmp` on((`compra`.`id_cliente` = `cmp`.`id_cliente`))) join `plan` on((`plan`.`id_plan` = `compra`.`id_plan`))) left join `celular` on((`celular`.`id_celular` = `compra`.`id_celular`))) left join `marca` on((`marca`.`id_marca` = `celular`.`id_marca`)));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
