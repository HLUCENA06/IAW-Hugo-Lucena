/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: radio
-- ------------------------------------------------------
-- Server version	11.4.13-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `podcasts`
--

DROP TABLE IF EXISTS `podcasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `podcasts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) NOT NULL,
  `programa` varchar(80) NOT NULL,
  `minutos` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podcasts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `podcasts` WRITE;
/*!40000 ALTER TABLE `podcasts` DISABLE KEYS */;
INSERT INTO `podcasts` VALUES
(1,'Las corvinas de octubre','Cocina de lonja',28,'2026-10-20'),
(2,'Entrevista a la cofradía de pescadores','La tertulia del muelle',52,'2026-10-26'),
(3,'Especial rock andaluz','Mareas de rock',58,'2026-10-27'),
(4,'El faro y sus fareros','Faro de medianoche',45,'2026-10-29'),
(5,'Final del torneo de barrio','Deporte de barrio',40,'2026-10-30'),
(6,'Atún de almadraba, paso a paso','Cocina de lonja',31,'2026-11-03');
/*!40000 ALTER TABLE `podcasts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `programas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` varchar(10) NOT NULL,
  `hora` time NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `locutor` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES
(1,'lunes','07:00:00','Despierta, Marea','Lola Ruiz'),
(2,'lunes','10:00:00','La tertulia del muelle','Paco Vela'),
(3,'lunes','13:00:00','Noticias del puerto','Redacción'),
(4,'lunes','22:00:00','Faro de medianoche','Toni Ancla'),
(5,'martes','07:00:00','Despierta, Marea','Lola Ruiz'),
(6,'martes','11:00:00','Cocina de lonja','Rocío Sal'),
(7,'martes','13:00:00','Noticias del puerto','Redacción'),
(8,'martes','18:00:00','Mareas de rock','Inés Barca'),
(9,'miercoles','07:00:00','Despierta, Marea','Lola Ruiz'),
(10,'miercoles','10:00:00','La tertulia del muelle','Paco Vela'),
(11,'miercoles','13:00:00','Noticias del puerto','Redacción'),
(12,'miercoles','20:00:00','Deporte de barrio','Juanma Remo'),
(13,'jueves','07:00:00','Despierta, Marea','Lola Ruiz'),
(14,'jueves','11:00:00','Cocina de lonja','Rocío Sal'),
(15,'jueves','13:00:00','Noticias del puerto','Redacción'),
(16,'jueves','18:00:00','Mareas de rock','Inés Barca'),
(17,'viernes','07:00:00','Despierta, Marea','Lola Ruiz'),
(18,'viernes','13:00:00','Noticias del puerto','Redacción'),
(19,'viernes','20:00:00','Deporte de barrio','Juanma Remo'),
(20,'viernes','22:00:00','Faro de medianoche','Toni Ancla');
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-23 18:25:41
