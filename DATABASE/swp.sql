-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: swp
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rated_star` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `service_id` (`service_id`) USING BTREE,
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Yan',1,'Admin@a','032',3,'none',1,'#'),(2,'Yan',1,'Admin@a','032',4,'none',2,'#'),(3,'Yan',1,'Admin@a','032',3,'none',3,'#'),(4,'Yan',1,'Admin@a','032',2,'none',1,'#'),(5,'Yan',1,'Admin@a','032',3,'none',2,'#'),(6,'Yan',1,'Admin@a','032',5,'none',1,'#'),(7,'Yan',1,'Admin@a','032',3,'none',1,'#');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_examination`
--

DROP TABLE IF EXISTS `medical_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_examination` (
  `reservation_id` int NOT NULL,
  `service_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `precription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`reservation_id`,`service_id`,`receiver_id`) USING BTREE,
  KEY `fk_service_exam` (`service_id`) USING BTREE,
  KEY `fk_recicever_exam` (`receiver_id`) USING BTREE,
  CONSTRAINT `fk_recicever_exam` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reservation_exam` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_service_exam` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_examination`
--

LOCK TABLES `medical_examination` WRITE;
/*!40000 ALTER TABLE `medical_examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `updated_date` datetime DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `thumbnail_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `author_id` (`author_id`) USING BTREE,
  KEY `post_status_setting_fk_idx` (`status_id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_status_setting_fk` FOREIGN KEY (`status_id`) REFERENCES `setting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (32,NULL,'Shut out from mainstream medicine, some immigrants are buying expensive, unproven Covid therapies from âwellnessâ clinics or turning to the black market.','2021-06-21 22:20:59',1,'assets/images/service/s1.jpg',5,5,25,'Desperate for Covid Care, Undocumented Immigrants Resort to Unproven Drugs'),(33,NULL,'Talk of ‘gain-of-function’ research, a muddy category at best, brings up deep questions about how scientists should study viruses and other pathogens.',NULL,1,'assets/images/service/s2.jpg',16,6,25,'Fight Over Covid’s Origins Renews Debate on Risks of Lab Work'),(34,NULL,'Organisers are to decide as soon as Monday whether to allow domestic spectators into the stadiums for the Games, which were delayed by a year due to the pandemic and now set to start in about a month. Foreign spectators have already been banned.',NULL,0,'assets/images/service/128283710.jpg',28,7,25,'Olympics venue medical officers want no spectators amid COVID-19 fears'),(35,NULL,'With summer in full swing and excessive heat waves rolling through parts of the country, taking a dip in water can be a refreshing way to cool off.',NULL,0,'assets/images/service/dd7184.png',29,8,25,'What to do to stay safe around water this summer at the pool or beach'),(36,'No Title','No Description',NULL,NULL,'assets/images/service/s3.png',5,5,NULL,'Title is None!'),(37,'Do you think you\'re living an ordinary life? You are so mistaken it\'s difficult to even explain. The mere fact that you exist makes you extraordinary. The odds of you existing are less than winning the lottery, but here you are. Are you going to let this extraordinary opportunity pass?\r\nShe had come to the conclusion that you could tell a lot about a person by their ears. The way they stuck out and the size of the earlobes could give you wonderful insights into the person. Of course, she couldn\'t scientifically prove any of this, but that didn\'t matter to her. Before anything else, she would size up the ears of the person she was talking to.\r\nIt\'s always good to bring a slower friend with you on a hike. If you happen to come across bears, the whole group doesn\'t have to worry. Only the slowest in the group do. That was the lesson they were about to learn that day.','Description','2021-06-22 00:47:44',1,'assets/images/service/Medical-logo-vector-lage.jpg',2,6,1,'222'),(39,'\"It was so great to hear from you today and it was such weird timing,\" he said. \"This is going to sound funny and a little strange, but you were in a dream I had just a couple of days ago. I\'d love to get together and tell you about it if you\'re up for a cup of coffee,\" he continued, laying the trap he\'d been planning for years.\r\nColors bounced around in her head. They mixed and threaded themselves together. Even colors that had no business being together. They were all one, yet distinctly separate at the same time. How was she going to explain this to the others?','123','2021-06-22 00:58:56',1,'assets/images/s1.jpg',2,6,1,'Project Scenario 2');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiver`
--

DROP TABLE IF EXISTS `receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `mobile` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_userid_idx` (`user_id`) USING BTREE,
  CONSTRAINT `FK_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiver`
--

LOCK TABLES `receiver` WRITE;
/*!40000 ALTER TABLE `receiver` DISABLE KEYS */;
INSERT INTO `receiver` VALUES (1,2,'Bo Yates',0,'0559706307','3852 Ridiculus Rd.','Fusce@loremipsum.ca'),(2,2,'John Doe',1,'012345678','6661 Neque Avenue','egestas.drerit@mauriserat.net'),(7,36,'DÆ°Æ¡ng',1,'0974484610','30','sad'),(8,-1,'Tá»ng TrÆ°á»ng Giang',1,'0977659677','19','admin@a'),(9,-1,'DÆ°Æ¡ng',1,'0977659677','30','sad@a'),(10,-1,'turuek',0,'1425678','121323123','a@a'),(11,2,'Abc',1,'0977659677','30','asd@asd');
/*!40000 ALTER TABLE `receiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `checkup_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `staff_id` (`staff_id`) USING BTREE,
  KEY `fk_receiver` (`receiver_id`) USING BTREE,
  CONSTRAINT `fk_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_service`
--

DROP TABLE IF EXISTS `reservation_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_service` (
  `reservation_id` int NOT NULL,
  `service_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` float(255,0) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`,`service_id`) USING BTREE,
  KEY `fk_service` (`service_id`) USING BTREE,
  CONSTRAINT `fk_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_service`
