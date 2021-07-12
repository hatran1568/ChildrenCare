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

 Date: 10/07/2021 21:26:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `status_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  INDEX `feedback_status_setting_idx`(`status_id`) USING BTREE,
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `feedback_status_setting` FOREIGN KEY (`status_id`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 'Yan', 1, 'Admin@a', '032', 3, 'none', 1, '#', 28);
INSERT INTO `feedback` VALUES (2, 'Yan', 1, 'Admin@a', '032', 4, 'none', 2, '#', 29);
INSERT INTO `feedback` VALUES (3, 'Yan', 1, 'Admin@a', '032', 3, 'none', 3, '#', 29);
INSERT INTO `feedback` VALUES (4, 'Yan', 1, 'Admin@a', '032', 2, 'none', 1, '#', 29);
INSERT INTO `feedback` VALUES (5, 'Yan', 1, 'Admin@a', '032', 3, 'none', 2, '#', 29);
INSERT INTO `feedback` VALUES (6, 'Yan', 1, 'Admin@a', '032', 5, 'none', 1, '#', 28);
INSERT INTO `feedback` VALUES (7, 'Yan', 1, 'Admin@a', '032', 3, 'none', 1, '#', 29);

-- ----------------------------
-- Table structure for medical_examination
-- ----------------------------
DROP TABLE IF EXISTS `medical_examination`;
CREATE TABLE `medical_examination`  (
  `reservation_id` int(0) NOT NULL,
  `service_id` int(0) NOT NULL,
  `receiver_id` int(0) NOT NULL,
  `prescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`reservation_id`, `service_id`, `receiver_id`) USING BTREE,
  INDEX `fk_service_exam`(`service_id`) USING BTREE,
  INDEX `fk_recicever_exam`(`receiver_id`) USING BTREE,
  CONSTRAINT `fk_recicever_exam` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reservation_exam` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_service_exam` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medical_examination
