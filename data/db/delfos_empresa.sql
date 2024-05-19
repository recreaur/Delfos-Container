-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: empresa
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
-- Current Database: `empresa`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `empresa`;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Numero` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Director` char(9) DEFAULT NULL,
  `FechaIniDir` date DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  UNIQUE KEY `U_nombre` (`Nombre`),
  KEY `FKDepartamentoEmpleado` (`Director`),
  CONSTRAINT `FKDepartamentoEmpleado` FOREIGN KEY (`Director`) REFERENCES `empleado` (`NSS`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT  IGNORE INTO `departamento` VALUES (1,'Central','888665555','1971-06-19'),(4,'Administración','987654321','1985-01-01'),(5,'Investigación','333445555','1978-05-22'),(9,'Expansión','888000000','2015-01-03');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `NSS` char(9) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `FechaNcto` date DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Salario` int DEFAULT NULL,
  `Jefe` char(9) DEFAULT NULL,
  `Depto` int DEFAULT NULL,
  `Localidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NSS`),
  KEY `FKEmpleadoJefe` (`Jefe`),
  KEY `FKEmpleadoDepto` (`Depto`),
  CONSTRAINT `FKEmpleadoDepto` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Numero`),
  CONSTRAINT `FKEmpleadoJefe` FOREIGN KEY (`Jefe`) REFERENCES `empleado` (`NSS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT  IGNORE INTO `empleado` VALUES ('123456789','Juan','Suárez García','1955-01-09','Juan Valdés 25','V',1800,'333445555',5,'Huesca'),('222333000','Leyre','Iturrioz Mañas','1989-07-14',NULL,'M',2000,'888665555',1,NULL),('222777000','Beatriz','Camuñas Márquez','1980-06-14','Villegas, 4','M',1300,'888665555',1,'Logroño'),('222888000','Marta','Puertas Elorza','1978-08-12','Lope de Vega, 3','M',1500,'888665555',1,'Villamediana'),('222999000','Lorea','Chávarri Díez','1985-06-02',NULL,'M',5000,NULL,4,NULL),('222999444','Alba','Narváez Alonso','1982-06-30','Vara de Rey 22','M',3000,NULL,5,'Logroño'),('333445555','Francisco','Gómez de la Sierra','1945-12-08','Loscertales 9','V',2400,'888665555',5,'Valencia'),('453453453','Josefa','de la Torre y Silva','1962-07-31','Carcagente 12','M',1500,'333445555',5,'Zaragoza'),('555555555','Julián','Márquez Pérez','1981-01-12','Chile 15','V',2400,'222999444',5,'Logroño'),('666884444','Ramón','Piedra Trujillo','1952-09-15','Madre Vedruna 21','V',2280,'333445555',5,'Huesca'),('888000000','Vanesa','Sarasola Goñi','1988-02-13','Austria','M',3000,NULL,9,'Logroño'),('888665555','Pilar','Requena Santos','1927-11-10','Alicante 3','M',3300,NULL,1,'Zaragoza'),('987654321','Ana','Álvarez González','1981-06-20','Graus 19','M',2580,'888665555',4,'Madrid'),('987987987','Juan','Suárez Roca','1959-03-29','Pza. España 1','V',1500,'987654321',4,'Madrid'),('999887777','Alicia','Vives Carrascosa','1958-07-17','Gran Vía 33','M',1500,'987654321',4,'Alcalá de Henares'),('999999991','Kepa','Arrieta Alcorta',NULL,'Urbieta 33','V',NULL,NULL,5,'Donostia');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiar`
--

DROP TABLE IF EXISTS `familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiar` (
  `Empleado` char(9) NOT NULL DEFAULT '',
  `Nombre` varchar(20) NOT NULL DEFAULT '',
  `FechaNcto` date NOT NULL DEFAULT '0000-00-00',
  `Sexo` char(1) DEFAULT NULL,
  `Parentesco` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Empleado`,`Nombre`,`FechaNcto`),
  CONSTRAINT `FKFamiliarEmpleado` FOREIGN KEY (`Empleado`) REFERENCES `empleado` (`NSS`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiar`
--

LOCK TABLES `familiar` WRITE;
/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
INSERT  IGNORE INTO `familiar` VALUES ('123456789','Alicia','1978-01-01','M','hija'),('123456789','Isabel','1957-04-05','M','esposa'),('123456789','Jorge','1978-12-31','V','hermano'),('333445555','Alicia','1976-04-05','M','hermana'),('333445555','Josefa','1948-05-03','M','esposa'),('333445555','Teodoro','1973-10-25','V','hijo'),('987654321','Ana','1989-05-27','M','hija'),('987654321','Miguel','1932-02-29','V','esposo');
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidadesdepto`
--

DROP TABLE IF EXISTS `localidadesdepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidadesdepto` (
  `Depto` int NOT NULL,
  `Localidad` varchar(20) NOT NULL,
  PRIMARY KEY (`Depto`,`Localidad`),
  CONSTRAINT `FKLocalidadesDeptoDepto` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidadesdepto`
--

LOCK TABLES `localidadesdepto` WRITE;
/*!40000 ALTER TABLE `localidadesdepto` DISABLE KEYS */;
INSERT  IGNORE INTO `localidadesdepto` VALUES (1,'Zaragoza'),(4,'Madrid'),(5,'Huesca'),(5,'Valencia'),(5,'Zaragoza');
/*!40000 ALTER TABLE `localidadesdepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `Numero` int NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Localidad` varchar(20) DEFAULT NULL,
  `Depto` int DEFAULT NULL,
  `Descr` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  UNIQUE KEY `U_nombre` (`Nombre`),
  KEY `FKProyectoDepartamento` (`Depto`),
  CONSTRAINT `FKProyectoDepartamento` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT  IGNORE INTO `proyecto` VALUES (1,'ProductoX','Zaragoza',5,'2018-sb-bi&dm'),(2,'ProductoY','Huesca',5,'2019-cn-bi'),(3,'ProductoZ','Huesca',5,'2018-sb-dw'),(10,'Informatización','Zaragoza',4,'2015-cn-wd&bi'),(20,'Reorganización','Madrid',1,'2017-sb-hw&dm'),(30,'Nuevos beneficios','Teruel',4,'2018-cn-dl&dm'),(100,'Habilitación','Logroño',5,'2019-sb-bi&dw'),(200,'ProductoG','Logroño',5,'2018-cn-wd&hb'),(300,'Instalación','Zaragoza',4,'2019-sb-bi&dw'),(400,'ProductoWQ','Logroño',5,'2016-sb-vsh'),(500,'Producto7','Logroño',5,'2017-sb-vsh');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabaja`
--

DROP TABLE IF EXISTS `trabaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabaja` (
  `Empleado` char(9) NOT NULL,
  `Proyecto` int NOT NULL,
  `Horas` decimal(63,2) DEFAULT NULL,
  PRIMARY KEY (`Empleado`,`Proyecto`),
  KEY `FKTrabajaProyecto` (`Proyecto`),
  CONSTRAINT `FKTrabajaEmpleado` FOREIGN KEY (`Empleado`) REFERENCES `empleado` (`NSS`) ON DELETE CASCADE,
  CONSTRAINT `FKTrabajaProyecto` FOREIGN KEY (`Proyecto`) REFERENCES `proyecto` (`Numero`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabaja`
--

LOCK TABLES `trabaja` WRITE;
/*!40000 ALTER TABLE `trabaja` DISABLE KEYS */;
INSERT  IGNORE INTO `trabaja` VALUES ('123456789',1,32.50),('123456789',2,7.50),('333445555',2,10.00),('333445555',3,10.00),('333445555',10,10.00),('333445555',20,10.00),('453453453',1,20.00),('453453453',2,20.00),('453453453',400,NULL),('555555555',400,40.00),('555555555',500,40.00),('666884444',3,40.00),('888665555',20,1.00),('987654321',20,15.00),('987654321',30,20.00),('987987987',10,35.00),('987987987',30,5.00),('999887777',10,10.00),('999887777',30,30.00);
/*!40000 ALTER TABLE `trabaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabaja_completo`
--

DROP TABLE IF EXISTS `trabaja_completo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabaja_completo` (
  `NSS` char(9) DEFAULT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `FechaNcto` date DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Salario` int DEFAULT NULL,
  `Jefe` char(9) DEFAULT NULL,
  `Depto` int DEFAULT NULL,
  `Localidad` varchar(20) DEFAULT NULL,
  `NumeroProy` int DEFAULT NULL,
  `NombreProy` varchar(20) DEFAULT NULL,
  `LocalidadProy` varchar(20) DEFAULT NULL,
  `DeptoProy` int DEFAULT NULL,
  `HorasSem` decimal(63,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabaja_completo`
--

LOCK TABLES `trabaja_completo` WRITE;
/*!40000 ALTER TABLE `trabaja_completo` DISABLE KEYS */;
INSERT  IGNORE INTO `trabaja_completo` VALUES ('123456789','Juan','Suárez García','1955-01-09','Juan Valdés 25','V',1800,'333445555',5,'Huesca',1,'ProductoX','Zaragoza',5,32.50),('453453453','Josefa','de la Torre y Silva','1962-07-31','Carcagente 12','M',1500,'333445555',5,'Zaragoza',1,'ProductoX','Zaragoza',5,20.00),('123456789','Juan','Suárez García','1955-01-09','Juan Valdés 25','V',1800,'333445555',5,'Huesca',2,'ProductoY','Huesca',5,7.50),('333445555','Francisco','Gómez de la Sierra','1945-12-08','Loscertales 9','V',2400,'888665555',5,'Valencia',2,'ProductoY','Huesca',5,10.00),('453453453','Josefa','de la Torre y Silva','1962-07-31','Carcagente 12','M',1500,'333445555',5,'Zaragoza',2,'ProductoY','Huesca',5,20.00),('333445555','Francisco','Gómez de la Sierra','1945-12-08','Loscertales 9','V',2400,'888665555',5,'Valencia',3,'ProductoZ','Huesca',5,10.00),('666884444','Ramón','Piedra Trujillo','1952-09-15','Madre Vedruna 21','V',2280,'333445555',5,'Huesca',3,'ProductoZ','Huesca',5,40.00),('333445555','Francisco','Gómez de la Sierra','1945-12-08','Loscertales 9','V',2400,'888665555',5,'Valencia',10,'Informatización','Zaragoza',4,10.00),('987987987','Juan','Suárez Roca','1959-03-29','Pza. España 1','V',1500,'987654321',4,'Madrid',10,'Informatización','Zaragoza',4,35.00),('999887777','Alicia','Vives Carrascosa','1958-07-17','Gran Vía 33','M',1500,'987654321',4,'Alcalá de Henares',10,'Informatización','Zaragoza',4,10.00),('333445555','Francisco','Gómez de la Sierra','1945-12-08','Loscertales 9','V',2400,'888665555',5,'Valencia',20,'Reorganización','Madrid',1,10.00),('888665555','Pilar','Requena Santos','1927-11-10','Alicante 3','M',3300,NULL,1,'Zaragoza',20,'Reorganización','Madrid',1,1.00),('987654321','Ana','Álvarez González','1981-06-20','Graus 19','M',2580,'888665555',4,'Madrid',20,'Reorganización','Madrid',1,15.00),('987654321','Ana','Álvarez González','1981-06-20','Graus 19','M',2580,'888665555',4,'Madrid',30,'Nuevos beneficios','Teruel',4,20.00),('987987987','Juan','Suárez Roca','1959-03-29','Pza. España 1','V',1500,'987654321',4,'Madrid',30,'Nuevos beneficios','Teruel',4,5.00),('999887777','Alicia','Vives Carrascosa','1958-07-17','Gran Vía 33','M',1500,'987654321',4,'Alcalá de Henares',30,'Nuevos beneficios','Teruel',4,30.00),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'Habilitación','Logroño',5,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200,'ProductoG','Logroño',5,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300,'Instalación','Zaragoza',4,NULL),('453453453','Josefa','de la Torre y Silva','1962-07-31','Carcagente 12','M',1500,'333445555',5,'Zaragoza',400,'ProductoWQ','Logroño',5,NULL),('555555555','Julián','Márquez Pérez','1981-01-12','Chile 15','V',2400,'222999444',5,'Logroño',400,'ProductoWQ','Logroño',5,40.00),('555555555','Julián','Márquez Pérez','1981-01-12','Chile 15','V',2400,'222999444',5,'Logroño',500,'Producto7','Logroño',5,40.00),('222333000','Leyre','Iturrioz Mañas','1989-07-14',NULL,'M',2000,'888665555',1,NULL,NULL,NULL,NULL,NULL,NULL),('222777000','Beatriz','Camuñas Márquez','1980-06-14','Villegas, 4','M',1300,'888665555',1,'Logroño',NULL,NULL,NULL,NULL,NULL),('222888000','Marta','Puertas Elorza','1978-08-12','Lope de Vega, 3','M',1500,'888665555',1,'Villamediana',NULL,NULL,NULL,NULL,NULL),('222999000','Lorea','Chávarri Díez','1985-06-02',NULL,'M',5000,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL),('222999444','Alba','Narváez Alonso','1982-06-30','Vara de Rey 22','M',3000,NULL,5,'Logroño',NULL,NULL,NULL,NULL,NULL),('888000000','Vanesa','Sarasola Goñi','1988-02-13','Austria','M',3000,NULL,9,'Logroño',NULL,NULL,NULL,NULL,NULL),('999999991','Kepa','Arrieta Alcorta',NULL,'Urbieta 33','V',NULL,NULL,5,'Donostia',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `trabaja_completo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_trabaja_completo`
--

DROP TABLE IF EXISTS `vista_trabaja_completo`;
/*!50001 DROP VIEW IF EXISTS `vista_trabaja_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_trabaja_completo` AS SELECT 
 1 AS `NSS`,
 1 AS `Nombre`,
 1 AS `Apellidos`,
 1 AS `FechaNcto`,
 1 AS `Direccion`,
 1 AS `Sexo`,
 1 AS `Salario`,
 1 AS `Jefe`,
 1 AS `Depto`,
 1 AS `Localidad`,
 1 AS `NumeroProy`,
 1 AS `NombreProy`,
 1 AS `LocalidadProy`,
 1 AS `DeptoProy`,
 1 AS `HorasSem`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `empresa`
--

USE `empresa`;

--
-- Final view structure for view `vista_trabaja_completo`
--

/*!50001 DROP VIEW IF EXISTS `vista_trabaja_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bdelfos`@`10.10.4.%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_trabaja_completo` AS select `e`.`NSS` AS `NSS`,`e`.`Nombre` AS `Nombre`,`e`.`Apellidos` AS `Apellidos`,`e`.`FechaNcto` AS `FechaNcto`,`e`.`Direccion` AS `Direccion`,`e`.`Sexo` AS `Sexo`,`e`.`Salario` AS `Salario`,`e`.`Jefe` AS `Jefe`,`e`.`Depto` AS `Depto`,`e`.`Localidad` AS `Localidad`,`p`.`Numero` AS `NumeroProy`,`p`.`Nombre` AS `NombreProy`,`p`.`Localidad` AS `LocalidadProy`,`p`.`Depto` AS `DeptoProy`,`t`.`Horas` AS `HorasSem` from (`proyecto` `p` left join (`empleado` `e` left join `trabaja` `t` on((`t`.`Empleado` = `e`.`NSS`))) on((`t`.`Proyecto` = `p`.`Numero`))) union select `e`.`NSS` AS `NSS`,`e`.`Nombre` AS `Nombre`,`e`.`Apellidos` AS `Apellidos`,`e`.`FechaNcto` AS `FechaNcto`,`e`.`Direccion` AS `Direccion`,`e`.`Sexo` AS `Sexo`,`e`.`Salario` AS `Salario`,`e`.`Jefe` AS `Jefe`,`e`.`Depto` AS `Depto`,`e`.`Localidad` AS `Localidad`,`p`.`Numero` AS `NumeroProy`,`p`.`Nombre` AS `NombreProy`,`p`.`Localidad` AS `LocalidadProy`,`p`.`Depto` AS `DeptoProy`,`t`.`Horas` AS `HorasSem` from ((`empleado` `e` left join `trabaja` `t` on((`t`.`Empleado` = `e`.`NSS`))) left join `proyecto` `p` on((`t`.`Proyecto` = `p`.`Numero`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 10:19:46

