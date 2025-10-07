/*
 Navicat Premium Dump SQL

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3307
 Source Schema         : c8_prodi

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 07/10/2025 13:02:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for dosen_images
-- ----------------------------
DROP TABLE IF EXISTS `dosen_images`;
CREATE TABLE `dosen_images`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `dosen_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dosen_images_dosen_id_foreign`(`dosen_id` ASC) USING BTREE,
  INDEX `dosen_images_image_id_foreign`(`image_id` ASC) USING BTREE,
  CONSTRAINT `dosen_images_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosens` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dosen_images_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `image_url` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen_images
-- ----------------------------
INSERT INTO `dosen_images` VALUES (1, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 1);
INSERT INTO `dosen_images` VALUES (2, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 2);
INSERT INTO `dosen_images` VALUES (3, 3, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 3);
INSERT INTO `dosen_images` VALUES (4, 4, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 4);
INSERT INTO `dosen_images` VALUES (5, 5, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 5);
INSERT INTO `dosen_images` VALUES (6, 6, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 6);
INSERT INTO `dosen_images` VALUES (7, 7, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 7);
INSERT INTO `dosen_images` VALUES (8, 8, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 8);
INSERT INTO `dosen_images` VALUES (9, 9, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 9);
INSERT INTO `dosen_images` VALUES (10, 10, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 10);
INSERT INTO `dosen_images` VALUES (11, 11, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 11);
INSERT INTO `dosen_images` VALUES (12, 12, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 12);
INSERT INTO `dosen_images` VALUES (13, 13, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 13);
INSERT INTO `dosen_images` VALUES (15, 15, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 15);
INSERT INTO `dosen_images` VALUES (16, 16, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 16);
INSERT INTO `dosen_images` VALUES (17, 17, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 17);
INSERT INTO `dosen_images` VALUES (19, 19, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 19);
INSERT INTO `dosen_images` VALUES (20, 20, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 20);
INSERT INTO `dosen_images` VALUES (21, 21, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 21);
INSERT INTO `dosen_images` VALUES (22, 22, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 22);
INSERT INTO `dosen_images` VALUES (23, 23, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 23);
INSERT INTO `dosen_images` VALUES (24, 24, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 24);
INSERT INTO `dosen_images` VALUES (25, 25, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 25);
INSERT INTO `dosen_images` VALUES (26, 26, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 26);
INSERT INTO `dosen_images` VALUES (27, 27, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 27);
INSERT INTO `dosen_images` VALUES (28, 28, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 28);
INSERT INTO `dosen_images` VALUES (29, 29, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 29);
INSERT INTO `dosen_images` VALUES (30, 30, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 30);
INSERT INTO `dosen_images` VALUES (31, 31, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 31);
INSERT INTO `dosen_images` VALUES (32, 32, '2025-09-25 16:47:12', '2025-09-25 16:47:12', 32);

-- ----------------------------
-- Table structure for dosen_jabatans
-- ----------------------------
DROP TABLE IF EXISTS `dosen_jabatans`;
CREATE TABLE `dosen_jabatans`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `dosen_id` bigint UNSIGNED NOT NULL,
  `jabatan_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dosen_jabatans_dosen_id_foreign`(`dosen_id` ASC) USING BTREE,
  INDEX `dosen_jabatans_jabatan_id_foreign`(`jabatan_id` ASC) USING BTREE,
  CONSTRAINT `dosen_jabatans_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosens` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dosen_jabatans_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatans` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen_jabatans
-- ----------------------------
INSERT INTO `dosen_jabatans` VALUES (1, 1, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (2, 2, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (3, 3, 4, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (4, 4, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (5, 5, 4, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (6, 6, 4, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (7, 7, 4, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (8, 8, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (9, 9, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (10, 10, 4, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (11, 11, 4, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (12, 12, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (13, 13, 2, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (15, 15, 2, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (16, 16, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (17, 17, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (19, 19, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (20, 20, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (21, 21, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (22, 22, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (23, 23, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (24, 24, 2, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (25, 25, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (26, 26, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (27, 27, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (28, 28, 1, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (29, 29, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (30, 30, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (31, 31, 2, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (32, 32, 2, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_jabatans` VALUES (64, 8, 6, '2025-09-25 16:58:30', '2025-09-25 16:58:30');
INSERT INTO `dosen_jabatans` VALUES (65, 19, 7, '2025-09-25 16:58:30', '2025-09-25 16:58:30');

-- ----------------------------
-- Table structure for dosen_prodis
-- ----------------------------
DROP TABLE IF EXISTS `dosen_prodis`;
CREATE TABLE `dosen_prodis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `dosen_id` bigint UNSIGNED NOT NULL,
  `prodi_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dosen_prodis_dosen_id_foreign`(`dosen_id` ASC) USING BTREE,
  INDEX `dosen_prodis_prodi_id_foreign`(`prodi_id` ASC) USING BTREE,
  CONSTRAINT `dosen_prodis_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosens` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dosen_prodis_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen_prodis
-- ----------------------------
INSERT INTO `dosen_prodis` VALUES (1, 1, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (2, 2, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (3, 3, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (4, 4, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (5, 5, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (6, 6, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (7, 7, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (8, 8, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (9, 9, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (10, 10, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (11, 11, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (12, 12, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (13, 13, 1, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (15, 15, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (16, 16, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (17, 17, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (19, 19, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (20, 20, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (21, 21, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (22, 22, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (23, 23, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (24, 24, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (25, 25, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (26, 26, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (27, 27, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (28, 28, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (29, 29, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (30, 30, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (31, 31, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosen_prodis` VALUES (32, 32, 2, '2025-09-25 16:47:12', '2025-09-25 16:47:12');

-- ----------------------------
-- Table structure for dosen_skills
-- ----------------------------
DROP TABLE IF EXISTS `dosen_skills`;
CREATE TABLE `dosen_skills`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `dosen_id` bigint UNSIGNED NOT NULL,
  `skill_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dosen_skills_dosen_id_foreign`(`dosen_id` ASC) USING BTREE,
  INDEX `dosen_skills_skill_id_foreign`(`skill_id` ASC) USING BTREE,
  CONSTRAINT `dosen_skills_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosens` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dosen_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen_skills
-- ----------------------------
INSERT INTO `dosen_skills` VALUES (1, 1, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (2, 2, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (3, 3, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (4, 4, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (5, 5, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (6, 6, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (7, 7, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (8, 8, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (9, 9, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (10, 10, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (11, 11, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (12, 12, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (13, 13, 5, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (14, 1, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (15, 2, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (16, 3, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (17, 4, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (18, 5, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (19, 6, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (20, 7, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (21, 8, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (22, 9, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (23, 10, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (24, 11, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (25, 12, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (26, 13, 6, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (28, 15, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (29, 16, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (30, 17, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (32, 19, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (33, 20, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (34, 21, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (35, 22, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (36, 23, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (37, 24, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (38, 25, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (39, 26, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (40, 27, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (41, 28, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (42, 29, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (43, 30, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (44, 31, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (45, 32, 7, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (47, 15, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (48, 16, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (49, 17, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (51, 19, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (52, 20, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (53, 21, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (54, 22, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (55, 23, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (56, 24, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (57, 25, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (58, 26, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (59, 27, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (60, 28, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (61, 29, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (62, 30, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (63, 31, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `dosen_skills` VALUES (64, 32, 8, '2025-09-25 16:53:14', '2025-09-25 16:53:14');

-- ----------------------------
-- Table structure for dosens
-- ----------------------------
DROP TABLE IF EXISTS `dosens`;
CREATE TABLE `dosens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `NUPTK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosens
-- ----------------------------
INSERT INTO `dosens` VALUES (1, '7000000000000001', '081200000001', 'ADE WINARNI, S.T', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (2, '7000000000000002', '081200000002', 'AGGRY SAPUTRA, S.T, M.T', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (3, '7000000000000003', '081200000003', 'ALFAN FEDRIANTO, S.E., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (4, '7000000000000004', '081200000004', 'DANANDJAYA SAPUTRA, S.T., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (5, '7000000000000005', '081200000005', 'DEDY JAUHARI, S.Kom., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (6, '7000000000000006', '081200000006', 'IMRON NUGRAHA, S.Pd., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (7, '7000000000000007', '081200000007', 'JAJANG NURJAMAN, S.T., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (8, '7000000000000008', '081200000008', 'LIZA SAFITRI, S.T., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (9, '7000000000000009', '081200000009', 'MOCHAMMAD RIZKI ROMDONI, S.Kom., M.T', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (10, '7000000000000010', '081200000010', 'NURUL SAEPUL, S.Pd., M.M.', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (11, '7000000000000011', '081200000011', 'YAFRI, S.Kom., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (12, '7000000000000012', '081200000012', 'ZULFACHMI, S,T, M.T', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (13, '7000000000000013', '081200000013', 'ZULKIPLI, S.Pd., M.Pd', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (15, '7000000000000015', '081200000015', 'AURORA ELSA S. FREDERICK, S.E., M.B.A', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (16, '7000000000000016', '081200000016', 'DARMAWAN MEGA PERMANA, S.Pi., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (17, '7000000000000017', '081200000017', 'DWI NURUL HUDA, S.T., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (19, '7000000000000019', '081200000019', 'HENDI SETIAWAN, S.Kom,M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (20, '7000000000000020', '081200000020', 'ILIVIA, S.Kom., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (21, '7000000000000021', '081200000021', 'LARASATI INDRIASTUTI, S.E., M.Ak', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (22, '7000000000000022', '081200000022', 'LEVA AFFRILLIANGGI FALIHAH, S.Kom., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (23, '7000000000000023', '081200000023', 'LISKEN SIRAIT, S.Sos., M.Pd', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (24, '7000000000000024', '081200000024', 'MUHAMMAD FAIZAL, S.H., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (25, '7000000000000025', '081200000025', 'Dr. MULYADI TAN, S.Kom., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (26, '7000000000000026', '081200000026', 'MUTHI\'AH AS-SA\'IDAH, S.Pd., M.Si', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (27, '7000000000000027', '081200000027', 'N. SUPRIYADI, S.Kom., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (28, '7000000000000028', '081200000028', 'NANNY RARAS SETYONINGRUM, S.Si., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (29, '7000000000000029', '081200000029', 'RIO ARI PRASETIO, S.Pd., M.M', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (30, '7000000000000030', '081200000030', 'SLAMET SANTOSO, M.T', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (31, '7000000000000031', '081200000031', 'VITA RAHAYU, S.T., M.Kom', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `dosens` VALUES (32, '7000000000000032', '081200000032', 'WANHENDRA, S.Kom., M.S.I', '2025-09-25 16:47:12', '2025-09-25 16:47:12');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for image_url
-- ----------------------------
DROP TABLE IF EXISTS `image_url`;
CREATE TABLE `image_url`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_url
-- ----------------------------
INSERT INTO `image_url` VALUES (1, 'https://sttindonesia.ac.id/Files/fotodosen/adenew1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (2, 'https://sttindonesia.ac.id/Files/fotodosen/aggrynew1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (3, 'https://sttindonesia.ac.id/Files/fotodosen/alfan1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (4, 'https://gitlab.com/kevinperdana/foto-dosen/-/raw/main/danand1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (5, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/dedy1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (6, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/imron1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (7, 'https://sttindonesia.ac.id/Files/fotodosen/jajang1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (8, 'https://sttindonesia.ac.id/Files/fotodosen/liza1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (9, 'https://sttindonesia.ac.id/Files/fotodosen/rizki1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (10, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/nurulsaepul1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (11, 'https://sttindonesia.ac.id/wp-content/plugins/td-composer/assets/images/placeholders/thumb_01.jpg', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (12, 'https://sttindonesia.ac.id/Files/fotodosen/fahmi1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (13, 'https://sttindonesia.ac.id/Files/fotodosen/kipli1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (14, 'https://sttindonesia.ac.id/Files/fotodosen/abdul1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (15, 'https://sttindonesia.ac.id/Files/fotodosen/elsa1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (16, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/darmawan1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (17, 'https://sttindonesia.ac.id/Files/fotodosen/dwi1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (18, 'https://sttindonesia.ac.id/Files/fotodosen/elvi1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (19, 'https://sttindonesia.ac.id/Files/fotodosen/hendi1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (20, 'https://sttindonesia.ac.id/Files/fotodosen/ilivia1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (21, 'https://sttindonesia.ac.id/Files/fotodosen/larasati1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (22, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/leva2_1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (23, 'https://sttindonesia.ac.id/Files/fotodosen/lisken1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (24, 'https://sttindonesia.ac.id/Files/fotodosen/faizal1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (25, 'https://sttindonesia.ac.id/Files/fotodosen/mulyadi1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (26, 'https://sttindonesia.ac.id/Files/fotodosen/muthiah1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (27, 'https://sttindonesia.ac.id/Files/fotodosen/supri1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (28, 'https://sttindonesia.ac.id/Files/fotodosen/raras1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (29, 'https://sttindonesia.ac.id/Files/fotodosen/rio1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (30, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/slametsantoso1x1.jpeg', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (31, 'https://sttindonesia.ac.id/Files/fotodosen/vita1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');
INSERT INTO `image_url` VALUES (32, 'https://sttindonesia.ac.id/Files/fotodosen/wan1x1.png', '2025-09-25 16:47:12', '2025-09-25 16:47:12');

-- ----------------------------
-- Table structure for jabatans
-- ----------------------------
DROP TABLE IF EXISTS `jabatans`;
CREATE TABLE `jabatans`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatans
-- ----------------------------
INSERT INTO `jabatans` VALUES (1, 'Lektor', NULL, NULL);
INSERT INTO `jabatans` VALUES (2, 'Asisten Ahli', NULL, NULL);
INSERT INTO `jabatans` VALUES (4, 'Dosen Tetap Teknik Informatika', NULL, NULL);
INSERT INTO `jabatans` VALUES (5, 'Dosen Tetap Sistem Informasi', NULL, NULL);
INSERT INTO `jabatans` VALUES (6, 'Kepala Prodi Teknik Informatika', NULL, NULL);
INSERT INTO `jabatans` VALUES (7, 'Kepala Prodi Sistem Informasi', NULL, NULL);

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for kerjasama
-- ----------------------------
DROP TABLE IF EXISTS `kerjasama`;
CREATE TABLE `kerjasama`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kerjasama
-- ----------------------------
INSERT INTO `kerjasama` VALUES (1, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-5-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (2, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-4-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (3, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-6-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (4, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-7-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (11, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (12, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-1-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (13, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-2-scaled.png', NULL, NULL);
INSERT INTO `kerjasama` VALUES (14, 'https://sttindonesia.ac.id/wp-content/uploads/2025/05/Cover-3-scaled.png', NULL, NULL);

-- ----------------------------
-- Table structure for kerjasama_prodi
-- ----------------------------
DROP TABLE IF EXISTS `kerjasama_prodi`;
CREATE TABLE `kerjasama_prodi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kerjasama_id` bigint UNSIGNED NOT NULL,
  `prodi_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dosen_kerjasama_kerjasama_id_foreign`(`kerjasama_id` ASC) USING BTREE,
  INDEX `dosen_kerjasama_prodi_id_foreign`(`prodi_id` ASC) USING BTREE,
  CONSTRAINT `dosen_kerjasama_kerjasama_id_foreign` FOREIGN KEY (`kerjasama_id`) REFERENCES `kerjasama` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dosen_kerjasama_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kerjasama_prodi
-- ----------------------------
INSERT INTO `kerjasama_prodi` VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (2, 2, 1, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (3, 3, 1, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (4, 4, 1, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (5, 11, 2, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (6, 12, 2, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (7, 13, 2, NULL, NULL);
INSERT INTO `kerjasama_prodi` VALUES (8, 14, 2, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2025_09_22_072848_create_dosens_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_09_22_074002_create_prodi_table', 1);
INSERT INTO `migrations` VALUES (6, '2025_09_22_074114_create_jabatans_table', 1);
INSERT INTO `migrations` VALUES (7, '2025_09_22_074348_create_skills_table', 1);
INSERT INTO `migrations` VALUES (8, '2025_09_22_075717_create_dosen_skills_table', 1);
INSERT INTO `migrations` VALUES (9, '2025_09_22_075928_create_dosen_jabatans_table', 1);
INSERT INTO `migrations` VALUES (10, '2025_09_22_081826_create_dosen_prodis_table', 1);
INSERT INTO `migrations` VALUES (11, '2025_09_23_082538_create_image_url_table', 1);
INSERT INTO `migrations` VALUES (12, '2025_09_23_083643_create_locations_table', 1);
INSERT INTO `migrations` VALUES (13, '2025_09_23_090025_create_dosen_images_table', 1);
INSERT INTO `migrations` VALUES (14, '2025_09_23_092147_add_dosen_id_to_image_url_table', 1);
INSERT INTO `migrations` VALUES (15, '2025_09_23_093453_add_username_to_users_table', 1);
INSERT INTO `migrations` VALUES (16, '2025_09_24_042840_update_dosens_table', 2);
INSERT INTO `migrations` VALUES (17, '2025_09_24_043659_revert_add_dosen_id_to_image_url_table', 3);
INSERT INTO `migrations` VALUES (18, '2025_09_24_044311_update_dosen_images_table', 4);
INSERT INTO `migrations` VALUES (19, '2025_09_24_044512_drop_locations_table', 5);
INSERT INTO `migrations` VALUES (20, '2025_09_23_083757_add_location_id_to_dosen_table', 6);
INSERT INTO `migrations` VALUES (21, '2025_09_26_083149_create_kerjasama_table', 6);
INSERT INTO `migrations` VALUES (22, '2025_09_29_030828_create_dosen_kerjasama_table', 7);
INSERT INTO `migrations` VALUES (24, '2025_09_29_033705_rename_dosen_kerjasama_to_kerjasama_prodi', 8);
INSERT INTO `migrations` VALUES (25, '2025_10_06_030153_create_riset_table', 9);
INSERT INTO `migrations` VALUES (27, '2025_10_06_040645_add_details_fields_to_riset_table', 10);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for prodi
-- ----------------------------
DROP TABLE IF EXISTS `prodi`;
CREATE TABLE `prodi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prodi
-- ----------------------------
INSERT INTO `prodi` VALUES (1, 'Teknik Informatika', NULL, NULL);
INSERT INTO `prodi` VALUES (2, 'Sistem Informasi', NULL, NULL);

-- ----------------------------
-- Table structure for riset
-- ----------------------------
DROP TABLE IF EXISTS `riset`;
CREATE TABLE `riset`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_ketua` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anggota_penulis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` date NULL DEFAULT NULL,
  `journal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url_riset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tahun` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of riset
-- ----------------------------
INSERT INTO `riset` VALUES (1, 'Dwi Nurul Huda, ST., M.Kom', 'Muhammad Syafi\'i', 'Penerapan QR Code dalam Aplikasi Monitoring Peralatan Kerja Berbasis Web Pada PT. Perusahaan Listrik Negara Gardu Induk Tanjung Uban', '2022-01-21', 'Prosiding Seminar Nasional Ilmu Sosial dan Teknologi (SNISTEK)', 'https://forum.upbatam.ac.id/index.php/prosiding/article/view/5202', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (2, 'Rahmad Abdul Rahmad', 'Dwi Nurul Huda, ST., M.Kom, Ahmad Kriswantoro', 'Sistem Informasi Pengolahan Data Kepariwisataan Dinas Kebudayaan dan Pariwisata Kabupaten Bintan Berbasis Web', '2023-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/226', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (3, 'Dwi Nurul Huda, ST., M.Kom', 'Selly', 'Sistem Pakar Diagnosa Penyakit Trichomoniasis Menggunakan Metode Certainty Factor', '2021-10-08', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/189', 2021, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (4, 'Dwi Nurul Huda, ST., M.Kom', 'Tio Adyatma, Zulfachmi, M.T', 'Pengembangan Aplikasi E-Money Dengan Pemanfaatan Payment Gateway Berbasis Android (Studi Kasus Sekolah Tinggi Teknologi Indonesia Tanjungpinang)', '2022-10-31', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/212', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (5, 'Dwi Nurul Huda, ST., M.Kom', 'Amalia Zahara, Danil Hardinata', 'Pemanfaatan Konsep Finite State Automata Pada Sistem Perparkiran Kendaraan Bermotor Bandara Raja Haji Fisabilillah Tanjungpinang', '2023-10-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/245', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (6, 'Mochamad Rizki Romdoni, S.Kom., M.T', 'Liza Safitri, S.T., M.Kom, Dwi Nurul Huda, ST., M.Kom, Sahrul Mubarok, N. Supriyadi, M.T', 'Pengendalian Gerbang Otomatis Berjadwal Dengan Iot Dan Android', '2024-09-19', 'Prosiding Seminar Nasional Ilmu Sosial dan Teknologi (SNISTEK)', 'https://ejournal.upbatam.ac.id/index.php/prosiding/article/view/9330', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (8, 'Dwi Nurul Huda, ST., M.Kom', 'Darwin', 'Analisis Audit Sistem Informasi Creative Banking Nusantara pada PT BPR Dana Bintan Sejahtera Menggunakan COBIT 5', '2024-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/276', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (9, 'Dwi Nurul Huda, ST., M.Kom', 'Mochamad Rizki Romdoni, S.Kom., M.T, Liza Safitri, S.T., M.Kom, Ade Winarni, MT, Abdur Rahman', 'Real-time Detection Transformer (RT-DETR) of Ornamental Fish Diseases with YOLOv9 using CNN (Convolutional Neural Network) Algorithm', '2024-11-13', 'Journal of Applied Informatics and Computing', 'https://jurnal.polibatam.ac.id/index.php/JAIC/article/view/8561', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (10, 'Dwi Nurul Huda, ST., M.Kom', 'Muhammad Tri Margianto', 'Sistem Pendukung Keputusan Pada Aplikasi Penyedia Layanan Internet Terbaik Menggunakan Metode Multi Factor Evaluation Process', '2022-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/208', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (11, 'Hendi Setiawan, M.Kom', 'Tommy Darian', 'Sistem Pendukung Keputusan Penerima Bantuan Sosial Menggunakan Metode Multi-Factor Evaluation Process (MFEP) pada Dinas Sosial Tanjungpinang', '2023-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/214', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (12, 'Hendi Setiawan, M.Kom', 'Fikri Haiqal', 'Sistem Pendukung Keputusan Metode Technique For Order Preference By Similirity To Ideal Solution Untuk Menentukan Penerima Beasiswa Tidak Mampu Di SMK Negeri 1 Bintan Timur', '2021-10-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/199', 2021, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (13, 'Hendi Setiawan, M.Kom', 'Erika Mutiara Putri', 'Penerapan Metode Promethee II Dalam Menentukan Penerima Bantuan Pangan Non Tunai (BPNT) Pada Kantor Desa Toapaya Kabupaten Bintan', '2022-01-20', 'Prosiding Seminar Nasional Ilmu Sosial dan Teknologi (SNISTEK)', 'https://ejournal.upbatam.ac.id/index.php/prosiding/article/view/5203', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (14, 'Hendi Setiawan, M.Kom', 'M Dwi Kurnia Lubis', 'Aplikasi Visual Novel Biografi Joko Widodo', '2022-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/198', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (15, 'Hendi Setiawan, M.Kom', 'Weilliani Weilliani', 'Analisa Kepuasan Pengguna CBT (Computer Based Test) pada SMA Maitreyawira Tanjungpinang dengan Metode Servqual dan CSI (Customer Satisfaction Index)', '2023-03-02', 'Prosiding Seminar Implementasi Teknologi Informasi dan Komunikasi', 'https://ejurnal.itats.ac.id/semtik/article/view/4063', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (16, 'Hendi Setiawan, M.Kom', 'Nanny Raras Setyoningrum, S.Si, M.Kom, Danandjaya Saputra, S.T., M.Kom, Merry', 'Inventory Prediction System Using The Least Square Method At The Serba Serbi Online Shop Tanjungpinang', '2024-01-16', 'Jurnal Media Elektrik', 'https://journal.unm.ac.id/index.php/mediaelektrik/article/view/1284', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (17, 'Hendi Setiawan, M.Kom', 'Dias Erlangga Valdiviano', 'Implementasi Metode Triple Exponential Smoothing Berbasis Website Dalam Memprediksi Persediaan Barang Pada Chronix Project', '2023-10-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/248', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (18, 'Aggry Saputra, M.T', 'Muthi\'ah As-Sa\'idah, S.Pd., M.Si, Hendi Setiawan, M.Kom', 'Optimalisasi Pengelolaan Inventaris Melalui Aplikasi Berbasis Website pada SMK Negeri 1 Bintan Timur', '2024-09-19', 'Prosiding Seminar Nasional Ilmu Sosial dan Teknologi (SNISTEK)', 'https://ejournal.upbatam.ac.id/index.php/prosiding/article/view/9313', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (19, 'Danandjaya Saputra, S.T., M.Kom', 'Mohammad Rafiq, Nanny Raras Setyoningrum, S.Si, M.Kom, Hendi Setiawan, M.Kom', 'Prototipe Smart Solar Tracker System dengan Memanfaatkan Internet Of Things dan Monitoring Berbasis Android', '2024-07-31', 'Digital Transformation Technology', NULL, 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (20, 'Muthi\'ah As-Sa\'idah, S.Pd., M.Si', 'Henni Afra Saputri, Zulfachmi, M.T', 'Analisis Kualitas Aplikasi Aku Pintar Dengan Menggunakan Framework ISO/IEC 25010', '2023-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/229', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (21, 'Muthi\'ah As-Sa\'idah, S.Pd., M.Si', 'Muhammad Qolbi Shobri, Nila Destia Nasra', 'Implementasi Analytic Hierarchy Process (AHP) Dalam Pengambilan Keputusan Desain Kualitas Software', '2024-03-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/268', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (22, 'Muthi\'ah As-Sa\'idah, S.Pd., M.Si', 'Aggry Saputra, M.T, Hendi Setiawan, M.Kom', 'Analisis Komparasi Cybercrime Web Defacement dan Darknet Exposure di Indonesia (Studi Kasus: Lanskap Keamanan Siber di Indonesia Tahun 2022 dan Tahun 2023)', '2024-09-18', 'Prosiding Seminar Nasional Ilmu Sosial dan Teknologi (SNISTEK)', 'https://ejournal.upbatam.ac.id/index.php/prosiding/article/view/9345', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (23, 'Muthi\'ah As-Sa\'idah, S.Pd., M.Si', 'Aggry Saputra, M.T, Zulkipli, M.Pd', 'Enhanced Data Security Using 5x5 Hill Cipher with Modular 53', '2024-10-29', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/323', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (24, 'Nanny Raras Setyoningrum', 'Danil Syah Arihardjo', 'Analisis Dan Perancangan Sistem Informasi Penggajian Karyawan Berbasis Web Pada Pt. Batam Bintan Telekomunikasi Lagoi', '2021-02-22', 'Jurnal Informatika Teknologi dan Sains (Jinteks)', 'http://www.jurnal.uts.ac.id/index.php/JINTEKS/article/view/978', 2021, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (25, 'Nanny Raras Setyoningrum', 'Julfendi Julfendi', 'Aplikasi Kuis Pembelajaran Tata Bahasa dan Kosa Kata Bahasa Perancis DELF Level A1 Berbasis Android', '2022-08-22', 'DoubleClick: Journal of Computer and Information Technology', 'https://e-journal.unipma.ac.id/index.php/doubleclick/article/view/13479', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (26, 'Nanny Raras Setyoningrum', 'Giandicka, Naufal Muhammad Kautsar', 'Sistem Informasi Pengolahan Data Penjualan Dan Peramalan Pembelian Setiap Pelanggan Dengan Metode Trend Projection Berbasis Web', '2021-03-18', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/131', 2021, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (27, 'Nanny Raras Setyoningrum', 'Rahmat Santoso', 'Aplikasi Berlangganan E-Paper Tanjungpinang Pos Berbasis WebApps Terintegrasi Payment Gateway Midtrans', '2023-03-02', 'Prosiding Seminar Implementasi Teknologi Informasi dan Komunikasi', 'https://ejurnal.itats.ac.id/semtik/article/view/3998', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (28, 'Nanny Raras Setyoningrum', 'Fitri', 'Analisis Perbandingan Tingkat Kepuasan Karyawan PT. Harap Panjang Terhadap Layanan Aplikasi ABSS Dengan MYOB Menggunakan Metode Servqual', '2023-10-30', 'Jurnal Bangkit Indonesia', 'https://journal.sttindonesia.ac.id/bangkitindonesia/article/view/246', 2023, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (29, 'Nanny Raras Setyoningrum, S.Si, M.Kom', 'Hendi Setiawan, M.Kom, Danandjaya Saputra, S.T., M.Kom', 'Augmented Reality Mobile Application As An Animal Introduction Learning Media for Elementary School Students with Mentally Disabled;', '2024-12-25', 'Media Elektrik', 'https://journal.unm.ac.id/index.php/mediaelektrik/article/view/6201', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (30, 'Nanny Raras Setyoningrum, S.Si, M.Kom', 'Hendi Setiawan, M.Kom, Danandjaya Saputra, S.T., M.Kom', 'Pelatihan Digital Marketing dalam Pengembangan Pemasaran Produk Umkm Pada Komunitas Tuah Dua Sebiik Tanjungpinang-Bintan', '2024-12-04', 'COMMUNITY: Jurnal Pengabdian Kepada Masyarakat', 'https://jurnalp4i.com/index.php/community/article/view/3585', 2024, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (31, 'Nanny Raras Setyoningrum, S.Si, M.Kom', 'Putri Jingga Rahimma', 'Implementasi Algoritma Regresi Linear Dalam Sistem Prediksi Pendaftar Mahasiswa Baru Sekolah Tinggi Teknologi Indonesia Tanjungpinang', '2022-01-21', 'Prosiding Seminar Nasional Ilmu Sosial dan Teknologi (SNISTEK)', 'https://ejournal.upbatam.ac.id/index.php/prosiding/article/view/5200', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');
INSERT INTO `riset` VALUES (32, 'WANHENDRA', 'Ahmad Mirsad', 'Sistem Monitoring dan Evaluasi Hasil Kegiatan Pengawasan pada Dinas Perumahan dan Kawasan Pemukiman Provinsi Kepulauan Riau', '2022-10-31', 'Jurnal Bangkit Indonesia', 'http://journal.sttindonesia.ac.id/bangkitindonesia/article/view/202', 2022, '2025-10-06 04:19:41', '2025-10-06 04:19:41');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('dwgke3R9Py3jFEa56IgMcyiaNmHivTNYzZnTmZKh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnhDTHEybGtkQjN3cGV2ek9MUnBvMVJlYWdLTDNKOTRuSlNDcjRvaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758790614);
INSERT INTO `sessions` VALUES ('fnOXKlpwPLzwBvO00q2VVW36YmTAONfbhoVFQ3Q5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0dPN25GNjNlTG9BZURpbGtEMmlWaHdOQjVMcW56NnVLeHJFcktqSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758864741);

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_skill` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skills
-- ----------------------------
INSERT INTO `skills` VALUES (1, 'kodeing', NULL, NULL);
INSERT INTO `skills` VALUES (2, 'makan', NULL, NULL);
INSERT INTO `skills` VALUES (5, 'Pengembangan Perangkat Lunak', '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `skills` VALUES (6, 'Jaringan Komputer', '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `skills` VALUES (7, 'Analisis Sistem Informasi', '2025-09-25 16:53:14', '2025-09-25 16:53:14');
INSERT INTO `skills` VALUES (8, 'Manajemen Proyek TI', '2025-09-25 16:53:14', '2025-09-25 16:53:14');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Yuri', 'YuriAja', 'yuri@gmail.com', NULL, '12345678', NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'Z', 'adminZ', 'adminZ@gmail.com', NULL, '$2y$12$IzumvomTDG7aWxx0cemhSeyryF.uW1Ky9lvSSshja9pBzC0tug9PG', NULL, '2025-09-24 07:46:58', '2025-09-24 07:46:58');

SET FOREIGN_KEY_CHECKS = 1;
