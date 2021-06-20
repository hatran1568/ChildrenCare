/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : swp

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 20/06/2021 21:25:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`  (
  `user_id` int(0) NOT NULL,
  `service_id` int(0) NOT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `service_id`) USING BTREE,
  INDEX `serviceid_idx`(`service_id`) USING BTREE,
  CONSTRAINT `serviceid` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rated_star` int(0) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_id` int(0) NULL DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (1, 'Pepsi');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `featured` tinyint(1) NULL DEFAULT NULL,
  `thumbnail_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `author_id` int(0) NULL DEFAULT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for presription_detail
-- ----------------------------
DROP TABLE IF EXISTS `presription_detail`;
CREATE TABLE `presription_detail`  (
  `presription_id` int(0) NOT NULL,
  `medicine_id` int(0) NOT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  `dosage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`presription_id`, `medicine_id`) USING BTREE,
  INDEX `medicine_id`(`medicine_id`) USING BTREE,
  INDEX `presription_id`(`presription_id`) USING BTREE,
  CONSTRAINT `presription_detail_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presription_detail
-- ----------------------------
INSERT INTO `presription_detail` VALUES (1, 1, 2, 'none');

-- ----------------------------
-- Table structure for receiver
-- ----------------------------
DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `full_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `mobile` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_userid_idx`(`user_id`) USING BTREE,
  CONSTRAINT `FK_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiver
-- ----------------------------
INSERT INTO `receiver` VALUES (1, 2, 'Bo Yates', 0, '0559706307', '3852 Ridiculus Rd.', 'Fusce@loremipsum.ca');
INSERT INTO `receiver` VALUES (2, 2, 'John Doe', 1, '012345678', '6661 Neque Avenue', 'egestas.drerit@mauriserat.net');
INSERT INTO `receiver` VALUES (7, 36, 'DÆ°Æ¡ng', 1, '0974484610', '30', 'sad');
INSERT INTO `receiver` VALUES (8, -1, 'Tá»ng TrÆ°á»ng Giang', 1, '0977659677', '19', 'admin@a');
INSERT INTO `receiver` VALUES (9, -1, 'DÆ°Æ¡ng', 1, '0977659677', '30', 'sad@a');
INSERT INTO `receiver` VALUES (10, -1, 'turuek', 0, '1425678', '121323123', 'a@a');

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `customer_id` int(0) NULL DEFAULT NULL,
  `reservation_date` datetime(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_id` int(0) NULL DEFAULT NULL,
  `number_of_person` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (2, 2, '2021-06-22 22:32:39', 'Cancel', 26, 1);
INSERT INTO `reservation` VALUES (36, 2, '2021-06-20 00:00:00', 'Submited', 7, 1);
INSERT INTO `reservation` VALUES (37, 2, '2021-06-20 00:00:00', 'Cancel', 7, 1);

-- ----------------------------
-- Table structure for reservation_service
-- ----------------------------
DROP TABLE IF EXISTS `reservation_service`;
CREATE TABLE `reservation_service`  (
  `reservation_id` int(0) NOT NULL,
  `service_id` int(0) NOT NULL,
  `prescription_id` int(0) NULL DEFAULT NULL,
  `receiver_id` int(0) NULL DEFAULT NULL,
  `datetime` date NULL DEFAULT NULL,
  `unit_price` float(10, 2) NULL DEFAULT NULL,
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  INDEX `prescription_id`(`prescription_id`) USING BTREE,
  INDEX `fk_receiverid_idx`(`receiver_id`) USING BTREE,
  INDEX `fk_reservation`(`reservation_id`) USING BTREE,
  CONSTRAINT `fk_receiverid` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_service_ibfk_3` FOREIGN KEY (`prescription_id`) REFERENCES `presription_detail` (`presription_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_service
-- ----------------------------
INSERT INTO `reservation_service` VALUES (36, 1, 1, 2, '2021-06-20', 90000.00, 3);
INSERT INTO `reservation_service` VALUES (36, 2, 1, 1, '2021-06-20', 100000.00, 4);

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `original_price` float(10, 2) NULL DEFAULT NULL,
  `sale_price` float(10, 2) NULL DEFAULT NULL,
  `thumbnail_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `featured` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (1, 'Service 1', 100000.00, 90000.00, 'assets/images/service/img_3.jpg', 9, 'Service 1', 'Service 1', NULL, NULL, NULL);
INSERT INTO `service` VALUES (2, 'Service 2', 100000.00, 100000.00, 'assets/images/service/img_3.jpg', 10, 'Service 2', 'Service 2', NULL, NULL, NULL);
INSERT INTO `service` VALUES (3, 'Service 3', 200000.00, 150000.00, 'assets/images/service/img_3.jpg', 11, 'Service 3', 'Service 3', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` int(0) NOT NULL,
  `description` varchar(2048) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'Role', 'Admin', 1, NULL, '1');
INSERT INTO `setting` VALUES (2, 'Role', 'Manager', 2, NULL, '1');
INSERT INTO `setting` VALUES (3, 'Role', 'Staff', 3, NULL, '1');
INSERT INTO `setting` VALUES (4, 'Role', 'Customer', 4, NULL, '1');
INSERT INTO `setting` VALUES (5, 'Post category', 'Category_1', 1, NULL, '1');
INSERT INTO `setting` VALUES (6, 'Post category', 'Category_2', 2, NULL, '1');
INSERT INTO `setting` VALUES (7, 'Post category', 'Category_3', 3, NULL, '1');
INSERT INTO `setting` VALUES (8, 'Post category', 'Category_4', 4, NULL, '1');
INSERT INTO `setting` VALUES (9, 'Service Category', 'Category_1', 1, NULL, '1');
INSERT INTO `setting` VALUES (10, 'Service Category', 'Category_2', 2, NULL, '1');
INSERT INTO `setting` VALUES (11, 'Service Category', 'Category_3', 3, NULL, '1');
INSERT INTO `setting` VALUES (12, 'Service Category', 'Category_4', 4, NULL, '1');

-- ----------------------------
-- Table structure for slider
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backlink` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider
-- ----------------------------
INSERT INTO `slider` VALUES (1, 'Chao', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (2, 'Chao', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (4, 'Chao', 'assets/images/tiktok-10x-chau-anh.jpg', '#', 1, 'none');
INSERT INTO `slider` VALUES (5, 'Isum', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (6, 'navi', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (7, 'CHao', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (8, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (9, 'Hue', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (10, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (11, 'Ha', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (12, 'Chi', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (13, 'ilgnd', 'assets/images/slider/slider.png', '#', 1, 'none');
INSERT INTO `slider` VALUES (14, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (15, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (18, 'navi', 'assets/images/UML.png', '#', 0, 'none');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_roleid_idx`(`role_id`) USING BTREE,
  CONSTRAINT `FK_roleid` FOREIGN KEY (`role_id`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (-1, 'Guest', 'Guest', 'Guest', 1, '0', '0', '0', 4, 1);
INSERT INTO `user` VALUES (2, 'Fusce@loremipsum.ca', 'Rhona', 'Bo Yates', 0, '0559706307', '3852 Ridiculus Rd.', 'https://i.imgur.com/EFyvmxy.png', 1, 1);
INSERT INTO `user` VALUES (4, 'magna@Nullatempor.co.uk', 'Sigourney', 'Guinevere Blackburn', 1, '0470342636', '4647 Tempor Rd.', '4', 1, 1);
INSERT INTO `user` VALUES (5, 'cursus@Aliquamgravida.edu', 'Hermione', 'Debra Young', 1, '0196303756', '3259 Purus. Rd.', '5', 2, 1);
INSERT INTO `user` VALUES (7, 'Cum.so@necmlandit.co.uk', 'Germane', 'Martina Rodgers', 0, '0662288538', '622-1528 Volutpat Av.', '7', 3, 1);
INSERT INTO `user` VALUES (10, 'Integer.aliquam.adipi@vel.com', 'Rhonda', 'Linda Solis', 0, '0321248916', '6661 Neque Avenue', '10', 4, 1);
INSERT INTO `user` VALUES (13, 'faucibus.id@egestasadui.net', 'Giselle', 'Cally Mckinney', 1, '0933925868', 'Ap #440-7242 Lobortis Road', '13', 3, 1);
INSERT INTO `user` VALUES (15, 'ut.ipsum.ac@Proin.net', 'Mechelle', 'Ruth Glenn', 0, '0115225427', '791-3993 Diam Road', '15', 1, 1);
INSERT INTO `user` VALUES (16, 'mollis.non.cursus@cursus.com', 'Gail', 'Sigourney Keller', 0, '0271628087', '289-5821 Ornare. Street', '16', 2, 1);
INSERT INTO `user` VALUES (17, 'consequat.lectus@ipsum.edu', 'Althea', 'Jade Chang', 0, '0647998539', '410-9038 Semper Rd.', '17', 4, 1);
INSERT INTO `user` VALUES (18, 'primis.in.ibus@euturpis.co.uk', 'Shoshana', 'Hollee Golden', 1, '0932558198', 'Ap #876-8951 Enim. Rd.', '18', 3, 1);
INSERT INTO `user` VALUES (19, 'nonummy@Maecenas.net', 'Keelie', 'Maxine Mathis', 1, '0608159107', 'Ap #843-1727 Ac St.', '19', 3, 1);
INSERT INTO `user` VALUES (20, 'amet.nulla.Donec@net', 'Leslie', 'Sybil Fuentes', 1, '0157666445', '129-2060 Adipiscing St.', '20', 1, 1);
INSERT INTO `user` VALUES (21, 'ornare@egetmollislectus.com', 'Galena', 'Eden Grant', 0, '0135037341', 'P.O. Box 624, 8936 In St.', '21', 1, 1);
INSERT INTO `user` VALUES (22, 'tempus.Donec@necante.net', 'Ivory', 'May Copeland', 1, '0837662391', '140-2049 Amet, St.', '22', 1, 1);
INSERT INTO `user` VALUES (23, 'nec.cursus.a@Vestibulum.edu', 'Bo', 'Mara Dalton', 0, '0730490877', '146-6971 Elementum, Street', '23', 1, 1);
INSERT INTO `user` VALUES (24, 'dui.Cras.pellene@lorem.com', 'Imani', 'Cailin Patel', 1, '0231918392', '7950 Tristique Rd.', '24', 3, 0);
INSERT INTO `user` VALUES (25, 'vitae.diam@dui.ca', 'Eden', 'Kai Shaw', 1, '0721772746', 'P.O. Box 278, 9740 Quisque Street', '25', 3, 0);
INSERT INTO `user` VALUES (26, 'egestas.henrit@merat.net', 'Wynne', 'Leilani Davis', 1, '0650286200', '115 Nulla Rd.', '26', 3, 1);
INSERT INTO `user` VALUES (27, 'eu.lacus.Quisque@ligula.ca', 'Dara', 'Keiko Tucker', 0, '0617291317', 'Ap #549-5875 Posuere St.', '27', 1, 1);
INSERT INTO `user` VALUES (28, 'Nam.ac@interdumSed.com', 'Caryn', 'Madeline Mckee', 0, '0915978706', '3222 Nec, Rd.', '28', 2, 1);
INSERT INTO `user` VALUES (29, 'molestie@Proin.edu', 'Lillith', 'Kelsie Hogan', 1, '0655287977', '704-102 Magna. Road', '29', 2, 1);
INSERT INTO `user` VALUES (30, 'et@ultriciesadigenim.edu', 'Angela', 'Meredith Newton', 0, '0436457125', 'Ap #724-7504 Eu St.', '30', 4, 1);
INSERT INTO `user` VALUES (32, 'giangtong09@gmail.com', 'huepham1905', 'Chao', 1, '0974484610', '19', NULL, 4, 1);
INSERT INTO `user` VALUES (33, 'admin', 'admin', 'Chaos', 0, '0974484610', '19', NULL, 4, 1);
INSERT INTO `user` VALUES (34, 'sssss', 'admin', 'asd', 1, '0974484610', '19', NULL, 4, 1);
INSERT INTO `user` VALUES (35, 'user', 'useer', 'DÆ°Æ¡ng', 1, 'ad', '30', NULL, 4, 0);
INSERT INTO `user` VALUES (36, 'sad', 'sad', 'DÆ°Æ¡ng', 1, '0974484610', '30', NULL, 4, 1);
INSERT INTO `user` VALUES (37, 'ysysuuueii@dwd', 'null0000000000', 'Gae', 1, '13253562', '2453245', 'None', 4, 1);
INSERT INTO `user` VALUES (38, 'qwdqw@eee', 'null0000000000', 'Trrre', 0, '12354654', '12123123', 'None', 4, 0);
INSERT INTO `user` VALUES (39, 'ysysuu1eeueii@dwd', 'CRS0000000000', 'qweqwe', 1, '123123', '12323', 'None', 1, 1);
INSERT INTO `user` VALUES (40, 'test@test', 'CRS294324825', '123123', 1, '342141', '1324', 'None', 4, 1);

-- ----------------------------
-- Table structure for user_history
-- ----------------------------
DROP TABLE IF EXISTS `user_history`;
CREATE TABLE `user_history`  (
  `user_id` int(0) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `updated_by` int(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NOT NULL,
  `role_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `updated_date`) USING BTREE,
  INDEX `FK_updated_by_idx`(`updated_by`) USING BTREE,
  CONSTRAINT `FK_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
