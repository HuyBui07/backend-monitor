-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL,
  `contact_address` varchar(200) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `tax_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Thu Duc, Vietnam','1994-06-01',_binary '\0','Hai Minh','0979501701','HM_123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_seq`
--

DROP TABLE IF EXISTS `customer_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_seq`
--

LOCK TABLES `customer_seq` WRITE;
/*!40000 ALTER TABLE `customer_seq` DISABLE KEYS */;
INSERT INTO `customer_seq` VALUES (51);
/*!40000 ALTER TABLE `customer_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt`
--

DROP TABLE IF EXISTS `debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt` (
  `id` int NOT NULL,
  `already_paid` bit(1) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r6hu5y4r0r5bdkrp5y8ircnmi` (`order_id`),
  KEY `FKilsb1va8xfb8va46e6emoh7nf` (`customer_id`),
  CONSTRAINT `FK2hkxf3ou01pyihy4ln6u5i0q0` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`id`),
  CONSTRAINT `FKilsb1va8xfb8va46e6emoh7nf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt`
--

LOCK TABLES `debt` WRITE;
/*!40000 ALTER TABLE `debt` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt_seq`
--

DROP TABLE IF EXISTS `debt_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt_seq`
--

LOCK TABLES `debt_seq` WRITE;
/*!40000 ALTER TABLE `debt_seq` DISABLE KEYS */;
INSERT INTO `debt_seq` VALUES (1);
/*!40000 ALTER TABLE `debt_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_item`
--

DROP TABLE IF EXISTS `inventory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_item` (
  `id` int NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `imported_date` date DEFAULT NULL,
  `manufacturing_date` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `imported_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnlagkg4wldbng04fndb117wai` (`product_id`),
  KEY `FK19xsrqt167dam9vcd9n4v8957` (`warehouse_id`),
  CONSTRAINT `FK19xsrqt167dam9vcd9n4v8957` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `FKnlagkg4wldbng04fndb117wai` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_item`
--

LOCK TABLES `inventory_item` WRITE;
/*!40000 ALTER TABLE `inventory_item` DISABLE KEYS */;
INSERT INTO `inventory_item` VALUES (5,'2025-11-12','2024-04-16','2024-04-01',1,1,1,1),(6,'2024-04-30','2024-04-16','2024-04-01',99,1,1,1);
/*!40000 ALTER TABLE `inventory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_item_seq`
--

DROP TABLE IF EXISTS `inventory_item_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_item_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_item_seq`
--

LOCK TABLES `inventory_item_seq` WRITE;
/*!40000 ALTER TABLE `inventory_item_seq` DISABLE KEYS */;
INSERT INTO `inventory_item_seq` VALUES (101);
/*!40000 ALTER TABLE `inventory_item_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `inventory_item_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8kq6npeucy89uvw8llgpiatj6` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  KEY `FK49sgp05n6vmx0hahfqfpxnnid` (`inventory_item_id`),
  CONSTRAINT `FK49sgp05n6vmx0hahfqfpxnnid` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_item` (`id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK8kq6npeucy89uvw8llgpiatj6` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (3,1,9,NULL,6);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_seq`
--

DROP TABLE IF EXISTS `order_item_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_seq`
--

LOCK TABLES `order_item_seq` WRITE;
/*!40000 ALTER TABLE `order_item_seq` DISABLE KEYS */;
INSERT INTO `order_item_seq` VALUES (101);
/*!40000 ALTER TABLE `order_item_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table` (
  `id` int NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `deposited_money` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `order_type` enum('PURCHASE','SALE') DEFAULT NULL,
  `status` enum('PROCESSING','DELIVERING','COMPLETED','CANCELLED') DEFAULT NULL,
  `created_user_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `debt_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_as1tnb5cfoueixbt5bdyonqyk` (`debt_id`),
  KEY `FKnnnjs3vyp4lj6bdjjwsmbwq5n` (`created_user_id`),
  KEY `FKdit09e676nqbguvt1k1w8mlj2` (`customer_id`),
  CONSTRAINT `FK1mdachciudwskv572c4pipxgs` FOREIGN KEY (`debt_id`) REFERENCES `debt` (`id`),
  CONSTRAINT `FKdit09e676nqbguvt1k1w8mlj2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKnnnjs3vyp4lj6bdjjwsmbwq5n` FOREIGN KEY (`created_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (5,'2024-04-16 16:33:54.516912',NULL,0,'PURCHASE','COMPLETED',3,NULL,1,'2024-04-16 16:34:11.372795',NULL),(6,'2024-04-16 16:38:21.264591',NULL,0,'PURCHASE','PROCESSING',3,NULL,100,'2024-04-16 16:38:21.264591',NULL),(9,'2024-04-16 16:44:42.090168',0.5,0,'SALE','COMPLETED',3,1,0.5,'2024-04-16 16:45:52.255150',NULL);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table_new_inventory_items`
--

DROP TABLE IF EXISTS `order_table_new_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table_new_inventory_items` (
  `purchase_order_id` int NOT NULL,
  `new_inventory_items_id` int NOT NULL,
  UNIQUE KEY `UK_e7espfwoq02le6imniha8yrq3` (`new_inventory_items_id`),
  KEY `FK2vo22lv4g4gop3vrh841mtw51` (`purchase_order_id`),
  CONSTRAINT `FK2vo22lv4g4gop3vrh841mtw51` FOREIGN KEY (`purchase_order_id`) REFERENCES `order_table` (`id`),
  CONSTRAINT `FKg4hk09qb3migxvoc25ft006aj` FOREIGN KEY (`new_inventory_items_id`) REFERENCES `inventory_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table_new_inventory_items`
--

LOCK TABLES `order_table_new_inventory_items` WRITE;
/*!40000 ALTER TABLE `order_table_new_inventory_items` DISABLE KEYS */;
INSERT INTO `order_table_new_inventory_items` VALUES (5,5),(6,6);
/*!40000 ALTER TABLE `order_table_new_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table_seq`
--

DROP TABLE IF EXISTS `order_table_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table_seq`
--

LOCK TABLES `order_table_seq` WRITE;
/*!40000 ALTER TABLE `order_table_seq` DISABLE KEYS */;
INSERT INTO `order_table_seq` VALUES (101);
/*!40000 ALTER TABLE `order_table_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `calculation_unit` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `quantity_remaining` int DEFAULT '0',
  `quantity_solved` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `quantity_sold` int DEFAULT '0',
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Brick','Bricks for building','http://res.cloudinary.com/dhwz3ojau/image/upload/v1713258979/cms/products/Brick.jpg',_binary '\0','Brick','Vietnam',100,NULL,0.5,'2024-04-16 16:16:22.747467',1,'2024-04-16 16:44:42.099214');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seq`
--

LOCK TABLES `product_seq` WRITE;
/*!40000 ALTER TABLE `product_seq` DISABLE KEYS */;
INSERT INTO `product_seq` VALUES (51);
/*!40000 ALTER TABLE `product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `employee_type` enum('SALE','WAREHOUSE','SHIPPING') DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `started_working_date` date DEFAULT NULL,
  `user_type` enum('EMPLOYEE','MANAGER') DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Contact address 1','2000-12-30','employee1@gmail.com','1001','SALE',NULL,'Employee 1','$2a$10$G7rGeYxjVdSW67B25tA6keUJBnsOLua8wEoLg7039IB9oFl2kb46S','0123456789',1000,'2023-12-07','EMPLOYEE',_binary '\0'),(2,'Contact address 2','2000-12-30','employee2@gmail.com','1002','WAREHOUSE',NULL,'Employee 2','$2a$10$MctIcXpa04.XYtInNEnEJevi7D.Z/bynaHXh3hUMYhvU675eRFZKW','0123456789',1000,'2023-12-07','EMPLOYEE',_binary '\0'),(3,'Manager\'s Contact address','2000-12-30','manager@gmail.com',NULL,NULL,NULL,'Manager','$2a$10$HoPtZmkNcmvXaikD7inrwu6zIrKJiI9.Ue9CkKp84UI9lE9ynPS2y','0123456789',NULL,'2023-12-07','MANAGER',_binary '\0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (1);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `capacity` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Da Nang, Vietnam',1000000);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_seq`
--

DROP TABLE IF EXISTS `warehouse_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_seq`
--

LOCK TABLES `warehouse_seq` WRITE;
/*!40000 ALTER TABLE `warehouse_seq` DISABLE KEYS */;
INSERT INTO `warehouse_seq` VALUES (51);
/*!40000 ALTER TABLE `warehouse_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 16:47:15
