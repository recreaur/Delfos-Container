-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: comercio
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
-- Current Database: `comercio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `comercio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `comercio`;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `IDENT_ARTIC` int NOT NULL,
  `NOMBR_ARTIC` varchar(20) NOT NULL,
  `PESO` int DEFAULT NULL,
  `COLOR` varchar(10) DEFAULT NULL,
  `PREC_COMPR` decimal(8,2) NOT NULL,
  `PREC_VENT` decimal(8,2) NOT NULL,
  `IDENT_PROV` int DEFAULT NULL,
  PRIMARY KEY (`IDENT_ARTIC`),
  KEY `IDENT_PROV` (`IDENT_PROV`),
  CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`IDENT_PROV`) REFERENCES `proveedor` (`IDENT_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT  IGNORE INTO `articulo` VALUES (1,'impresora',150,'rojo',2.23,3.49,4),(2,'calculadora',150,'negro',24.67,28.25,1),(3,'calendario',100,'blanco',3.01,3.61,4),(4,'lámpara',550,'rojo',13.87,17.91,5),(5,'lámpara',550,'blanco',12.89,17.43,5),(6,'lámpara',550,'azul',13.56,17.91,5),(7,'lámpara',550,'verde',13.56,17.91,5),(8,'pesacartas',NULL,NULL,14.99,24.04,3),(9,'pesacartas',NULL,NULL,18.99,30.05,3),(10,'bolígrafo',20,'rojo',0.12,0.24,2),(11,'bolígrafo',20,'azul',0.12,0.24,2),(12,'bolígrafo lujo',20,'rojo',0.35,0.60,2),(13,'bolígrafo lujo',20,'verde',0.35,0.60,2),(14,'bolígrafo lujo',20,'azul',0.35,0.60,2),(15,'bolígrafo lujo',20,'negro',0.35,0.60,2),(16,'linterna',15,'amarillo',1.25,5.00,7),(17,'bolígrafo',15,'rojo',0.10,0.30,7),(18,'bolígrafo ligero',101,'plata',0.50,1.03,3);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasif_peso`
--

DROP TABLE IF EXISTS `clasif_peso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasif_peso` (
  `tipo_peso` varchar(10) DEFAULT NULL,
  `peso_minim` decimal(10,0) DEFAULT NULL,
  `peso_maxim` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasif_peso`
--

LOCK TABLES `clasif_peso` WRITE;
/*!40000 ALTER TABLE `clasif_peso` DISABLE KEYS */;
INSERT  IGNORE INTO `clasif_peso` VALUES ('leve',0,100),('ligero',101,500),('medio',501,2500),('pesado',2501,9999);
/*!40000 ALTER TABLE `clasif_peso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IDENT_CLIENT` int NOT NULL,
  `APELL1` varchar(25) NOT NULL,
  `NOMBR_CLIENT` varchar(20) DEFAULT NULL,
  `NACION` varchar(2) DEFAULT NULL,
  `CIUD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDENT_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT  IGNORE INTO `cliente` VALUES (1,'Borrás','Margarita','E','Madrid'),(2,'Pérez','Miguel','E','Madrid'),(3,'Dupont','Jean','F','París'),(4,'Dupret','Michel','F','Lyon'),(5,'Llopis','Antoni','E','Barcelona'),(6,'Souris','Marcel','F','París'),(7,'Goñi','Pablo','E','Pamplona'),(8,'Courbon','Gerard','F','Lyon'),(9,'Román','Consuelo','E','Jaén'),(10,'Roca','Pau','E','Gerona'),(11,'Mancha','Jorge','E','Valencia'),(12,'Curro','Pablo','E','Barcelona'),(13,'Cortés','Diego','E','Madrid'),(14,'Fernández','Joaquín','E','Madrid'),(15,'Durán','Jacinto','E','Pamplona'),(16,'Minguín','Pedro','E','Pamplona'),(17,'Pérez','Pedro','E',NULL),(18,'Souris','Marcel','F','Baiona'),(19,'Curro','Pablo','P','Lisboa'),(20,'Ochoa','Daniela','E','Soria'),(21,'Dolado','Ronaldo','P','Oporto');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `IDENT_PROV` int NOT NULL,
  `NOMBR_PROV` varchar(25) NOT NULL,
  PRIMARY KEY (`IDENT_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT  IGNORE INTO `proveedor` VALUES (1,'Catio Electronic'),(2,'Estilográficas Reunidas'),(3,'Mecánicas de Precisión'),(4,'Sanjita'),(5,'Electrolamp'),(6,'Sanjita'),(7,'Electrolamp');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `IDENT_TIEND` int NOT NULL,
  `CIUD` varchar(20) NOT NULL,
  `NOMBR_GERENT` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IDENT_TIEND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT  IGNORE INTO `tienda` VALUES (1,'Madrid','Contesfoques, Jordi'),(2,'Madrid','Martínez, Juan'),(3,'Pamplona','Domínguez, Julián'),(4,'Barcelona','Peña, José María'),(5,'Trujillo','Méndez, Pedro'),(6,'Jaén','Marín, Raquel'),(7,'Valencia','Petit, Joan'),(8,'Requena','Marcos, Pilar'),(9,'Palencia','Castroviejo, Lorenzo'),(10,'Gerona','Gómez, Gabriel'),(11,'Lyon','Modoux, Jean'),(12,'París','Fouet, Paul'),(13,'Logroño','Domínguez, Julián'),(14,'Barcelona','Olivé, Antoni');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `IDENT_CLIENT` int NOT NULL,
  `IDENT_TIEND` int NOT NULL,
  `IDENT_ARTIC` int NOT NULL,
  `FECH_VENT` date NOT NULL,
  `CANT_ARTICS` int DEFAULT NULL,
  `PREC_TOTAL` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`IDENT_CLIENT`,`IDENT_TIEND`,`IDENT_ARTIC`,`FECH_VENT`),
  KEY `IDENT_TIEND` (`IDENT_TIEND`),
  KEY `IDENT_ARTIC` (`IDENT_ARTIC`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`IDENT_CLIENT`) REFERENCES `cliente` (`IDENT_CLIENT`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`IDENT_TIEND`) REFERENCES `tienda` (`IDENT_TIEND`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`IDENT_ARTIC`) REFERENCES `articulo` (`IDENT_ARTIC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT  IGNORE INTO `venta` VALUES (1,2,2,'2002-02-10',1,28.25),(1,2,12,'2002-03-10',1,0.60),(1,2,13,'2002-03-10',10,6.01),(1,3,6,'2003-02-01',1,18.00),(2,14,12,'2002-02-13',1,1.00),(3,7,6,'2002-03-11',1,16.95),(3,7,9,'2002-04-30',2,60.10),(4,11,1,'2002-03-11',8,26.93),(4,11,10,'2002-03-11',7,1.68),(5,4,4,'2002-01-06',1,16.83),(6,12,3,'2002-01-09',2,7.21),(6,12,15,'2002-01-09',2,0.96),(7,1,11,'2003-02-02',1,0.25),(7,3,10,'2002-01-06',1,0.24),(7,3,11,'2002-01-06',2,0.48),(7,3,14,'2002-01-08',3,1.80),(7,3,18,'2002-11-29',3,3.06),(8,11,2,'2002-01-09',1,27.65),(13,1,3,'2002-02-10',1,3.49),(13,1,4,'2002-02-09',1,17.91),(16,2,11,'2002-02-13',1,0.30),(18,3,2,'2002-02-11',7,312.00),(18,3,2,'2002-02-12',1,44.60),(18,13,1,'2002-02-12',1,4.00),(20,3,12,'2002-11-11',10,6.00),(21,2,15,'2003-03-22',2,3.00);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 10:19:23

