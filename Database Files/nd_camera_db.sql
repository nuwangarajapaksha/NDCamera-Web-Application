CREATE DATABASE  IF NOT EXISTS `nd_camera_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nd_camera_db`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: nd_camera_db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'2023-06-15 19:49:08.030000','2023-08-12 23:55:14.350000','Nikon','nikon-logo.png',1),(2,'2023-06-15 19:49:08.030000','2023-08-10 19:30:22.245000','Canon','canon-logo.png',1),(3,'2023-06-15 19:49:08.030000','2023-06-15 19:49:08.030000','Sony','sony-logo.jpg',1),(4,'2023-06-15 19:49:08.030000','2023-06-15 19:49:08.030000','GoPro','gopro-logo.png',1),(22,'2023-08-12 23:13:13.442000','2023-10-15 21:03:48.412000','nuwa','1694198498109_canon-logo.png',0),(23,'2023-08-16 16:28:29.431000','2023-08-16 16:29:44.911000','Nuwanga','1692183509382_canon-logo.png',0),(24,'2023-08-16 16:29:04.400000','2023-08-16 16:29:42.304000','333','1692183562137_banner-1.jpg',0),(25,'2023-08-19 22:45:52.111000','2023-08-19 22:46:04.030000','n','1692465352103_gopro-hero9-black.jpg',0),(26,'2023-08-27 13:25:32.004000','2023-08-27 13:31:05.243000','Ashen Indula','1693122931941_gopro-hero9-black.jpg',0);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ehbhl1s72v0lm45hi2kiw8fkb` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (1,NULL,'2023-08-11 13:33:46.442000','logo','logo.png'),(2,NULL,'2023-08-11 13:29:52.997000','email','hello@ndcamera.com'),(3,NULL,'2023-08-11 13:54:34.648000','contact-number','+94 732 638 491'),(4,NULL,'2023-08-11 13:35:49.081000','slider-img','banner.jpg'),(5,NULL,'2023-08-12 00:24:06.307000','slider-caption','New'),(6,NULL,'2023-08-11 13:53:26.290000','slider-title','DJI Gimble'),(7,NULL,'2023-08-11 13:29:53.079000','slider-subtitle','New Stock Available'),(8,NULL,'2023-08-11 13:37:01.832000','home-banner-img','banner-1.jpg,banner-2.jpg'),(9,NULL,'2023-08-11 13:29:53.034000','address','263, Highlevel Road, Colombo 05 00500 - Western'),(10,NULL,'2023-08-12 00:24:20.039000','nav-caption','Delivery Available'),(11,NULL,'2023-08-11 13:38:00.847000','breadcrumb-img','breadcrumb.jpg'),(12,NULL,'2023-08-11 13:29:53.112000','delivery-charges','400'),(13,NULL,'2023-08-20 01:45:58.432000','open-time','9:00 a.m. to 7:00 p.m.'),(14,NULL,'2023-08-11 13:29:53.045000','location','https://www.google.com/maps/search/CameraLK/@6.8879884,79.8632827,15z/data=!3m1!4b1?authuser=0&entry=ttu'),(15,NULL,'2023-08-11 13:29:52.983000','app-name','NDCamera');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `qty` int NOT NULL,
  `product` bigint DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKshu96dhjmw9ld1x5hapdw4do9` (`user`),
  KEY `FK6tfisfw20mss46ytlkx6jrhmj` (`product`),
  CONSTRAINT `FK6tfisfw20mss46ytlkx6jrhmj` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FKshu96dhjmw9ld1x5hapdw4do9` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (56,'2023-08-08 21:15:00.298000','2023-08-09 09:51:24.154000',2,1,26),(58,'2023-08-09 09:52:12.859000','2023-08-09 09:52:12.859000',1,3,26),(110,'2023-10-15 19:21:49.470000','2023-10-15 19:21:49.470000',1,2,24);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `qty` int NOT NULL,
  `orders` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjisa73epwl4dwh3rbo3i3jxpv` (`orders`),
  KEY `FKmulv4gttli0eov5xuhm7v9td7` (`product`),
  CONSTRAINT `FKjisa73epwl4dwh3rbo3i3jxpv` FOREIGN KEY (`orders`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKmulv4gttli0eov5xuhm7v9td7` FOREIGN KEY (`product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (105,'2023-08-20 11:36:18.347000','2023-08-20 11:36:18.347000',1,1,1,3),(106,'2023-08-20 11:36:18.380000','2023-08-20 11:36:18.380000',1,2,1,4),(107,'2023-08-20 11:48:34.421000','2023-08-20 11:48:34.422000',1,1,2,2),(108,'2023-08-20 12:03:04.127000','2023-08-20 12:03:04.127000',1,3,3,6),(109,'2023-08-20 12:05:08.824000','2023-08-20 12:05:08.824000',1,4,4,4),(110,'2023-08-20 12:05:08.843000','2023-08-20 12:05:08.843000',1,1,4,3),(111,'2023-08-20 12:05:08.862000','2023-08-20 12:05:08.862000',1,2,4,1),(112,'2023-08-20 12:06:17.976000','2023-08-20 12:06:17.976000',1,1,5,1),(113,'2023-08-20 12:07:33.283000','2023-08-20 12:07:33.283000',1,1,6,1),(114,'2023-08-20 12:08:26.883000','2023-08-20 12:08:26.883000',1,1,7,2),(115,'2023-08-20 12:15:46.407000','2023-08-20 12:15:46.407000',1,1,8,3),(116,'2023-08-20 12:16:28.163000','2023-08-20 12:16:28.163000',1,1,9,1),(117,'2023-08-20 12:17:18.446000','2023-08-20 12:17:18.446000',1,1,10,1),(118,'2023-08-20 12:17:38.771000','2023-08-20 12:17:38.771000',1,1,11,2),(119,'2023-10-15 18:30:35.172000','2023-10-15 18:30:35.172000',1,1,12,2),(120,'2023-10-15 18:30:35.233000','2023-10-15 18:30:35.233000',1,1,12,3),(121,'2023-10-15 19:22:12.685000','2023-10-15 19:22:12.685000',1,4,13,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `users` bigint DEFAULT NULL,
  `item_count` int DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery` double DEFAULT NULL,
  `paymentType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe31r5d0xqe6sh0ikdpaqekl23` (`users`),
  CONSTRAINT `FKe31r5d0xqe6sh0ikdpaqekl23` FOREIGN KEY (`users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-08-20 11:36:18.325000','2023-08-20 11:36:18.325000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,2,'PROCESSING',400,'Cash On Delivery',504300),(2,'2023-08-20 11:48:34.379000','2023-10-15 18:52:41.844000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'RETURNED',400,'Cash On Delivery',589900),(3,'2023-08-20 12:03:04.086000','2023-08-20 12:03:04.086000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'PROCESSING',400,'Cash On Delivery',2517400),(4,'2023-08-20 12:05:08.810000','2023-08-20 12:05:08.810000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,3,'PROCESSING',400,'Cash On Delivery',1343304),(5,'2023-08-20 12:06:17.967000','2023-08-20 12:06:17.967000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'PROCESSING',400,'Cash On Delivery',307902),(6,'2023-08-20 12:07:33.273000','2023-08-20 12:07:33.273000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'PROCESSING',400,'Cash On Delivery',307902),(7,'2023-08-20 12:08:26.871000','2023-10-15 18:53:23.675000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'DELIVERED',400,'Cash On Delivery',589900),(8,'2023-08-20 12:15:46.399000','2023-10-15 18:53:19.558000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'DELIVERED',400,'Cash On Delivery',280300),(9,'2023-08-20 12:16:28.155000','2023-10-15 18:52:58.939000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'COMPLETED',400,'Cash On Delivery',307902),(10,'2023-08-20 12:17:18.441000','2023-10-15 18:52:49.729000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'COMPLETED',400,'Cash On Delivery',307902),(11,'2023-08-20 12:17:38.761000','2023-10-15 18:52:45.817000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,1,'COMPLETED',400,'Cash On Delivery',589900),(12,'2023-10-15 18:30:35.104000','2023-10-15 18:52:13.358000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','','60011',24,2,'PROCESSING',400,'Cash On Delivery',869800),(13,'2023-10-15 19:22:12.655000','2023-10-15 19:22:12.655000',1,'292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','Nuwanga','heee','60011',24,1,'PROCESSING',400,'Cash On Delivery',1230408);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` bigint DEFAULT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FKti0lsgnnoerhclcve20iho3un` (`brand`),
  CONSTRAINT `FKti0lsgnnoerhclcve20iho3un` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2023-06-22 00:39:21.368000','2023-08-20 01:47:34.860000',_binary '','Designed as a true all-rounder, the Nikon D7500 is a DX-format DSLR offering a versatile feature-set to appeal to photographers and videographers alike','nikon-d7500-camera.jpg','Nikon D7500 DSLR Camera',307502,'camera',1,1),(2,'2023-06-22 00:39:21.368000','2023-06-22 00:39:21.368000',_binary '','Mixing a contemporary imaging approach with traditional form and function, the Nikon D780 is a versatile DSLR excelling in both photography and video applications. ','nikon-d780-camera.jpg','Nikon D780 DSLR Camera',589500,'camera',1,1),(3,'2023-06-22 00:39:21.368000','2023-06-22 00:39:21.368000',_binary '','This multimedia maven offers a newly developed 30.4MP full-frame CMOS sensor paired with the DIGIC 6+ image processor in order to balance fine detail and resolution with low-light performance and sensitivity. ','canon-eos5dmarkIV-camera.jpg','Canon EOS 5D Mark IV DSLR Camera',279900,'camera',2,1),(4,'2023-06-22 00:39:21.368000','2023-06-22 00:39:21.368000',_binary '','Creating distinctive stories with DSLR quality photos and Full HD movies is easier than you think with the 18MP Canon EOS 4000D DSLR Camera. ','canon-eos4000d-camera.jpeg','Canon EOS 4000D DSLR Camera',112000,'camera',2,1),(5,'2023-06-22 00:39:21.368000','2023-06-22 00:39:21.368000',_binary '','Distinguished by its updated sensor design, the Alpha a7 III Mirrorless Digital Camera from Sony is a well-rounded camera suitable for both photo and video applications in a variety of working situations. ','sony-alphaa7III-camera.jpg','Sony Alpha a7 III Mirrorless Digital Camera',484900,'camera',3,1),(6,'2023-06-22 00:39:21.368000','2023-08-10 15:17:33.500000',_binary '','Designed as a professional photo+cinema camera for content creators to up their game, the ultra-compact black Sony ZV-E1 Mirrorless Camera provides cinematic looks to your vlogs, interviews, and product demonstrations. ','sony-zve1-camera.jpg','Sony ZV-E1 Mirrorless Camera',839000,'camera',3,1),(7,'2023-06-22 00:39:21.368000','2023-08-10 15:10:32.402000',_binary '','With improved digital features, a 27MP image sensor, and Wi-Fi capabilities, the GoPro HERO11 Black is the ultimate action camera to capture dynamic POV video up to 5.3K60. ','gopro-hero11-black.jpg','GoPro HERO11 Black',129900,'camera',4,1),(8,'2023-06-22 00:39:21.368000','2023-08-10 15:09:13.339000',_binary '','Capture up to 5K30 resolution video and maintain high detail even when zooming in. Packing a new 23.6MP sensor, the HERO9 Black brings lifelike image sharpness, fluid motion, and in-camera horizon leveling for optimal image quality.','gopro-hero9-black.jpg','GoPro HERO9 Black',88500,'camera',4,1),(19,'2023-08-19 22:44:32.429000','2023-08-19 22:45:36.646000',_binary '\0','ssssssssssssssssssssssssssssssssssssss','1692465272405_canon-eos4000d-camera.jpeg','Ashen Indula',50000,'cam',1,0),(20,'2023-08-20 01:50:15.771000','2023-08-20 01:50:15.771000',_binary '','ggggggggggggggggggggggggggggg','1692476415750_canon-logo.png','Nuwan',50001,'cam',1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_verified_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verification_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (24,'2023-05-30 22:19:13.732000','2023-09-08 11:04:10.630000',_binary '','292, Bathalehenewatta, Gonewala','kelaniya','0713848592','nuwangarajapaksha@gmail.com','2023-05-30 22:19:22.714000','Nuwanga','81dc9bdb52d04dc20036dbd8313ed055','60011','411c55fe-6ffa-4cdc-bbfd-822cf86eb5fb','ADMIN'),(25,'2023-06-04 23:56:43.366000','2023-08-16 10:15:15.754000',_binary '','292,Bathalahenawatta, Gonawala, Kelaniya','Kelaniya','0713848591','wwww@gmail.com',NULL,'444','81dc9bdb52d04dc20036dbd8313ed055','11630','10d82a43-de93-42e2-bc59-9b303a89289d','USER'),(26,'2023-06-14 21:56:17.931000','2023-08-17 23:41:53.035000',_binary '','292,Bathalahenawatta, Gonawala, Kelaniya','Kelaniya','0713848593','ashen@gmail.com','2023-06-18 15:22:13.564000','dd','81dc9bdb52d04dc20036dbd8313ed055','11630','30c5c38e-d3f3-4f30-9ac6-fb3e121c1f1e','USER'),(29,'2023-06-18 12:43:05.725000','2023-09-08 11:10:26.827000',_binary '','292,','kelaniya','0713848594','Chena@gmail.com','2023-06-18 15:23:18.012000','Ashen Indula','81dc9bdb52d04dc20036dbd8313ed055','60011','af215fc1-affb-4311-84fb-d93ac64b5846','USER'),(30,'2023-06-18 12:43:18.016000','2023-08-17 23:40:25.222000',_binary '\0','292,','kelaniya',NULL,'Camith@gmail.com','2023-06-18 15:23:36.275000','Ashen Indula','81dc9bdb52d04dc20036dbd8313ed055','60011','c78a3e7a-02eb-485c-b0a1-6003a5114ad8','USER'),(31,'2023-06-23 10:50:19.698000','2023-08-19 22:43:29.478000',_binary '\0','292,','kelaniya',NULL,'kamal@gmail.com','2023-06-23 10:50:50.926000','Ashen Indula','81dc9bdb52d04dc20036dbd8313ed055','60011','9b35fb6f-9194-4585-b038-6c27a3fa4c73','USER'),(55,'2023-08-19 22:38:19.258000','2023-08-19 22:38:19.258000',_binary '\0',NULL,NULL,NULL,'ww@gmail.com',NULL,'Ashen Indula','81dc9bdb52d04dc20036dbd8313ed055',NULL,'8baeeec5-e0bc-4dda-806c-0e76316437a7','USER'),(56,'2023-08-19 22:43:13.640000','2023-08-19 22:43:13.640000',_binary '\0',NULL,NULL,NULL,'34@gmail.com',NULL,'34','81dc9bdb52d04dc20036dbd8313ed055',NULL,'11fc4664-01cd-4892-a7cf-46d92667dc0d','ADMIN'),(57,'2023-09-08 10:25:35.840000','2023-09-08 10:25:35.840000',_binary '\0',NULL,NULL,NULL,'34@dd',NULL,'33','81dc9bdb52d04dc20036dbd8313ed055',NULL,'c362e978-d8e6-484f-8e65-a980d14b5fe6','USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqbrg1gnvyxhes1hm81lsqae5h` (`user`),
  KEY `FK2vy5bofpdruunu3a66h6xf725` (`product`),
  CONSTRAINT `FK2vy5bofpdruunu3a66h6xf725` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  CONSTRAINT `FKqbrg1gnvyxhes1hm81lsqae5h` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (10,'2023-06-21 22:17:06.246000','2023-06-21 22:17:06.246000',2,26),(14,'2023-06-23 13:18:20.406000','2023-06-23 13:18:20.406000',5,24),(15,'2023-08-09 09:51:33.049000','2023-08-09 09:51:33.049000',1,26),(19,'2023-08-19 22:39:18.915000','2023-08-19 22:39:18.915000',3,24),(20,'2023-08-20 00:36:08.264000','2023-08-20 00:36:08.264000',1,24),(21,'2023-08-20 01:01:41.148000','2023-08-20 01:01:41.148000',2,24);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-15 21:08:39
