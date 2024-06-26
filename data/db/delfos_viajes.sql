-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: viajes
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
-- Current Database: `viajes`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `viajes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `viajes`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `DNI` varchar(20) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `NTelefono` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT  IGNORE INTO `cliente` VALUES ('10000001','Ana Leza','Nueva 28, Haro',943000001),('10000002','Mikel Landa','Leitzaran 1, Andoain',943000002),('10000003','Montse Agirre','Erreka Kalea, Loiola',943000003),('10000004','Julio Rey','Nueva 12, Alfaro',943000004),('10000005','Leire Toledo','Kale Nagusia, Tolosa',943000005),('10000006','Irati Lasa','Olaeta 5, Hernani',943000006),('10000007','Ane Cases','Paseo 1, Briones',943000007),('10000008','Bego Vadillo','Calle Puerto 1, Haro',943000008),('10000009','Mercedes Espinosa','Mayor, 32, Haro',943000009),('10000010','Leire Astiz','Olaeta 2, Donostia',943000010),('10000011','Baltasar Arruti','Bidasoa 5, Lezo',943000011),('10000012','Inma Arruti','Zubieta 5, Donostia',943000012),('10000013','Xabier Luke','Maeztu 23, Gasteiz',943000013),('10000014','Markel Casillas','Kale Nagusia, Tolosa',943000014),('10000015','Libe Lasa','Akan 8, Urnieta',943000015),('10000016','Ane Garmendia','Erreka 4, Donostia',943000016),('10000017','Eneko Rey','Mayor 1, Briones',943000017),('10000018','Odin Luengo','Mayor 2, Briones',943000018),('10000019','Bixente Astiz','Zubieta 32, Usurbil',943000019),('10000020','Mara Esnal','Olaeta 8, Hernani',943000020),('10000021','Jean Ray','Pl. Centenario, Haro',943000021),('10000022','Luis Pastor','Nueva 32, Haro',943000022),('10000023','Gaspar Eloy','Roble 2, Briones',943000023),('10000024','Ainhoa Elizalde','Berrospe 6, Tolosa',943000024),('10000026','Bienvenido Ortega','Kale Nagusia, Tolosa',943000026),('72515655','Mikel Arteta','Orio 5, Beasain',632700787),('72515657','Patxi Valverde','Santana 28, Beasain',632700789),('77777777','Maite Lopez','Leitzaran 1, Andoain',943598778),('88888888','Maite Artola','Zubieta 5, Donostia',943678900),('99999999','Nora Alberdi','Pl. Centenario, Lezo',688344366);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursion_opcional`
--

