-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `brand_table`
--

DROP TABLE IF EXISTS `brand_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_table` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_description` varchar(1000) DEFAULT NULL,
  `brand_name` varchar(45) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name_UNIQUE` (`brand_name`),
  UNIQUE KEY `brand_id_UNIQUE` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_table`
--

LOCK TABLES `brand_table` WRITE;
/*!40000 ALTER TABLE `brand_table` DISABLE KEYS */;
INSERT INTO `brand_table` VALUES (1,'Motorla brand is owned by Lenovo','Motorola'),(2,'HP laptops give you the right speed, graphics, and storage choices to match your lifestyle plus exclusive HP innovations to make the road enjoyable for you. This brand has some of the best-looking laptops in their portfolio','HP'),(3,'Lenovo Laptops are known for the perfect blend of uber cool design along with the right infusion of outstanding features to give you the best of performance. Be it the latest computer games to enjoy or intricate programming that needs to done','Lenovo'),(4,'MacBooks are renowned for their stability, easy-to-use interface and incredible looks. Whether it\'s for use at home, office, on the move or enjoying a film, they can do it all in style. They are perfect for almost everyone','Apple'),(5,'Yet again, Microsoft offers a range of robust devices that are not only feature-rich but also affordable and stylish. If you are looking for the perfect balance of size, power, elegance and affordability for working on the go, then the Surface range of tablets are for you','Microsoft'),(6,'If you are looking for a Mobiles at a reasonable price, then the honor Bee fits the bill well.The honor Brand Store has listings of different honor Mobiless in different colours. ','Huawei'),(7,'GE offers a wide range of large appliances such as refrigerators, washing machines, air conditioners, dishwashers, microwaves and water purifiers','GE');
/*!40000 ALTER TABLE `brand_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_table`
--

DROP TABLE IF EXISTS `category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_table` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `category_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_table`
--

LOCK TABLES `category_table` WRITE;
/*!40000 ALTER TABLE `category_table` DISABLE KEYS */;
INSERT INTO `category_table` VALUES (1,'Mobile & Tablets','These are electronic products'),(2,'Cameras','Range of SLR and DSLR cameras from top brands'),(3,'Computer & Laptops','Best performace computer with various price ranges and offers'),(4,'Large Appliances','a wide range of large appliances such as refrigerators, washing machines, air conditioners, dishwashers, microwaves and water purifiers from leading brands');
/*!40000 ALTER TABLE `category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_role`
--

DROP TABLE IF EXISTS `customer_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_role` (
  `role_id` varchar(10) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_role`
--

