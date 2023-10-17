/*
 Navicat Premium Data Transfer

 Source Server         : liang
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : sannongejia

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 17/10/2023 10:01:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `useraddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sjr` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '646f35ec09e29891981e5f24', '广东省广州市从化区广从南路548号', '13427815322', '许国柱');
INSERT INTO `address` VALUES (6, '646f35ec09e29891981e5f24', 'G108', '19129233374', '廖增林');
INSERT INTO `address` VALUES (7, '646f35ec09e29891981e5f24', '广东省广州市从化区广从南路548号', '1311311313131', '臭嗨居居');
INSERT INTO `address` VALUES (10, '646436c509e2989198e98f88', 'G110', '13427815322', '许国柱');
INSERT INTO `address` VALUES (11, '6463ba68f43e60d7b6956dba', '广州软件学院', '13427815322', '许国柱');
INSERT INTO `address` VALUES (12, '64662c89f43e60d7b676c96d', 'G110', '666666666', '程冠驹');
INSERT INTO `address` VALUES (13, '6476a286e1a35c371bd4208a', 'G11', '13427815322', '许国柱');

-- ----------------------------
-- Table structure for adminusers
-- ----------------------------
DROP TABLE IF EXISTS `adminusers`;
CREATE TABLE `adminusers`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` json,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`, `username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminusers
-- ----------------------------
INSERT INTO `adminusers` VALUES (1, 'http://localhost:3000/uploads\\avatar.png', 'admin', 'admin', '[1]', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwibmFtZSI6IueuoeeQhuWRmCIsImlhdCI6MTY5MjUyNTMxMiwiZXhwIjoxNjkyNTI3MTEyfQ.Z9ATYnj-EkxP8EYlfDIbzIDgUBZI2Qkwnol0ES34o0Q', '管理员');
INSERT INTO `adminusers` VALUES (2, 'http://localhost:3000/uploads\\avatar.png', 'manager', 'manager', '[1]', 'manager Token', '管理人');
INSERT INTO `adminusers` VALUES (11, 'http://localhost:3000/uploads/avatar.png', 'humble', 'humble', '[7]', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1bWJsZSIsIm5hbWUiOiJodW1ibGUiLCJpYXQiOjE2OTI3NjYxMTMsImV4cCI6MTY5Mjc2NzkxM30.jdKQrMJcxPDyPGTyGHgljL3SsroaiIKvdgI84LCv5yE', 'humble');
INSERT INTO `adminusers` VALUES (12, 'http://localhost:3000/uploads/avatar.png', 'humble1', 'humble1', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1bWJsZTEiLCJuYW1lIjoiaHVtYmxlMSIsImlhdCI6MTY5MzQ2ODEyNSwiZXhwIjoxNjkzNDY5OTI1fQ.8U9hcwEHmTajIzs_1AHT2ITZBhDyUh1bsNgZZ8PLo_w', 'humble1');

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan`  (
  `dingdanid` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(255) DEFAULT NULL,
  `shopcart` json NOT NULL,
  `adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cjtime` datetime(0) DEFAULT NULL,
  `fukuantime` datetime(0) DEFAULT NULL,
  `fahuotime` datetime(0) DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sjr` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dingdanid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES (27, '64662c89f43e60d7b676c96d', 5, '[{\"count\": 2, \"jiage\": 12, \"shopid\": 1, \"shopname\": \"四齿耙\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 35, \"shopid\": 2, \"shopname\": \"尖头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/349bee26-bef5-445f-a49e-bb53d3fcb5fd.png\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 36, \"shopid\": 3, \"shopname\": \"平头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c805fe4c-ccdf-4641-bffc-10ef94caddf5.png\", \"pinglunzhuantai\": 1}]', 'G110', '2023-05-30 23:04:11', '2023-05-30 23:18:23', '2023-05-30 23:20:04', '666666666', '程冠驹');
INSERT INTO `dingdan` VALUES (28, '6476a286e1a35c371bd4208a', 5, '[{\"count\": 1, \"jiage\": 12, \"shopid\": 1, \"shopname\": \"四齿耙\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png\", \"pinglunzhuantai\": 1}]', 'G11', '2023-05-31 09:31:11', '2023-05-31 09:31:26', '2023-05-31 09:32:17', '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (26, '64662c89f43e60d7b676c96d', 2, '[{\"count\": 1, \"jiage\": 22, \"shopid\": 15, \"shopname\": \"洋槐木柄1.2m\", \"changpingimg\": \"http://localhost:3000/uploads/product/1691825620665-æ.jpg\", \"pinglunzhuantai\": 0}, {\"count\": 1, \"jiage\": 22, \"shopid\": 11, \"shopname\": \"四齿耙小号\", \"changpingimg\": \"http://localhost:3000/uploads/product/1691825626974-åé½¿èå°å·.jpg\", \"pinglunzhuantai\": 0}, {\"count\": 1, \"jiage\": 47, \"shopid\": 14, \"shopname\": \"四齿耙大号带柄\", \"changpingimg\": \"http://localhost:3000/uploads/product/1691825624761-åé½¿èå¤§å·å¸¦æ.jpg\", \"pinglunzhuantai\": 0}, {\"count\": 1, \"jiage\": 40, \"shopid\": 5, \"shopname\": \"大号十字镐单头\", \"changpingimg\": \"http://localhost:3000/uploads/product/1691830302486-å¤§å·åå­é.jpg\", \"pinglunzhuantai\": 0}]', 'G110', '2023-05-30 22:13:15', '2023-05-30 22:22:12', NULL, '666666666', '程冠驹');
INSERT INTO `dingdan` VALUES (25, '6463ba68f43e60d7b6956dba', 2, '[{\"count\": 1, \"jiage\": 25, \"shopid\": 23, \"shopname\": \"生菜籽\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/e5969ab2-8e55-4997-9343-1ab63da47d1d.jpg\", \"pinglunzhuantai\": 0}]', '广州软件学院', '2023-05-28 23:56:11', '2023-05-28 23:56:16', NULL, '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (22, '646436c509e2989198e98f88', 3, '[{\"count\": 1, \"jiage\": 31, \"shopid\": 5, \"shopname\": \"长体平头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/f7856578-40d9-4bb7-94a9-504d5c427e08.png\", \"pinglunzhuantai\": 0}]', 'G110', '2023-05-28 23:30:13', '2023-05-28 23:30:18', '2023-09-08 16:50:58', '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (23, '646436c509e2989198e98f88', 2, '[{\"count\": 1, \"jiage\": 25, \"shopid\": 23, \"shopname\": \"生菜籽\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/e5969ab2-8e55-4997-9343-1ab63da47d1d.jpg\", \"pinglunzhuantai\": 0}]', 'G110', '2023-05-28 23:33:44', '2023-05-29 00:17:20', NULL, '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (24, '646436c509e2989198e98f88', 2, '[{\"count\": 1, \"jiage\": 3, \"shopid\": 25, \"shopname\": \"细叶韭菜种子\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/0f4d1e28-bd33-45af-8fc4-8fb8c2144757.jpg\", \"pinglunzhuantai\": 0}]', 'G110', '2023-05-28 23:33:56', '2023-05-28 23:34:00', NULL, '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (20, '6463ba68f43e60d7b6956dba', 4, '[{\"count\": 1, \"jiage\": 25, \"shopid\": 23, \"shopname\": \"生菜籽\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/e5969ab2-8e55-4997-9343-1ab63da47d1d.jpg\", \"pinglunzhuantai\": 0}, {\"count\": 1, \"jiage\": 4, \"shopid\": 24, \"shopname\": \"辣椒种子\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/31eb09e1-1281-4b4a-a56c-e45bc520f7e6.jpg\", \"pinglunzhuantai\": 0}, {\"count\": 1, \"jiage\": 3, \"shopid\": 25, \"shopname\": \"细叶韭菜种子\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/0f4d1e28-bd33-45af-8fc4-8fb8c2144757.jpg\", \"pinglunzhuantai\": 0}]', '广州软件学院', '2023-05-28 22:50:01', '2023-05-28 22:50:30', '2023-05-28 22:50:45', '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (21, '646436c509e2989198e98f88', 5, '[{\"count\": 1, \"jiage\": 12, \"shopid\": 1, \"shopname\": \"四齿耙\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png\", \"pinglunzhuantai\": 1}]', 'G110', '2023-05-28 22:51:45', '2023-05-28 22:51:52', '2023-05-28 22:52:10', '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (19, '646436c509e2989198e98f88', 5, '[{\"count\": 1, \"jiage\": 12, \"shopid\": 1, \"shopname\": \"四齿耙\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 35, \"shopid\": 2, \"shopname\": \"尖头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/349bee26-bef5-445f-a49e-bb53d3fcb5fd.png\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 36, \"shopid\": 3, \"shopname\": \"平头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c805fe4c-ccdf-4641-bffc-10ef94caddf5.png\", \"pinglunzhuantai\": 1}]', 'G110', '2023-05-28 14:07:25', '2023-05-28 02:02:20', '2023-05-28 02:03:53', '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (18, '646436c509e2989198e98f88', 5, '[{\"count\": 1, \"jiage\": 48, \"shopid\": 12, \"shopname\": \"菜果树花肥料\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c400e688-9a22-49f1-b4e7-7f8fb1b87305.jpg\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 22, \"shopid\": 13, \"shopname\": \"发酵干鸡粪肥\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/8862f67f-d802-4802-8e4a-05c143afa349.jpg\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 16, \"shopid\": 14, \"shopname\": \"高浓度硫酸钾型肥料\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/2793d6e8-8fba-4052-a8d3-49d398fad7d7.jpg\", \"pinglunzhuantai\": 1}, {\"count\": 1, \"jiage\": 33, \"shopid\": 15, \"shopname\": \"花蕊绿植温和型肥料\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/16a40812-b85d-4343-9ea2-92dcaee355ba.jpg\", \"pinglunzhuantai\": 1}]', 'G110', '2023-05-28 02:02:20', '2023-05-28 02:02:20', '2023-05-28 02:03:53', '13427815322', '许国柱');
INSERT INTO `dingdan` VALUES (29, '6476a286e1a35c371bd4208a', 3, '[{\"count\": 1, \"jiage\": 47, \"shopid\": 14, \"shopname\": \"大号尖头锹\", \"changpingimg\": \"http://localhost:3000/uploads/product/1691825624761-åé½¿èå¤§å·å¸¦æ.jpg\", \"pinglunzhuantai\": 0}]', 'G110', '2023-05-31 09:31:55', '2023-05-31 09:31:57', '2023-08-31 14:40:19', '13427815322', '许国柱');

-- ----------------------------
-- Table structure for existingattribute
-- ----------------------------
DROP TABLE IF EXISTS `existingattribute`;
CREATE TABLE `existingattribute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spuid` int(11) DEFAULT NULL,
  `basesaleattrid` int(11) DEFAULT NULL,
  `saleattrname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleattrvaluelist` json,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of existingattribute
-- ----------------------------
INSERT INTO `existingattribute` VALUES (1, 1, 1, '尺码', '[\"大号\", \"中号\", \"小号\"]');
INSERT INTO `existingattribute` VALUES (5, 1, 3, '版本', '[\"1.2m\", \"1.4m\", \"单头\"]');
INSERT INTO `existingattribute` VALUES (6, 2, 1, '尺码', '[\"大号\", \"小号\", \"特大\"]');
INSERT INTO `existingattribute` VALUES (7, 8, 1, '尺码', '[\"大号\", \"小号\", \"中号\"]');
INSERT INTO `existingattribute` VALUES (8, 9, 3, '版本', '[\"纤维握把\", \"木头握把\"]');
INSERT INTO `existingattribute` VALUES (9, 9, 1, '尺码', '[\"小号\", \"大号\"]');
INSERT INTO `existingattribute` VALUES (17, 8, 3, '版本', '[\"1.2m\", \"1.4m\", \"单头\"]');
INSERT INTO `existingattribute` VALUES (18, 3, 1, '尺码', '[\"2.5kg\", \"5kg\", \"10kg\", \"20kg\", \"40kg\"]');
INSERT INTO `existingattribute` VALUES (19, 3, 3, '版本', '[\"粉状\", \"颗粒\"]');

-- ----------------------------
-- Table structure for helpcommunity
-- ----------------------------
DROP TABLE IF EXISTS `helpcommunity`;
CREATE TABLE `helpcommunity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `videourls` json,
  `headSculpture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `creattime` datetime(0) DEFAULT NULL,
  `likestatus` int(255) DEFAULT NULL,
  `likecount` int(255) DEFAULT NULL,
  `imgurls` json,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comdata` json,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helpcommunity
-- ----------------------------
INSERT INTO `helpcommunity` VALUES (1, '64662c89f43e60d7b676c96d', 'AJU', NULL, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png', '2023-05-25 14:34:23', 0, 0, '[{\"url\": \"blob:http://localhost:5173/6f229b21-82ff-437e-93e3-a0d93325e857\", \"name\": \"64ab6ec9e0bdbcaef4355e5813249aa9_1.jpg\", \"path\": \"blob:http://localhost:5173/6f229b21-82ff-437e-93e3-a0d93325e857\", \"size\": 67649, \"uuid\": 1684996685751, \"image\": {\"width\": 1079, \"height\": 1080, \"location\": \"blob:http://localhost:5173/6f229b21-82ff-437e-93e3-a0d93325e857\"}, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/6f6e1557-39d4-48ea-b416-f12a954c8349.jpg\", \"status\": \"ready\", \"extname\": \"jpg\", \"fileType\": \"image\", \"cloudPath\": \"1684996685741_1.jpg\"}]', '广州软件学院', '测试', NULL);
INSERT INTO `helpcommunity` VALUES (3, '64662c89f43e60d7b676c96d', 'AJU', NULL, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png', '2023-05-25 14:45:08', 1, 3, '[{\"url\": \"blob:http://localhost:5173/27f3906f-e678-47ee-8b93-808d8cd7223d\", \"name\": \"1c80bc476d6bd4be3f0a022a1eb886fc_1.jpg\", \"path\": \"blob:http://localhost:5173/27f3906f-e678-47ee-8b93-808d8cd7223d\", \"size\": 86564, \"uuid\": 1684997095992, \"image\": {\"width\": 922, \"height\": 922, \"location\": \"blob:http://localhost:5173/27f3906f-e678-47ee-8b93-808d8cd7223d\"}, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/acc25671-4a09-46bf-833e-7745943e72b4.jpg\", \"status\": \"ready\", \"extname\": \"jpg\", \"fileType\": \"image\", \"cloudPath\": \"1684997095927_0.jpg\"}, {\"url\": \"blob:http://localhost:5173/5440e3a6-f85b-4a33-b26a-9b9e77b8fa29\", \"name\": \"64ab6ec9e0bdbcaef4355e5813249aa9_1.jpg\", \"path\": \"blob:http://localhost:5173/5440e3a6-f85b-4a33-b26a-9b9e77b8fa29\", \"size\": 67649, \"uuid\": 1684997096025, \"image\": {\"width\": 1079, \"height\": 1080, \"location\": \"blob:http://localhost:5173/5440e3a6-f85b-4a33-b26a-9b9e77b8fa29\"}, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/1ee87a6e-411b-496c-a8af-8568b38ee028.jpg\", \"status\": \"ready\", \"extname\": \"jpg\", \"fileType\": \"image\", \"cloudPath\": \"1684997095927_1.jpg\"}, {\"url\": \"blob:http://localhost:5173/806241a1-bae9-43e5-b0c8-67555f32368c\", \"name\": \"083817ee47ca33d83ded15f937c680bc_1.jpg\", \"path\": \"blob:http://localhost:5173/806241a1-bae9-43e5-b0c8-67555f32368c\", \"size\": 60105, \"uuid\": 1684997096061, \"image\": {\"width\": 674, \"height\": 674, \"location\": \"blob:http://localhost:5173/806241a1-bae9-43e5-b0c8-67555f32368c\"}, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/19077809-3700-463c-9c63-53965a504e08.jpg\", \"status\": \"ready\", \"extname\": \"jpg\", \"fileType\": \"image\", \"cloudPath\": \"1684997095927_2.jpg\"}]', '广州软件学院', '传一些好康头像给你们康康', '[{\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\", \"comname\": \"許國柱\", \"comtime\": \"2023/5/25\", \"usercom\": \"这些头像好康\"}, {\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png\", \"comname\": \"AJU\", \"comtime\": \"2023/5/25\", \"usercom\": \"是吧，我也觉得\"}, {\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\", \"comname\": \"許國柱\", \"comtime\": \"2023/5/25\", \"usercom\": \"6\"}, {\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/a5fe2ec3-7bb7-4332-b614-6195c16c590f.png\", \"comname\": \"许国柱\", \"comtime\": \"2023/5/25\", \"usercom\": \"挺热闹呀\"}, {\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\", \"comname\": \"azhuu\", \"comtime\": \"2023/5/29\", \"usercom\": \"6666\"}, {\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\", \"comname\": \"azhuu\", \"comtime\": \"2023-05-29T02:15:57.159Z\", \"usercom\": \"6666\"}]');
INSERT INTO `helpcommunity` VALUES (2, '64662c89f43e60d7b676c96d', 'AJU', NULL, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png', '2023-05-25 14:38:12', 0, 2, '[{\"url\": \"blob:http://localhost:5173/6f229b21-82ff-437e-93e3-a0d93325e857\", \"name\": \"64ab6ec9e0bdbcaef4355e5813249aa9_1.jpg\", \"path\": \"blob:http://localhost:5173/6f229b21-82ff-437e-93e3-a0d93325e857\", \"size\": 67649, \"uuid\": 1684996685751, \"image\": {\"width\": 1079, \"height\": 1080, \"location\": \"blob:http://localhost:5173/6f229b21-82ff-437e-93e3-a0d93325e857\"}, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/6f6e1557-39d4-48ea-b416-f12a954c8349.jpg\", \"status\": \"ready\", \"extname\": \"jpg\", \"fileType\": \"image\", \"cloudPath\": \"1684996685741_1.jpg\"}]', '广州软件学院', '测试', NULL);
INSERT INTO `helpcommunity` VALUES (4, '64662c89f43e60d7b676c96d', 'AJU', '[{\"url\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5a7a1377-5c35-4bf4-b8ba-9f5bb44a8e5f.mp4\", \"name\": \"老虎.mp4\", \"path\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5a7a1377-5c35-4bf4-b8ba-9f5bb44a8e5f.mp4\", \"size\": 2769288, \"uuid\": 1684998187239, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5a7a1377-5c35-4bf4-b8ba-9f5bb44a8e5f.mp4\", \"status\": \"success\", \"extname\": \"mp4\", \"fileType\": \"video\", \"cloudPath\": \"1684998187239_0.mp4\"}]', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png', '2023-05-25 14:59:55', 0, 3, NULL, '广州软件学院', '给你康个好看的视频', NULL);
INSERT INTO `helpcommunity` VALUES (5, '64662c89f43e60d7b676c96d', 'AJU', '[{\"url\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5a7a1377-5c35-4bf4-b8ba-9f5bb44a8e5f.mp4\", \"name\": \"老虎.mp4\", \"path\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5a7a1377-5c35-4bf4-b8ba-9f5bb44a8e5f.mp4\", \"size\": 2769288, \"uuid\": 1684998187239, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5a7a1377-5c35-4bf4-b8ba-9f5bb44a8e5f.mp4\", \"status\": \"success\", \"extname\": \"mp4\", \"fileType\": \"video\", \"cloudPath\": \"1684998187239_0.mp4\"}]', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png', '2023-05-25 15:04:04', 0, 1, NULL, '广州软件学院', '测试', NULL);
INSERT INTO `helpcommunity` VALUES (6, '646436c509e2989198e98f88', '許國柱', '[{\"url\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/dc7227b5-0e13-4851-bc2d-758d27f42553.mp4\", \"name\": \"2040233145许国柱青春有约.mp4\", \"path\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/dc7227b5-0e13-4851-bc2d-758d27f42553.mp4\", \"size\": 2708269, \"uuid\": 1684999301297, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/dc7227b5-0e13-4851-bc2d-758d27f42553.mp4\", \"status\": \"success\", \"extname\": \"mp4\", \"fileType\": \"video\", \"cloudPath\": \"1684999301296_0.mp4\"}]', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png', '2023-05-25 15:22:03', 0, 5, NULL, '广州软件学院', '我也给你们看看好康的是视频', '[{\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png\", \"comname\": \"AJU\", \"comtime\": \"2023-05-30T14:44:06.326Z\", \"usercom\": \"好康(♥∀♥)\"}]');
INSERT INTO `helpcommunity` VALUES (7, '6463ba68f43e60d7b6956dba', '许国柱', NULL, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/a5fe2ec3-7bb7-4332-b614-6195c16c590f.png', '2023-05-28 00:12:09', 0, 0, '[{\"url\": \"http://tmp/kO9VGnqgwYq89c66df4ed13e0e1f5b8f2c8129f9caeb.jpg\", \"name\": \"kO9VGnqgwYq89c66df4ed13e0e1f5b8f2c8129f9caeb.jpg\", \"path\": \"http://tmp/kO9VGnqgwYq89c66df4ed13e0e1f5b8f2c8129f9caeb.jpg\", \"size\": 60105, \"uuid\": 1685203921604, \"image\": {\"width\": 674, \"height\": 674, \"location\": \"http://tmp/kO9VGnqgwYq89c66df4ed13e0e1f5b8f2c8129f9caeb.jpg\"}, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/eef731b8-b5cf-4e7f-bb3c-e43ca6b779ec.jpg\", \"status\": \"ready\", \"extname\": \"jpg\", \"fileType\": \"image\", \"cloudPath\": \"1685203921552_2.jpg\"}]', '广州软件学院', '试试微信', NULL);
INSERT INTO `helpcommunity` VALUES (8, '6476a286e1a35c371bd4208a', 'azu', '[{\"url\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5847f268-852e-4280-8dbb-09e86e17e79b.mp4\", \"name\": \"2040233145许国柱青春有约.mp4\", \"path\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5847f268-852e-4280-8dbb-09e86e17e79b.mp4\", \"size\": 2708269, \"uuid\": 1685496545379, \"fileID\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5847f268-852e-4280-8dbb-09e86e17e79b.mp4\", \"status\": \"success\", \"extname\": \"mp4\", \"fileType\": \"video\", \"cloudPath\": \"1685496545379_0.mp4\"}]', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/a5fe2ec3-7bb7-4332-b614-6195c16c590f.png', '2023-05-31 09:29:15', 1, 1, NULL, '广州软件学院', '666', '[{\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5b7540c6-2d51-4864-9832-e3dc85c07f62.png\", \"comname\": \"azuu\", \"comtime\": \"2023/5/31\", \"usercom\": \"AAAA\"}, {\"comimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5b7540c6-2d51-4864-9832-e3dc85c07f62.png\", \"comname\": \"azuu\", \"comtime\": \"2023-05-31T01:30:23.951Z\", \"usercom\": \"666\"}]');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '全部数据', NULL, 1);
INSERT INTO `menu` VALUES (2, 1, '权限管理', 'Acl', 2);
INSERT INTO `menu` VALUES (69, 65, '待处理订单', 'Pending', 3);
INSERT INTO `menu` VALUES (5, 2, '用户管理', 'User', 3);
INSERT INTO `menu` VALUES (6, 2, '角色管理', 'Role', 3);
INSERT INTO `menu` VALUES (7, 2, '菜单管理', 'Permisson', 3);
INSERT INTO `menu` VALUES (8, 5, '添加用户', 'btn.User.add', 4);
INSERT INTO `menu` VALUES (9, 5, '删除用户', 'btn.User.remove', 4);
INSERT INTO `menu` VALUES (10, 6, '分配权限', 'btn.Role.assgin', 4);
INSERT INTO `menu` VALUES (13, 5, '修改用户', 'btn.User.update', 4);
INSERT INTO `menu` VALUES (14, 5, '分配角色', 'btn.User.assgin', 4);
INSERT INTO `menu` VALUES (15, 6, '添加角色', 'btn.Role.add', 4);
INSERT INTO `menu` VALUES (16, 6, '修改角色', 'btn.Role.update', 4);
INSERT INTO `menu` VALUES (17, 6, '删除角色', 'btn.Role.remove', 4);
INSERT INTO `menu` VALUES (18, 7, '添加', 'btn.Permission.add', 4);
INSERT INTO `menu` VALUES (19, 7, '修改', 'btn.Permission.update', 4);
INSERT INTO `menu` VALUES (20, 7, '删除', 'btn.Permission.remove', 4);
INSERT INTO `menu` VALUES (62, 51, '更新Spu', 'btn.Spu.update', 4);
INSERT INTO `menu` VALUES (56, 52, '删除Sku', 'btn.Sku.remove', 4);
INSERT INTO `menu` VALUES (55, 52, 'Sku详情', 'btn.Sku.detail', 4);
INSERT INTO `menu` VALUES (54, 52, '更新SKU', 'btn.Sku.update', 4);
INSERT INTO `menu` VALUES (53, 52, 'Sku上下架', 'btn.Sku.updown', 4);
INSERT INTO `menu` VALUES (65, 1, '订单管理', 'Orderfrom', 2);
INSERT INTO `menu` VALUES (64, 51, '删除Spu', 'btn.Spu.delete', 4);
INSERT INTO `menu` VALUES (63, 51, '查看SKU列表', 'btn.Spu.skus', 4);
INSERT INTO `menu` VALUES (61, 51, '添加SKU', 'btn.Spu.addsku', 4);
INSERT INTO `menu` VALUES (60, 51, '添加SPU', 'btn.Spu.add', 4);
INSERT INTO `menu` VALUES (59, 50, '删除属性', 'btn.Attr.remove', 4);
INSERT INTO `menu` VALUES (58, 50, '更新属性', 'btn.Attr.update', 4);
INSERT INTO `menu` VALUES (57, 50, '添加属性', 'btn.Attr.add', 4);
INSERT INTO `menu` VALUES (52, 49, 'Sku管理', 'Sku', 3);
INSERT INTO `menu` VALUES (49, 1, '商品管理', 'Product', 2);
INSERT INTO `menu` VALUES (50, 49, '平台属性管理', 'Attr', 3);
INSERT INTO `menu` VALUES (51, 49, 'SPU管理', 'Spu', 3);
INSERT INTO `menu` VALUES (72, 69, '修改订单信息', 'btn.pending.update', 4);
INSERT INTO `menu` VALUES (73, 69, '订单发货', 'btn.pending.driver', 4);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `article_type` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` json,
  `datetime` date DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '《求是》', 0, '习近平：坚持把解决好“三农”问题作为全党工作重中之重 举全党全社会之力推动乡村振兴_滚动新闻_中国政府网', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/04fd6a25-2a84-4263-b47e-32675945ae89.png', '[\"“实施乡村振兴战略，必须把确保重要农产品特别是粮食供给作为首要任务，把提高农业综合生产能力放在更加突出的位置，把‘藏粮于地、藏粮于技’真正落实到位。要在推动社会保障事业高质量发展上持续用力，织密社会保障安全网，为人民生活安康托底。”\", \"习近平总书记6日下午看望参加全国政协十三届五次会议的农业界、社会福利和社会保障界委员并参加联组会时的重要讲话振奋人心，为农业和社会保障事业的发展指明前进方向，激发代表委员和广大干部群众的奋进力量。\", \"粮食安全是“国之大者”\", \"“总书记说，在粮食安全这个问题上不能有丝毫麻痹大意。”现场聆听习近平总书记的重要讲话，贵州省盘州市淤泥乡岩博联村党委书记余留芬委员说，“岩博联村土地贫瘠，过去粮食产量低、吃不饱，在党和政府帮助以及村民共同努力下，现在不仅吃得饱，也吃得好了。我们要按照总书记要求的‘始终绷紧粮食安全这根弦’，确保中国人的饭碗主要装中国粮。”\", \"耕地是粮食生产的命根子，是中华民族永续发展的根基。\", \"“习近平总书记对保障粮食安全、落实最严格耕地保护制度提出了明确要求，这让我们更加坚定了发展方向。”广西壮族自治区农业科学院研究员陈彩虹委员说，未来我们要打造更多高标准农田，坚决遏制耕地“非农化”、防止“非粮化”，稳定粮食面积，确保粮食产得出、供得上、供得优。\", \"解决吃饭问题，根本出路在科技。\", \"“多年来，在无数次深入各地农村调研中，我深刻体会到，推动农业绿色发展转型的根本在科技进步。”中山大学生命科学学院教授刘昕委员感慨。今年两会，刘昕委员带来的提案，其中就有关于大力推进种源等农业关键核心技术攻关的。“农业最大的短板是种子，我们要努力完善先进育种技术创新体系，推动我国种业科技自立自强。”\", \"河南省辉县市裴寨村，读书服务站内不时传来琅琅书声。这些年，为提升农民素质、缩小城乡差距，裴寨村修建了“习书堂”，引导群众“读好书”“好读书”。\", \"“做好‘三农’工作，推进乡村振兴，还要重视农民思想道德教育，培育文明乡风。”裴寨村党支部书记裴春亮代表说，“接下来，我们将落实总书记的重要讲话精神，继续强化农村基层党组织建设，不断丰富村民的精神文化生活。”\", \"在推动社会保障事业高质量发展上持续用力\", \"大凉山“悬崖村”，“阳光低保”跨过天堑，为昔日的特困户织起一张社会兜底保障网。四川省民政厅党组书记、厅长益西达瓦委员感同身受：“确保兜住底、兜准底、兜好底，是我国建成世界上最大规模社会保障体系的缩影。”\", \"“习近平总书记强调，要在推动社会保障事业高质量发展上持续用力。”益西达瓦委员深受鼓舞，同时感到沉甸甸的责任，“我们一定不辜负总书记嘱托，不仅要守护好人民群众的每一分‘养老钱’‘保命钱’，还要进一步围绕低收入人口、残疾人、老人和未成年人等特殊群体，通过提升保障标准、拓宽就业渠道等多种方式，不断巩固拓展保障成果。”\", \"随着城镇化、人口老龄化、就业方式多样化发展，我国社会保障体系还将不断深入改革，增强制度的统一性和规范性，把更多人纳入社会保障体系。\", \"作为长期从事社保制度研究的专家，中国社会科学院世界社保研究中心主任郑秉文委员充满信心：“‘健全灵活就业人员社保制度’‘深化社会救助制度改革’‘补齐农村社会福利短板’……总书记的话，充分体现了党中央对增进民生福祉的高度重视。我会继续深入调研，持续为健全覆盖全民的社会保障体系建言献策、贡献力量。”\", \"民生无小事，枝叶总关情。\", \"走进山东省滨州市博兴县吕艺镇老年公寓，家具、电器一应俱全，屋内茶几旁摆放着一盆鲜花，棋牌室里欢声笑语。在这所由政府、企业、村集体三方保障运行的老年公寓，70岁以上老年人实行统一供养，免收住宿、供暖等费用，每人每月还可领取100元夕阳红补助金。\", \"“习近平总书记强调，要补齐农村社会福利短板。”吕艺镇党委书记曲海霞对未来方向更加坚定：让农村百姓不仅“老有所养”，还能在精神上“老有所乐”。“我们将按照总书记的要求，格外加强对特殊和困难群体的关心关爱，努力为人民生活安康托底！”\"]', '2023-03-12', 1000);
INSERT INTO `news` VALUES (2, '农科新闻网', 1, '智慧科技 耀亮春日田野', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/9d70084e-e496-4df7-90f3-cf2a9df7d420.jpg', '[\"春耕备耕时节，湖南省常德市鼎城区国家现代农业产业园运用现代信息技术，对传统农业生产进行数字化改造。图为在产业园一处蔬菜育苗基地，工作人员使用手机控制大棚内温度、湿度。新华社记者 陈思汗摄\", \"“清明谷雨两相连，浸种耕田莫迟延”。春耕春种对于夺取全年农业丰产增收具有重要意义。眼下正值春耕、春播、春管的关键时期，全国春季农业生产由南向北依次展开，田间地头奏响春耕进行曲。正如有网友留言所说：“一年之计在于春，一年好景在春耕。”\", \"智慧春耕\", \"为农业插上科技翅膀\", \"春耕，指的是在春季作物播种前完成的农田耕作，包括翻松、平整土地以及施肥等，是春季作物播种之前必要的农事活动。\", \"当前，全国各地的春耕中，智能农机设备得到广泛应用，助力今年春耕向高质量、高效率的目标前进。\", \"据央视网报道，湖南省岳阳市引入无人机巡田，可以自动采集土地平整度、秧苗生长状态等信息，为农户科学开展除草、施肥等工作提供依据。在浙江省湖州市的农业综合示范园区，数字化系统在监测土壤温湿度、光照强度等参数的同时，还能自动控制水闸、灭虫灯等设备，农田管理更加精细。广西壮族自治区防城港市上思县叫安镇，今年将分散的土地打造成了集中连片、设施完善的高标准农田，机械化使用率逐步提高。\", \"根据农业农村部农业机械化管理司预计，今春全国将有超过2250万台（套）各型拖拉机、耕整地机具以及播种机、水稻育插秧机具等农机装备投入农业生产，与去年基本持平略有增加。同时，农机装备向智能高效升级。数据显示，截至2022年底，全国装有北斗定位作业终端的农机装备已达150万台（套），其中安装有辅助驾驶系统的拖拉机超17万台。智慧农机助力农业向规模化、集约化、高效化方向迈进。\", \"人民网发布文章报道了湖南省长沙市望城区广源种植专业合作社的“无人农场”。农场的农业生产全程智能化：耕，有北斗旋耕机按照设计路线翻耕；种，有插秧机、抛秧机、撒播飞机精准作业；管，包括苗情、虫情、地情等，通过系统实时监测，无人机飞到田里施肥、打药……在这里，无人机下地干活，分析决策有后台智能大脑帮忙，全程实现数字化管理。村民把土地交给农机合作社打理，当起了“甩手掌柜”。\", \"农技服务也迈开智能发展的步伐。据杭州网报道，日前，浙江省杭州市临安区湍口镇组织春耕备耕农业科技下乡服务活动，全面启动“智汇乡村”线上服务平台建设。湍口镇以信息化手段连通科技专家，建立按需匹配专家提供志愿服务的长效服务机制，为乡村发展提供常态化科技、科普服务。\", \"微博网友“青苹果”评论说：“科技进步带动了农业发展。春耕，是希望的开始，期待今年的收获。”网友“何兰”说：“科技助力春耕，节约了劳动力，减轻了农民负担，为智慧春耕点赞！”\"]', '2023-03-08', 9999);
INSERT INTO `news` VALUES (3, '	国务院', 0, '国务院关于印发“十四五”推进农业农村现代化规划的通知_农业、畜牧业、渔业_中国政府网 ', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/61eb5ed2-9f50-4cf0-986f-f513a2d8db69.png', '[\"“十四五”推进农业农村现代化规划\", \"“三农”工作是全面建设社会主义现代化国家的重中之重。为贯彻落实《中华人民共和国国民经济和社会发展第十四个五年规划和2035年远景目标纲要》，坚持农业农村优先发展，全面推进乡村振兴，加快农业农村现代化，编制本规划。\", \"第一章　开启农业农村现代化新征程\", \"“十四五”时期是我国全面建成小康社会、实现第一个百年奋斗目标之后，乘势而上开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军的第一个五年，“三农”工作重心历史性转向全面推进乡村振兴，加快中国特色农业农村现代化进程。\", \"第一节　发展环境\", \"“十三五”时期，以习近平同志为核心的党中央坚持把解决好“三农”问题作为全党工作的重中之重，把脱贫攻坚作为全面建成小康社会的标志性工程，启动实施乡村振兴战略，加快推进现代农业建设，乡村振兴实现良好开局。决战脱贫攻坚取得全面胜利。现行标准下农村贫困人口全部脱贫，832个贫困县全部摘帽，12.8万个贫困村全部出列，完成了消除绝对贫困和区域性整体贫困的艰巨任务，创造了人类减贫史上的奇迹。农业综合生产能力稳步提升。粮食连年丰收，产量连续保持在1.3万亿斤以上，肉蛋奶、水产品、果菜茶品种丰富、供应充裕。农业科技进步贡献率达到60%，农作物耕种收综合机械化率达到71%，农业绿色发展迈出新步伐。农民收入水平大幅提高。农村居民人均可支配收入达到17131元，较2010年翻一番多。城乡居民收入差距缩小到2.56∶1。农村基础设施建设得到加强。卫生厕所普及率达到68%，具备条件的乡镇和建制村通硬化路、通客车实现全覆盖，供水供电、通信网络等基础设施明显改善，乡村面貌焕然一新。农村改革纵深推进。农村基本经营制度进一步巩固完善，农村土地、集体产权、经营体制等改革取得突破性进展，乡村治理体系基本建立，农村社会保持和谐稳定。这些成就标志着农业农村发展实现新的跨越，站到新的历史起点上，为“十四五”时期加快推进农业农村现代化奠定了坚实基础。\", \"当前和今后一个时期，国内外环境发生深刻复杂变化，我国农业农村发展仍面临不少矛盾和挑战。农业基础依然薄弱。耕地质量退化面积较大，育种科技创新能力不足，抗风险能力较弱。资源环境刚性约束趋紧，农业面源污染仍然突出。转变农业发展方式任务繁重，农村一二三产业融合发展水平不高，农业质量效益和竞争力不强。农村发展存在短板弱项。制约城乡要素双向流动和平等交换的障碍依然存在，人才服务乡村振兴保障机制仍不健全，防汛抗旱等防灾减灾体系还不完善，基础设施仍有明显薄弱环节，民生保障还存在不少弱项。促进农民持续增收面临较大压力。城乡居民收入差距仍然较大。种养业特别是粮食种植效益偏低，农民就业制约因素较多，农村人口老龄化加快，农村精神文化缺乏，支撑农民增收的传统动能逐渐减弱、新动能亟待培育。巩固拓展脱贫攻坚成果任务比较艰巨。脱贫地区产业发展基础仍然不强，内生动力和自我发展能力亟待提升。部分脱贫户脱贫基础还比较脆弱，防止返贫任务较重。\"]', '2023-03-12', 6666);
INSERT INTO `news` VALUES (4, '农科新闻网', 1, '“花海捞针”育缤纷——江西农大付东辉团队选育彩色油菜花纪实', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/46f571bb-d0bf-4334-9b9c-5df4e291e066.jpg', '[\"春光旖旎，油菜花开。\", \"在位于江西南昌经开区的江西农业大学彩色油菜花试验田里，一袭白褂的付东辉教授手持镊子，小心谨慎地把花蕾中的雄蕊一粒粒剥落，留下中间一根细小的雌蕊。他缓缓凑近，把另外一株父本雄蕊的花粉轻轻敲击沾染到雌蕊的柱头上，再套上套袋。一番操作下来，他才敢呼出一口大气。\", \"这项如同给花蕊做“手术”的细微工作就是杂交，等着付东辉做“手术”的花还有很多，很多……\", \"21年的油菜研究，让付东辉眷恋上了眼前这片花田，也让原本颜色单一的油菜花开出如今的63种颜色来。\", \"十五万株选良品\", \"3月底的一天，江西农业大学付东辉的实验室里空无一人。记者正欲拨打其电话，路过的一位研究人员笑着说：“你找‘花痴’博士啊，去油菜花田，他准在那儿。”\", \"到了试验田，远远地就见付东辉在为不同颜色的油菜花“挂牌”——这样的标记，是为了在花期过后方便保存不同花色的种子，也是下一步选育新色的基础。为了抢花期，仅这项工作就要占掉两个月。\", \"“选育模式类似杂交水稻，过程更是一场几十年的‘长征’。”见记者来，付东辉指着一株今年刚选育出的绛紫红色油菜花打开了话匣。\", \"“杂交结果有的可预知，有的是意想不到的惊喜，就像开盲盒。”付东辉说，目前所有的花色都是基于前期白色、黄色和红色3种颜色油菜花的杂交，出现新的花色后，再把各个颜色相互杂交出更多的颜色。\", \"为了获得叶色、花色、株型不同的油菜花，付东辉他们每年都会从约15万株样本中筛选出优良株系进行加代，能达到条件的不到2000株，每年稳定的不超过10株，也就是说成品率仅0.00006%，无异于“花海捞针”。\", \"如此庞大的工作量却只能用最朴素的办法：人工筛选。\", \"“培育过程让每种新花色达到遗传稳定都十分不易，一种颜色的稳定需4年以上，有的甚至要七八年。”付东辉说。\", \"如今，付东辉团队已经建立了基因定位群体，对花色基因进行了初步定位，让花色、种类不断更新。\", \"今年，该团队已新选育出7种新花色。至此，油菜花花色类型从2022年的56种增加到现在的63种。另外，在2021年30种稳定花色的基础上，稳定花色新增4种。\", \"“我们正在进行基因精细定位和克隆，为的是揭示花色多样化产生的原因，以便高效选育出更多新品种来。”付东辉说。\"]', '2023-02-28', 7777);
INSERT INTO `news` VALUES (5, '新华社', 0, '中共中央　国务院关于促进农民增加收入若干政策的意见__2004年第9号国务院公报', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/33e3acce-8e18-483b-a9ac-197914e20906.png', '[\"在党的十六大精神指引下，2003年各地区各部门按照中央的要求，加大了解决“三农”问题的力度，抵御住了突如其来非典疫情的严重冲击，克服了多种自然灾害频繁发生的严重影响，实现了农业结构稳步调整，农村经济稳步发展，农村改革稳步推进，农民收入稳步增加，农村社会继续保持稳定。同时，应当清醒地看到，当前农业和农村发展中还存在着许多矛盾和问题，突出的是农民增收困难。全国农民人均纯收入连续多年增长缓慢，粮食主产区农民收入增长幅度低于全国平均水平，许多纯农户的收入持续徘徊甚至下降，城乡居民收入差距仍在不断扩大。农民收入长期上不去，不仅影响农民生活水平提高，而且影响粮食生产和农产品供给；不仅制约农村经济发展，而且制约整个国民经济增长；不仅关系农村社会进步，而且关系全面建设小康社会目标的实现；不仅是重大的经济问题，而且是重大的政治问题。全党必须从贯彻“三个代表”重要思想，实现好、维护好、发展好广大农民群众根本利益的高度，进一步增强做好农民增收工作的紧迫感和主动性。\", \"现阶段农民增收困难，是农业和农村内外部环境发生深刻变化的现实反映，也是城乡二元结构长期积累的各种深层次矛盾的集中反映。在农产品市场约束日益增强、农民收入来源日趋多元化的背景下，促进农民增收必须有新思路，采取综合性措施，在发展战略、经济体制、政策措施和工作机制上有一个大的转变。\", \"当前和今后一个时期做好农民增收工作的总体要求是：各级党委和政府要认真贯彻十六大和十六届三中全会精神，牢固树立科学发展观，按照统筹城乡经济社会发展的要求，坚持“多予、少取、放活”的方针，调整农业结构，扩大农民就业，加快科技进步，深化农村改革，增加农业投入，强化对农业支持保护，力争实现农民收入较快增长，尽快扭转城乡居民收入差距不断扩大的趋势。\", \"一、集中力量支持粮食主产区发展粮食产业，促进种粮农民增加收入\", \"（一）加强主产区粮食生产能力建设。当前种粮效益低、主产区农民增收困难的问题尤为突出，必须采取切实有力的措施，尽快加以解决。抓住了种粮农民的增收问题，就抓住了农民增收的重点；调动了农民的种粮积极性，就抓住了粮食生产的根本；保护和提高了主产区的粮食生产能力，就稳住了全国粮食的大局。从2004年起，国家将实施优质粮食产业工程，选择一部分有基础、有潜力的粮食大县和国有农场，集中力量建设一批国家优质专用粮食基地。要着力支持主产区特别是中部粮食产区重点建设旱涝保收、稳产高产基本农田。扩大沃土工程实施规模，不断提高耕地质量。加强大宗粮食作物良种繁育、病虫害防治工程建设，强化技术集成能力，优先支持主产区推广一批有重大影响的优良品种和先进适用技术。围绕农田基本建设，加快中小型水利设施建设，扩大农田有效灌溉面积，提高排涝和抗旱能力。提高农业机械化水平，对农民个人、农场职工、农机专业户和直接从事农业生产的农机服务组织购置和更新大型农机具给予一定补贴。\", \"（二）支持主产区进行粮食转化和加工。主产区要立足粮食优势促进农民增加收入、发展区域经济，并按照市场需求，把粮食产业做大做强。充分利用主产区丰富的饲料资源，积极发展农区畜牧业，通过小额贷款、贴息补助、提供保险服务等形式，支持农民和企业购买优良畜禽、繁育良种，通过发展养殖业带动粮食增值。按照国家产业政策要求，引导农产品加工业合理布局，扶持主产区发展以粮食为主要原料的农产品加工业，重点是发展精深加工。国家通过技改贷款贴息、投资参股、税收政策等措施，支持主产区建立和改造一批大型农产品加工、种子营销和农业科技型企业。\", \"（三）增加对粮食主产区的投入。现有农业固定资产投资、农业综合开发资金、土地复垦基金等要相对集中使用，向主产区倾斜。继续增加农业综合开发资金，新增部分主要用于主产区。为切实支持粮食主产区振兴经济、促进农民增收，要开辟新的资金来源渠道。从2004年起，确定一定比例的国有土地出让金，用于支持农业土地开发，建设高标准基本农田，提高粮食综合生产能力。主销区和产销平衡区也要加强粮食生产能力建设。进一步密切产销区的关系。粮食销区的经营主体到产区建立粮食生产基地、仓储设施和加工企业，应享受国家对主产区的有关扶持政策。产区粮食企业到销区建立仓储、加工等设施，开拓粮食市场，销区政府应予以支持并实行必要的优惠政策。\"]', '2023-02-28', 8888);

-- ----------------------------
-- Table structure for platformattribute
-- ----------------------------
DROP TABLE IF EXISTS `platformattribute`;
CREATE TABLE `platformattribute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propertyid` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` json,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of platformattribute
-- ----------------------------
INSERT INTO `platformattribute` VALUES (1, 1, '产品类型', '[{\"flag\": false, \"valuename\": \"锄头\"}, {\"flag\": false, \"valuename\": \"耙子\"}, {\"flag\": false, \"valuename\": \"镰刀\"}, {\"flag\": false, \"valuename\": \"铁锹\"}, {\"flag\": false, \"valuename\": \"镐子\"}, {\"flag\": false, \"valuename\": \"柄\"}]');
INSERT INTO `platformattribute` VALUES (6, 1, '材质', '[{\"flag\": false, \"valuename\": \"铁\"}, {\"flag\": false, \"valuename\": \"锰钢\"}, {\"flag\": false, \"valuename\": \"不锈钢\"}, {\"flag\": false, \"valuename\": \"螺纹钢\"}]');
INSERT INTO `platformattribute` VALUES (7, 3, '类型', '[{\"flag\": false, \"valuename\": \"有机肥料\"}, {\"flag\": false, \"valuename\": \"化学肥料\"}, {\"flag\": false, \"valuename\": \"复合肥料\"}]');
INSERT INTO `platformattribute` VALUES (8, 3, '适用作物', '[{\"flag\": false, \"valuename\": \"通用\"}, {\"flag\": false, \"valuename\": \"水果类\"}, {\"flag\": false, \"valuename\": \"观花植物\"}, {\"flag\": false, \"valuename\": \"蔬菜类\"}, {\"flag\": false, \"valuename\": \"观叶植物\"}, {\"flag\": false, \"valuename\": \"多肉类\"}, {\"flag\": false, \"valuename\": \"果树类\"}]');
INSERT INTO `platformattribute` VALUES (9, 3, '使用方式', '[{\"flag\": false, \"valuename\": \"灌溉施肥\"}, {\"flag\": false, \"valuename\": \"施土施肥\"}]');
INSERT INTO `platformattribute` VALUES (10, 3, '用途', '[{\"flag\": false, \"valuename\": \"促进植物生长\"}, {\"flag\": false, \"valuename\": \"增加产量\"}]');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES (1, '农业用品');
INSERT INTO `property` VALUES (2, '种子');
INSERT INTO `property` VALUES (3, '肥料');
INSERT INTO `property` VALUES (4, '农机具');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` json,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '平台管理员', '[1, 2, 5, 8, 9, 13, 14, 6, 10, 15, 16, 17, 7, 18, 19, 20, 65, 69, 72, 73, 49, 52, 56, 55, 54, 53, 50, 59, 58, 57, 51, 62, 64, 63, 61, 60]');
INSERT INTO `role` VALUES (2, '商品管理员', '[49, 52, 56, 55, 54, 53, 50, 59, 58, 57, 51, 62, 64, 63, 61, 60, 1]');
INSERT INTO `role` VALUES (3, '权限管理员', '[2, 5, 8, 9, 13, 14, 6, 10, 15, 16, 17, 7, 18, 19, 20, 1]');
INSERT INTO `role` VALUES (7, '订单管理员', '[65, 69, 72, 73, 1]');

-- ----------------------------
-- Table structure for salesattribute
-- ----------------------------
DROP TABLE IF EXISTS `salesattribute`;
CREATE TABLE `salesattribute`  (
  `basesaleattrid` int(11) NOT NULL,
  `saleattrname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`basesaleattrid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salesattribute
-- ----------------------------
INSERT INTO `salesattribute` VALUES (1, '尺码');
INSERT INTO `salesattribute` VALUES (2, '颜色');
INSERT INTO `salesattribute` VALUES (3, '版本');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `shopid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `shopname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `xiaoliang` int(11) DEFAULT NULL,
  `jiage` float(255, 0) DEFAULT NULL,
  `shuliang` int(255) DEFAULT NULL,
  `changpingimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `xxjs` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pingjia` json,
  PRIMARY KEY (`shopid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 0, '四齿耙', 6, 12, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png', '用于表层土壤耕作的农具。耕作深度一般不超过 10厘米。多用于翻地、平地碎土、耙土、耙堆肥、耙草、平整菜园，拾花生等。', '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"耙子很好用，很趁手\", \"nickname\": \"azhuu\", \"creattime\": \"2023-05-19\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}, {\"_id\": \"64662c89f43e60d7b676c96d\", \"comment\": \"比俺老猪的九齿钉耙好用多了\", \"nickname\": \"AJU\", \"creattime\": \"2023-05-20\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c715438c-bef4-44f5-9745-eee5ddd3392b.png\"}, {\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"很好用\", \"nickname\": \"許國柱\", \"creattime\": \"2023-05-28T06:10:22.665Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}, {\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"还怪好用的\", \"nickname\": \"azhuu\", \"creattime\": \"2023-05-28T15:06:59.488Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}, {\"_id\": \"64662c89f43e60d7b676c96d\", \"comment\": \"666\", \"nickname\": \"AJU\", \"creattime\": \"2023-05-30T15:21:15.143Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/634f18bd-e003-476a-ad06-22d311775ab0.png\"}, {\"_id\": \"6476a286e1a35c371bd4208a\", \"comment\": \"666\", \"nickname\": \"azuu\", \"creattime\": \"2023-05-31T01:32:47.872Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5b7540c6-2d51-4864-9832-e3dc85c07f62.png\"}]');
INSERT INTO `shop` VALUES (2, 0, '尖头锹', 7, 35, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/349bee26-bef5-445f-a49e-bb53d3fcb5fd.png', NULL, '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"好\", \"nickname\": \"azhuu\", \"creattime\": \"2023-05-28T15:27:00.742Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}, {\"_id\": \"64662c89f43e60d7b676c96d\", \"comment\": \"66\", \"nickname\": \"AJU\", \"creattime\": \"2023-05-30T15:21:26.865Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/634f18bd-e003-476a-ad06-22d311775ab0.png\"}]');
INSERT INTO `shop` VALUES (3, 0, '平头锹', 8, 36, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c805fe4c-ccdf-4641-bffc-10ef94caddf5.png', NULL, '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"棒\", \"nickname\": \"azhuu\", \"creattime\": \"2023-05-28T15:27:05.745Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}, {\"_id\": \"64662c89f43e60d7b676c96d\", \"comment\": \"66\", \"nickname\": \"AJU\", \"creattime\": \"2023-05-30T15:21:31.293Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/634f18bd-e003-476a-ad06-22d311775ab0.png\"}]');
INSERT INTO `shop` VALUES (4, 0, '四方平头锹', 9, 31, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/87c57db1-ea07-4972-a0af-5a38fcfcb044.png', NULL, NULL);
INSERT INTO `shop` VALUES (5, 0, '长体平头锹', 10, 31, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/f7856578-40d9-4bb7-94a9-504d5c427e08.png', NULL, NULL);
INSERT INTO `shop` VALUES (6, 0, '挖树专用锹', 11, 39, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/561604e0-dedc-4893-81de-7801afda5a8e.png', NULL, NULL);
INSERT INTO `shop` VALUES (7, 0, '三角锄', 12, 17, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/31dc891b-f775-4cd2-b9bc-3a849133343d.png', NULL, NULL);
INSERT INTO `shop` VALUES (8, 0, '木柄小铁锄', 13, 24, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c9ef19fd-951e-4c2c-b5dd-f4a5c62aa4a7.png', NULL, NULL);
INSERT INTO `shop` VALUES (9, 0, '十字镐', 13, 50, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/244c2fce-aa74-4c3f-9a0b-65302f8e3a68.png', NULL, NULL);
INSERT INTO `shop` VALUES (10, 0, '镰刀', 13, 20, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/2e789e26-0405-409a-bc53-8f8b9be45dcb.png', NULL, NULL);
INSERT INTO `shop` VALUES (11, 0, '耙子', 5, 30, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/48597dc8-c5b1-443e-8112-69f48f3e2128.png', '铁耙子园林耙子搂草耙子钢丝耙柴耙多齿耙子 14齿草耙+1.2米钢管柄', NULL);
INSERT INTO `shop` VALUES (12, 2, '菜果树花肥料', 33, 48, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c400e688-9a22-49f1-b4e7-7f8fb1b87305.jpg', '颗粒型肥料使用方法简便多样、使用广泛、效果显著，科学施肥让植物更健康', '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"苹果树肥料很好用\", \"nickname\": \"許國柱\", \"creattime\": \"2023-05-27T19:52:55.490Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}]');
INSERT INTO `shop` VALUES (13, 2, '发酵干鸡粪肥', 23, 22, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/8862f67f-d802-4802-8e4a-05c143afa349.jpg', '园林有机肥、改善土壤缓释快、肥效长、包膜控释，养分持久', '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"好用诶\", \"nickname\": \"許國柱\", \"creattime\": \"2023-05-27T19:55:34.130Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}]');
INSERT INTO `shop` VALUES (14, 2, '高浓度硫酸钾型肥料', 55, 16, 78, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/2793d6e8-8fba-4052-a8d3-49d398fad7d7.jpg', '高硫酸钾肥效长适用范围广、适用且不限于瓜果蔬菜果树盆栽花蕊数目', '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"爱了爱了\", \"nickname\": \"許國柱\", \"creattime\": \"2023-05-27T19:55:40.550Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}]');
INSERT INTO `shop` VALUES (15, 2, '花蕊绿植温和型肥料', 52, 33, 66, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/16a40812-b85d-4343-9ea2-92dcaee355ba.jpg', '发酵工艺，只选择“有氧”的，温和进补，苗不烧、根不伤', '[{\"_id\": \"646436c509e2989198e98f88\", \"comment\": \"花都茁壮成长了\", \"nickname\": \"許國柱\", \"creattime\": \"2023-05-27T19:56:12.758Z\", \"headSculpture\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png\"}]');
INSERT INTO `shop` VALUES (16, 2, '通用型肥料', 44, 30, 88, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/efad6d96-0ddc-4df2-876e-963093360363.jpg', '品牌实力，见证荣誉。调节酸碱，改善生长环境', NULL);
INSERT INTO `shop` VALUES (17, 3, '地膜覆盖机', 33, 262, 53, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c5ccb5d1-a754-4acc-a23c-b1bb3f6746fe.jpg', '本机适合松软土质、自动覆土、防风刷可调节', NULL);
INSERT INTO `shop` VALUES (18, 3, '开沟机', 11, 2480, 13, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/f5375754-1355-4224-9ded-5f39c3110d80.jpg', '专业性农耕机器、功能齐全一机多用，耐磨防滑实心轮，防止爆胎减少打滑耕作免换', NULL);
INSERT INTO `shop` VALUES (19, 3, '水田旱地两用履带式旋耕机', 77, 1600, 56, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/0683379e-e450-475f-8eea-75a215616bf9.jpg', '小设备，大用途，新一代履带微耕机，布局地形马力强劲', NULL);
INSERT INTO `shop` VALUES (20, 3, '饲料粉碎机', 99, 348, 99, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/a21d6370-b2a3-4caf-93a0-d9a69b1e9b6a.jpg', '整机发货，粗细可调，使用广泛，全铜丝电机适应各种恶劣环境，安全高效', NULL);
INSERT INTO `shop` VALUES (21, 3, '拖拉机', 3, 12547, 12, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/72dd3b91-dfca-4bc4-a4d1-1301ca21eae9.jpg', '运货、耕地，马力十足。四驱悬挂。', NULL);
INSERT INTO `shop` VALUES (22, 3, '玉米脱粒机', 55, 489, 100, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/0ab1ed11-f206-4e60-89af-0460c43b2ba9.jpg', '加粗加厚机芯马力十足、36cm加长滚筒效果好，十四档位调节再小也能脱粒、加厚钢板稳固', NULL);
INSERT INTO `shop` VALUES (23, 1, '生菜籽', 33, 25, 64, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/e5969ab2-8e55-4997-9343-1ab63da47d1d.jpg', '粒粒保证、颗颗全检', NULL);
INSERT INTO `shop` VALUES (24, 1, '辣椒种子', 51, 4, 60, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/31eb09e1-1281-4b4a-a56c-e45bc520f7e6.jpg', '家庭种植选春、秋两季栽培、家庭种植选春、秋两季栽培', NULL);
INSERT INTO `shop` VALUES (25, 1, '细叶韭菜种子', 54, 3, 87, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/0f4d1e28-bd33-45af-8fc4-8fb8c2144757.jpg', '口碑栽道是我们对种子不断地追求~生长迅速、长势旺盛、适应性强', NULL);
INSERT INTO `shop` VALUES (26, 1, '小香葱种子', 99, 4, 45, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/21972d40-7754-45e6-96f0-a6c07c4b97d5.jpg', '适合居家种植，适应性强、对养料需求低，仅需浇水以及阳光照射', NULL);
INSERT INTO `shop` VALUES (27, 1, '小番茄种子', 34, 8, 45, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/9b1a0b78-445a-43ed-8fa3-c7f5acf4ae5b.jpg', '果实鲜红、圆形，果面有光泽，外形靓丽，观赏性强', NULL);
INSERT INTO `shop` VALUES (28, 1, '羊角蜜种子', 49, 6, 62, 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/bffd2c76-364f-4365-8353-2187d8281ba4.jpg', '发芽率高，成活率高、口感较好、品种优良、生长迅速‘健康水果', NULL);

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart`  (
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shopcart` json,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES ('6463ba68f43e60d7b6956dba', '[]');
INSERT INTO `shopcart` VALUES ('646436c509e2989198e98f88', '[]');
INSERT INTO `shopcart` VALUES ('6463b389e766bb00852703e2', '[{\"count\": 1, \"jiage\": 12, \"shopid\": 1, \"shopname\": \"四齿耙\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png\"}]');
INSERT INTO `shopcart` VALUES ('64662c89f43e60d7b676c96d', '[{\"count\": 1, \"jiage\": 36, \"shopid\": 3, \"shopname\": \"平头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/c805fe4c-ccdf-4641-bffc-10ef94caddf5.png\"}, {\"count\": 1, \"jiage\": 35, \"shopid\": 2, \"shopname\": \"尖头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/349bee26-bef5-445f-a49e-bb53d3fcb5fd.png\"}, {\"count\": 1, \"jiage\": 31, \"shopid\": 4, \"shopname\": \"四方平头锹\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/87c57db1-ea07-4972-a0af-5a38fcfcb044.png\"}]');
INSERT INTO `shopcart` VALUES ('6476a286e1a35c371bd4208a', '[{\"count\": 1, \"jiage\": 12, \"shopid\": 1, \"shopname\": \"四齿耙\", \"changpingimg\": \"https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/63efa4fc-79a3-4f3b-8c14-6039f7929c77.png\"}]');

-- ----------------------------
-- Table structure for skudetail
-- ----------------------------
DROP TABLE IF EXISTS `skudetail`;
CREATE TABLE `skudetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spuid` int(11) DEFAULT NULL,
  `price` float(10, 2) DEFAULT NULL,
  `weight` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `skucount` int(11) DEFAULT NULL,
  `skusaleattrvalueList` json,
  `skuplatformattributeList` json,
  `skuimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `skudescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `skuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `putaway` int(255) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skudetail
-- ----------------------------
INSERT INTO `skudetail` VALUES (1, 1, 37.00, '1.65kg', 99, '[{\"id\": \"1\", \"saleattrname\": \"中号\"}, {\"id\": \"5\", \"saleattrname\": \"1.2m\"}]', '[{\"id\": \"1\", \"platformattrname\": \"耙子\"}, {\"id\": \"6\", \"platformattrname\": \"螺纹钢\"}]', 'http://localhost:3000/uploads/product/1691825642601-åé½¿èä¸­å·å¸¦æ.jpg', '齿长21cm，宽长15.5cm，齿粗13mm，柄长1.2m', '中号四齿耙', 1);
INSERT INTO `skudetail` VALUES (15, 1, 22.00, '0.65', 88, '[{\"id\": \"5\", \"saleattrname\": \"1.4m\"}]', '[{\"id\": \"1\", \"platformattrname\": \"柄\"}]', 'http://localhost:3000/uploads/product/1691825620665-æ.jpg', '洋槐进口木柄1.2m', '洋槐木柄1.2m', 1);
INSERT INTO `skudetail` VALUES (9, 1, 22.00, '1.05kg', 88, '[{\"id\": \"1\", \"saleattrname\": \"大号\"}, {\"id\": \"5\", \"saleattrname\": \"单头\"}]', '[{\"id\": \"1\", \"platformattrname\": \"耙子\"}, {\"id\": \"6\", \"platformattrname\": \"螺纹钢\"}]', 'http://localhost:3000/uploads/product/1691825622850-åé½¿èå¤§å·.jpg', '齿长26.5cm，宽长18.5cm，齿粗15mm', '四齿耙大号', 0);
INSERT INTO `skudetail` VALUES (5, 9, 40.00, '2kg', 80, '[{\"id\": \"8\", \"saleattrname\": \"木头握把\"}, {\"id\": \"9\", \"saleattrname\": \"大号\"}]', '[{\"id\": \"1\", \"platformattrname\": \"镐子\"}, {\"id\": \"6\", \"platformattrname\": \"锰钢\"}]', 'http://localhost:3000/uploads/product/1691830302486-å¤§å·åå­é.jpg', '辊锻十字镐大号，单头，道轨钢（71猛高碳低合金钢）', '大号十字镐单头', 0);
INSERT INTO `skudetail` VALUES (10, 1, 19.00, '0.5kg', 89, '[{\"id\": \"5\", \"saleattrname\": \"1.2m\"}]', '[{\"id\": \"1\", \"platformattrname\": \"柄\"}]', 'http://localhost:3000/uploads/product/1691825620665-æ.jpg', '洋槐进口木柄1.2m\n', '洋槐木柄1.2m', 0);
INSERT INTO `skudetail` VALUES (11, 1, 22.00, '0.5kg', 88, '[{\"id\": \"1\", \"saleattrname\": \"小号\"}, {\"id\": \"5\", \"saleattrname\": \"单头\"}]', '[{\"id\": \"1\", \"platformattrname\": \"耙子\"}, {\"id\": \"6\", \"platformattrname\": \"螺纹钢\"}]', 'http://localhost:3000/uploads/product/1691825626974-åé½¿èå°å·.jpg', '齿长19cm，宽长15.5cm，齿粗11mm', '四齿耙小号', 0);
INSERT INTO `skudetail` VALUES (12, 1, 37.00, '1.5kg', 88, '[{\"id\": \"1\", \"saleattrname\": \"小号\"}, {\"id\": \"5\", \"saleattrname\": \"1.2m\"}]', '[{\"id\": \"1\", \"platformattrname\": \"耙子\"}, {\"id\": \"6\", \"platformattrname\": \"螺纹钢\"}]', 'http://localhost:3000/uploads/product/1691825629101-åé½¿èå°å·å¸¦æ.jpg', '齿长19.5cm，宽长13cm，齿粗11mm，柄长1.2m', '小号四齿带柄', 0);
INSERT INTO `skudetail` VALUES (13, 1, 30.00, '1kg', 88, '[{\"id\": \"1\", \"saleattrname\": \"中号\"}, {\"id\": \"5\", \"saleattrname\": \"单头\"}]', '[{\"id\": \"1\", \"platformattrname\": \"耙子\"}, {\"id\": \"6\", \"platformattrname\": \"螺纹钢\"}]', 'http://localhost:3000/uploads/product/1691825631856-åé½¿èä¸­å·.jpg', '齿长21.5cm，宽长16cm，齿粗13mm', '四齿耙中号', 0);
INSERT INTO `skudetail` VALUES (14, 1, 47.00, '2kg', 67, '[{\"id\": \"1\", \"saleattrname\": \"大号\"}, {\"id\": \"5\", \"saleattrname\": \"1.2m\"}]', '[{\"id\": \"1\", \"platformattrname\": \"耙子\"}, {\"id\": \"6\", \"platformattrname\": \"螺纹钢\"}]', 'http://localhost:3000/uploads/product/1691825624761-åé½¿èå¤§å·å¸¦æ.jpg', '齿长26.5cm，宽长17cm，齿粗15mm，柄长1.2m', '四齿耙大号带柄', 0);
INSERT INTO `skudetail` VALUES (16, 2, 25.60, '1.0kg', 55, '[{\"id\": \"6\", \"saleattrname\": \"大号\"}]', '[{\"id\": \"1\", \"platformattrname\": \"铁锹\"}, {\"id\": \"6\", \"platformattrname\": \"锰钢\"}]', 'http://localhost:3000/uploads/product/1693040493963-å¤§å·å°å¤´é¹.jpg', '锰钢，总长101cm，铲面长22cm，铲面宽15cm', '大号尖头锹', 0);
INSERT INTO `skudetail` VALUES (17, 2, 13.60, '0.86kg', 66, '[{\"id\": \"6\", \"saleattrname\": \"特大\"}]', '[{\"id\": \"1\", \"platformattrname\": \"铁锹\"}, {\"id\": \"6\", \"platformattrname\": \"锰钢\"}]', 'http://localhost:3000/uploads/product/1693040439053-ç¹å¤§å°å¤´é¹ï¼åå¤´ï¼.jpg', '锰钢，总长41cm，铲面长30cm，铲面宽24cm', '特大尖头锹（单头）', 0);
INSERT INTO `skudetail` VALUES (18, 2, 31.60, '1.76kg', 66, '[{\"id\": \"6\", \"saleattrname\": \"特大\"}]', '[{\"id\": \"1\", \"platformattrname\": \"铁锹\"}, {\"id\": \"6\", \"platformattrname\": \"锰钢\"}]', 'http://localhost:3000/uploads/product/1693040442315-ç¹å¤§å°å¤´é¹.jpg', '锰钢，总长130cm，铲面长30cm，铲面宽24cm', '特大尖头锹', 0);
INSERT INTO `skudetail` VALUES (19, 2, 19.60, '1.0kg', 66, '[{\"id\": \"6\", \"saleattrname\": \"小号\"}]', '[{\"id\": \"1\", \"platformattrname\": \"铁锹\"}, {\"id\": \"6\", \"platformattrname\": \"锰钢\"}]', 'http://localhost:3000/uploads/product/1693040446531-å°å·å°å¤´é¹.jpg', '锰钢，总长41cm，铲面长30cm，铲面宽24cm', '小号尖头锹', 0);
INSERT INTO `skudetail` VALUES (20, 3, 15.90, '2.5kg', 55, '[{\"id\": \"18\", \"saleattrname\": \"2.5kg\"}, {\"id\": \"19\", \"saleattrname\": \"粉状\"}]', '[{\"id\": \"7\", \"platformattrname\": \"有机肥料\"}, {\"id\": \"8\", \"platformattrname\": \"通用\"}, {\"id\": \"9\", \"platformattrname\": \"施土施肥\"}, {\"id\": \"10\", \"platformattrname\": \"促进植物生长\"}]', 'http://localhost:3000/uploads/product/1693387777299-çº¯ç¾ç²ªåéµææºè¥.jpg', '纯羊粪发酵有机肥，2.5kg，粉状', '纯羊粪发酵有机肥', 0);

-- ----------------------------
-- Table structure for spudetail
-- ----------------------------
DROP TABLE IF EXISTS `spudetail`;
CREATE TABLE `spudetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `propertyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spudetail
-- ----------------------------
INSERT INTO `spudetail` VALUES (1, '四齿耙', '用于表层土壤耕作的农具。耕作深度一般不超过 10厘米。多用于翻地、平地碎土、耙土、耙堆肥、耙草、平整菜园，拾花生等等。', 1);
INSERT INTO `spudetail` VALUES (2, '尖头锹', '尖头锹可以用于挖掘坑穴、移动土壤、清理农田或种植床，并进行其他土壤准备工作。在建筑和园艺方面，它常用于挖掘地基、埋设管道、整理花坛或园艺区域，以及移除废弃材料等任务。', 1);
INSERT INTO `spudetail` VALUES (3, '纯羊粪发酵有机肥', '来自大草原的羊粪，纯天然无污染，经高温充分发酵腐熟，无臭味，不烧根，不起虫，是绿色健康的好肥料!', 3);
INSERT INTO `spudetail` VALUES (4, '平头锹', '平头锹在各种领域和任务中都有用武之地。在农业中，它可以用于挖掘沟渠、铲除土壤、搬运堆肥等。在建筑和园艺方面，平头锹可以用于挖掘浅坑、铲除废弃物、整理土壤等。', 1);
INSERT INTO `spudetail` VALUES (5, '挖树专用锹', '使用挖树专用锹可以更加有效地挖掘树木，并确保根系的完整性，从而提高成功移植的机会。在进行树木挖掘和移植时，确保遵循适当的技术和方法，以减少对树木健康的不良影响。', 1);
INSERT INTO `spudetail` VALUES (8, '三角锄', '这种工具适用于多种任务，如开沟、挖坑、松土、混合土壤等。由于其尖锐的头部，它也可以用于处理比较坚硬的土壤和根系。三角锄在农田、花园和其他需要土地准备和整理的场合非常有用。', 1);
INSERT INTO `spudetail` VALUES (9, '十字镐', '十字镐是一种多用途的工具，它具有十字形状的头部，适用于多种挖掘和破碎任务。其尖锐的尖头和刃使其适用于开沟、挖坑、破碎坚硬的土壤和石头，以及处理根系等任务。无论是在农田、建筑工地还是园艺领域，十字镐都是一个不可或缺的工具，能够应对各种土地准备和清理工作。', 1);

-- ----------------------------
-- Table structure for spuimage
-- ----------------------------
DROP TABLE IF EXISTS `spuimage`;
CREATE TABLE `spuimage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spuid` int(11) DEFAULT NULL,
  `imagename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spuimage
-- ----------------------------
INSERT INTO `spuimage` VALUES (1, 1, '四齿耙中号带柄.jpg', 'http://localhost:3000/uploads/product/1691825642601-åé½¿èä¸­å·å¸¦æ.jpg');
INSERT INTO `spuimage` VALUES (2, 1, '四齿耙大号.jpg', 'http://localhost:3000/uploads/product/1691825622850-åé½¿èå¤§å·.jpg');
INSERT INTO `spuimage` VALUES (3, 1, '柄.jpg', 'http://localhost:3000/uploads/product/1691825620665-æ.jpg');
INSERT INTO `spuimage` VALUES (4, 1, '四齿耙小号.jpg', 'http://localhost:3000/uploads/product/1691825626974-åé½¿èå°å·.jpg');
INSERT INTO `spuimage` VALUES (5, 1, '四齿耙小号带柄.jpg', 'http://localhost:3000/uploads/product/1691825629101-åé½¿èå°å·å¸¦æ.jpg');
INSERT INTO `spuimage` VALUES (6, 1, '四齿耙中号.jpg', 'http://localhost:3000/uploads/product/1691825631856-åé½¿èä¸­å·.jpg');
INSERT INTO `spuimage` VALUES (7, 1, '四齿耙大号带柄.jpg', 'http://localhost:3000/uploads/product/1691825624761-åé½¿èå¤§å·å¸¦æ.jpg');
INSERT INTO `spuimage` VALUES (8, 8, '大号三角锄.jpg', 'http://localhost:3000/uploads/product/1691827528206-å¤§å·ä¸è§é.jpg');
INSERT INTO `spuimage` VALUES (9, 9, '大号十字镐.jpg', 'http://localhost:3000/uploads/product/1691830302486-å¤§å·åå­é.jpg');
INSERT INTO `spuimage` VALUES (10, 9, '小号纤维握把十字镐.jpg', 'http://localhost:3000/uploads/product/1691830312128-å°å·çº¤ç»´æ¡æåå­é.jpg');
INSERT INTO `spuimage` VALUES (11, 9, '大号纤维握把十字镐.jpg', 'http://localhost:3000/uploads/product/1691830304919-å¤§å·çº¤ç»´æ¡æåå­é.jpg');
INSERT INTO `spuimage` VALUES (12, 9, '大号硬木握把十字镐.jpg', 'http://localhost:3000/uploads/product/1691830307288-å¤§å·ç¡¬æ¨æ¡æåå­é.jpg');
INSERT INTO `spuimage` VALUES (13, 9, '小号十字镐.jpg', 'http://localhost:3000/uploads/product/1691830309746-å°å·åå­é.jpg');
INSERT INTO `spuimage` VALUES (14, 9, '小号硬木握把十字镐.jpg', 'http://localhost:3000/uploads/product/1691830314370-å°å·ç¡¬æ¨æ¡æåå­é.jpg');
INSERT INTO `spuimage` VALUES (20, 2, '大号尖头锹.jpg', 'http://localhost:3000/uploads/product/1693040493963-å¤§å·å°å¤´é¹.jpg');
INSERT INTO `spuimage` VALUES (17, 2, '特大尖头锹（单头）.jpg', 'http://localhost:3000/uploads/product/1693040439053-ç¹å¤§å°å¤´é¹ï¼åå¤´ï¼.jpg');
INSERT INTO `spuimage` VALUES (18, 2, '特大尖头锹.jpg', 'http://localhost:3000/uploads/product/1693040442315-ç¹å¤§å°å¤´é¹.jpg');
INSERT INTO `spuimage` VALUES (19, 2, '小号尖头锹.jpg', 'http://localhost:3000/uploads/product/1693040446531-å°å·å°å¤´é¹.jpg');
INSERT INTO `spuimage` VALUES (38, 8, '大号三角锄带柄1.4m.jpg', 'http://localhost:3000/uploads/product/1693041684772-å¤§å·ä¸è§éå¸¦æ1.4m.jpg');
INSERT INTO `spuimage` VALUES (37, 8, '大号三角锄带柄1.2m.jpg', 'http://localhost:3000/uploads/product/1693041678361-å¤§å·ä¸è§éå¸¦æ1.2m.jpg');
INSERT INTO `spuimage` VALUES (45, 3, '纯羊粪发酵有机肥.jpg', 'http://localhost:3000/uploads/product/1693387777299-çº¯ç¾ç²ªåéµææºè¥.jpg');
INSERT INTO `spuimage` VALUES (39, 8, '小号三角锄.jpg', 'http://localhost:3000/uploads/product/1693041688953-å°å·ä¸è§é.jpg');
INSERT INTO `spuimage` VALUES (40, 8, '小号三角锄带柄1.2m.jpg', 'http://localhost:3000/uploads/product/1693041692516-å°å·ä¸è§éå¸¦æ1.2m.jpg');
INSERT INTO `spuimage` VALUES (41, 8, '中号三角锄.jpg', 'http://localhost:3000/uploads/product/1693041704749-ä¸­å·ä¸è§é.jpg');
INSERT INTO `spuimage` VALUES (42, 8, '小号三角锄带柄1.4m.jpg', 'http://localhost:3000/uploads/product/1693041699875-å°å·ä¸è§éå¸¦æ1.4m.jpg');
INSERT INTO `spuimage` VALUES (43, 8, '中号三角锄带柄1.2m.jpg', 'http://localhost:3000/uploads/product/1693041708025-ä¸­å·ä¸è§éå¸¦æ1.2m.jpg');
INSERT INTO `spuimage` VALUES (44, 8, '中号三角锄带柄1.4m.jpg', 'http://localhost:3000/uploads/product/1693041712196-ä¸­å·ä¸è§éå¸¦æ1.4m.jpg');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `headSculpture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('6463b389e766bb00852703e2', 'azhu', 'xgz', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/18fce40e-94c7-4327-be22-14d25fa5dedf.png', '13427815322', '男', '2023-05-05', NULL);
INSERT INTO `userinfo` VALUES ('646436c509e2989198e98f88', 'azhuu', 'azhuu', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/d897f074-5262-4717-aa08-2ad79c68374e.png', '13427815322', '男', '2002-07-29', 'admin');
INSERT INTO `userinfo` VALUES ('6463ba68f43e60d7b6956dba', 'xgzweixin', '许国柱', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/a5fe2ec3-7bb7-4332-b614-6195c16c590f.png', 'undefined', '男', '2017-02-15', NULL);
INSERT INTO `userinfo` VALUES ('64662c89f43e60d7b676c96d', 'ajuu', 'AJU', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/634f18bd-e003-476a-ad06-22d311775ab0.png', 'undefined', '男', '2023-05-21', NULL);
INSERT INTO `userinfo` VALUES ('646874b3e1a35c371b9e47d7', 'xnn', '小囡囡', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/4e42503e-9738-452d-ac8a-47959f90105e.png', 'undefined', '男', '2023-05-21', NULL);
INSERT INTO `userinfo` VALUES ('6476a286e1a35c371bd4208a', 'azu', 'azuu', 'https://mp-efbf9779-c0d9-4262-ab16-a6d0746727bb.cdn.bspapp.com/cloudstorage/5b7540c6-2d51-4864-9832-e3dc85c07f62.png', 'undefined', '保密', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