DROP TABLE IF EXISTS `excursion_opcional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excursion_opcional` (
  `Destino` varchar(20) NOT NULL,
  `FechaSalida` date NOT NULL,
  `Numero` int NOT NULL,
  `DestinoExcursion` varchar(20) DEFAULT NULL,
  `HoraSalida` time DEFAULT NULL,
  `LugarSalida` varchar(20) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  PRIMARY KEY (`Destino`,`FechaSalida`,`Numero`),
  CONSTRAINT `excursion_opcional_ibfk_1` FOREIGN KEY (`Destino`, `FechaSalida`) REFERENCES `viaje` (`Destino`, `FechaSalida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursion_opcional`
--

LOCK TABLES `excursion_opcional` WRITE;
/*!40000 ALTER TABLE `excursion_opcional` DISABLE KEYS */;
INSERT  IGNORE INTO `excursion_opcional` VALUES ('Auckland','2021-04-01',1,'Hotsprings','00:12:00','Clock Tower',75),('Auckland','2021-04-01',8,'Hotsprings','00:12:00','Main Street',70),('Barcelona','2020-01-01',55,'La Pedrera','08:05:48','Rambla',90),('Donostia','2019-01-01',4,'Chillida Leku','11:12:00','Unibertsitateak',550),('Donostia','2022-01-02',5,'Galarreta','08:12:00','Unibertsitateak',222),('Haro','2017-06-02',6,'Bodegas Muga','05:12:00','Piscinas Haro',100),('India','2024-12-01',12,'Tah Majal','00:12:00','Clock Tower, Delhi',777),('Mordor','2020-04-11',10,'Hotsprings','00:12:00','Main Street 12',754),('Namibia','2020-11-21',1,'Duna 7','08:00:00','Hotel Sheraton',60),('Namibia','2020-11-21',3,'Duna 45','05:30:00','Hotel Sheraton',70),('Namibia','2020-11-21',5,'Harbor Bay','05:30:00','Hotel Sheraton',90),('Namibia','2020-11-21',7,'Windhoek','06:00:00','Hotel Sheraton',40),('Pekin','2021-05-02',14,'Blue River','00:12:00','Central Park',755),('Piondjang','2019-01-06',8,'President Palace','04:12:00','Central Park',75),('Sahara','2020-09-10',2,'Kanpalekua1','00:10:00','Sarrerako atea',750),('Sahara','2020-11-02',3,'Kanpalekua2','00:12:10','Sarrerako atea',775),('Senegal','2022-04-01',11,'Paris-Dakar museum','06:12:00','Kananga Office',475),('Toledo','2020-05-01',13,'Museo del Greco','10:08:11','Plaza Zocodover',75);
/*!40000 ALTER TABLE `excursion_opcional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursion_opcional_cliente`
--

DROP TABLE IF EXISTS `excursion_opcional_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excursion_opcional_cliente` (
  `Destino` varchar(20) NOT NULL,
  `FechaSalida` date NOT NULL,
  `Numero` int NOT NULL,
  `DNI` varchar(20) NOT NULL,
  PRIMARY KEY (`Destino`,`FechaSalida`,`Numero`,`DNI`),
  KEY `DNI` (`DNI`),
  CONSTRAINT `excursion_opcional_cliente_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `excursion_opcional_cliente_ibfk_2` FOREIGN KEY (`Destino`, `FechaSalida`, `Numero`) REFERENCES `excursion_opcional` (`Destino`, `FechaSalida`, `Numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursion_opcional_cliente`
--

LOCK TABLES `excursion_opcional_cliente` WRITE;
/*!40000 ALTER TABLE `excursion_opcional_cliente` DISABLE KEYS */;
INSERT  IGNORE INTO `excursion_opcional_cliente` VALUES ('India','2024-12-01',12,'10000001'),('Pekin','2021-05-02',14,'10000001'),('Toledo','2020-05-01',13,'10000001'),('Donostia','2019-01-01',4,'10000004'),('Auckland','2021-04-01',1,'10000005'),('Mordor','2020-04-11',10,'10000008'),('Sahara','2020-09-10',2,'10000008'),('Sahara','2020-11-02',3,'10000011'),('Namibia','2020-11-21',1,'10000012'),('Donostia','2022-01-02',5,'10000013'),('Namibia','2020-11-21',7,'10000013'),('Senegal','2022-04-01',11,'10000014'),('Namibia','2020-11-21',7,'10000016'),('Namibia','2020-11-21',1,'10000018'),('Namibia','2020-11-21',1,'10000019'),('Haro','2017-06-02',6,'10000020'),('Piondjang','2019-01-06',8,'10000024'),('Namibia','2020-11-21',1,'72515655'),('Namibia','2020-11-21',5,'72515655'),('Namibia','2020-11-21',7,'72515655'),('Namibia','2020-11-21',1,'72515657'),('Namibia','2020-11-21',7,'72515657');
/*!40000 ALTER TABLE `excursion_opcional_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guia` (
  `DNI` varchar(20) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `NTelefono` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
INSERT  IGNORE INTO `guia` VALUES ('21212121','Mikel Landa',943121212),('65111111','Leire Artola',943313131),('66666666','Andoni Toledo',948666666),('72515633','Maite Leunda',632700765),('72515638','Cristian Blanco',632700770),('72515639','Edurne Gorriti',632700771),('72515642','Nerea Haro',632700774),('72515648','Maite Loinaz',632700780),('72515650','Ainhoa Zapiain',632700782),('72515651','Unai Gauna',632700783),('72515655','Mikel Arteta',632700787),('72515657','Patxi Valverde',632700789),('72515665','Irati Lasa',632700797),('72515666','Gontzal Mendibil',632700798),('72515667','Igor Zalakain',632700799),('72515671','Jon Zatarain',632700768),('72515672','Javier Cosin',632700769),('72515673','Bienvenido Artetxe',632700770),('75646464','Iker Pujol',943567567),('88888888','Maite Artola',948777777);
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `IdHotel` varchar(20) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Localidad` varchar(20) DEFAULT NULL,
  `Capacidad` int DEFAULT NULL,
  PRIMARY KEY (`IdHotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT  IGNORE INTO `hotel` VALUES ('h01','Sheraton','Pekin',340),('h02','Asperia','Donostia',200),('h03','Alaska Beach','Rotorua',23),('h04','Hilton','Lima',1000),('h05','Sunshine','Pekin',2),('h06','River Hostel','Dakar',350),('h07','Tinto Dreams Hostel','Casalarreina',40),('h08','Eight Hotel','Katmandu',8),('h09','Corner Hotel','Windhoek',673),('h10','Campsite','Sahara',1500),('h11','King','Japon',2000),('h12','Tango','Buenos Aires, Boca',200),('h13','Nini','Coreatown',20),('h14','Campamento Torre','Cerro Castillo',20),('h15','Sunshine','Pekin',202),('h16','Mercury','Mordor',201),('h17','Kulungu','Senegal City',204),('h18','K2','New Delhi',270),('h19','Hotel Sol','Toledo',2700),('h20','Mezkitor','Ayacha',2700),('h21','Camp now hostel','Ramblas, Badalona',2700),('Id100','Cheap Hotel','Rotorua',100),('Id101','Medium Hotel','Rotorua',200),('Id102','Expensive Hotel','Rotorua',300),('id103','City','Mordor',15),('id104','River','Mordor',250),('id105','City','Rotorua',100),('id106','Igeldo','Donostia',75),('id107','Ribeiro I','Vigo',50),('id108','Ribeiro II','Vigo',100),('id109','Hotel Callao','Lima',1000),('id110','Hotel Aeropuerto','Lima',200),('id111','Hotel Emperador','Toledo',20);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_viaje`
--

DROP TABLE IF EXISTS `hotel_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_viaje` (
  `Destino` varchar(20) NOT NULL,
  `FechaSalida` date NOT NULL,
  `IdHotel` varchar(20) NOT NULL,
  PRIMARY KEY (`Destino`,`FechaSalida`,`IdHotel`),
  KEY `IdHotel` (`IdHotel`),
  CONSTRAINT `hotel_viaje_ibfk_1` FOREIGN KEY (`IdHotel`) REFERENCES `hotel` (`IdHotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_viaje_ibfk_2` FOREIGN KEY (`Destino`, `FechaSalida`) REFERENCES `viaje` (`Destino`, `FechaSalida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_viaje`
--

LOCK TABLES `hotel_viaje` WRITE;
/*!40000 ALTER TABLE `hotel_viaje` DISABLE KEYS */;
INSERT  IGNORE INTO `hotel_viaje` VALUES ('Pekin','2022-01-11','h01'),('Donostia','2019-01-01','h02'),('Donostia','2021-01-01','h02'),('Donostia','2022-01-02','h02'),('Zarautz','2020-11-20','h02'),('Auckland','2021-04-01','h03'),('Peru','2021-06-01','h04'),('Pekin','2021-05-02','h05'),('Senegal','2019-03-01','h06'),('Haro','2017-06-02','h07'),('Haro','2019-01-03','h07'),('Everest','2021-11-11','h08'),('Namibia','2020-11-21','h09'),('Namibia','2023-11-11','h09'),('Sahara','2020-09-10','h10'),('Sahara','2020-11-02','h10'),('Piondjang','2019-01-06','h13'),('Torres del Paine','2022-11-11','h14'),('Mordor','2020-04-11','h16'),('Senegal','2022-04-01','h17'),('India','2023-03-03','h18'),('India','2024-12-01','h18'),('Toledo','2020-05-01','h19'),('Toledo','2021-05-01','h19'),('Asilah','2021-05-03','h20'),('Barcelona','2021-05-04','h21'),('Rotorua','2020-03-01','Id100'),('Rotorua','2020-04-01','Id100'),('Rotorua','2020-03-01','Id101'),('Rotorua','2020-04-01','Id102'),('Donostia','2019-01-01','id106'),('Rias Baixas','2021-05-19','id107'),('Rias Baixas','2022-05-19','id107'),('Vigo','2021-03-19','id107'),('Vigo','2021-04-19','id107'),('Rias Baixas','2021-05-19','id108'),('Rias Baixas','2022-05-19','id108'),('Vigo','2021-03-19','id108'),('Vigo','2021-04-19','id108'),('Toledo','2020-05-01','id111'),('Toledo','2021-05-01','id111');
/*!40000 ALTER TABLE `hotel_viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_viaje_cliente`
--

DROP TABLE IF EXISTS `hotel_viaje_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_viaje_cliente` (
  `Destino` varchar(20) NOT NULL,
  `FechaSalida` date NOT NULL,
  `IdHotel` varchar(20) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `NumNoches` int DEFAULT NULL,
  PRIMARY KEY (`Destino`,`FechaSalida`,`IdHotel`,`DNI`),
  KEY `DNI` (`DNI`),
  CONSTRAINT `hotel_viaje_cliente_ibfk_1` FOREIGN KEY (`Destino`, `FechaSalida`, `IdHotel`) REFERENCES `hotel_viaje` (`Destino`, `FechaSalida`, `IdHotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_viaje_cliente_ibfk_2` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_viaje_cliente`
--

LOCK TABLES `hotel_viaje_cliente` WRITE;
/*!40000 ALTER TABLE `hotel_viaje_cliente` DISABLE KEYS */;
INSERT  IGNORE INTO `hotel_viaje_cliente` VALUES ('Asilah','2021-05-03','h20','10000015',7),('Auckland','2021-04-01','h03','10000005',4),('Auckland','2021-04-01','h03','10000008',4),('Auckland','2021-04-01','h03','10000023',10),('Barcelona','2021-05-04','h21','10000004',3),('Donostia','2019-01-01','h02','10000004',4),('Donostia','2019-01-01','h02','10000018',4),('Donostia','2022-01-02','h02','10000013',1),('Everest','2021-11-11','h08','10000001',12),('Haro','2017-06-02','h07','10000020',1),('India','2024-12-01','h18','10000001',4),('India','2024-12-01','h18','10000003',4),('Mordor','2020-04-11','h16','10000008',5),('Mordor','2020-04-11','h16','10000026',5),('Namibia','2020-11-21','h09','10000012',4),('Namibia','2020-11-21','h09','10000013',4),('Namibia','2020-11-21','h09','10000016',4),('Namibia','2020-11-21','h09','10000018',4),('Namibia','2020-11-21','h09','10000019',4),('Namibia','2020-11-21','h09','72515655',4),('Namibia','2020-11-21','h09','72515657',5),('Pekin','2021-05-02','h05','10000001',20),('Pekin','2021-05-02','h05','10000023',20),('Pekin','2022-01-11','h01','10000009',1),('Peru','2021-06-01','h04','10000009',10),('Piondjang','2019-01-06','h13','10000012',4),('Piondjang','2019-01-06','h13','10000024',4),('Rias Baixas','2021-05-19','id107','10000020',4),('Rias Baixas','2021-05-19','id108','10000019',7),('Rias Baixas','2022-05-19','id107','10000020',4),('Rotorua','2020-03-01','Id101','10000002',1),('Sahara','2020-09-10','h10','10000008',1),('Sahara','2020-09-10','h10','10000017',1),('Sahara','2020-09-10','h10','10000021',3),('Sahara','2020-11-02','h10','10000011',2),('Sahara','2020-11-02','h10','10000021',2),('Senegal','2019-03-01','h06','10000004',1),('Senegal','2022-04-01','h17','10000010',3),('Senegal','2022-04-01','h17','10000014',3),('Toledo','2020-05-01','h19','10000001',1),('Toledo','2020-05-01','h19','10000002',1),('Toledo','2020-05-01','h19','10000026',1),('Toledo','2020-05-01','id111','10000026',1),('Toledo','2021-05-01','id111','10000002',1),('Toledo','2021-05-01','id111','10000006',1),('Toledo','2021-05-01','id111','10000026',1),('Torres del Paine','2022-11-11','h14','10000022',1);
/*!40000 ALTER TABLE `hotel_viaje_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `DNI` varchar(20) NOT NULL,
  `Idioma` varchar(20) NOT NULL,
  PRIMARY KEY (`DNI`,`Idioma`),
  CONSTRAINT `idioma_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `guia` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT  IGNORE INTO `idioma` VALUES ('21212121','Euskera'),('65111111','Euskera'),('65111111','Italiano'),('66666666','Lengua de signos'),('72515633','Francés'),('72515638','Inglés'),('72515639','Catalán'),('72515639','Italiano'),('72515642','Euskera'),('72515642','Inglés'),('72515642','Swahili'),('72515648','Chino'),('72515650','Alemán'),('72515650','Castellano'),('72515650','Chino'),('72515650','Coreano'),('72515650','Japonés'),('72515651','Bable'),('72515655','Euskera'),('72515655','Swahili'),('72515657','Árabe'),('72515665','Chino'),('72515666','Japonés'),('72515667','Castellano'),('72515667','Catalán'),('72515667','Francés'),('72515667','Inglés'),('72515671','Francés'),('72515672','Inglés'),('72515673','Alemán'),('72515673','Bubi'),('72515673','Castellano'),('72515673','Fang'),('72515673','Francés'),('72515673','Inglés'),('72515673','Kombe'),('72515673','Lengua de signos'),('72515673','Swahili'),('72515673','Urdu'),('88888888','Gallego');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `Destino` varchar(20) NOT NULL,
  `FechaSalida` date NOT NULL,
  `Dias` int DEFAULT NULL,
  `CiudadSalida` varchar(20) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `PrecioDia` int DEFAULT NULL,
  PRIMARY KEY (`Destino`,`FechaSalida`),
  KEY `DNI` (`DNI`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `guia` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT  IGNORE INTO `viaje` VALUES ('Aitzgorri','2020-09-15',1,'Zegama','72515648',25),('Asilah','2021-05-03',602,'Donostia','72515657',325),('Auckland','2021-04-01',5,'Mordor','72515657',75),('Barcelona','2020-01-01',5,'Lasarte','72515667',150),('Barcelona','2020-02-01',4,'Lasarte','21212121',100),('Barcelona','2021-05-04',5,'Hernani','72515667',741),('Berlin','2019-06-01',5,'Santander','72515650',111),('Donostia','2019-01-01',40,'Haro','72515650',400),('Donostia','2021-01-01',40,'Haro','65111111',100),('Donostia','2022-01-02',50,'Alfaro','72515650',450),('Everest','2021-11-11',5,'Mordor','72515673',1500),('Haro','2017-06-02',3,'Ribera Baja','72515666',512),('Haro','2019-01-03',20,'Donostia','72515666',300),('India','2023-03-03',42,'Zarautz','72515650',40),('India','2024-12-01',54,'Lizartza','72515642',652),('Kioto','2021-09-26',30,'Donostia','88888888',100),('Kioto','2021-12-26',30,'Donostia','88888888',100),('Lisboa','2020-11-11',5,'Mordor','72515633',40),('Marrakets','2022-09-26',15,'Haro','88888888',40),('Mordor','2020-04-11',78,'Irun','72515673',800),('Mordor','2020-09-18',1000,'Zarautz','72515638',5000),('Namibia','2020-11-21',5,'Santander','72515673',452),('Namibia','2023-11-11',5,'Mordor','72515673',452),('New York','2020-09-28',14,'Santander',NULL,125),('Oporto','2030-11-10',55,'Mordor','72515633',30),('Paris','2020-11-11',50,'Mordor','72515639',400),('Patagonia','2020-09-18',27,'Donostia',NULL,132),('Patagonia','2022-10-26',27,'Haro','88888888',67),('Pekin','2021-05-02',500,'Mordor','72515673',0),('Pekin','2022-01-11',12,'Mordor','72515651',65),('Peru','2021-06-01',5,'Alfaro','72515650',111),('Piondjang','2019-01-06',25,'Donostia','72515642',170),('Rias Baixas','2021-05-19',15,'Tolosa','66666666',60),('Rias Baixas','2022-05-19',15,'Tolosa','66666666',65),('Rotorua','2020-03-01',10,'Auckland','21212121',200),('Rotorua','2020-04-01',10,'Auckland','21212121',300),('Sahara','2020-09-10',365,'Donostia','72515673',120),('Sahara','2020-11-02',365,'Donostia','72515667',119),('Senegal','2019-03-01',2,'Mordor','72515655',10),('Senegal','2022-04-01',7,'Donostia','72515673',40),('Toledo','2020-05-01',51,'Irun','72515671',240),('Toledo','2021-05-01',51,'Irun','72515671',240),('Torres del Paine','2022-11-11',800,'Irun','72515650',405),('Vigo','2021-03-19',15,'Lasarte','66666666',50),('Vigo','2021-04-19',15,'Lasarte','66666666',50),('Zarautz','2020-11-20',5,'Santander','65111111',50);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 10:20:24