LOCK TABLES `customer_role` WRITE;
/*!40000 ALTER TABLE `customer_role` DISABLE KEYS */;
INSERT INTO `customer_role` VALUES ('1','customer');
/*!40000 ALTER TABLE `customer_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_role_mapping`
--

DROP TABLE IF EXISTS `customer_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_role_mapping` (
  `customer_id` varchar(45) NOT NULL,
  `customer_role_id` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`,`customer_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_role_mapping`
--

LOCK TABLES `customer_role_mapping` WRITE;
/*!40000 ALTER TABLE `customer_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_table` (
  `customer_id` varchar(60) NOT NULL,
  `customer_first_name` varchar(45) NOT NULL,
  `customer_last_name` varchar(45) NOT NULL,
  `customer_password` varchar(100) NOT NULL,
  `customer_emailid` varchar(45) NOT NULL,
  `customer_mobile` varchar(45) NOT NULL,
  `customer_address` mediumtext NOT NULL COMMENT 'This should contain json string representing address fields',
  `customer_created_at` date DEFAULT NULL,
  `customer_group` varchar(45) DEFAULT NULL COMMENT 'Group to which the customer belongs, like customer, merchant,sales, partner',
  `customer_history` mediumtext COMMENT 'Json array containing list of orders placed by this customer',
  `customer_updated_at` date DEFAULT NULL,
  `customer_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  UNIQUE KEY `customer_emailid_UNIQUE` (`customer_emailid`),
  UNIQUE KEY `customer_mobile_UNIQUE` (`customer_mobile`),
  UNIQUE KEY `customer_username_UNIQUE` (`customer_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table`
--

LOCK TABLES `customer_table` WRITE;
/*!40000 ALTER TABLE `customer_table` DISABLE KEYS */;
INSERT INTO `customer_table` VALUES ('FA290252-A1F3-8697-CDC9EDB372E746ED','Mayur','Jain','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','mjain@adobe.com','9986182719','Bangalore',NULL,'consumer',NULL,NULL,'mayur'),('FA2A97DF-0001-CD23-37D97C4972596F90','Pavan','Venkata','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','pavan@cfsummit.com','999823443','Bangalore',NULL,'consumer',NULL,NULL,'pawan'),('FA2BCC97-E596-81AF-0C9BAC08175B83E6','Awdhesh','Kumar','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','awd@cfsummit.com','3449450490','Bangalore',NULL,'consumer',NULL,NULL,'awdhesh'),('FA2CE150-D189-C2C4-4B1DE5AEF132FCFF','Paul','Nibin','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','paul@cfsummit.com','43834958839','NewYork',NULL,'consumer',NULL,NULL,'paul'),('FA2E228E-DAE5-C86D-5DEAA8FAEEB5D153','Rick','Harris','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','rick@cfsummit','93498483334','Las Vegas',NULL,'consumer',NULL,NULL,'rick');
/*!40000 ALTER TABLE `customer_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateway_table`
--

DROP TABLE IF EXISTS `gateway_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateway_table` (
  `gateway_id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(45) DEFAULT NULL,
  `gateway_description` varchar(100) DEFAULT NULL,
  `gateway_settings` mediumtext COMMENT 'Settings specifying the configuration required to work with the gateway.',
  `gateway_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway_table`
--

LOCK TABLES `gateway_table` WRITE;
/*!40000 ALTER TABLE `gateway_table` DISABLE KEYS */;
INSERT INTO `gateway_table` VALUES (1,'alipay-express','This is Ali Pay express gateway','{url:https://www.alipay.com/21312131}','active'),(2,'directebanking','This Direct Banking gateway','{url:https://www.directbanking.com/232112423}','active'),(3,'paypal-express','This is paypal express gateway','{url://https://www.paypal.com/express/13231231}','active');
/*!40000 ALTER TABLE `gateway_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_product_table`
--

DROP TABLE IF EXISTS `merchant_product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_product_table` (
  `merchant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  PRIMARY KEY (`merchant_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_product_table`
--

LOCK TABLES `merchant_product_table` WRITE;
/*!40000 ALTER TABLE `merchant_product_table` DISABLE KEYS */;
INSERT INTO `merchant_product_table` VALUES (1,1,15,800),(2,2,39,500);
/*!40000 ALTER TABLE `merchant_product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_customer_id` varchar(60) NOT NULL,
  `order_status` varchar(15) NOT NULL,
  `order_products` varchar(100) NOT NULL COMMENT 'This should contain json string representing product_id and quantity',
  `order_amount` varchar(45) DEFAULT NULL,
  `order_payment_gatewayid` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `order_customer_id_idx` (`order_customer_id`),
  KEY `oreder_payment_gatewayid_idx` (`order_payment_gatewayid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1,'FA290252-A1F3-8697-CDC9EDB372E746ED','cart','[{\"PRODUCT_MERCHANT_ID\":1,\"QUANTITY\":3,\"PRODUCT_ID\":2}]',NULL,1);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(60) NOT NULL,
  `product_description` varchar(200) DEFAULT NULL,
  `product_brand_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_image_links` mediumtext COMMENT 'This should contain comma seprated image links',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'Iphone6c','Latest phone by Apple',4,1,'www.cdn.com/iphone6s,www.cdn.com/small/iphone6s'),(2,'Nexus6p','Latest phone by Google and Huawei',6,1,'www.cdn.com/nexus6p,www.cdn.com/small/nexus6p');
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_table`
--

DROP TABLE IF EXISTS `promotion_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_table` (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_type` varchar(100) DEFAULT NULL,
  `promotion_description` varchar(100) DEFAULT NULL,
  `promotion_status` varchar(10) DEFAULT NULL,
  `promotion_rule` varchar(45) DEFAULT NULL COMMENT 'This field will be brand_id, category_id, product_id or others',
  `promotion_discount_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_table`
--

LOCK TABLES `promotion_table` WRITE;
/*!40000 ALTER TABLE `promotion_table` DISABLE KEYS */;
INSERT INTO `promotion_table` VALUES (1,'free_ship','One electronics product shipping is free','active','product_category','88D06B7D-DB69-12F4-AB507B67FF8B2820');
/*!40000 ALTER TABLE `promotion_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-07 15:42:06
