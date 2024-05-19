-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `universidad`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `universidad`;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `IDALUMNO` varchar(10) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  PRIMARY KEY (`IDALUMNO`),
  UNIQUE KEY `DNI` (`DNI`),
  CONSTRAINT `FK_ALUMNOPERSONA` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT  IGNORE INTO `alumno` VALUES ('A202020','15151515Z'),('A121212','16161616A'),('A131313','17171717A'),('A020202','18181818A'),('A222222','18181818H'),('A030303','20202020A'),('A010101','21212121A'),('A040404','26262626A');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnoasignatura`
--

DROP TABLE IF EXISTS `alumnoasignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnoasignatura` (
  `IDALUMNO` varchar(10) NOT NULL,
  `IDASIGNATURA` varchar(10) NOT NULL,
  `NUMEROMATRICULA` int DEFAULT NULL,
  PRIMARY KEY (`IDALUMNO`,`IDASIGNATURA`),
  KEY `FK_ASIGNATURA` (`IDASIGNATURA`),
  CONSTRAINT `FK_ALUMNO` FOREIGN KEY (`IDALUMNO`) REFERENCES `alumno` (`IDALUMNO`),
  CONSTRAINT `FK_ASIGNATURA` FOREIGN KEY (`IDASIGNATURA`) REFERENCES `asignatura` (`IDASIGNATURA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnoasignatura`
--

LOCK TABLES `alumnoasignatura` WRITE;
/*!40000 ALTER TABLE `alumnoasignatura` DISABLE KEYS */;
INSERT  IGNORE INTO `alumnoasignatura` VALUES ('A010101','150212',1),('A020202','130113',1),('A020202','150212',2),('A030303','130113',3),('A030303','130122',2),('A030303','150212',1),('A040404','130122',1),('A121212','000115',1),('A121212','160003',2),('A131313','160002',4),('A131313','160003',5),('A202020','130113',1),('A202020','130122',2),('A202020','150212',2),('A222222','130122',1);
/*!40000 ALTER TABLE `alumnoasignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `IDASIGNATURA` varchar(10) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `CREDITOS` decimal(2,1) NOT NULL,
  `CUATRIMESTRE` char(1) NOT NULL,
  `COSTEBASICO` decimal(3,1) DEFAULT NULL,
  `IDPROFESOR` varchar(10) NOT NULL,
  `IDTITULACION` varchar(10) DEFAULT NULL,
  `CURSO` char(1) DEFAULT NULL,
  PRIMARY KEY (`IDASIGNATURA`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`),
  KEY `FK_PROFESORASIGNATURA` (`IDPROFESOR`),
  KEY `FK_TITULACIONASIGNATURA` (`IDTITULACION`),
  CONSTRAINT `FK_PROFESORASIGNATURA` FOREIGN KEY (`IDPROFESOR`) REFERENCES `profesor` (`IDPROFESOR`),
  CONSTRAINT `FK_TITULACIONASIGNATURA` FOREIGN KEY (`IDTITULACION`) REFERENCES `titulacion` (`IDTITULACION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT  IGNORE INTO `asignatura` VALUES ('000115','Seguridad Vial',4.5,'1',30.0,'P204',NULL,NULL),('000116','Inglés técnico',4.5,'2',60.0,'P204',NULL,'2'),('130044','Estadística',6.0,'2',90.0,'P204','160000','2'),('130113','Programación I',9.0,'1',60.0,'P101','130110','1'),('130122','Análisis II',9.0,'2',60.0,'P203','130110','2'),('150001','Derecho',6.0,'2',70.0,'P117','150000','2'),('150212','Química Física',4.5,'2',70.0,'P304','150210','1'),('160002','Contabilidad',6.0,'1',70.0,'P117','160000','1'),('160003','Gestión de empresa',6.0,'1',90.0,'P117','160000','1');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `DNI` varchar(9) NOT NULL,
  `NOMBRE` varchar(25) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `CIUDAD` varchar(30) DEFAULT NULL,
  `DIRECCIONCALLE` varchar(50) DEFAULT NULL,
  `DIRECCIONNUM` varchar(3) DEFAULT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `VARON` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT  IGNORE INTO `persona` VALUES ('15151515Z','Malena','Folgado','Fuenmayor','Obispo Fidel','3','941676767','1980-05-05',0),('16161616A','Luis','Ramírez','Haro','Pez','34','941111111','1969-01-01',1),('17171717A','Laura','Beltran','Madrid','Gran Vía','23','912121212','1974-08-08',0),('18181818A','Pepe','Pérez','Madrid','Percebe','13','913131313','1980-02-02',1),('18181818H','Malena','Folgado','Villamediana','Comunidad','11','941151515','1982-06-06',0),('19191919A','Juan','Sánchez','Bilbao','Melancolía','7','944141414','1966-03-03',1),('20202020A','Luis','Jiménez','Nájera','Cigüeña','15','941151515','1979-03-03',1),('21212121A','Rosa','García','Haro','Alegría','16','941161616','1978-04-04',0),('23232323A','Jorge','Sáenz','Logroño','Luis de Ulloa','17','941171717','1978-09-09',1),('24242424A','María','Gutierrez','Logroño','Avda. la Paz','18','941181818','1964-10-10',0),('25252525A','Rosario','Díaz','Logroño','Percebe','19','941191919','1971-11-11',0),('26262626A','Elena','González','Logroño','Percebe','20','941202020','1975-05-05',0);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `IDPROFESOR` varchar(10) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  PRIMARY KEY (`IDPROFESOR`),
  UNIQUE KEY `DNI` (`DNI`),
  CONSTRAINT `FK_PROFESORPERSONA` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT  IGNORE INTO `profesor` VALUES ('P101','19191919A'),('P203','23232323A'),('P304','24242424A'),('P117','25252525A'),('P204','26262626A');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulacion`
--

DROP TABLE IF EXISTS `titulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulacion` (
  `IDTITULACION` varchar(10) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTITULACION`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulacion`
--

LOCK TABLES `titulacion` WRITE;
/*!40000 ALTER TABLE `titulacion` DISABLE KEYS */;
INSERT  IGNORE INTO `titulacion` VALUES ('150000','Derecho'),('160000','Empresariales'),('130110','Matemáticas'),('150210','Químicas');
/*!40000 ALTER TABLE `titulacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 10:20:08