-- ----------------------------
INSERT INTO `medical_examination` VALUES (1, 1, 2, 'Yes');
INSERT INTO `medical_examination` VALUES (1, 1, 11, '500mg of Amoxicillin, three times a day for seven days');
INSERT INTO `medical_examination` VALUES (1, 2, 1, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch');
INSERT INTO `medical_examination` VALUES (1, 2, 2, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch');
INSERT INTO `medical_examination` VALUES (1, 3, 1, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch');
INSERT INTO `medical_examination` VALUES (3, 1, 1, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch');
INSERT INTO `medical_examination` VALUES (3, 2, 1, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch');
INSERT INTO `medical_examination` VALUES (4, 2, 1, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch.Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch.');
INSERT INTO `medical_examination` VALUES (4, 3, 1, 'Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch.Cyanide: 3 times a day; Beta Blockers: 1 after lunch. Cyanide: 3 times a day; Beta Blockers: 1 after lunch.');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `featured` tinyint(1) NULL DEFAULT NULL,
  `thumbnail_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `author_id` int(0) NULL DEFAULT NULL,
  `category_id` int(0) NULL DEFAULT NULL,
  `status_id` int(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  INDEX `post_status_setting_fk_idx`(`status_id`) USING BTREE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_status_setting_fk` FOREIGN KEY (`status_id`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (32, 'FRESNO, Calif. — On a Tuesday afternoon in April, among tables of vegetables, clothes and telephone chargers at Fresno’s biggest outdoor flea market were prescription drugs being sold as treatments for Covid. Vendors sold $25 injections of the steroid dexamethasone, several kinds of antibiotics and the anti-parasitic drug ivermectin. Chloroquine and hydroxychloroquine — the malaria drugs pushed by President Donald J. Trump last year — make regular appearances at the market as well, as do sham herbal supplements. Health and consumer protection agencies have repeatedly warned that several of these treatments, as well as vitamin infusions and expensive injections of “peptide therapies” sold at alternative wellness clinics for more than $1,000, are not supported by reliable scientific evidence. But such unproven remedies, often promoted by doctors and companies on social media, have appealed to many people in low-income immigrant communities in places across the country where Covid-19 rates have been high but access to health care is low. Some turn to unregulated drugs because mainstream medicine is too expensive or is inaccessible because of language or cultural barriers. \"It’s disappointing but not surprising” that people living below the poverty line have spent large sums of money for unproven treatments for Covid-19, said Rais Vohra, the interim head of Fresno County’s health department. “People are desperate and bombarded with misinformation and may not have the skills, time or context to interpret medical evidence.”', 'Shut out from mainstream medicine, some immigrants are buying expensive, unproven Covid therapies from âwellnessâ clinics or turning to the black market.', '2021-06-21 22:20:59', 1, 'assets/images/service/s1.jpg', 2, 5, 25, 'Desperate for Covid Care, Undocumented Immigrants Resort to Unproven Drugs');
INSERT INTO `post` VALUES (33, NULL, 'Talk of ‘gain-of-function’ research, a muddy category at best, brings up deep questions about how scientists should study viruses and other pathogens.', NULL, 1, 'assets/images/service/s2.jpg', 16, 6, 25, 'Fight Over Covid’s Origins Renews Debate on Risks of Lab Work');
INSERT INTO `post` VALUES (34, NULL, 'Organisers are to decide as soon as Monday whether to allow domestic spectators into the stadiums for the Games, which were delayed by a year due to the pandemic and now set to start in about a month. Foreign spectators have already been banned.', NULL, 0, 'assets/images/service/128283710.jpg', 28, 7, 25, 'Olympics venue medical officers want no spectators amid COVID-19 fears');
INSERT INTO `post` VALUES (35, NULL, 'With summer in full swing and excessive heat waves rolling through parts of the country, taking a dip in water can be a refreshing way to cool off.', NULL, 0, 'assets/images/service/dd7184.png', 29, 8, 25, 'What to do to stay safe around water this summer at the pool or beach');
INSERT INTO `post` VALUES (36, 'No Title', 'No Description', NULL, NULL, 'assets/images/service/s3.png', 5, 5, NULL, 'Title is None!');
INSERT INTO `post` VALUES (37, 'Do you think you\'re living an ordinary life? You are so mistaken it\'s difficult to even explain. The mere fact that you exist makes you extraordinary. The odds of you existing are less than winning the lottery, but here you are. Are you going to let this extraordinary opportunity pass?\r\nShe had come to the conclusion that you could tell a lot about a person by their ears. The way they stuck out and the size of the earlobes could give you wonderful insights into the person. Of course, she couldn\'t scientifically prove any of this, but that didn\'t matter to her. Before anything else, she would size up the ears of the person she was talking to.\r\nIt\'s always good to bring a slower friend with you on a hike. If you happen to come across bears, the whole group doesn\'t have to worry. Only the slowest in the group do. That was the lesson they were about to learn that day.', 'Description', '2021-06-22 00:47:44', 1, 'assets/images/service/Medical-logo-vector-lage.jpg', 2, 6, 1, '222');
INSERT INTO `post` VALUES (39, '\"It was so great to hear from you today and it was such weird timing,\" he said. \"This is going to sound funny and a little strange, but you were in a dream I had just a couple of days ago. I\'d love to get together and tell you about it if you\'re up for a cup of coffee,\" he continued, laying the trap he\'d been planning for years.\r\nColors bounced around in her head. They mixed and threaded themselves together. Even colors that had no business being together. They were all one, yet distinctly separate at the same time. How was she going to explain this to the others?', '123', '2021-06-22 00:58:56', 1, 'assets/images/s1.jpg', 2, 6, 1, 'Project Scenario 2');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiver
-- ----------------------------
INSERT INTO `receiver` VALUES (1, 2, 'Bo Yates', 0, '0559706307', '3852 Ridiculus Rd.', 'Fusce@loremipsum.ca');
INSERT INTO `receiver` VALUES (2, 2, 'John Doe', 1, '012345678', '6661 Neque Avenue', 'egestas.drerit@mauriserat.net');
INSERT INTO `receiver` VALUES (7, 36, 'DÆ°Æ¡ng', 1, '0974484610', '30', 'sad');
INSERT INTO `receiver` VALUES (8, -1, 'Tá»ng TrÆ°á»ng Giang', 1, '0977659677', '19', 'admin@a');
INSERT INTO `receiver` VALUES (9, -1, 'DÆ°Æ¡ng', 1, '0977659677', '30', 'sad@a');
INSERT INTO `receiver` VALUES (10, -1, 'turuek', 0, '1425678', '121323123', 'a@a');
INSERT INTO `receiver` VALUES (11, 2, 'Abc', 1, '0977659677', '30', 'asd@asd');

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `customer_id` int(0) NULL DEFAULT NULL,
  `reservation_date` date NULL DEFAULT NULL,
  `status_id` int(0) NULL DEFAULT NULL,
  `staff_id` int(0) NULL DEFAULT NULL,
  `receiver_id` int(0) NULL DEFAULT NULL,
  `checkup_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  INDEX `fk_receiver`(`receiver_id`) USING BTREE,
  CONSTRAINT `fk_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (1, 5, '2021-06-27', 20, 7, 2, '2021-06-27 11:15:48');
INSERT INTO `reservation` VALUES (2, 5, '2021-06-27', 21, 7, 2, '2021-06-27 11:15:48');
INSERT INTO `reservation` VALUES (3, 2, NULL, 20, 26, 1, '2021-06-27 11:15:48');
INSERT INTO `reservation` VALUES (4, 2, NULL, 20, 25, 1, NULL);
INSERT INTO `reservation` VALUES (5, 2, '2021-07-10', 27, 25, 1, '2021-07-10 21:10:55');
INSERT INTO `reservation` VALUES (6, 2, '2021-07-09', 20, 15, 1, '2021-07-10 21:26:00');

-- ----------------------------
-- Table structure for reservation_service
-- ----------------------------
DROP TABLE IF EXISTS `reservation_service`;
CREATE TABLE `reservation_service`  (
  `reservation_id` int(0) NOT NULL,
  `service_id` int(0) NOT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  `unit_price` float(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`reservation_id`, `service_id`) USING BTREE,
  INDEX `fk_service`(`service_id`) USING BTREE,
  CONSTRAINT `fk_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_service
-- ----------------------------
INSERT INTO `reservation_service` VALUES (1, 1, 2, 90000);
INSERT INTO `reservation_service` VALUES (1, 2, 2, 90000);
INSERT INTO `reservation_service` VALUES (1, 3, 1, 90000);
INSERT INTO `reservation_service` VALUES (3, 1, 1, 90000);
INSERT INTO `reservation_service` VALUES (3, 2, 1, 100000);
INSERT INTO `reservation_service` VALUES (4, 2, 1, 100000);
INSERT INTO `reservation_service` VALUES (4, 3, 1, 150000);

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
  `quantity` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (1, 'Service 1', 100000.00, 90000.00, 'assets/images/service/img_3.jpg', 9, 'Service 1', 'Service 1', NULL, NULL, NULL, NULL);
INSERT INTO `service` VALUES (2, 'Service 2', 100000.00, 100000.00, 'assets/images/service/img_3.jpg', 10, 'Service 2', 'Service 2', NULL, NULL, NULL, NULL);
INSERT INTO `service` VALUES (3, 'Service 3', 200000.00, 150000.00, 'assets/images/service/img_3.jpg', 11, 'Service 3', 'Service 3', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `setting` VALUES (13, 'User Status', 'Not verified', 1, NULL, '1');
INSERT INTO `setting` VALUES (14, 'User Status', 'Active', 2, NULL, '1');
INSERT INTO `setting` VALUES (15, 'User Status', 'Contact', 3, NULL, '1');
INSERT INTO `setting` VALUES (16, 'User Status', 'Potential', 4, NULL, '1');
INSERT INTO `setting` VALUES (17, 'User Status', 'Customer', 5, NULL, '1');
INSERT INTO `setting` VALUES (18, 'User Status', 'Inactive', 6, NULL, '1');
INSERT INTO `setting` VALUES (19, 'Reservation Status', 'Pending', 1, NULL, '1');
INSERT INTO `setting` VALUES (20, 'Reservation Status', 'Submited', 2, NULL, '1');
INSERT INTO `setting` VALUES (21, 'Reservation Status', 'Cancel', 3, NULL, '1');
INSERT INTO `setting` VALUES (22, 'Reservation Status', 'Approved', 4, NULL, '1');
INSERT INTO `setting` VALUES (23, 'Reservation Status', 'Rejected', 5, NULL, '1');
INSERT INTO `setting` VALUES (24, 'Post Status', 'Draft', 0, NULL, '1');
INSERT INTO `setting` VALUES (25, 'Post Status', 'Published', 1, NULL, '1');
INSERT INTO `setting` VALUES (26, 'Post Status', 'Hidden', 2, NULL, '1');
INSERT INTO `setting` VALUES (27, 'Reservation Status', 'Success', 6, NULL, '1');
INSERT INTO `setting` VALUES (28, 'Feedback Status', 'Processing', 1, NULL, '1');
INSERT INTO `setting` VALUES (29, 'Feedback Status', 'Processed', 2, NULL, '1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider
-- ----------------------------
INSERT INTO `slider` VALUES (1, 'A  Response Plan to counter Covid-19', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 1, 'Pushing the boundaries of what’s possible in children’s health.');
INSERT INTO `slider` VALUES (2, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 1, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (5, 'Isum', 'assets/images/service/s2.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (6, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (7, 'CHao', 'assets/images/service/128283710.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (8, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (9, 'Hue', 'assets/images/service/dd7184.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (10, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (11, 'Ha', 'assets/images/service/s3.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (12, 'Chi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (13, 'ilgnd', 'assets/images/service/Medical-logo-vector-lage.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (14, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (15, 'navi', 'assets/images/slider/slider.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (18, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (19, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (20, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (21, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (22, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (23, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (24, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (25, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (26, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (28, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (29, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (30, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (31, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (32, 'navi', 'assets/images/UML.png', '#', 0, 'none');
INSERT INTO `slider` VALUES (33, 'Gate', 'assets/images/104322938_185802629520370_1926776226818429282_n.jpg', '#', 0, 'none');

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
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_roleid_idx`(`role_id`) USING BTREE,
  INDEX `fk_status_user`(`status`) USING BTREE,
  CONSTRAINT `FK_roleid` FOREIGN KEY (`role_id`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_status_user` FOREIGN KEY (`status`) REFERENCES `setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (-1, 'Guest', 'Guest', 'Guest', 1, '0', '0', '0', 4, 14);
INSERT INTO `user` VALUES (2, 'Fusce@loremipsum.ca', 'Rhona', 'Bo Yates', 0, '0559706307123', '3852 Ridiculus Rd.', 'assets/images/avatar/Comm15_1 - Copy.png', 1, 14);
INSERT INTO `user` VALUES (4, 'magna@Nullatempor.co.uk', 'Sigourney', 'Guinevere Blackburn', 1, '0470342636', '4647 Tempor Rd.', '4', 1, 14);
INSERT INTO `user` VALUES (5, 'manager', 'chao', 'Debra Young', 1, '0196303756', '3259 Purus. Rd.', '5', 2, 14);
INSERT INTO `user` VALUES (7, 'Cum.so@necmlandit.co.uk', 'Germane', 'Martina Rodgers', 0, '0662288538', '622-1528 Volutpat Av.', '7', 3, 14);
INSERT INTO `user` VALUES (10, 'Integer.aliquam.adipi@vel.com', 'Rhonda', 'Linda Solis', 0, '0321248916', '6661 Neque Avenue', '10', 4, 14);
INSERT INTO `user` VALUES (13, 'faucibus.id@egestasadui.net', 'Giselle', 'Cally Mckinney', 1, '0933925868', 'Ap #440-7242 Lobortis Road', '13', 3, 14);
INSERT INTO `user` VALUES (15, 'ut.ipsum.ac@Proin.net', 'Mechelle', 'Ruth Glenn', 0, '0115225427', '791-3993 Diam Road', '15', 1, 14);
INSERT INTO `user` VALUES (16, 'mollis.non.cursus@cursus.com', 'Gail', 'Sigourney Keller', 0, '0271628087', '289-5821 Ornare. Street', '16', 2, 14);
INSERT INTO `user` VALUES (17, 'consequat.lectus@ipsum.edu', 'Althea', 'Jade Chang', 0, '0647998539', '410-9038 Semper Rd.', '17', 4, 16);
INSERT INTO `user` VALUES (18, 'primis.in.ibus@euturpis.co.uk', 'Shoshana', 'Hollee Golden', 1, '0932558198', 'Ap #876-8951 Enim. Rd.', '18', 3, 14);
INSERT INTO `user` VALUES (19, 'nonummy@Maecenas.net', 'Keelie', 'Maxine Mathis', 1, '0608159107', 'Ap #843-1727 Ac St.', '19', 3, 14);
INSERT INTO `user` VALUES (20, 'amet.nulla.Donec@net', 'Leslie', 'Sybil Fuentes', 1, '0157666445', '129-2060 Adipiscing St.', '20', 1, 14);
INSERT INTO `user` VALUES (21, 'ornare@egetmollislectus.com', 'Galena', 'Eden Grant', 0, '0135037341', 'P.O. Box 624, 8936 In St.', '21', 1, 14);
INSERT INTO `user` VALUES (22, 'tempus.Donec@necante.net', 'Ivory', 'May Copeland', 1, '0837662391', '140-2049 Amet, St.', '22', 1, 14);
INSERT INTO `user` VALUES (23, 'nec.cursus.a@Vestibulum.edu', 'Bo', 'Mara Dalton', 0, '0730490877', '146-6971 Elementum, Street', '23', 1, 14);
INSERT INTO `user` VALUES (24, 'dui.Cras.pellene@lorem.com', 'Imani', 'Cailin Patel', 1, '0231918392', '7950 Tristique Rd.', '24', 3, 14);
INSERT INTO `user` VALUES (25, 'vitae.diam@dui.ca', 'Eden', 'Kai Shaw', 1, '0721772746', 'P.O. Box 278, 9740 Quisque Street', '25', 3, 14);
INSERT INTO `user` VALUES (26, 'egestas.henrit@merat.net', 'Wynne', 'Leilani Davis', 1, '0650286200', '115 Nulla Rd.', '26', 3, 14);
INSERT INTO `user` VALUES (27, 'eu.lacus.Quisque@ligula.ca', 'Dara', 'Keiko Tucker', 0, '0617291317', 'Ap #549-5875 Posuere St.', '27', 1, 14);
INSERT INTO `user` VALUES (28, 'Nam.ac@interdumSed.com', 'Caryn', 'Madeline Mckee', 0, '0915978706', '3222 Nec, Rd.', '28', 2, 14);
INSERT INTO `user` VALUES (29, 'molestie@Proin.edu', 'Lillith', 'Kelsie Hogan', 1, '0655287977', '704-102 Magna. Road', '29', 2, 14);
INSERT INTO `user` VALUES (30, 'et@ultriciesadigenim.edu', 'Angela', 'Meredith Newton', 0, '0436457125', 'Ap #724-7504 Eu St.', '30', 4, 16);
INSERT INTO `user` VALUES (32, 'giangtong09@gmail.com', 'huepham1905', 'Chao', 1, '0974484610', '19', NULL, 4, 16);
INSERT INTO `user` VALUES (33, 'admin', 'admin', 'Chaos', 0, '0974484610', '19', NULL, 4, 16);
INSERT INTO `user` VALUES (34, 'sssss', 'admin', 'asd', 1, '0974484610', '19', NULL, 4, 16);
INSERT INTO `user` VALUES (35, 'user', 'useer', 'DÆ°Æ¡ng', 1, 'ad', '30', NULL, 4, 15);
INSERT INTO `user` VALUES (36, 'sad', 'sad', 'DÆ°Æ¡ng', 1, '0974484610', '30', NULL, 4, 16);
INSERT INTO `user` VALUES (37, 'ysysuuueii@dwd', 'null0000000000', 'Gae', 1, '13253562', '2453245', 'None', 4, 15);
INSERT INTO `user` VALUES (38, 'qwdqw@eee', 'null0000000000', 'Trrre', 0, '12354654', '12123123', 'None', 4, 15);
INSERT INTO `user` VALUES (39, 'ysysuu1eeueii@dwd', 'CRS0000000000', 'qweqwe', 1, '123123', '12323', 'None', 1, 14);
INSERT INTO `user` VALUES (40, 'test@test', 'CRS294324825', '123123', 1, '342141', '1324', 'None', 4, 15);
INSERT INTO `user` VALUES (42, 'Ha2aasd', 'sa', 'ha', 0, '0974484610', 'asda', NULL, 4, 13);
INSERT INTO `user` VALUES (44, 'admin@asdasdasd', 'sa', 'sa', 1, '0974484610', '30', NULL, 4, 13);
INSERT INTO `user` VALUES (45, 'manager', '123456', 'Manager', 0, '0123456789', '', NULL, 2, 14);

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

-- ----------------------------
-- Records of user_history
-- ----------------------------
INSERT INTO `user_history` VALUES (42, 'Ha2aasd', 'ha', 0, '0974484610', 'asda', 13, -1, '2021-06-25 17:04:18', 4);
INSERT INTO `user_history` VALUES (44, 'admin@asdasdasd', 'sa', 1, '0974484610', '30', 13, -1, '2021-06-27 10:13:47', 4);

SET FOREIGN_KEY_CHECKS = 1;