--

LOCK TABLES `reservation_service` WRITE;
/*!40000 ALTER TABLE `reservation_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `original_price` float(10,2) DEFAULT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `thumbnail_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `updated_date` datetime DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Service 1',100000.00,90000.00,'assets/images/service/img_3.jpg',9,'Service 1','Service 1',NULL,NULL,NULL,NULL),(2,'Service 2',100000.00,100000.00,'assets/images/service/img_3.jpg',10,'Service 2','Service 2',NULL,NULL,NULL,NULL),(3,'Service 3',200000.00,150000.00,'assets/images/service/img_3.jpg',11,'Service 3','Service 3',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` int NOT NULL,
  `description` varchar(2048) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Role','Admin',1,NULL,'1'),(2,'Role','Manager',2,NULL,'1'),(3,'Role','Staff',3,NULL,'1'),(4,'Role','Customer',4,NULL,'1'),(5,'Post category','Category_1',1,NULL,'1'),(6,'Post category','Category_2',2,NULL,'1'),(7,'Post category','Category_3',3,NULL,'1'),(8,'Post category','Category_4',4,NULL,'1'),(9,'Service Category','Category_1',1,NULL,'1'),(10,'Service Category','Category_2',2,NULL,'1'),(11,'Service Category','Category_3',3,NULL,'1'),(12,'Service Category','Category_4',4,NULL,'1'),(13,'User Status','Not verified',1,NULL,'1'),(14,'User Status','Active',2,NULL,'1'),(15,'User Status','Contact',3,NULL,'1'),(16,'User Status','Potential',4,NULL,'1'),(17,'User Status','Customer',5,NULL,'1'),(18,'User Status','Inactive',6,NULL,'1'),(19,'Reservation Status','Pending',1,NULL,'1'),(20,'Reservation Status','Submited',2,NULL,'1'),(21,'Reservation Status','Cancel',3,NULL,'1'),(22,'Reservation Status','Approved',4,NULL,'1'),(23,'Reservation Status','Rejected',5,NULL,'1'),(24,'Post Status','Draft',0,NULL,'1'),(25,'Post Status','Published',1,NULL,'1'),(26,'Post Status','Hidden',2,NULL,'1');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `backlink` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,'A  Response Plan to counter Covid-19','assets/images/slider/slider_1_dad_and_girl.jpg','#',1,'Pushing the boundaries of what’s possible in children’s health.'),(2,'Medical Emergencies Always Come Unannounced!','assets/images/slider/Yuna-color-correction.jpg','#',1,'Get the most advanced emergency care anywhere in just minutes.'),(4,'Chao','assets/images/tiktok-10x-chau-anh.jpg','#',0,'none'),(5,'Isum','assets/images/service/s2.jpg','#',0,'none'),(6,'navi','assets/images/slider/slider.png','#',0,'none'),(7,'CHao','assets/images/service/128283710.jpg','#',0,'none'),(8,'navi','assets/images/slider/slider.png','#',0,'none'),(9,'Hue','assets/images/service/dd7184.png','#',0,'none'),(10,'navi','assets/images/slider/slider.png','#',0,'none'),(11,'Ha','assets/images/service/s3.png','#',0,'none'),(12,'Chi','assets/images/slider/slider.png','#',0,'none'),(13,'ilgnd','assets/images/service/Medical-logo-vector-lage.jpg','#',0,'none'),(14,'navi','assets/images/slider/slider.png','#',0,'none'),(15,'navi','assets/images/slider/slider.png','#',0,'none'),(18,'navi','assets/images/UML.png','#',0,'none'),(19,'navi','assets/images/UML.png','#',0,'none'),(20,'navi','assets/images/UML.png','#',0,'none'),(21,'navi','assets/images/UML.png','#',0,'none'),(22,'navi','assets/images/UML.png','#',0,'none'),(23,'navi','assets/images/UML.png','#',0,'none'),(24,'navi','assets/images/UML.png','#',0,'none'),(25,'navi','assets/images/UML.png','#',0,'none'),(26,'navi','assets/images/UML.png','#',0,'none'),(28,'navi','assets/images/UML.png','#',0,'none'),(29,'navi','assets/images/UML.png','#',0,'none'),(30,'navi','assets/images/UML.png','#',0,'none'),(31,'navi','assets/images/UML.png','#',0,'none'),(32,'navi','assets/images/UML.png','#',0,'none'),(33,'Gate','assets/images/104322938_185802629520370_1926776226818429282_n.jpg','#',0,'none');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_roleid_idx` (`role_id`) USING BTREE,
  KEY `fk_status_user` (`status`) USING BTREE,
  CONSTRAINT `FK_roleid` FOREIGN KEY (`role_id`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_status_user` FOREIGN KEY (`status`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (-1,'Guest','Guest','Guest',1,'0','0','0',4,14),(2,'Fusce@loremipsum.ca','Rhona','Bo Yates',0,'0559706307','3852 Ridiculus Rd.','https://i.imgur.com/EFyvmxy.png',1,14),(4,'magna@Nullatempor.co.uk','Sigourney','Guinevere Blackburn',1,'0470342636','4647 Tempor Rd.','4',1,14),(5,'manager','sa','Debra Young',1,'0196303756','3259 Purus. Rd.','5',2,14),(7,'Cum.so@necmlandit.co.uk','Germane','Martina Rodgers',0,'0662288538','622-1528 Volutpat Av.','7',3,14),(10,'Integer.aliquam.adipi@vel.com','Rhonda','Linda Solis',0,'0321248916','6661 Neque Avenue','10',4,14),(13,'faucibus.id@egestasadui.net','Giselle','Cally Mckinney',1,'0933925868','Ap #440-7242 Lobortis Road','13',3,14),(15,'ut.ipsum.ac@Proin.net','Mechelle','Ruth Glenn',0,'0115225427','791-3993 Diam Road','15',1,14),(16,'mollis.non.cursus@cursus.com','Gail','Sigourney Keller',0,'0271628087','289-5821 Ornare. Street','16',2,14),(17,'consequat.lectus@ipsum.edu','Althea','Jade Chang',0,'0647998539','410-9038 Semper Rd.','17',4,16),(18,'primis.in.ibus@euturpis.co.uk','Shoshana','Hollee Golden',1,'0932558198','Ap #876-8951 Enim. Rd.','18',3,14),(19,'nonummy@Maecenas.net','Keelie','Maxine Mathis',1,'0608159107','Ap #843-1727 Ac St.','19',3,14),(20,'amet.nulla.Donec@net','Leslie','Sybil Fuentes',1,'0157666445','129-2060 Adipiscing St.','20',1,14),(21,'ornare@egetmollislectus.com','Galena','Eden Grant',0,'0135037341','P.O. Box 624, 8936 In St.','21',1,14),(22,'tempus.Donec@necante.net','Ivory','May Copeland',1,'0837662391','140-2049 Amet, St.','22',1,14),(23,'nec.cursus.a@Vestibulum.edu','Bo','Mara Dalton',0,'0730490877','146-6971 Elementum, Street','23',1,14),(24,'dui.Cras.pellene@lorem.com','Imani','Cailin Patel',1,'0231918392','7950 Tristique Rd.','24',3,14),(25,'vitae.diam@dui.ca','Eden','Kai Shaw',1,'0721772746','P.O. Box 278, 9740 Quisque Street','25',3,14),(26,'egestas.henrit@merat.net','Wynne','Leilani Davis',1,'0650286200','115 Nulla Rd.','26',3,14),(27,'eu.lacus.Quisque@ligula.ca','Dara','Keiko Tucker',0,'0617291317','Ap #549-5875 Posuere St.','27',1,14),(28,'Nam.ac@interdumSed.com','Caryn','Madeline Mckee',0,'0915978706','3222 Nec, Rd.','28',2,14),(29,'molestie@Proin.edu','Lillith','Kelsie Hogan',1,'0655287977','704-102 Magna. Road','29',2,14),(30,'et@ultriciesadigenim.edu','Angela','Meredith Newton',0,'0436457125','Ap #724-7504 Eu St.','30',4,16),(32,'giangtong09@gmail.com','huepham1905','Chao',1,'0974484610','19',NULL,4,16),(33,'admin','admin','Chaos',0,'0974484610','19',NULL,4,16),(34,'sssss','admin','asd',1,'0974484610','19',NULL,4,16),(35,'user','useer','DÆ°Æ¡ng',1,'ad','30',NULL,4,15),(36,'sad','sad','DÆ°Æ¡ng',1,'0974484610','30',NULL,4,16),(37,'ysysuuueii@dwd','null0000000000','Gae',1,'13253562','2453245','None',4,15),(38,'qwdqw@eee','null0000000000','Trrre',0,'12354654','12123123','None',4,15),(39,'ysysuu1eeueii@dwd','CRS0000000000','qweqwe',1,'123123','12323','None',1,14),(40,'test@test','CRS294324825','123123',1,'342141','1324','None',4,15),(42,'Ha2aasd','sa','ha',0,'0974484610','asda',NULL,4,13);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_history` (
  `user_id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`updated_date`) USING BTREE,
  KEY `FK_updated_by_idx` (`updated_by`) USING BTREE,
  CONSTRAINT `FK_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
INSERT INTO `user_history` VALUES (42,'Ha2aasd','ha',0,'0974484610','asda',13,-1,'2021-06-25 17:04:18',4);
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-27  0:03:58
