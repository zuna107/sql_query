-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2023 at 05:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aka_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `Nip` int(11) NOT NULL,
  `Nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`Nip`, `Nama`) VALUES
(1, 'Muslim Hidayat'),
(2, 'Nahar Mardiyantoro'),
(3, 'Hidayatus Sibyan'),
(4, 'M.Fuat Asnawi'),
(5, 'Dian Asmarajati'),
(6, 'Saifu Rohman');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_prodi` varchar(6) NOT NULL,
  `nama_prodi` varchar(255) DEFAULT NULL,
  `jenjang` varchar(2) DEFAULT NULL,
  `kepala` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_prodi`, `nama_prodi`, `jenjang`, `kepala`) VALUES
('21402', 'Mesin Produksi', 'D3', 'Sunaryo, M.Pd'),
('22201', 'Teknik Sipil', 'S1', 'Wiji Lestarini, MT'),
('23201', 'Arsitektur', 'S1', 'Adinda Septiyani, MT'),
('55201', 'Teknik Informatika', 'S1', 'Hidayatus Sibyan, M.Kom'),
('57401', 'Manajemen Informatika', 'D3', 'Muslim Hidayat, M.Kom');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `Idkelas` int(11) NOT NULL,
  `Kode` char(2) NOT NULL,
  `Nip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`Idkelas`, `Kode`, `Nip`) VALUES
(1, 'P1', 2),
(2, 'P1', 3),
(3, 'B2', 1),
(4, 'B2', 2),
(5, 'B1', 4),
(6, 'S2', 5),
(7, 'T1', 4),
(8, 'T2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `Nim` int(11) NOT NULL,
  `Idkelas` int(11) NOT NULL,
  `Nilai` int(11) DEFAULT 0,
  `Thakademik` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`Nim`, `Idkelas`, `Nilai`, `Thakademik`) VALUES
(201715010, 3, 2, '20192'),
(201815003, 1, NULL, '20192'),
(201815003, 8, 2, '20192'),
(201815007, 2, 3, '20202'),
(201815007, 4, 4, '20191'),
(201815007, 7, 2, '20192'),
(201815007, 8, 4, '20201'),
(201815014, 1, 1, '20191'),
(201915001, 1, NULL, '20192'),
(201915001, 3, 3, '20191'),
(201915006, 7, 2, '20211'),
(202015002, 1, 2, '20191'),
(202015002, 2, 3, '20192'),
(2019150040, 4, 4, '20202'),
(2019160040, 7, 4, '20211');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `Thang` int(11) NOT NULL,
  `Nim` int(11) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(80) DEFAULT 'Yogya',
  `Tgl` date DEFAULT NULL,
  `Jurusan` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`Thang`, `Nim`, `Nama`, `Alamat`, `Tgl`, `Jurusan`) VALUES
(2017, 201715009, 'SURIPIN', 'WONOSOBO', NULL, '21402'),
(2017, 201715010, 'MELI SAPUTRI', 'BANJARNEGARA', NULL, '21402'),
(2018, 201815003, 'FARIDA MELIA', 'MADIUN', NULL, '22201'),
(2018, 201815007, 'AHMAD YOGA I', 'TEMANGGUNG', NULL, '22201'),
(2018, 201815014, 'GALIH SAPUTRA', NULL, NULL, '55201'),
(2019, 201915001, 'NUR FITRIYANTO', 'WONOSOBO', NULL, '57401'),
(2019, 201915006, 'MUHAMMAD SOLEH', 'BANJARNEGARA', NULL, '57401'),
(2020, 202015002, 'JODI ANGGORO', 'WONOSOBO', NULL, '57401'),
(2019, 2019150040, 'Intan', 'Bekasi', NULL, '57401'),
(2019, 2019160040, 'siti badriyah', 'Magelang', NULL, '22201'),
(2021, 2021150001, 'Mady bagus', 'Wonosobo', NULL, '55201'),
(2021, 2021150002, 'Zaid Husni A', 'Magelang', NULL, '55201'),
(2021, 2021150050, 'Hanafi Ulin', 'Temanggung', NULL, '55201'),
(2021, 2021150093, 'Muhamad Akmal', 'WOnosobo', NULL, '55201'),
(2021, 2021160003, 'Iyan Almas Albantani', 'Banten', NULL, '55201');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Kode` char(2) NOT NULL,
  `Matakuliah` varchar(30) NOT NULL,
  `Sks` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`Kode`, `Matakuliah`, `Sks`) VALUES
('B1', 'BAHASA INGGRIS', 2),
('B2', 'BASIS DATA', 4),
('P1', 'PEMROGRAMAN WEB', 2),
('S2', 'DESIGN ANALISIS SISTEM', 2),
('S3', 'KALKULUS', NULL),
('T1', 'ALGORITMA DAN STRUKTUR DATA', 4),
('T2', 'ASWAJA', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tahunakademik`
--

CREATE TABLE `tahunakademik` (
  `Kode` varchar(5) NOT NULL,
  `Namatahun` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tahunakademik`
--

INSERT INTO `tahunakademik` (`Kode`, `Namatahun`) VALUES
('20181', 'Tahun 2018/2019 ganjil'),
('20182', 'Tahun 2018/2019 genap'),
('20191', 'Tahun 2019/2020 ganjil'),
('20192', 'Tahun 2019/2019 genap'),
('20201', 'Tahun 2020/2021 ganjil'),
('20202', 'Tahun 2020/2021 genap'),
('20211', 'Tahun 2021/2022 ganjil'),
('20212', 'Tahun 2021/2022 genap');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Nip`) USING BTREE;

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_prodi`) USING BTREE;

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`Idkelas`) USING BTREE,
  ADD KEY `Kode_Kelas` (`Kode`) USING BTREE,
  ADD KEY `Nip_Kelas` (`Nip`) USING BTREE;

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`Nim`,`Idkelas`) USING BTREE,
  ADD KEY `Nim_Krs` (`Nim`) USING BTREE,
  ADD KEY `IdKelas_Krs` (`Idkelas`) USING BTREE,
  ADD KEY `Thakademik` (`Thakademik`) USING BTREE;

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`Nim`) USING BTREE,
  ADD KEY `Jurusan` (`Jurusan`) USING BTREE;

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kode`) USING BTREE;

--
-- Indexes for table `tahunakademik`
--
ALTER TABLE `tahunakademik`
  ADD PRIMARY KEY (`Kode`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `FK_Kelas_Dosen` FOREIGN KEY (`Nip`) REFERENCES `dosen` (`Nip`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Kelas_Matakuliah` FOREIGN KEY (`Kode`) REFERENCES `matakuliah` (`Kode`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `FK_Krs_Kelas` FOREIGN KEY (`Idkelas`) REFERENCES `kelas` (`Idkelas`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Krs_Mahasiswa` FOREIGN KEY (`Nim`) REFERENCES `mahasiswa` (`Nim`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`Thakademik`) REFERENCES `tahunakademik` (`Kode`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`Jurusan`) REFERENCES `jurusan` (`kode_prodi`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
