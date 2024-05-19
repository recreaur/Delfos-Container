-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: aplicacionbd
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `cuasi` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dni` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `apellidos` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cuasi`),
  UNIQUE KEY `UNIQUE` (`dni`),
  CONSTRAINT `FK_alumno_1` FOREIGN KEY (`cuasi`) REFERENCES `usuario` (`cuasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_ejercicio_practica`
--

DROP TABLE IF EXISTS `alumno_ejercicio_practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_ejercicio_practica` (
  `alumno` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ejerciciopractica` int unsigned NOT NULL,
  `respuesta` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  `fechahora` datetime NOT NULL,
  PRIMARY KEY (`alumno`,`ejerciciopractica`) USING BTREE,
  KEY `FK_alumno_ejercicio_practica_2` (`ejerciciopractica`),
  CONSTRAINT `FK_alumno_ejercicio_practica_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`cuasi`),
  CONSTRAINT `FK_alumno_ejercicio_practica_2` FOREIGN KEY (`ejerciciopractica`) REFERENCES `ejercicio_practica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_ejercicio_practica`
--

LOCK TABLES `alumno_ejercicio_practica` WRITE;
/*!40000 ALTER TABLE `alumno_ejercicio_practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_ejercicio_practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_ejercicio_repaso`
--

DROP TABLE IF EXISTS `alumno_ejercicio_repaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_ejercicio_repaso` (
  `alumnorepaso` int NOT NULL,
  `ejercicio` int unsigned NOT NULL,
  `respuesta` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `correcta` tinyint(1) DEFAULT NULL,
  `numintentos` int DEFAULT NULL,
  `tiemporesolucion` int DEFAULT NULL,
  `fechaguardado` datetime DEFAULT NULL,
  PRIMARY KEY (`alumnorepaso`,`ejercicio`),
  KEY `fk_alumno_ejercicio_repaso_alumno_repaso1_idx` (`alumnorepaso`),
  KEY `fk_alumno_ejercicio_repaso_ejercicio1_idx` (`ejercicio`),
  CONSTRAINT `fk_alumno_ejercicio_repaso_alumno_repaso1` FOREIGN KEY (`alumnorepaso`) REFERENCES `alumno_repaso` (`id`),
  CONSTRAINT `fk_alumno_ejercicio_repaso_ejercicio1` FOREIGN KEY (`ejercicio`) REFERENCES `ejercicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_ejercicio_repaso`
--

LOCK TABLES `alumno_ejercicio_repaso` WRITE;
/*!40000 ALTER TABLE `alumno_ejercicio_repaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_ejercicio_repaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_practica`
--

DROP TABLE IF EXISTS `alumno_practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_practica` (
  `alumno` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `practica` int unsigned NOT NULL,
  `fechahora` datetime NOT NULL,
  PRIMARY KEY (`alumno`,`practica`),
  KEY `FK_alumno_practica_2` (`practica`),
  CONSTRAINT `FK_alumno_practica_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`cuasi`),
  CONSTRAINT `FK_alumno_practica_2` FOREIGN KEY (`practica`) REFERENCES `practica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_practica`
--

LOCK TABLES `alumno_practica` WRITE;
/*!40000 ALTER TABLE `alumno_practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_repaso`
--

DROP TABLE IF EXISTS `alumno_repaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_repaso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumno` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `maxnumejercicio` int NOT NULL,
  `minnumsesion` int NOT NULL,
  `maxnumsesion` int NOT NULL,
  `esquemas` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dificultad` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fechainicio` datetime NOT NULL,
  `fechafin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_repaso_1_idx` (`alumno`),
  CONSTRAINT `fk_repaso_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`cuasi`)
) ENGINE=InnoDB AUTO_INCREMENT=14085 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_repaso`
--

LOCK TABLES `alumno_repaso` WRITE;
/*!40000 ALTER TABLE `alumno_repaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_repaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `esquema` int unsigned NOT NULL,
  `enunciado` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `query` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dificultad` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `numsesion` int unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_ejercicio_1` (`esquema`),
  CONSTRAINT `FK_ejercicio_1` FOREIGN KEY (`esquema`) REFERENCES `esquema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1213 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio`
--

LOCK TABLES `ejercicio` WRITE;
/*!40000 ALTER TABLE `ejercicio` DISABLE KEYS */;
INSERT INTO `ejercicio` VALUES (813,64,'Créditos de la asignatura más pequeña en número de creditos y coste de la más cara.','SELECT MIN(CREDITOS) AS MENOR, MAX(COSTEBASICO) AS \'MÁS CARA\' \nFROM asignatura;','facil',1,1),
                               (814,64,'Qué posibilidades de créditos de asignatura hay en asignaturas de la titulación 130110 junto al coste básico por hora de clase (1 crédito=10 horas de clase).','SELECT DISTINCT creditos, costebasico/(creditos*10) as \'€/hora\'\nFROM asignatura\nWHERE idtitulacion=130110;','facil',1,1);
/*!40000 ALTER TABLE `ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicio_practica`
--

DROP TABLE IF EXISTS `ejercicio_practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio_practica` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `practica` int unsigned NOT NULL,
  `numero` int unsigned NOT NULL,
  `ejercicio` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ejercicio_practica_2` (`ejercicio`),
  KEY `FK_ejercicio_practica_1` (`practica`) USING BTREE,
  CONSTRAINT `FK_ejercicio_practica_1` FOREIGN KEY (`practica`) REFERENCES `practica` (`id`),
  CONSTRAINT `FK_ejercicio_practica_2` FOREIGN KEY (`ejercicio`) REFERENCES `ejercicio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='No tiene clave UNIQUE ya que en MySQL no existe DEFERRED';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicio_practica`
--

LOCK TABLES `ejercicio_practica` WRITE;
/*!40000 ALTER TABLE `ejercicio_practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicio_practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esquema`
--

DROP TABLE IF EXISTS `esquema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esquema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `host` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `puerto` int unsigned NOT NULL,
  `esquema` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `usuario` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `sgbd` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pdf` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esquema`
--

LOCK TABLES `esquema` WRITE;
/*!40000 ALTER TABLE `esquema` DISABLE KEYS */;
INSERT INTO `esquema` VALUES (58,'Comercio mySQL','db',3306,'comercio?useOldAliasMetadataBehavior=true','comercioUsr','comercioUsrcomercioUsr','mysql','/pdf/58.jpg'),
                             (61,'empresa mySQL','db',3306,'empresa?useOldAliasMetadataBehavior=true','empresaUsr','empresaUsrempresaUsr','mysql','/pdf/61.bmp'),
                             (62,'Biblioteca mySQL','db',3306,'biblioteca?useOldAliasMetadataBehavior=true','bibliotecaUsr','bibliotecaUsrbibliotecaUsr','mysql','/pdf/62.JPG'),
                             (64,'Universidad mySQL','db',3306,'universidad?useOldAliasMetadataBehavior=true','uniUsr','uniUsruniUsr','mysql','/pdf/64.jpg'),
                             (82,'viajes mySQL','db',3306,'viajes?useOldAliasMetadataBehavior=true','viajesUsr','viajesUsrviajesUsr','mysql','/pdf/82.pdf');
/*!40000 ALTER TABLE `esquema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `evaluacion_practicas`
--

DROP TABLE IF EXISTS `evaluacion_practicas`;
/*!50001 DROP VIEW IF EXISTS `evaluacion_practicas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `evaluacion_practicas` AS SELECT 
 1 AS `apellidos`,
 1 AS `nombre`,
 1 AS `%OK`,
 1 AS `%hechos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `habilita`
--

DROP TABLE IF EXISTS `habilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilita` (
  `cuasi` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `clave` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`cuasi`) USING BTREE,
  UNIQUE KEY `UNIQUE` (`clave`) USING BTREE,
  CONSTRAINT `FK_habilita_1` FOREIGN KEY (`cuasi`) REFERENCES `alumno` (`cuasi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilita`
--

LOCK TABLES `habilita` WRITE;
/*!40000 ALTER TABLE `habilita` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practica`
--

DROP TABLE IF EXISTS `practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practica` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `numsesion` int unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practica`
--

LOCK TABLES `practica` WRITE;
/*!40000 ALTER TABLE `practica` DISABLE KEYS */;
/*!40000 ALTER TABLE `practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `cuasi` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`cuasi`),
  CONSTRAINT `FK_profesor_1` FOREIGN KEY (`cuasi`) REFERENCES `usuario` (`cuasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('admin');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cuasi` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`cuasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `evaluacion_practicas`
--

/*!50001 DROP VIEW IF EXISTS `evaluacion_practicas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aplicacionbd`@'%' SQL SECURITY DEFINER */
/*!50001 VIEW `evaluacion_practicas` AS select `a`.`apellidos` AS `apellidos`,`a`.`nombre` AS `nombre`,round(((count((case when (0 = `aep`.`correcta`) then NULL else 1 end)) * 100) / (select count(0) from (`ejercicio_practica` `ep` join `practica` `p` on((`ep`.`practica` = `p`.`id`))) where ((`p`.`nombre` like '%_3') and (`p`.`numsesion` in (1,2,3,4,7,8,9))))),1) AS `%OK`,round(((count(0) * 100) / (select count(0) from (`ejercicio_practica` `ep` join `practica` `p` on((`ep`.`practica` = `p`.`id`))) where ((`p`.`nombre` like '%_3') and (`p`.`numsesion` in (1,2,3,4,7,8,9))))),1) AS `%hechos` from (((`alumno` `a` join `alumno_ejercicio_practica` `aep` on((`a`.`cuasi` = `aep`.`alumno`))) join `ejercicio_practica` `ep` on((`aep`.`ejerciciopractica` = `ep`.`id`))) join `practica` `p` on((`ep`.`practica` = `p`.`id`))) where (`p`.`numsesion` in (1,2,3,4,7,8,9)) group by `a`.`cuasi`,`a`.`apellidos`,`a`.`nombre` order by `a`.`nombre`,`a`.`apellidos` */;
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

-- Dump completed on 2023-01-17 18:34:58
