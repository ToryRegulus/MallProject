-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int unsigned DEFAULT NULL,
  `goodsid` int unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `num` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES (1,1,7,'华为p100',3250.00,2),(2,1,6,'小米T2000',4500.00,1),(3,2,5,'红色连衣裙',320.00,1),(4,2,4,'T恤衫',200.00,3),(5,2,3,'粉色儿童装',120.00,1);
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-15 01:18:55.285214'),(2,'auth','0001_initial','2019-11-15 01:18:56.401407'),(3,'admin','0001_initial','2019-11-15 01:18:58.728767'),(4,'admin','0002_logentry_remove_auto_add','2019-11-15 01:18:59.218537'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-15 01:18:59.269503'),(6,'contenttypes','0002_remove_content_type_name','2019-11-15 01:18:59.876011'),(7,'auth','0002_alter_permission_name_max_length','2019-11-15 01:19:00.179505'),(8,'auth','0003_alter_user_email_max_length','2019-11-15 01:19:00.548513'),(9,'auth','0004_alter_user_username_opts','2019-11-15 01:19:00.589298'),(10,'auth','0005_alter_user_last_login_null','2019-11-15 01:19:00.846517'),(11,'auth','0006_require_contenttypes_0002','2019-11-15 01:19:00.853505'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-15 01:19:00.874076'),(13,'auth','0008_alter_user_username_max_length','2019-11-15 01:19:01.191182'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-15 01:19:01.896264'),(15,'auth','0010_alter_group_name_max_length','2019-11-15 01:19:02.318452'),(16,'auth','0011_update_proxy_permissions','2019-11-15 01:19:02.375278'),(17,'sessions','0001_initial','2019-11-15 01:19:02.546104'),(18,'auth','0012_alter_user_first_name_max_length','2021-01-27 02:38:23.951281');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('19aw16zh4xwb8oo1yrpnkjsruqvs1rks','ZmU0MDdiOWFjMDE0YzJmY2FmNGExZjgwNTQ5NTI4OWUwMTg3YzViZDp7ImFkbWluIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwibmFtZSI6IkFkbWluIiwicGFzc3dvcmQiOiJZV1J0YVc0PSIsImFkZHJlc3MiOiJcdTUzMTdcdTRlYWNcdTVlMDJcdTY3MWRcdTk2MzNcdTUzM2FcdTU5MjdcdTVjNzFcdTViNTAwMDdcdTUzZjciLCJwaG9uZSI6IjEzNTY2Njg2ODY4IiwiZW1haWwiOiIxMjI3OTQxMDVAcXEuY29tIiwiY29kZSI6IjEwMDA4NiIsInN0YXRlIjowfX0=','2019-12-26 03:49:24.978028'),('8jvvyu7epdlpjlz1l8k5o8wqqopbbfti','ZTdlMDQ2ZmUxNzJkNzI2N2EwMzExZjQ4YTgyODNjNjc4NmJlM2VkNTp7InNob3BsaXN0Ijp7fSwidXNlciI6eyJpZCI6OSwidXNlcm5hbWUiOiJ6aGFvbGl1IiwibmFtZSI6Ilx1OGQ3NVx1NTE2ZCIsInBhc3N3b3JkIjoiZW1oaGIyeHBkUT09IiwiYWRkcmVzcyI6Ilx1NjIxMFx1OTBmZFx1NWUwMlx1OTUyNlx1NmM1Zlx1NTMzYVx1NTJiY1x1NGViYVx1OGRlZjM4Nlx1NTNmNyIsInBob25lIjoiMTIzNDUiLCJlbWFpbCI6InpoYW9saXVAemhhb2xpdS5jb20iLCJjb2RlIjoiNjEwMDExIiwic3RhdGUiOjF9LCJhZG1pbiI6eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsIm5hbWUiOiJBZG1pbiIsInBhc3N3b3JkIjoiWVdSdGFXND0iLCJhZGRyZXNzIjoiXHU1MzE3XHU0ZWFjXHU1ZTAyXHU2NzFkXHU5NjMzXHU1MzNhXHU1OTI3XHU1YzcxXHU1YjUwMDA3XHU1M2Y3IiwicGhvbmUiOiIxMzU2NjY4Njg2OCIsImVtYWlsIjoiMTIyNzk0MTA1QHFxLmNvbSIsImNvZGUiOiIxMDAwODYiLCJzdGF0ZSI6MH19','2019-12-24 08:25:23.318939'),('ffzd2b3zx6uqjjm1xypwkwjcftsmfzm2','.eJwtjs0OgyAQhN-Fs2mA5ddT-x5ctoCpSdUqkh6M796lMZDJzsyXhYNhmsaZ9QcbE-tFx2rJ24xTZv1Vdeyyj8t-sJTvshHOpJAgB-ktarpoFTivkGeFjoshAtGY0pZLIThUDcKGqjJGmjOXoRorUqjeALQWkNRLYnS0gvSpOefNwmDby69lbj8RoI0xrh1K84Tju6VSWq8E1_d1vcVloiou6c_TFmfIlx13Cvh5_gDMQ0cU:1l4aJP:Nelkgt2NTn-6A37Chh_Pk7i9SEFzkepr5wJd8dIWB2E','2021-02-10 02:12:03.890846'),('uo4xfc8qyqbki7wat498fq5ppha7x00u','NjM5MGE3YzllOTZlMGI2YTFhM2Y0ZmViYzZjZjliNThkODAzODA0YTp7InZlcmlmeWNvZGUiOiJMN0Y3IiwiYWRtaW4iOnsidXNlcm5hbWUiOiJhZG1pbiIsIm5hbWUiOiJBZG1pbiIsInBhc3N3b3JkIjoiWVdSdGFXND0iLCJhZGRyZXNzIjoiXHU1MzE3XHU0ZWFjXHU1ZTAyXHU2NzFkXHU5NjMzXHU1MzNhXHU1OTI3XHU1YzcxXHU1YjUwMDA3XHU1M2Y3IiwicGhvbmUiOiIxMzU2NjY4Njg2OCIsImVtYWlsIjoiMTIyNzk0MTA1QHFxLmNvbSIsInN0YXRlIjowfSwic2hvcGxpc3QiOnsiNCI6eyJpZCI6NCwidHlwZWlkIjozLCJnb29kcyI6IlRcdTYwNjRcdTg4NmIiLCJjb21wYW55IjoiXHU0ZTAzXHU1MzM5XHU3MmZjIiwicHJpY2UiOjIwMC4wLCJwaWNuYW1lIjoiMTU3NDY0OTE0NC45NTY1MDMyLmpwZyIsInN0b3JlIjo0MCwibnVtIjowLCJjbGlja251bSI6NDgsInN0YXRlIjoxLCJtIjo2fSwiOCI6eyJpZCI6OCwidHlwZWlkIjo0LCJnb29kcyI6Ilx1NGY3M1x1ODBmZDI5MTAiLCJjb21wYW55IjoiXHU0ZjczXHU4MGZkIiwicHJpY2UiOjk5OS4wLCJwaWNuYW1lIjoiMTU3NDY0OTM5My4yOTg2OTYuanBnIiwic3RvcmUiOjMwLCJudW0iOjAsImNsaWNrbnVtIjoxLCJzdGF0ZSI6MSwibSI6M319fQ==','2019-12-10 04:18:19.173319');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int unsigned NOT NULL,
  `goods` varchar(32) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `content` text,
  `price` double(6,2) unsigned NOT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `store` int unsigned NOT NULL DEFAULT '0',
  `num` int unsigned NOT NULL DEFAULT '0',
  `clicknum` int unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,9,'连衣裙','香奈儿','香奈儿的连衣裙',385.00,'1574151358.8798356.jpg',20,0,3,1,'2019-11-19 08:15:58'),(2,6,'联想','联想T4000','联想电脑',3980.00,'1574163445.5454707.jpg',10,0,3,1,'2019-11-19 11:37:25'),(3,7,'粉色儿童装','巴拉巴拉','巴拉巴拉儿童装',120.00,'1574649050.7357385.jpg',50,0,2,1,'2019-11-25 02:30:51'),(4,3,'T恤衫','七匹狼','七匹狼男装',200.00,'1574649144.9565032.jpg',40,0,49,1,'2019-11-25 02:32:24'),(5,9,'红色连衣裙','佰可依','佰可依连衣裙',320.00,'1574649247.7387948.jpg',20,0,1,1,'2019-11-25 02:34:07'),(6,8,'小米T2000','小米','小米手机',4500.00,'1574649285.4107904.jpg',32,0,26,1,'2019-11-25 02:34:45'),(7,8,'华为p100','华为','华为粉色手机',3250.00,'1574649352.4440417.jpg',40,0,1,1,'2019-11-25 02:35:52'),(8,4,'佳能2910','佳能','佳能粉色相机',999.00,'1574649393.298696.jpg',30,0,1,1,'2019-11-25 02:36:33'),(9,4,'佳能2800','佳能','佳能黑色相机',1200.00,'1574649438.8471856.jpg',20,0,1,1,'2019-11-25 02:37:18'),(10,7,'儿童套装','安踏儿童','安踏儿童装',200.00,'1574649488.7034283.jpg',15,0,0,1,'2019-11-25 02:38:08'),(11,9,'橙色连衣裙','GAP','GAP连衣裙',429.00,'1574649543.5130486.jpg',18,0,0,1,'2019-11-25 02:39:03');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned DEFAULT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `total` double(8,2) unsigned DEFAULT NULL,
  `state` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,9,'赵六','成都市锦江区劼人路386号','610011','12345','2019-11-27 01:47:50',11000.00,0),(2,9,'赵六','成都市锦江区劼人路386号','610011','12345','2019-11-27 02:03:02',1040.00,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pid` int unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'服装',0,'0,'),(2,'数码',0,'0,'),(3,'男装',1,'0,1,'),(4,'相机',2,'0,2,'),(5,'食品',0,'0,'),(6,'电脑',2,'0,2,'),(7,'儿童装',1,'0,1,'),(8,'手机',2,'0,2,'),(9,'女装',1,'0,1,'),(11,'特色小吃',5,'0,5,');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `sex` tinyint unsigned NOT NULL DEFAULT '1',
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','Admin','21232f297a57a5a743894a0e4a801fc3',1,'北京市朝阳区大山子007号','100086','13566686868','122794105@qq.com',0,'2018-04-07 21:20:08'),(2,'zhangsan','张三','01d7f40760960e7bd9443513f22ab9af',1,'成都市龙泉驿区建材路26号','610100','12345','zhangsan@126.com',0,'2019-11-14 05:36:12'),(3,'xiaohong','小红','1167eac4687a0d8aae4d01efe9274cda',0,'成都市龙泉驿区建材路27号','610100','12345','xiaohong@126.com',0,'2019-11-14 05:43:32'),(7,'lisi','李四','dc3a8f1670d65bea69b7b65048a0ac40',0,'成都市锦江区劼人路386号','610011','12345','lisi@163.com',2,'2019-11-14 08:28:13'),(8,'wangwu','王五','9f001e4166cf26bfbdd3b4f67d9ef617',1,'成都市锦江区劼人路386号','610011','12345','wangwu@yahoo.com',2,'2019-11-14 08:34:14'),(9,'zhaoliu','赵六','27311020efc4ce2806feca0aab933fbd',0,'成都市锦江区劼人路386号','610011','12345','zhaoliu@zhaoliu.com',1,'2019-11-14 12:15:34'),(10,'sunqi','孙七','9ceb8eb2cad7d1d49f718ea264f56f0f',1,'成都市锦江区劼人路386号','610011','12345','sunqi@sunqi.com',1,'2019-11-14 12:18:18'),(11,'zhouba','周八','3835f66c0da66bc389adc8d50db76f10',0,'成都市武侯区国学巷26号','610041','1234567','zhouba@zhouba.com',1,'2019-11-14 13:15:51'),(12,'xiaowang','小王','0c8c4eeb19abc6c501b59287ba5ae9e4',1,'成都市武侯区国学巷55号','610041','1234567','xiaowang@126.com',2,'2019-11-14 13:17:46'),(13,'xiaoqi','小七','e6c0b6f797eb786539fdc917ca8fc3d9',0,'成都市武侯区国学巷26号','610041','1234567','xiaoqi@gmail.com',1,'2019-11-14 13:18:37'),(14,'wujiu','吴九','adc33b567d8ee111cd99b9548025b94b',1,'成都市武侯区国学巷12号','610041','1234567','wujiu@wujiu.com',1,'2019-11-14 13:22:00'),(15,'zhengshi','郑十','3da95c7de13268a77293d68907b7ae6e',1,'成都市锦江区春熙路27号','610011','1234567','zhengshi@zhengshi.com',1,'2019-11-14 13:28:07'),(16,'xiaoming','小明','97304531204ef7431330c20427d95481',1,'成都市锦江区春熙路33号','610011','123456789','xiaoming@126.com',2,'2019-11-14 13:29:54'),(17,'xiaoqiang','小强','a2ffa5c9be07488bbb04a3a47d3c5f6a',1,'成都市锦江区春熙路166号','610041','123456789','xiaoqiang@hotmail.com',2,'2019-11-14 13:30:59'),(18,'xiaoshu','小姝','71b6c7ba2fba52a10b0b0c7c8c09b9bc',0,'成都市龙泉驿区红岭路388号','610100','123456789','xiaoshu@outlook.com',1,'2019-11-14 13:32:31'),(19,'xueying','雪樱','558191721f3e8851ef282c5fb334835a',1,'成都市龙泉驿区红岭路388号','610100','123456789','xueying@gamil.com',1,'2019-11-14 13:33:30'),(20,'daochengsizhong','道成寺钟','4950c886ff746b3de336eb08d42c554f',1,'成都市龙泉驿区红岭路380号','610100','123456789','daochengsizhong@126.com',1,'2019-11-14 13:34:17'),(21,'hui','灰','917a34072663f9c8beea3b45e8f129c5',0,'成都市龙泉驿区红岭路27号','610100','123456789','hui@163.com',1,'2019-11-14 13:34:51'),(22,'hongmeiling','红美铃','2e217a6be0ff5714b0bade8f1c637eef',1,'成都市武侯区国学巷34号','610041','12345124','hongmeiling@126.com',1,'2019-11-14 13:35:53'),(23,'yongyuvoid','空羽void','b1d94721a39130cfb9bd088562eed4ba',1,'成都市武侯区国学巷156号','610041','1231155','kongyuvoid@gmail.com',1,'2019-11-14 13:36:46'),(24,'zaomiaomeiyouganjin','早苗没有干劲','61a2fa7e950a835125a0b1c4d24a6559',1,'成都市锦江区春熙路27号','610011','1234512446','zaomiaomeiyouganjin@126.com',1,'2019-11-14 13:37:53'),(25,'yeshanyoumu','楪山柚木','413826e233db6333ae95bbb8ed3ccb5e',0,'成都市龙泉驿区红岭路341号','610100','1774411333','yeshanyoumu@outlook.com',1,'2019-11-14 13:39:40'),(26,'XBOX','','3a3417f5f20a03a98973689887fb72a2',1,'','','','',1,'2019-11-22 04:04:50'),(27,'PS4','','0e740342f31e9aa65ae671ea1ec61413',1,'','','','',1,'2019-11-22 04:08:53');
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

-- Dump completed on 2021-01-27 10:39:02
