-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.40-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema aplicacionbd
--

CREATE DATABASE IF NOT EXISTS aplicacionbd;
USE aplicacionbd;

--
-- Definition of table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `cuasi` varchar(12) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cuasi`),
  UNIQUE KEY `UNIQUE` (`dni`),
  CONSTRAINT `FK_alumno_1` FOREIGN KEY (`cuasi`) REFERENCES `usuario` (`cuasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumno`
--

/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;


--
-- Definition of table `alumno_ejercicio_practica`
--

DROP TABLE IF EXISTS `alumno_ejercicio_practica`;
CREATE TABLE `alumno_ejercicio_practica` (
  `alumno` varchar(12) NOT NULL,
  `ejerciciopractica` int(10) unsigned NOT NULL,
  `respuesta` longtext NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  `fechahora` datetime NOT NULL,
  PRIMARY KEY (`alumno`,`ejerciciopractica`) USING BTREE,
  KEY `FK_alumno_ejercicio_practica_2` (`ejerciciopractica`),
  CONSTRAINT `FK_alumno_ejercicio_practica_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`cuasi`),
  CONSTRAINT `FK_alumno_ejercicio_practica_2` FOREIGN KEY (`ejerciciopractica`) REFERENCES `ejercicio_practica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumno_ejercicio_practica`
--

/*!40000 ALTER TABLE `alumno_ejercicio_practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_ejercicio_practica` ENABLE KEYS */;


--
-- Definition of table `alumno_practica`
--

DROP TABLE IF EXISTS `alumno_practica`;
CREATE TABLE `alumno_practica` (
  `alumno` varchar(12) NOT NULL,
  `practica` int(10) unsigned NOT NULL,
  `fechahora` datetime NOT NULL,
  PRIMARY KEY (`alumno`,`practica`),
  KEY `FK_alumno_practica_2` (`practica`),
  CONSTRAINT `FK_alumno_practica_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`cuasi`),
  CONSTRAINT `FK_alumno_practica_2` FOREIGN KEY (`practica`) REFERENCES `practica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumno_practica`
--

/*!40000 ALTER TABLE `alumno_practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_practica` ENABLE KEYS */;


--
-- Definition of table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
CREATE TABLE `ejercicio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `esquema` int(10) unsigned NOT NULL,
  `enunciado` longtext NOT NULL,
  `query` longtext NOT NULL,
  `dificultad` varchar(10) NOT NULL,
  `numsesion` int(10) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_ejercicio_1` (`esquema`),
  CONSTRAINT `FK_ejercicio_1` FOREIGN KEY (`esquema`) REFERENCES `esquema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ejercicio`
--

/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;


--
-- Definition of table `ejercicio_practica`
--

DROP TABLE IF EXISTS `ejercicio_practica`;
CREATE TABLE `ejercicio_practica` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `practica` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  `ejercicio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ejercicio_practica_2` (`ejercicio`),
  KEY `FK_ejercicio_practica_1` (`practica`) USING BTREE,
  CONSTRAINT `FK_ejercicio_practica_1` FOREIGN KEY (`practica`) REFERENCES `practica` (`id`),
  CONSTRAINT `FK_ejercicio_practica_2` FOREIGN KEY (`ejercicio`) REFERENCES `ejercicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='No tiene clave UNIQUE ya que en MySQL no existe DEFERRED';

--
-- Dumping data for table `ejercicio_practica`
--

/*!40000 ALTER TABLE `ejercicio_practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicio_practica` ENABLE KEYS */;


--
-- Definition of table `esquema`
--

DROP TABLE IF EXISTS `esquema`;
CREATE TABLE `esquema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `host` varchar(45) NOT NULL,
  `puerto` int(10) unsigned NOT NULL,
  `esquema` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `sgbd` varchar(45) NOT NULL,
  `pdf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esquema`
--

/*!40000 ALTER TABLE `esquema` DISABLE KEYS */;
/*!40000 ALTER TABLE `esquema` ENABLE KEYS */;


--
-- Definition of table `habilita`
--

DROP TABLE IF EXISTS `habilita`;
CREATE TABLE `habilita` (
  `cuasi` varchar(12) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`cuasi`) USING BTREE,
  UNIQUE KEY `UNIQUE` (`clave`) USING BTREE,
  CONSTRAINT `FK_habilita_1` FOREIGN KEY (`cuasi`) REFERENCES `alumno` (`cuasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `habilita`
--

/*!40000 ALTER TABLE `habilita` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilita` ENABLE KEYS */;


--
-- Definition of table `practica`
--

DROP TABLE IF EXISTS `practica`;
CREATE TABLE `practica` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `numsesion` int(10) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `practica`
--

/*!40000 ALTER TABLE `practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `practica` ENABLE KEYS */;


--
-- Definition of table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE `profesor` (
  `cuasi` varchar(12) NOT NULL,
  PRIMARY KEY (`cuasi`),
  CONSTRAINT `FK_profesor_1` FOREIGN KEY (`cuasi`) REFERENCES `usuario` (`cuasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profesor`
--

/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` (`cuasi`) VALUES 
 ('admin');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `cuasi` varchar(12) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cuasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`cuasi`,`password`,`email`) VALUES 
 ('admin','81dc9bdb52d04dc20036dbd8313ed055','admin@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
