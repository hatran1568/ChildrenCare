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

 Date: 06/06/2021 10:46:32
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
-- Records of cart_item
-- ----------------------------
INSERT INTO `cart_item` VALUES (2, 1, 2);
INSERT INTO `cart_item` VALUES (2, 2, 1);
INSERT INTO `cart_item` VALUES (2, 3, 1);

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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `role_id` int(0) NOT NULL,
  `url_id` int(0) NOT NULL,
  PRIMARY KEY (`role_id`, `url_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `url_id`(`url_id`) USING BTREE,
  CONSTRAINT `group_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `group_ibfk_3` FOREIGN KEY (`url_id`) REFERENCES `url` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (31, 'Content', 'Description', '2001-01-01 00:00:00', NULL, 'fgshjkla.caa', NULL, 1, NULL, 'Sketch Demo');

-- ----------------------------
-- Table structure for post_category
-- ----------------------------
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE `post_category`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_category
-- ----------------------------
INSERT INTO `post_category` VALUES (1, 'Category_1');
INSERT INTO `post_category` VALUES (2, 'Category_2');
INSERT INTO `post_category` VALUES (3, 'Category_3');
INSERT INTO `post_category` VALUES (4, 'Category_4');
INSERT INTO `post_category` VALUES (5, 'Category_5');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reservation_service
-- ----------------------------
DROP TABLE IF EXISTS `reservation_service`;
CREATE TABLE `reservation_service`  (
  `reservation_id` int(0) NOT NULL,
  `service_id` int(0) NOT NULL,
  `prescription_id` int(0) NOT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  `unit_price` float(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`reservation_id`, `service_id`, `prescription_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  INDEX `prescription_id`(`prescription_id`) USING BTREE,
  CONSTRAINT `reservation_service_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_service_ibfk_3` FOREIGN KEY (`prescription_id`) REFERENCES `presription_detail` (`presription_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Admin');
INSERT INTO `role` VALUES (2, 'Manager');
INSERT INTO `role` VALUES (3, 'Staff');
INSERT INTO `role` VALUES (4, 'Customer');

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
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id`) REFERENCES `service_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (1, 'Service 1', 100000.00, 90000.00, NULL, 1, 'Service 1', 'Service 1');
INSERT INTO `service` VALUES (2, 'Service 2', 100000.00, 100000.00, NULL, 1, 'Service 2', 'Service 2');
INSERT INTO `service` VALUES (3, 'Service 3', 200000.00, 150000.00, NULL, 2, 'Service 3', 'Service 3');

-- ----------------------------
-- Table structure for service_category
-- ----------------------------
DROP TABLE IF EXISTS `service_category`;
CREATE TABLE `service_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_category
-- ----------------------------
INSERT INTO `service_category` VALUES (1, 'Category 1');
INSERT INTO `service_category` VALUES (2, 'Category 2');
INSERT INTO `service_category` VALUES (3, 'Category 3');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for slider
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backlink` varchar(0) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for url
-- ----------------------------
DROP TABLE IF EXISTS `url`;
CREATE TABLE `url`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
  INDEX `FK`(`role_id`) USING BTREE,
  CONSTRAINT `FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'Fusce@loremipsum.ca', 'Rhona', 'Bo Yates', 0, '0559706307', '3852 Ridiculus Rd.', '2', 1, 1);
INSERT INTO `user` VALUES (4, 'magna@Nullatempor.co.uk', 'Sigourney', 'Guinevere Blackburn', 1, '0470342636', '4647 Tempor Rd.', '4', 1, 1);
INSERT INTO `user` VALUES (5, 'cursus.vestibulum.Mauris@Aliquamgravida.edu', 'Hermione', 'Debra Young', 1, '0196303756', '3259 Purus. Rd.', '5', 2, 1);
INSERT INTO `user` VALUES (7, 'Cum.sociis.natoque@necmaurisblandit.co.uk', 'Germane', 'Martina Rodgers', 0, '0662288538', '622-1528 Volutpat Av.', '7', 1, NULL);
INSERT INTO `user` VALUES (8, 'Sed.auctor.odio@urnajustofaucibus.ca', 'Lacy', 'Halee Leach', 1, '0261195816', 'P.O. Box 944, 7401 Ipsum. St.', '8', 2, NULL);
INSERT INTO `user` VALUES (10, 'Integer.aliquam.adipiscing@vel.com', 'Rhonda', 'Linda Solis', 0, '0321248916', '6661 Neque Avenue', '10', 4, NULL);
INSERT INTO `user` VALUES (13, 'faucibus.id@egestasadui.net', 'Giselle', 'Cally Mckinney', 1, '0933925868', 'Ap #440-7242 Lobortis Road', '13', 3, NULL);
INSERT INTO `user` VALUES (14, 'ac.mattis@et.ca', 'Noel', 'Marcia Dodson', 0, '0897036524', 'Ap #476-9416 Morbi Rd.', '14', 4, NULL);
INSERT INTO `user` VALUES (15, 'ut.ipsum.ac@Proin.net', 'Mechelle', 'Ruth Glenn', 0, '0115225427', '791-3993 Diam Road', '15', 1, NULL);
INSERT INTO `user` VALUES (16, 'mollis.non.cursus@cursus.com', 'Gail', 'Sigourney Keller', 0, '0271628087', '289-5821 Ornare. Street', '16', 2, NULL);
INSERT INTO `user` VALUES (17, 'consequat.lectus@ipsum.edu', 'Althea', 'Jade Chang', 0, '0647998539', '410-9038 Semper Rd.', '17', 4, NULL);
INSERT INTO `user` VALUES (18, 'primis.in.faucibus@euturpis.co.uk', 'Shoshana', 'Hollee Golden', 1, '0932558198', 'Ap #876-8951 Enim. Rd.', '18', 3, NULL);
INSERT INTO `user` VALUES (19, 'nonummy@Maecenas.net', 'Keelie', 'Maxine Mathis', 1, '0608159107', 'Ap #843-1727 Ac St.', '19', 3, NULL);
INSERT INTO `user` VALUES (20, 'amet.nulla.Donec@Suspendissetristiqueneque.net', 'Leslie', 'Sybil Fuentes', 1, '0157666445', '129-2060 Adipiscing St.', '20', 1, NULL);
INSERT INTO `user` VALUES (21, 'ornare@egetmollislectus.com', 'Galena', 'Eden Grant', 0, '0135037341', 'P.O. Box 624, 8936 In St.', '21', 1, NULL);
INSERT INTO `user` VALUES (22, 'tempus.risus.Donec@necante.net', 'Ivory', 'May Copeland', 1, '0837662391', '140-2049 Amet, St.', '22', 1, NULL);
INSERT INTO `user` VALUES (23, 'nec.cursus.a@arcuVestibulum.edu', 'Bo', 'Mara Dalton', 0, '0730490877', '146-6971 Elementum, Street', '23', 1, NULL);
INSERT INTO `user` VALUES (24, 'dui.Cras.pellentesque@lorem.com', 'Imani', 'Cailin Patel', 1, '0231918392', '7950 Tristique Rd.', '24', 3, NULL);
INSERT INTO `user` VALUES (25, 'vitae.diam@dui.ca', 'Eden', 'Kai Shaw', 1, '0721772746', 'P.O. Box 278, 9740 Quisque Street', '25', 3, NULL);
INSERT INTO `user` VALUES (26, 'egestas.hendrerit@mauriserat.net', 'Wynne', 'Leilani Davis', 1, '0650286200', '115 Nulla Rd.', '26', 3, NULL);
INSERT INTO `user` VALUES (27, 'eu.lacus.Quisque@ligula.ca', 'Dara', 'Keiko Tucker', 0, '0617291317', 'Ap #549-5875 Posuere St.', '27', 1, NULL);
INSERT INTO `user` VALUES (28, 'Nam.ac@interdumSed.com', 'Caryn', 'Madeline Mckee', 0, '0915978706', '3222 Nec, Rd.', '28', 2, NULL);
INSERT INTO `user` VALUES (29, 'molestie@Proin.edu', 'Lillith', 'Kelsie Hogan', 1, '0655287977', '704-102 Magna. Road', '29', 2, 1);
INSERT INTO `user` VALUES (30, 'et@ultriciesadipiscingenim.edu', 'Angela', 'Meredith Newton', 0, '0436457125', 'Ap #724-7504 Eu St.', '30', 4, NULL);

SET FOREIGN_KEY_CHECKS = 1;
