/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : akademik

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 11/11/2020 06:09:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen`  (
  `Nip` int(11) NOT NULL,
  `Nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Nip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES (1, 'Muslim Hidayat');
INSERT INTO `dosen` VALUES (2, 'Nahar Mardiyantoro');
INSERT INTO `dosen` VALUES (3, 'Hidayatus Sibyan');
INSERT INTO `dosen` VALUES (4, 'M.Fuat Asnawi');
INSERT INTO `dosen` VALUES (5, 'Dian Asmarajati');
INSERT INTO `dosen` VALUES (6, 'Saifu Rohman');

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `Idkelas` int(11) NOT NULL,
  `Kode` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nip` int(11) NOT NULL,
  PRIMARY KEY (`Idkelas`) USING BTREE,
  INDEX `Kode_Kelas`(`Kode`) USING BTREE,
  INDEX `Nip_Kelas`(`Nip`) USING BTREE,
  CONSTRAINT `FK_Kelas_Dosen` FOREIGN KEY (`Nip`) REFERENCES `dosen` (`Nip`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_Kelas_Matakuliah` FOREIGN KEY (`Kode`) REFERENCES `matakuliah` (`Kode`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (1, 'P1', 2);
INSERT INTO `kelas` VALUES (2, 'P1', 3);
INSERT INTO `kelas` VALUES (3, 'B2', 1);
INSERT INTO `kelas` VALUES (4, 'B2', 2);
INSERT INTO `kelas` VALUES (5, 'B1', 4);
INSERT INTO `kelas` VALUES (6, 'S2', 5);
INSERT INTO `kelas` VALUES (7, 'T1', 4);
INSERT INTO `kelas` VALUES (8, 'T2', 1);

-- ----------------------------
-- Table structure for krs
-- ----------------------------
DROP TABLE IF EXISTS `krs`;
CREATE TABLE `krs`  (
  `Nim` int(11) NOT NULL,
  `Idkelas` int(11) NOT NULL,
  `Nilai` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`Nim`, `Idkelas`) USING BTREE,
  INDEX `Nim_Krs`(`Nim`) USING BTREE,
  INDEX `IdKelas_Krs`(`Idkelas`) USING BTREE,
  CONSTRAINT `FK_Krs_Kelas` FOREIGN KEY (`Idkelas`) REFERENCES `kelas` (`Idkelas`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_Krs_Mahasiswa` FOREIGN KEY (`Nim`) REFERENCES `mahasiswa` (`Nim`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of krs
-- ----------------------------
INSERT INTO `krs` VALUES (201715010, 3, 2);
INSERT INTO `krs` VALUES (201815003, 1, NULL);
INSERT INTO `krs` VALUES (201815003, 8, 2);
INSERT INTO `krs` VALUES (201815007, 4, 4);
INSERT INTO `krs` VALUES (201815007, 7, 2);
INSERT INTO `krs` VALUES (201815007, 8, 4);
INSERT INTO `krs` VALUES (201815014, 1, 1);
INSERT INTO `krs` VALUES (201915001, 1, 4);
INSERT INTO `krs` VALUES (201915001, 3, 3);
INSERT INTO `krs` VALUES (202015002, 1, 2);
INSERT INTO `krs` VALUES (202015002, 2, 3);

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `Thang` int(11) NOT NULL,
  `Nim` int(11) NOT NULL,
  `Nama` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Alamat` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Yogya',
  `Tgl` date NULL DEFAULT NULL,
  PRIMARY KEY (`Nim`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES (2017, 201715009, 'SURIPIN', 'WONOSOBO', '2020-11-09');
INSERT INTO `mahasiswa` VALUES (2017, 201715010, 'MELI SAPUTRI', 'BANJARNEGARA', '2020-11-04');
INSERT INTO `mahasiswa` VALUES (2018, 201815003, 'FARIDA MELIA', 'MADIUN', NULL);
INSERT INTO `mahasiswa` VALUES (2018, 201815007, 'AHMAD YOGA I', 'TEMANGGUNG', NULL);
INSERT INTO `mahasiswa` VALUES (2018, 201815014, 'GALIH SAPUTRA', NULL, NULL);
INSERT INTO `mahasiswa` VALUES (2019, 201915001, 'NUR FITRIYANTO', 'WONOSOBO', '0000-00-00');
INSERT INTO `mahasiswa` VALUES (2019, 201915006, 'MUHAMMAD SOLEH', 'BANJARNEGARA', NULL);
INSERT INTO `mahasiswa` VALUES (2020, 202015002, 'JODI ANGGORO', 'WONOSOBO', '0000-00-00');
INSERT INTO `mahasiswa` VALUES (2019, 2019150040, 'Intan', 'Bekasi', '2020-11-05');
INSERT INTO `mahasiswa` VALUES (2019, 2019160040, 'siti badriyah', 'Magelang', '0000-00-00');

-- ----------------------------
-- Table structure for matakuliah
-- ----------------------------
DROP TABLE IF EXISTS `matakuliah`;
CREATE TABLE `matakuliah`  (
  `Kode` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Matakuliah` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Sks` int(11) NULL DEFAULT 2,
  PRIMARY KEY (`Kode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of matakuliah
-- ----------------------------
INSERT INTO `matakuliah` VALUES ('B1', 'BAHASA INGGRIS', 2);
INSERT INTO `matakuliah` VALUES ('B2', 'BASIS DATA', 4);
INSERT INTO `matakuliah` VALUES ('P1', 'PEMROGRAMAN WEB', 2);
INSERT INTO `matakuliah` VALUES ('S2', 'DESIGN ANALISIS SISTEM', 2);
INSERT INTO `matakuliah` VALUES ('S3', 'KALKULUS', NULL);
INSERT INTO `matakuliah` VALUES ('T1', 'ALGORITMA DAN STRUKTUR DATA', 4);
INSERT INTO `matakuliah` VALUES ('T2', 'ASWAJA', 2);

SET FOREIGN_KEY_CHECKS = 1;
