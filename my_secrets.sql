-- MySQL dump 10.13  Distrib 5.6.16, for osx10.7 (x86_64)
--
-- Host: localhost    Database: my_secrets_development
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150415145632'),('20150415153657'),('20150416111308');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secrets`
--

DROP TABLE IF EXISTS `secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secrets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT '',
  `content` text,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secrets`
--

LOCK TABLES `secrets` WRITE;
/*!40000 ALTER TABLE `secrets` DISABLE KEYS */;
INSERT INTO `secrets` VALUES (1,1,'first my1','first content',0,'2015-04-15 16:10:43','2015-04-16 08:45:01'),(2,1,'second','second content',0,'2015-04-15 16:11:11','2015-04-15 16:11:11'),(3,NULL,'third','third content',1,'2015-04-16 08:31:04','2015-04-16 08:31:04'),(4,NULL,'third','third content',1,'2015-04-16 08:35:50','2015-04-16 08:35:50'),(5,NULL,'third','third content',0,'2015-04-16 08:36:21','2015-04-16 08:36:21'),(13,3,'3','3',0,'2015-04-16 09:04:21','2015-04-16 09:04:21'),(16,1,'3','3',0,'2015-04-16 09:33:23','2015-04-16 09:33:23'),(22,4,'3','third content',0,'2015-04-16 10:08:24','2015-04-16 10:29:07'),(23,10,'s123','s1 content',1,'2015-04-16 17:17:46','2015-04-17 06:52:34'),(25,11,'admin Sec','sec content',1,'2015-04-16 20:05:17','2015-04-16 20:05:17'),(26,16,'t','t',1,'2015-04-17 06:05:16','2015-04-17 06:05:16'),(27,10,'secret','secret\r\n',1,'2015-04-17 07:02:24','2015-04-17 07:02:24'),(28,15,'user1','user',1,'2015-04-17 07:26:09','2015-04-17 07:29:04'),(32,15,'n','n',0,'2015-04-17 08:33:20','2015-04-17 08:33:20'),(33,25,'y','yy',1,'2015-04-17 08:36:46','2015-04-17 08:36:46'),(34,26,'secret','secret content',1,'2015-04-17 09:41:25','2015-04-17 09:42:01'),(35,23,'admin secret','admin secret content\r\n',1,'2015-04-17 09:43:15','2015-04-17 09:43:15');
/*!40000 ALTER TABLE `secrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `usertype` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'wsd','wsd@usc.edu',0,1,'2015-04-16 15:54:29','2015-04-17 09:41:49','$2a$10$3FY/SfKXYNCUn1rSNUeFFe6Ks9SKEEWmuAR9em5VFxmnMPolKe72u'),(23,'admin','admin@secret.com',1,1,'2015-04-17 07:21:57','2015-04-17 07:21:57','$2a$10$PtN1Vm/gnS9.IP6vB5ABM.USdPUVig6NcJaMV435VxXRe/rtCtH6u'),(26,'user','user@usercompany.com',0,1,'2015-04-17 09:41:10','2015-04-17 09:41:10','$2a$10$tV7AGhGjG6DRCLLiMBYfquTm.82DH/m2QJ1.uyNMDU5PPgQw4q626');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-17  2:44:38
