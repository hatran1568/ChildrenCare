Drop database swp;
Create database swp;
use swp;

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

 Date: 25/07/2021 23:32:12
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (12, 'Giang', 1, 'giangtthe153299@fpt.edu.vn', '0974484610', 5, 'none', 1, 'assets/images/default-image.jpg', 28);
INSERT INTO `feedback` VALUES (13, 'Delilah Underwood', 0, 'commodo@metus.org', '09 8754 0232', 2, 'mauris a nunc. In at pede. Cras vulputate velit eu', 8, '#', 28);
INSERT INTO `feedback` VALUES (14, 'Nerea Horne', 1, 'faucibus@metusAenean.net', '00 5295 0037', 3, 'auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis', 6, '#', 29);
INSERT INTO `feedback` VALUES (15, 'Fulton Owens', 1, 'scelerisque@Namacnulla.net', '01 7856 3576', 2, 'molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.', 12, '#', 28);
INSERT INTO `feedback` VALUES (16, 'Yvonne Gordon', 0, 'dolor.quam@sem.edu', '01 8360 3310', 3, 'justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse', 12, '#', 29);
INSERT INTO `feedback` VALUES (17, 'Jayme Cortez', 0, 'tellus@ac.ca', '03 2503 7106', 0, 'Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam.', 10, '#', 29);
INSERT INTO `feedback` VALUES (18, 'Meredith Reyes', 1, 'velit.in@porttitorinterdumSed.edu', '02 1243 7697', 0, 'consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat', 9, '#', 28);
INSERT INTO `feedback` VALUES (19, 'Jacqueline Cardenas', 0, 'at.egestas.a@et.edu', '07 9374 2511', 0, 'nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.', 12, '#', 29);
INSERT INTO `feedback` VALUES (20, 'Jeremy Browning', 0, 'sagittis@risus.com', '05 3470 5729', 1, 'Proin sed turpis nec mauris blandit mattis. Cras eget nisi', 2, '#', 29);
INSERT INTO `feedback` VALUES (21, 'Uma Maxwell', 0, 'Donec.nibh@elementum.org', '06 2257 5408', 2, 'vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt', 2, '#', 29);
INSERT INTO `feedback` VALUES (22, 'Timon Griffith', 0, 'feugiat.nec.diam@risus.org', '03 6679 4440', 3, 'orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero', 6, '#', 29);
INSERT INTO `feedback` VALUES (23, 'Kareem Rodriguez', 0, 'ornare@lectusCum.org', '01 6085 5294', 5, 'molestie. Sed id risus quis diam luctus lobortis. Class aptent', 4, '#', 29);
INSERT INTO `feedback` VALUES (24, 'Lev Gay', 0, 'Mauris.vestibulum@Namtempordiam.edu', '08 9545 4597', 5, 'Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,', 8, '#', 29);
INSERT INTO `feedback` VALUES (25, 'Phyllis Sloan', 0, 'neque@antedictumcursus.ca', '00 0400 8770', 2, 'magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna', 7, '#', 28);
INSERT INTO `feedback` VALUES (26, 'Rina Morse', 0, 'feugiat.nec@euligulaAenean.co.uk', '00 2234 3983', 1, 'ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor', 5, '#', 29);
INSERT INTO `feedback` VALUES (27, 'Mufutau Burris', 1, 'penatibus@Quisqueimperdiet.org', '09 3185 3800', 3, 'pede. Cum sociis natoque penatibus et magnis dis parturient montes,', 1, '#', 28);
INSERT INTO `feedback` VALUES (28, 'Kadeem Tyson', 0, 'non@ac.com', '08 5687 9917', 4, 'a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed', 10, '#', 28);
INSERT INTO `feedback` VALUES (29, 'Ori Frost', 0, 'dui.Suspendisse.ac@ipsum.co.uk', '09 7453 3992', 1, 'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.', 4, '#', 28);
INSERT INTO `feedback` VALUES (30, 'Arden Montgomery', 1, 'facilisis@velitjusto.edu', '05 9563 1428', 0, 'pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi.', 10, '#', 28);
INSERT INTO `feedback` VALUES (31, 'Hedwig Abbott', 1, 'aliquet.sem.ut@lobortismauris.edu', '01 1120 3457', 3, 'ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque', 2, '#', 28);
INSERT INTO `feedback` VALUES (32, 'Andrew Burns', 0, 'nec.tempus.scelerisque@magnatellus.co.uk', '02 6560 7989', 3, 'in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla', 1, '#', 28);
INSERT INTO `feedback` VALUES (33, 'Levi Houston', 1, 'morbi.tristique.senectus@Quisqueliberolacus.com', '01 2684 2134', 5, 'et nunc. Quisque ornare tortor at risus. Nunc ac sem', 4, '#', 29);
INSERT INTO `feedback` VALUES (34, 'Britanni Stanton', 1, 'felis.adipiscing.fringilla@aliquet.co.uk', '00 5204 3641', 1, 'tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque', 7, '#', 28);
INSERT INTO `feedback` VALUES (35, 'Aidan Black', 1, 'taciti.sociosqu.ad@ipsum.org', '02 8134 2602', 5, 'dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris,', 4, '#', 29);
INSERT INTO `feedback` VALUES (36, 'Bruce Bradshaw', 0, 'mi.eleifend@molestie.edu', '05 0788 0928', 3, 'malesuada fames ac turpis egestas. Fusce aliquet magna a neque.', 6, '#', 29);
INSERT INTO `feedback` VALUES (37, 'Abdul Davenport', 0, 'Nulla@cursusinhendrerit.com', '06 0994 8786', 0, 'non, luctus sit amet, faucibus ut, nulla. Cras eu tellus', 10, '#', 28);
INSERT INTO `feedback` VALUES (38, 'Camille Guzman', 0, 'Vestibulum@suscipitestac.org', '08 7350 2381', 5, 'vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget', 3, '#', 29);
INSERT INTO `feedback` VALUES (39, 'Sean Alford', 1, 'nibh@ornaresagittisfelis.com', '07 8936 7303', 1, 'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.', 11, '#', 29);
INSERT INTO `feedback` VALUES (40, 'Adam Compton', 0, 'non.vestibulum@Aenean.org', '01 7527 0414', 2, 'venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien.', 7, '#', 28);
INSERT INTO `feedback` VALUES (41, 'Randall Moore', 0, 'nisi@consequat.ca', '05 9223 8473', 1, 'vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros', 6, '#', 29);
INSERT INTO `feedback` VALUES (42, 'Boris Bowers', 0, 'velit@elitpellentesquea.edu', '01 7809 7435', 1, 'scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.', 2, '#', 29);
INSERT INTO `feedback` VALUES (43, 'Kennedy Brady', 0, 'vitae.semper@vehiculaPellentesquetincidunt.com', '07 2817 5162', 3, 'lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse', 8, '#', 29);
INSERT INTO `feedback` VALUES (44, 'Emmanuel Nielsen', 0, 'senectus.et.netus@pedenonummy.edu', '06 2329 1023', 4, 'nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor', 12, '#', 28);
INSERT INTO `feedback` VALUES (45, 'Jocelyn Rosales', 0, 'tempus.mauris.erat@metussitamet.ca', '06 3173 8876', 5, 'lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate', 5, '#', 28);
INSERT INTO `feedback` VALUES (46, 'Karleigh Rocha', 1, 'blandit.viverra.Donec@amalesuada.com', '00 0546 9746', 2, 'risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,', 11, '#', 29);
INSERT INTO `feedback` VALUES (47, 'Jane Kinney', 1, 'sit.amet@aliquetnecimperdiet.net', '02 3824 2301', 3, 'ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit', 7, '#', 29);
INSERT INTO `feedback` VALUES (48, 'Omar Lopez', 0, 'ante@nequesedsem.net', '07 5094 7203', 1, 'tempus non, lacinia at, iaculis quis, pede. Praesent eu dui.', 2, '#', 28);
INSERT INTO `feedback` VALUES (49, 'Craig Bass', 0, 'magna@augueSed.org', '01 2853 9006', 2, 'dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis', 1, '#', 28);
INSERT INTO `feedback` VALUES (50, 'Gage Durham', 0, 'elementum@consectetueradipiscingelit.edu', '06 8824 0771', 5, 'eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum', 6, '#', 29);
INSERT INTO `feedback` VALUES (51, 'Amber Klein', 0, 'In.lorem@bibendum.net', '02 1261 1644', 5, 'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,', 10, '#', 29);
INSERT INTO `feedback` VALUES (52, 'Cheyenne Mcleod', 1, 'eu@blanditatnisi.org', '07 2322 6833', 2, 'aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae', 8, '#', 29);
INSERT INTO `feedback` VALUES (53, 'Zane Harmon', 0, 'amet.ornare@nislNulla.net', '09 8510 7124', 1, 'in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris', 9, '#', 29);
INSERT INTO `feedback` VALUES (54, 'Shaine Lyons', 0, 'erat.neque.non@sedturpisnec.edu', '04 9713 2672', 5, 'sit amet, risus. Donec nibh enim, gravida sit amet, dapibus', 2, '#', 28);
INSERT INTO `feedback` VALUES (55, 'Miriam Whitehead', 0, 'mauris.ipsum@uterat.ca', '03 0608 0834', 5, 'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec', 3, '#', 29);
INSERT INTO `feedback` VALUES (56, 'John Short', 0, 'at.nisi@Etiamlaoreetlibero.co.uk', '04 1939 4122', 5, 'euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur', 7, '#', 28);
INSERT INTO `feedback` VALUES (57, 'Joelle Guthrie', 1, 'dis@incursuset.org', '00 9021 9580', 4, 'mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam', 9, '#', 28);
INSERT INTO `feedback` VALUES (58, 'Clark Hickman', 1, 'Nunc.commodo.auctor@Sedid.net', '05 0559 1071', 1, 'tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet,', 5, '#', 28);
INSERT INTO `feedback` VALUES (59, 'Nolan Stokes', 0, 'facilisis@ipsumSuspendisse.net', '07 0415 8554', 5, 'placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,', 4, '#', 29);
INSERT INTO `feedback` VALUES (60, 'Carla Pruitt', 1, 'eu.metus.In@pretiumnequeMorbi.edu', '06 3619 2227', 5, 'Sed nunc est, mollis non, cursus non, egestas a, dui.', 11, '#', 28);
INSERT INTO `feedback` VALUES (61, 'Lee Hebert', 1, 'urna@consequatpurusMaecenas.com', '07 9272 7607', 1, 'ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida', 5, '#', 29);
INSERT INTO `feedback` VALUES (62, 'Chaney Mayo', 0, 'feugiat.Lorem@turpisNulla.org', '08 1721 0826', 5, 'erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse', 8, '#', 29);
INSERT INTO `feedback` VALUES (63, 'Amir Leblanc', 0, 'ad.litora.torquent@sitametmassa.ca', '02 5320 2387', 4, 'nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.', 2, '#', 28);
INSERT INTO `feedback` VALUES (64, 'Eugenia Simpson', 0, 'risus.varius@vitaemaurissit.net', '06 0220 1819', 1, 'sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis', 11, '#', 29);
INSERT INTO `feedback` VALUES (65, 'Perry Barnes', 1, 'dolor@Cras.net', '09 9834 1823', 3, 'ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo', 6, '#', 28);
INSERT INTO `feedback` VALUES (66, 'Jackson Calderon', 0, 'augue.Sed.molestie@duiFuscealiquam.com', '09 0104 8954', 1, 'orci, in consequat enim diam vel arcu. Curabitur ut odio', 6, '#', 29);
INSERT INTO `feedback` VALUES (67, 'Solomon Nicholson', 1, 'semper.Nam.tempor@dolorsitamet.com', '02 9596 7077', 1, 'Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci.', 11, '#', 29);
INSERT INTO `feedback` VALUES (68, 'Oleg Graves', 0, 'et@ultricessit.edu', '08 4910 0200', 3, 'a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.', 3, '#', 28);
INSERT INTO `feedback` VALUES (69, 'Zachary Hanson', 1, 'eget.odio@elementumsemvitae.co.uk', '08 1665 8322', 2, 'Fusce aliquet magna a neque. Nullam ut nisi a odio', 9, '#', 29);
INSERT INTO `feedback` VALUES (70, 'Paul Bean', 0, 'Vivamus@nonummyultricies.com', '06 3510 3829', 3, 'ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam', 2, '#', 29);
INSERT INTO `feedback` VALUES (71, 'Wing Lambert', 1, 'Phasellus.dolor@nonsollicitudina.com', '01 5593 0902', 4, 'quis accumsan convallis, ante lectus convallis est, vitae sodales nisi', 2, '#', 29);
INSERT INTO `feedback` VALUES (72, 'Knox Bridges', 0, 'Integer.eu@vel.com', '05 0089 7893', 3, 'magna tellus faucibus leo, in lobortis tellus justo sit amet', 1, '#', 29);
INSERT INTO `feedback` VALUES (73, 'Diana Compton', 1, 'Vivamus@velmauris.org', '09 3708 0928', 5, 'scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.', 4, '#', 29);
INSERT INTO `feedback` VALUES (74, 'Dale Dean', 1, 'habitant.morbi@Naminterdumenim.edu', '09 1667 7786', 1, 'nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus', 1, '#', 29);
INSERT INTO `feedback` VALUES (75, 'Dale Downs', 1, 'egestas.Aliquam.fringilla@Pellentesque.ca', '06 6896 3903', 4, 'Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla', 9, '#', 29);
INSERT INTO `feedback` VALUES (76, 'Leigh Harrison', 0, 'Donec.dignissim.magna@turpisegestasFusce.edu', '04 1264 6046', 5, 'eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc', 4, '#', 29);
INSERT INTO `feedback` VALUES (77, 'Simone Barker', 0, 'Proin@eratvolutpatNulla.ca', '00 1615 2379', 1, 'a nunc. In at pede. Cras vulputate velit eu sem.', 12, '#', 28);
INSERT INTO `feedback` VALUES (78, 'Summer Terry', 1, 'Quisque.nonummy.ipsum@AeneanmassaInteger.edu', '03 8827 2638', 4, 'nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod', 10, '#', 29);
INSERT INTO `feedback` VALUES (79, 'Melvin Ryan', 1, 'convallis@Nullafacilisi.ca', '03 2538 2282', 3, 'in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum', 2, '#', 29);
INSERT INTO `feedback` VALUES (80, 'Griffin Mendez', 1, 'eget@hendrerita.ca', '02 3245 1005', 5, 'urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum', 4, '#', 29);
INSERT INTO `feedback` VALUES (81, 'Prescott Parks', 0, 'turpis.nec.mauris@ac.com', '09 9683 6679', 2, 'bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus', 11, '#', 28);
INSERT INTO `feedback` VALUES (82, 'Emmanuel Hensley', 0, 'diam@Integer.net', '08 9737 5159', 1, 'consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,', 11, '#', 29);
INSERT INTO `feedback` VALUES (83, 'Ann Solis', 1, 'facilisis.facilisis@egettinciduntdui.net', '03 4427 4523', 0, 'Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu.', 6, '#', 29);
INSERT INTO `feedback` VALUES (84, 'Quentin Schroeder', 1, 'convallis.ligula@semconsequatnec.org', '04 8431 5779', 4, 'neque sed dictum eleifend, nunc risus varius orci, in consequat', 11, '#', 28);
INSERT INTO `feedback` VALUES (85, 'Owen Melton', 0, 'mollis@metusvitae.edu', '05 0241 8785', 1, 'mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean', 1, '#', 28);
INSERT INTO `feedback` VALUES (86, 'Violet Whitaker', 0, 'sed.hendrerit.a@malesuadafamesac.edu', '09 7228 7274', 0, 'tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis,', 12, '#', 28);
INSERT INTO `feedback` VALUES (87, 'Karina Greene', 0, 'dolor.sit@nonenim.org', '08 5813 3822', 5, 'tristique pellentesque, tellus sem mollis dui, in sodales elit erat', 4, '#', 29);
INSERT INTO `feedback` VALUES (88, 'Elaine Parker', 0, 'elit@semNulla.co.uk', '09 0371 0487', 3, 'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam', 3, '#', 29);
INSERT INTO `feedback` VALUES (89, 'Eden Moss', 1, 'luctus@malesuadafames.org', '04 6154 6509', 3, 'tristique pellentesque, tellus sem mollis dui, in sodales elit erat', 6, '#', 28);
INSERT INTO `feedback` VALUES (90, 'Guy Benjamin', 0, 'Aliquam@molestieSedid.org', '00 2732 7477', 1, 'gravida nunc sed pede. Cum sociis natoque penatibus et magnis', 4, '#', 29);
INSERT INTO `feedback` VALUES (91, 'Dennis Stewart', 1, 'Donec@Pellentesquehabitant.com', '08 3524 1498', 1, 'Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque', 8, '#', 29);
INSERT INTO `feedback` VALUES (92, 'Alden Shelton', 0, 'elit.Nulla@Seddiam.net', '01 9321 1930', 1, 'aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam', 1, '#', 29);
INSERT INTO `feedback` VALUES (93, 'Dora Hooper', 1, 'facilisi.Sed@necante.com', '07 6210 7120', 5, 'odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque', 6, '#', 29);
INSERT INTO `feedback` VALUES (94, 'Marsden Sparks', 0, 'laoreet.lectus.quis@gravidasagittis.edu', '00 0026 6624', 0, 'Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus', 11, '#', 29);
INSERT INTO `feedback` VALUES (95, 'Hunter Kinney', 1, 'lectus.Cum@auctor.net', '08 2750 1928', 2, 'pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero', 6, '#', 28);
INSERT INTO `feedback` VALUES (96, 'Kevin Hubbard', 1, 'interdum.enim.non@gravidaPraesenteu.ca', '07 8925 9579', 4, 'in sodales elit erat vitae risus. Duis a mi fringilla', 10, '#', 28);
INSERT INTO `feedback` VALUES (97, 'Jaime Conway', 0, 'cursus.in.hendrerit@metus.edu', '01 1302 1642', 2, 'euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur', 9, '#', 28);
INSERT INTO `feedback` VALUES (98, 'Finn Whitley', 0, 'mattis@acsemut.com', '06 8509 1573', 4, 'massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit', 2, '#', 29);
INSERT INTO `feedback` VALUES (99, 'Katell Pruitt', 0, 'amet.consectetuer@fermentummetus.net', '03 7921 3786', 1, 'Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit,', 8, '#', 28);
INSERT INTO `feedback` VALUES (100, 'Savannah Sosa', 1, 'adipiscing.elit@sitamet.net', '03 9335 9027', 1, 'enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum,', 5, '#', 28);
INSERT INTO `feedback` VALUES (101, 'Jakeem Sawyer', 0, 'convallis.est.vitae@dolortempus.edu', '01 9694 1487', 5, 'placerat, augue. Sed molestie. Sed id risus quis diam luctus', 9, '#', 29);
INSERT INTO `feedback` VALUES (102, 'Chase Walters', 1, 'est.ac@massa.ca', '00 2630 2770', 3, 'eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum', 9, '#', 28);
INSERT INTO `feedback` VALUES (103, 'Giselle Tyler', 0, 'commodo@elementumsem.co.uk', '02 8580 3956', 2, 'inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In', 10, '#', 28);
INSERT INTO `feedback` VALUES (104, 'Quamar Swanson', 0, 'nostra.per@sociisnatoque.com', '05 9469 0665', 2, 'Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,', 8, '#', 28);
INSERT INTO `feedback` VALUES (105, 'Devin Holmes', 0, 'semper.erat@sedsapienNunc.ca', '08 4917 3114', 0, 'Sed nunc est, mollis non, cursus non, egestas a, dui.', 3, '#', 28);
INSERT INTO `feedback` VALUES (106, 'Deirdre Parker', 1, 'velit@aaliquetvel.net', '08 9491 0964', 3, 'orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique', 6, '#', 28);
INSERT INTO `feedback` VALUES (107, 'Ivory Rodriguez', 0, 'egestas@egestasnuncsed.org', '07 2981 9430', 4, 'Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem.', 2, '#', 28);
INSERT INTO `feedback` VALUES (108, 'Walter Powell', 1, 'est.ac.facilisis@pede.net', '06 5618 7250', 1, 'nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam', 12, '#', 28);
INSERT INTO `feedback` VALUES (109, 'Leo Le', 1, 'pede.blandit.congue@nonenim.com', '07 8903 9931', 1, 'posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget,', 2, '#', 28);
INSERT INTO `feedback` VALUES (110, 'Oprah Wilkins', 0, 'Nunc.ullamcorper.velit@nunc.co.uk', '07 7890 7667', 5, 'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.', 8, '#', 29);
INSERT INTO `feedback` VALUES (111, 'Ethan Potter', 0, 'eu.eros.Nam@feugiatSednec.ca', '09 1256 6527', 0, 'vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci', 12, '#', 28);
INSERT INTO `feedback` VALUES (112, 'Irma Page', 0, 'hymenaeos.Mauris@diamPellentesquehabitant.co.uk', '05 1888 6607', 1, 'luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed', 8, '#', 28);

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
INSERT INTO `medical_examination` VALUES (18, 4, 16, 'Three time a day');
INSERT INTO `medical_examination` VALUES (18, 4, 17, ' 3 times a day');
INSERT INTO `medical_examination` VALUES (18, 4, 18, 'Should come back to hospital');
INSERT INTO `medical_examination` VALUES (18, 11, 19, '3 times a day');
INSERT INTO `medical_examination` VALUES (18, 11, 20, '2 times a day');

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
INSERT INTO `post` VALUES (32, '<blockquote>\r\n<p>This is a quote from a famous person</p>\r\n</blockquote>\r\n\r\n<p>FRESNO, Calif. &mdash; On a Tuesday afternoon in April, among tables of vegetables, clothes and telephone chargers at Fresno&rsquo;s biggest outdoor flea market were prescription drugs being sold as treatments for Covid. Vendors sold $25 injections of the steroid dexamethasone, several kinds of antibiotics and the anti-parasitic drug ivermectin. Chloroquine and hydroxychloroquine &mdash; the malaria drugs pushed by President Donald J. Trump last year &mdash; make regular appearances at the market as well, as do sham herbal supplements. Health and consumer protection agencies have repeatedly warned that several of these treatments, as well as vitamin infusions and expensive injections of &ldquo;peptide therapies&rdquo; sold at alternative wellness clinics for more than $1,000, are not supported by reliable scientific evidence. But such unproven remedies, often promoted by doctors and companies on social media, have appealed to many people in low-income immigrant communities in places across the country where Covid-19 rates have been high but access to health care is low.</p>\r\n\r\n<p>Some turn to unregulated drugs because mainstream medicine is too expensive or is inaccessible because of language or cultural barriers. &quot;It&rsquo;s disappointing but not surprising&rdquo; that people living below the poverty line have spent large sums of money for unproven treatments for Covid-19, said Rais Vohra, the interim head of Fresno County&rsquo;s health department. &ldquo;People are desperate and bombarded with misinformation and may not have the skills, time or context to interpret medical evidence.&rdquo;</p>\r\n', 'Shut out from mainstream medicine, some immigrants are buying expensive, unproven Covid therapies from wellness clinics or turning to the black market.', '2021-07-24 23:08:52', 1, 'assets/images/download.jpg', 3, 5, 24, 'Desperate for covid care, immigrants are struggling to find cure');
INSERT INTO `post` VALUES (33, 'A study published in the Multiple Sclerosis Journal found that prospective MS patients often had an increased frequency of hospital/GP visits up to 5 years before a clinical diagnosis for their MS symptoms. As with many diseases, the prodromal (pre-symptomatic) stage of disease may or may not come with any noticeable symptoms. However, there may be additional signs which may present during this stage that could be important features associated with the onset of disease-related symptoms in the months or years to come. According to their findings, hospital, and GP visits for 2-4x higher in the prodromal 5 years before MS diagnoses compared to healthy controls. Interestingly, these were specific for conditions related to the sensory organs, the musculoskeletal system, and the genito-urinary system. In addition, people who developed MS had 50% more physician visits for mental health and cognitive related issues (including mood and anxiety disorders) in the 5 years before their symptoms or diagnoses compared to controls, with prescriptions for antidepressants being common, as well as prescriptions for antibiotics.', 'Talk of \'gain-of-function\' research, a muddy category at best, brings up deep questions about how scientists should study viruses and other pathogens.', '2021-07-24 17:26:33', 1, 'assets/images/download.jpg', 3, 6, 25, 'Fight Over Covid\'s Origins Renews Debate on Risks of Lab Work');
INSERT INTO `post` VALUES (34, 'Getting an early diagnosis for multiple sclerosis (MS) is important in ensuring better long-term outcomes and quality of life. The challenge, however, is that getting an early diagnosis for MS is challenging and diagnoses are currently made in advanced disease stages. MS varies considerably between patients depending on the type and the parts of the body affected. Many of the symptoms of MS can also be associated with other disorders often complicating diagnoses. However, some of the most common symptoms include fatigue, pain, problems with walking or holding items, numbness or tingling in various parts of the body, problems with vision, issues with balance and coordination, bladder/bowel/sexual problems as well as some degree of cognitive disturbances. The most common type of MS (around 80% of all cases) is relapse remitting MS in which there are episodes of existing or new symptoms which worsen over days or weeks/months (relapse) and episodes of slow recovery over time (remitting). However, as the disease progresses over many years, the condition becomes progressively worse (secondary progressive MS). Around 10% of all cases are primary progressive MS cases where symptoms gradually become worse from onset without any remission.', 'Organisers are to decide as soon as Monday whether to allow domestic spectators into the stadiums for the Games, which were delayed by a year due to the pandemic and now set to start in about a month. Foreign spectators have already been banned.', '2021-06-22 00:47:44', 1, 'assets/images/service/128283710.jpg', 3, 7, 25, 'Olympics venue medical officers want no spectators amid COVID-19 fears');
INSERT INTO `post` VALUES (35, '<p>As opioid overdose deaths rose during the COVID-19 pandemic, people seeking treatment for opioid addiction had to wait nearly twice as long to begin methadone treatment in the United States than in Canada, a new Yale study has shown.</p><p>In both countries during the pandemic, about one in 10 methadone clinics were not accepting new patients and a third of those cited COVID-19 as the reason, according to research published July 23 in the journal <em>JAMA Network Open</em>.</p><p>The findings highlight shortcomings providing prompt access to people seeking treatment for opioid addiction, the authors say.</p>', 'With summer in full swing and excessive heat waves rolling through parts of the country, taking a dip in water can be a refreshing way to cool off.', '2021-07-24 23:12:16', 1, 'assets/images/download.jpg', 3, 8, 25, 'What to do to stay safe around water this summer at the pool or beach');
INSERT INTO `post` VALUES (36, 'Whilst the industry continues to focus on the development of vaccines and therapies in response to COVID-19, the crisis has had a considerable impact on clinical trials in other therapy areas, particularly on cardiovascular, dermatology and metabolic. Even though significant regulatory agencies, such as the FDA and EMEA, have promoted guidelines and measures for maintaining the integrity of the trials that attempt to guarantee the rights, safety and wellbeing of patients and healthcare staff during this COVID-19 pandemic, maintaining clinical trials and keeping them on track has been severely challenging.', 'No Description', '2021-06-22 00:47:44', 0, 'assets/images/service/s3.png', 3, 5, 24, 'Pre-COVID-19 vs post-COVID-19 – clinical trial challenges revealed');
INSERT INTO `post` VALUES (37, 'Do you think you\'re living an ordinary life? You are so mistaken it\'s difficult to even explain. The mere fact that you exist makes you extraordinary. The odds of you existing are less than winning the lottery, but here you are. Are you going to let this extraordinary opportunity pass?\r\nShe had come to the conclusion that you could tell a lot about a person by their ears. The way they stuck out and the size of the earlobes could give you wonderful insights into the person. Of course, she couldn\'t scientifically prove any of this, but that didn\'t matter to her. Before anything else, she would size up the ears of the person she was talking to.\r\nIt\'s always good to bring a slower friend with you on a hike. If you happen to come across bears, the whole group doesn\'t have to worry. Only the slowest in the group do. That was the lesson they were about to learn that day.', 'Recent events have only reinforced the frailty of our existence as well as a collective responsibility to help one another.', '2021-06-22 00:47:44', 1, 'assets/images/service/Medical-logo-vector-lage.jpg', 3, 6, 25, 'Study reflects shortcomings in how the U.S. handles care for people with opioid addiction');
INSERT INTO `post` VALUES (39, '\"It was so great to hear from you today and it was such weird timing,\" he said. \"This is going to sound funny and a little strange, but you were in a dream I had just a couple of days ago. I\'d love to get together and tell you about it if you\'re up for a cup of coffee,\" he continued, laying the trap he\'d been planning for years.\r\nColors bounced around in her head. They mixed and threaded themselves together. Even colors that had no business being together. They were all one, yet distinctly separate at the same time. How was she going to explain this to the others?', 'Whilst expected, there is no guarantee when another pandemic will hit again or what the impact would look like.', '2021-06-22 00:58:56', 1, 'assets/images/s1.jpg', 3, 6, 25, 'Study finds unacceptable mental health service shortfalls for children in high-income countries');
INSERT INTO `post` VALUES (42, 'Researchers found that of the one in eight children (12.7 per cent) who experience a mental disorder, less than half (44.2 per cent) receive any services for these conditions.  Using systematic review methods, the researchers examined 14 prevalence surveys conducted in 11 high-income countries that included a total of 61,545 children aged four to 18 years. Eight of the 14 studies also assessed service contacts. The 14 surveys were conducted between 2003 and 2020 in Canada as well as the US, Australia, Chile, Denmark, Great Britain, Israel, Lithuania, Norway, South Korea and Taiwan. Researchers note that mental health service provision lags behind services available to treat physical conditions in most of these countries. \"We would not find it acceptable to treat only 44 per cent of children who had cancer or diabetes or infectious diseases,\" says Waddell.', 'Most children with a mental health disorder are not receiving services to address their needs--according to a new study from researchers at Simon Fraser University\'s Children\'s Health Policy Centre.', '2021-06-22 00:47:44', 1, 'assets/images/s1.jpg', 3, 7, 25, 'Study finds unacceptable mental health service shortfalls for children in high-income countries');
INSERT INTO `post` VALUES (43, 'Glaucoma results from irreversible neurodegeneration of the optic nerve, the bundle of axons from retinal ganglion cells that transmits signals from the eye to the brain to produce vision. Available therapies slow vision loss by lowering elevated eye pressure, however some glaucoma progresses to blindness despite normal eye pressure. Neuroprotective therapies would be a leap forward, meeting the needs of patients who lack treatment options. The CaMKII (calcium/calmodulin-dependent protein kinase II) pathway regulates key cellular processes and functions throughout the body, including retinal ganglion cells in the eye. Yet the precise role of CaMKII in retinal ganglion cell health is not well understood. Inhibition of CaMKII activity, for example, has been shown to be either protective or detrimental to retinal ganglion cells, depending on the conditions. Using an antibody marker of CaMKII activity, Chen\'s team discovered that CaMKII pathway signaling was compromised whenever retinal ganglion cells were exposed to toxins or trauma from a crush injury to the optic nerve, suggesting a correlation between CaMKII activity and retinal ganglion cell survival. Searching for ways to intervene, they found that activating the CaMKII pathway with gene therapy proved protective to the retinal ganglion cells. Administering the gene therapy to mice just prior to the toxic insult (which initiates rapid damage to the cells), and just after optic nerve crush (which causes slower damage), increased CaMKII activity and robustly protected retinal ganglion cells.', 'A form of gene therapy protects optic nerve cells and preserves vision in mouse models of glaucoma, according to research supported by NIH\'s National Eye Institute', '2021-06-22 00:47:44', 1, 'assets/images/s1.jpg', 3, 5, 24, 'Gene therapy protects optic nerve cells and preserves vision in glaucoma mouse models');
INSERT INTO `post` VALUES (44, 'Thus, an increased GP or hospital visit frequency for specific physical conditions in combination with the need for mental health or cognitive referrals may be important prodromal hallmarks of MS. The combination of antidepressants and antibiotic use seems to be highly associated with the prodromal stage of MS – perhaps to treat symptoms not yet recognized as MS before MS is diagnosed. However, there are some important caveats to this study. Firstly, many of these complaints are largely non-exclusive in everyday life, and simply visiting your GP for sensory dysfunction or mental health-related issues is not specific to the prodromal stage of MS. Even the combination of receiving antidepressants and antibiotics whilst having some degree of musculoskeletal dysfunction is not sufficiently an exclusive combination of MS prodrome. However, it does suggest that these combinations may be related to an increased chance of an MS diagnosis within 5 years and assessments for MS at this stage would only benefit the individual – even if it turns out not to be associated with MS.', 'MS patients who began natalizumab treatment 1-2 years earlier than those who started later displayed a clear and significant improvement in mortality', '2021-07-24 23:08:52', 1, 'assets/images/s1.jpg', 3, 8, 25, 'multiple sclerosis (MS) is a demyelinating disorder with varying symptoms and progression from person to person');
INSERT INTO `post` VALUES (45, 'As increased optimism surrounded the control of the virus, the impact on life is still to be fully understood. Some forecasts predict grim long-term societal and financial consequences, across several countries. Whilst the tragic loss of life and the impact on the quality of life should not be overlooked, there are positives to come out of this crisis. This article will outline the impact on clinical trials and drug and diagnostic development. However, many parallels with everyday life can be taken into consideration. Strength through adversity is a commonly used aphorism and one which is true of people and industries alike. When confronted with challenges, human inventiveness knows no limits and COVID-19 has been both the mother of innovation but also the catalyst for the widespread adoption of current technologies. Thus, it is of little surprise that the clinical trial market has swiftly adjusted to the new paradigm circumscribed by restrictions on social interaction, by looking to leverage technological solutions.', 'Whilst pandemics are thankfully not common; COVID-19 has brought with it a profound global impact.', '2021-07-24 23:08:52', 1, 'assets/images/s1.jpg', 3, 6, 25, 'The impact of COVID-19 on clinical trials');

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiver
-- ----------------------------
INSERT INTO `receiver` VALUES (16, 1, 'Giang', 1, '0977659677', 'Vietnam', 'giangtthe153299@fpt.edu.vn');
INSERT INTO `receiver` VALUES (17, -1, 'trang', 1, '0977659677', 'Viet nam', 'tranglvqhe153785@fpt.edu.vn');
INSERT INTO `receiver` VALUES (18, -1, 'Ha', 1, '0977659677', 'Viet Nam', 'hattnhe153299@fpt.edu.vn');
INSERT INTO `receiver` VALUES (19, -1, 'Bo Yates', 0, '0977659677', 'Viet Nam', 'Fusce@loremipsum.ca');
INSERT INTO `receiver` VALUES (20, -1, 'Ngoc anh', 1, '0977659677', 'Viet Nam', 'anhntnhe151378@fpt.edu.vn');

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (18, 1, '2021-07-25', 27, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (50, 1, '2021-07-30', 21, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (51, 2, '2021-07-16', 20, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (52, 2, '2021-07-17', 22, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (53, 3, '2021-07-22', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (54, 4, '2021-07-29', 21, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (55, 3, '2021-07-02', 19, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (56, 1, '2021-07-04', 19, 4, 16, '2021-07-27 00:00:00');
INSERT INTO `reservation` VALUES (57, 4, '2021-07-08', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (58, 2, '2021-07-08', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (59, 5, '2021-07-20', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (60, 3, '2021-07-29', 19, 4, 16, '2021-07-27 00:00:00');
INSERT INTO `reservation` VALUES (61, 3, '2021-07-12', 19, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (62, 1, '2021-07-14', 22, 4, 16, '2021-07-27 00:00:00');
INSERT INTO `reservation` VALUES (63, 1, '2021-07-20', 19, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (64, 4, '2021-07-05', 19, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (65, 4, '2021-07-04', 22, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (66, 2, '2021-07-12', 19, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (67, 2, '2021-07-20', 21, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (68, 4, '2021-07-18', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (69, 4, '2021-07-02', 23, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (70, 4, '2021-07-17', 19, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (71, 1, '2021-07-26', 22, 4, 16, '2021-07-27 00:00:00');
INSERT INTO `reservation` VALUES (72, 4, '2021-07-10', 19, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (73, 3, '2021-07-19', 20, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (74, 3, '2021-07-08', 19, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (75, 1, '2021-07-03', 22, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (76, 5, '2021-07-28', 20, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (77, 3, '2021-07-25', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (78, 3, '2021-07-13', 22, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (79, 1, '2021-07-14', 22, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (80, 2, '2021-07-26', 22, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (81, 4, '2021-07-05', 20, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (82, 5, '2021-07-24', 21, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (83, 5, '2021-07-02', 22, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (84, 1, '2021-07-20', 21, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (85, 3, '2021-07-11', 21, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (86, 3, '2021-07-21', 19, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (87, 2, '2021-07-04', 23, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (88, 2, '2021-07-04', 22, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (89, 4, '2021-07-27', 19, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (90, 3, '2021-07-28', 21, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (91, 3, '2021-07-06', 21, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (92, 2, '2021-07-01', 21, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (93, 4, '2021-07-08', 21, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (94, 4, '2021-07-12', 19, 4, 16, '2021-07-28 00:00:00');
INSERT INTO `reservation` VALUES (95, 2, '2021-07-08', 20, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (96, 3, '2021-07-18', 20, 4, 16, '2021-07-31 00:00:00');
INSERT INTO `reservation` VALUES (97, 1, '2021-07-26', 23, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (98, 5, '2021-07-14', 23, 4, 16, '2021-07-29 00:00:00');
INSERT INTO `reservation` VALUES (99, 5, '2021-07-10', 22, 4, 16, '2021-07-30 00:00:00');
INSERT INTO `reservation` VALUES (100, 5, '2021-07-24', 22, 4, 16, '2021-07-27 00:00:00');

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
INSERT INTO `reservation_service` VALUES (18, 4, 3, 80000);
INSERT INTO `reservation_service` VALUES (18, 11, 2, 100000);
INSERT INTO `reservation_service` VALUES (51, 2, 2, 95980);
INSERT INTO `reservation_service` VALUES (52, 1, 1, 80448);
INSERT INTO `reservation_service` VALUES (52, 5, 1, 85969);
INSERT INTO `reservation_service` VALUES (53, 8, 2, 86387);
INSERT INTO `reservation_service` VALUES (54, 8, 1, 97285);
INSERT INTO `reservation_service` VALUES (55, 6, 2, 85783);
INSERT INTO `reservation_service` VALUES (55, 8, 2, 87448);
INSERT INTO `reservation_service` VALUES (56, 2, 1, 84456);
INSERT INTO `reservation_service` VALUES (59, 10, 3, 97916);
INSERT INTO `reservation_service` VALUES (60, 1, 3, 95383);
INSERT INTO `reservation_service` VALUES (61, 4, 3, 99552);
INSERT INTO `reservation_service` VALUES (61, 5, 3, 88276);
INSERT INTO `reservation_service` VALUES (62, 4, 3, 84196);
INSERT INTO `reservation_service` VALUES (63, 8, 2, 94850);
INSERT INTO `reservation_service` VALUES (63, 10, 2, 95416);
INSERT INTO `reservation_service` VALUES (63, 11, 2, 80530);
INSERT INTO `reservation_service` VALUES (64, 5, 3, 93636);
INSERT INTO `reservation_service` VALUES (64, 8, 3, 82693);
INSERT INTO `reservation_service` VALUES (66, 5, 1, 94339);
INSERT INTO `reservation_service` VALUES (67, 2, 2, 97204);
INSERT INTO `reservation_service` VALUES (67, 5, 2, 95074);
INSERT INTO `reservation_service` VALUES (68, 3, 1, 97882);
INSERT INTO `reservation_service` VALUES (68, 4, 3, 93604);
INSERT INTO `reservation_service` VALUES (69, 2, 3, 96402);
INSERT INTO `reservation_service` VALUES (69, 6, 3, 92008);
INSERT INTO `reservation_service` VALUES (70, 2, 1, 92466);
INSERT INTO `reservation_service` VALUES (70, 5, 2, 92366);
INSERT INTO `reservation_service` VALUES (70, 9, 1, 99101);
INSERT INTO `reservation_service` VALUES (70, 10, 1, 93601);
INSERT INTO `reservation_service` VALUES (71, 6, 2, 90448);
INSERT INTO `reservation_service` VALUES (71, 9, 3, 80444);
INSERT INTO `reservation_service` VALUES (72, 11, 3, 82323);
INSERT INTO `reservation_service` VALUES (73, 8, 1, 97841);
INSERT INTO `reservation_service` VALUES (74, 6, 2, 94349);
INSERT INTO `reservation_service` VALUES (75, 1, 2, 94642);
INSERT INTO `reservation_service` VALUES (75, 3, 3, 99823);
INSERT INTO `reservation_service` VALUES (75, 7, 3, 83778);
INSERT INTO `reservation_service` VALUES (75, 8, 3, 96000);
INSERT INTO `reservation_service` VALUES (75, 10, 2, 81863);
INSERT INTO `reservation_service` VALUES (76, 6, 1, 95205);
INSERT INTO `reservation_service` VALUES (76, 7, 2, 96336);
INSERT INTO `reservation_service` VALUES (77, 3, 2, 84521);
INSERT INTO `reservation_service` VALUES (77, 5, 2, 93133);
INSERT INTO `reservation_service` VALUES (77, 10, 2, 92768);
INSERT INTO `reservation_service` VALUES (77, 12, 1, 91211);
INSERT INTO `reservation_service` VALUES (78, 1, 1, 97340);
INSERT INTO `reservation_service` VALUES (78, 5, 1, 84511);
INSERT INTO `reservation_service` VALUES (78, 6, 3, 83177);
INSERT INTO `reservation_service` VALUES (78, 11, 1, 92603);
INSERT INTO `reservation_service` VALUES (79, 2, 3, 88654);
INSERT INTO `reservation_service` VALUES (79, 7, 2, 95261);
INSERT INTO `reservation_service` VALUES (79, 9, 3, 86615);
INSERT INTO `reservation_service` VALUES (80, 12, 3, 99966);
INSERT INTO `reservation_service` VALUES (81, 2, 1, 85271);
INSERT INTO `reservation_service` VALUES (81, 4, 1, 86290);
INSERT INTO `reservation_service` VALUES (81, 10, 1, 95669);
INSERT INTO `reservation_service` VALUES (81, 12, 1, 97750);
INSERT INTO `reservation_service` VALUES (82, 2, 3, 81159);
INSERT INTO `reservation_service` VALUES (82, 4, 2, 82872);
INSERT INTO `reservation_service` VALUES (83, 3, 3, 98668);
INSERT INTO `reservation_service` VALUES (83, 7, 2, 83051);
INSERT INTO `reservation_service` VALUES (83, 9, 3, 80628);
INSERT INTO `reservation_service` VALUES (84, 1, 1, 87566);
INSERT INTO `reservation_service` VALUES (84, 5, 2, 94495);
INSERT INTO `reservation_service` VALUES (84, 8, 3, 92880);
INSERT INTO `reservation_service` VALUES (84, 12, 1, 81517);
INSERT INTO `reservation_service` VALUES (86, 1, 3, 85421);
INSERT INTO `reservation_service` VALUES (86, 3, 1, 88323);
INSERT INTO `reservation_service` VALUES (87, 11, 2, 96139);
INSERT INTO `reservation_service` VALUES (88, 5, 1, 94022);
INSERT INTO `reservation_service` VALUES (88, 8, 2, 90936);
INSERT INTO `reservation_service` VALUES (88, 10, 3, 85890);
INSERT INTO `reservation_service` VALUES (88, 11, 3, 84447);
INSERT INTO `reservation_service` VALUES (90, 5, 3, 82040);
INSERT INTO `reservation_service` VALUES (91, 1, 1, 90488);
INSERT INTO `reservation_service` VALUES (91, 4, 2, 88321);
INSERT INTO `reservation_service` VALUES (92, 3, 3, 88938);
INSERT INTO `reservation_service` VALUES (92, 6, 2, 91959);
INSERT INTO `reservation_service` VALUES (93, 1, 1, 91249);
INSERT INTO `reservation_service` VALUES (93, 8, 1, 87704);
INSERT INTO `reservation_service` VALUES (93, 11, 1, 90416);
INSERT INTO `reservation_service` VALUES (94, 4, 3, 80249);
INSERT INTO `reservation_service` VALUES (95, 4, 1, 88860);
INSERT INTO `reservation_service` VALUES (95, 9, 1, 84906);
INSERT INTO `reservation_service` VALUES (95, 12, 2, 98745);
INSERT INTO `reservation_service` VALUES (96, 4, 2, 96113);
INSERT INTO `reservation_service` VALUES (96, 9, 1, 89908);
INSERT INTO `reservation_service` VALUES (96, 10, 1, 88359);
INSERT INTO `reservation_service` VALUES (98, 6, 2, 90737);
INSERT INTO `reservation_service` VALUES (99, 7, 2, 84707);

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
INSERT INTO `service` VALUES (1, 'Anesthesiology', 100000.00, 90000.00, 'assets/images/7a3a2028872f5aa9752076eb8fcadd67.png', 9, 'Service 1', 'Service 1', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (2, '\r\nClinical Nutrition', 100000.00, 100000.00, 'assets/images/8223fe77ccc022f23a0621ba829155cc.png', 10, 'Service 2', 'Service 2', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (3, 'Endocrinology', 460000.00, 150000.00, 'assets/images/128283710.jpg', 11, 'Service 3', 'Service 3', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (4, 'Gastroenterology', 100000.00, 80000.00, 'assets/images/d20140c66092cd2e66dada9a9f9104e6.jpg', 9, 'Service 4', 'Service 4', '2021-07-25 22:34:26', 0, 0, 12);
INSERT INTO `service` VALUES (5, 'Heart Disease', 500000.00, 100000.00, 'assets/images/dd7184.png', 10, 'Service 5', 'Service 5', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (6, 'LGBTQ Health', 200000.00, 150000.00, 'assets/images/download (1).png', 11, 'Service 6', 'Service 6', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (7, '\r\nLong COVID', 700000.00, 90000.00, 'assets/images/Medical-logo-vector-lage.jpg', 9, 'Service 7', 'Service 7', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (8, 'Neurosurgery', 100000.00, 80000.00, 'assets/images/png-transparent-bit-animation-pixel-art-medical-records-game-logo-video-game.png', 10, 'Service 8', 'Service 8', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (9, '\r\nOphthalmology', 200000.00, 150000.00, 'assets/images/s1.jpg', 11, 'Service 9', 'Service 9', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (10, '\r\nPharmacy', 100000.00, 90000.00, 'assets/images/s3.png', 12, 'Service 10', 'Service 10', NULL, NULL, 1, NULL);
INSERT INTO `service` VALUES (11, 'Pulmonology', 300000.00, 100000.00, 'assets/images/7a3a2028872f5aa9752076eb8fcadd67.png', 12, 'Service 11', 'Service 11', '2021-07-25 22:34:38', 0, 0, 18);
INSERT INTO `service` VALUES (12, 'CAR T-Cell therapy', 250000.00, 100000.00, 'assets/images/7a3a2028872f5aa9752076eb8fcadd67.png', 12, 'Service 12', 'Service 12', NULL, NULL, 1, NULL);

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
INSERT INTO `setting` VALUES (9, 'Service Category', 'Pediatrics', 1, NULL, '1');
INSERT INTO `setting` VALUES (10, 'Service Category', 'Cardiology', 2, NULL, '1');
INSERT INTO `setting` VALUES (11, 'Service Category', 'Neurosurgery', 3, NULL, '1');
INSERT INTO `setting` VALUES (12, 'Service Category', 'Cancer Care', 4, NULL, '1');
INSERT INTO `setting` VALUES (13, 'User Status', 'Not verified', 1, NULL, '1');
INSERT INTO `setting` VALUES (14, 'User Status', 'Active', 2, NULL, '1');
INSERT INTO `setting` VALUES (15, 'User Status', 'Contact', 3, NULL, '1');
INSERT INTO `setting` VALUES (16, 'User Status', 'Potential', 4, NULL, '1');
INSERT INTO `setting` VALUES (17, 'User Status', 'Customer', 5, NULL, '1');
INSERT INTO `setting` VALUES (18, 'User Status', 'Inactive', 6, NULL, '1');
INSERT INTO `setting` VALUES (19, 'Reservation Status', 'Pending', 1, NULL, '1');
INSERT INTO `setting` VALUES (20, 'Reservation Status', 'Submitted', 2, NULL, '1');
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
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider
-- ----------------------------
INSERT INTO `slider` VALUES (1, 'A  Response Plan to counter Covid-19', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 1, 'Pushing the boundaries of what’s possible in children’s health.');
INSERT INTO `slider` VALUES (2, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 1, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (5, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (6, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (7, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (8, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (9, 'HueMedical Emergencies Always Come Unannounced!', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (10, 'naviMedical Emergencies Always Come Unannounced!', 'assets/images/slider/slider_1_dad_and_girl.jpg', '#', 0, 'none');
INSERT INTO `slider` VALUES (11, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (12, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (13, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (14, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (15, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (16, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');
INSERT INTO `slider` VALUES (18, 'Medical Emergencies Always Come Unannounced!', 'assets/images/slider/Yuna-color-correction.jpg', '#', 0, 'Get the most advanced emergency care anywhere in just minutes.');

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (-1, 'guest', 'none', 'guest', 1, '0123456789', 'nowhere', '#', 4, 14);
INSERT INTO `user` VALUES (1, 'giangtthe153299@fpt.edu.vn', '58228426789508bbbb13d9f11e05bf6b', 'Giang', 1, '0974484610', 'Vietnam', 'assets/images/default.png', 1, 14);
INSERT INTO `user` VALUES (2, 'hattnhe153222@fpt.edu.vn', '58228426789508bbbb13d9f11e05bf6b', 'Ha', 0, '0974484610', 'Viet Nam', 'assets/images/default.png', 4, 14);
INSERT INTO `user` VALUES (3, 'anhntnhe151378@fpt.edu.vn', '58228426789508bbbb13d9f11e05bf6b', 'Ngoc Anh', 0, '0974484610', 'Viet Nam', 'assets/images/default.png', 2, 14);
INSERT INTO `user` VALUES (4, 'tranglvqhe153785@fpt.edu.vn', '58228426789508bbbb13d9f11e05bf6b', 'Trang', 0, '0974484610', 'Viet Nam', 'assets/images/default.png', 3, 14);
INSERT INTO `user` VALUES (5, 'minhhnhe151181@fpt.edu.vn', '58228426789508bbbb13d9f11e05bf6b', 'Minh', 1, '0974484610', 'Viet Nam', 'assets/images/default.png', 4, 14);

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
