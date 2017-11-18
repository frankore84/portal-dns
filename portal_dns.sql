-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: portal_dns
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(18) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(12) DEFAULT NULL,
  `customer_mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'20601642914','C.C.INITIATIVE PERU SOCIEDAD ANONIMA CERRADA','americatel','Avenida Sucre Nro. 755','Pueblo Libre','Serna Padilla, Oscar','940410742',NULL),(2,'20101250572','CONSORCIO DE INGS EJECUTORES MINEROS S.A.','americatel','Calle El Sauce Nro. 195 Urb. Rinconada El Sauce','La Molina','Aedo Perez, Gerardo','999711317',NULL),(3,'20507207058','RM & LOGISTICS S.A.C','americatel','Pasaje Ernesto Molina Nro. 151','Magdalena del Mar','Orellana Dávila, Evelina Trinidad','12638724',NULL),(4,'20193309586','LOS FRUTALES S.A.C. DEPOSITO DE ADUANAS','americatel','Av Los Frutales 333','Ate ','Castello Jara, Jorge','14375844',NULL),(5,'20117227848','PROYECTOS ESPECIALES PACIFICO S.A.','americatel','Avenida Republica De Panama Nro. 3635','San Isidro','Rivera Rojas, Marcos','16114100',NULL),(6,'20343016973','AGENCIA DE ADUANA OCEANO ANTARTICO S.A.','americatel','Jr Las Avestruces 157 Bellavista','Bellavista','Valdivia Chavez, Nestor','14510742',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(250) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `server_group_id` int(11) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `fk_domain_server_group_idx` (`server_group_id`),
  KEY `fk_domain_customer` (`customer_id`),
  CONSTRAINT `fk_domain_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_domain_server_group` FOREIGN KEY (`server_group_id`) REFERENCES `server_group` (`server_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'spaitic.com',1,1,'2017-11-13 16:27:02'),(2,'cpaperu.com',1,1,'2017-11-13 16:27:02'),(3,'ccinitiativesac.com',1,1,'2017-11-13 16:27:02'),(4,'casanhilarion.com',2,1,'2017-11-13 16:27:02'),(5,'lpa.com.pe',3,1,'2017-11-13 16:27:02'),(6,'losfrutalessac.com',4,1,'2017-11-13 16:27:02'),(7,'pepsa.com.pe',5,1,'2017-11-13 16:27:02'),(8,'oceanoantartico.com',6,1,'2017-11-13 16:27:02');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_group`
--

DROP TABLE IF EXISTS `server_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_group` (
  `server_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `server_group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`server_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_group`
--

LOCK TABLES `server_group` WRITE;
/*!40000 ALTER TABLE `server_group` DISABLE KEYS */;
INSERT INTO `server_group` VALUES (1,'NS Americatel');
/*!40000 ALTER TABLE `server_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'portal_dns'
--

--
-- Dumping routines for database 'portal_dns'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_CUSTOMER_Q01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CUSTOMER_Q01`(
IN _ruc varchar(18),
IN _company_name varchar(100),
IN _password varchar(255)

)
BEGIN

	SELECT
		customer_id,
		ruc,
		company_name,
		password,
		address,
		city,
		contact_name,
		contact_phone	
	FROM customer
    WHERE 
		(_ruc is null or _ruc = '' or ruc = _ruc)
	AND (_company_name is null or _company_name = '' or company_name LIKE CONCAT('%', _company_name , '%'))
    AND (_password is null or _password = '' or password = _password);
    
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DOMAIN_Q01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DOMAIN_Q01`(
IN _domain varchar(250),
IN _customer_id int,
IN _server_group_id int
)
BEGIN

		SELECT
			 d.domain_id
            ,d.domain
            ,c.customer_id
            ,c.ruc
            ,c.company_name
            ,s.server_group_id
            ,s.server_group_name
		FROM
			domain d
            inner join customer c on (d.customer_id = c.customer_id)
			inner join server_group s on (d.server_group_id = s.server_group_id)
		WHERE 
			(_domain is null or _domain = '' or d.domain LIKE CONCAT('%', _domain , '%'))
		AND (_customer_id = -1 or d.customer_id = _customer_id)
        AND (_server_group_id = -1 or d.server_group_id = _server_group_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 20:05:08
