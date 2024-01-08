-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 05:00 PM
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
-- Database: `poli_bk`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED NOT NULL,
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `status_periksa` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(1, 1, 4, 'Saya kemarin jatuh dari sepeda', 1, '1'),
(4, 11, 10, 'gusi bengkak', 1, '1'),
(5, 8, 8, 'sakit perut', 1, '0'),
(6, 10, 12, 'sarafnya kejepit', 1, '0'),
(7, 8, 11, 'sakit gigi', 1, '0'),
(8, 12, 6, 'anak saya demam', 1, '1'),
(9, 11, 13, 'abis kesleo', 1, '0'),
(10, 8, 14, 'mata saya merah dan bengkak', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 2, 14),
(4, 3, 13),
(5, 3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(5, 'Kanisa', '5ed188d08ac9470622eba9a1e38db325', 'Banjarnegara', '089937447512', 2),
(6, 'Davi', 'bcc9d0b5c8ad6af66f25a9d3c39d1f1c', 'Tangerang', '089937447222', 3),
(7, 'Zavier', 'ca17aad9379bc896bd2a9f7bee0b479b', 'Bogor', '087775898843', 5),
(8, 'Naysilla', 'ac8dd2a05ffa88a8511b7f1c5a5aed44', 'Tegal', '085344345499', 9),
(9, 'Kenzi', 'ac6e81f0fb726894aafcca13ad8e14df', 'Tegal', '087775898888', 6);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `status`) VALUES
(6, 5, 'Senin', '13:00:00', '15:00:00', '0'),
(7, 5, 'Rabu', '10:00:00', '11:30:00', '1'),
(8, 6, 'Selasa', '08:00:00', '11:30:00', '1'),
(9, 6, 'Sabtu', '15:00:00', '17:00:00', '1'),
(10, 7, 'Kamis', '13:00:00', '16:00:00', '1'),
(11, 7, 'Jumat', '09:00:00', '11:00:00', '1'),
(12, 8, 'Selasa', '14:00:00', '16:30:00', '1'),
(13, 8, 'Selasa', '09:00:00', '11:00:00', '1'),
(14, 9, 'Kamis', '09:30:00', '11:30:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Albendasol suspensi 200 mg/5 ml', 'Ktk 10 btl @ 10 ml', 6000),
(2, 'Pentoksifilin tablet 400 mg', 'ktk 10 x 10 tablet', 6000),
(3, 'Alprazolam tablet 1 mg', 'ktk 10 x 10 tablet', 118000),
(4, 'Amilorida tablet 5 mg', 'ktk 10 x 10 table', 12000),
(10, 'Asam Askorbat (Vitamin C) tablet 250 mg', 'btl 250 tablet', 42000),
(13, 'Paracetamol', 'btl 30 ml', 25000),
(14, 'Cataflam', '10 tablet', 23000),
(16, 'Sanmol', '4 tablet', 9000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(8, 'Ika', 'f76523aea736f0d986763b43fbc686e1', 'Semarang', '3302232983845966', '089678857124', '202401-008'),
(10, 'Lukman', 'aee943e4df51eb1680fb3df6b02c7aa8', 'Manokwari', '3340334598553434', '085344345499', '202401-009'),
(11, 'Maya', 'f4a637ba636f4a3b258273c5605d4266', 'Banjarnegara', '3302238978676666', '089937446656', '202401-010'),
(12, 'Agung', '6f5d0ad4bc971cddc51a0c5f74bdf3fd', 'Jogja', '3340123300403322', '085344342323', '202401-011');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 1, '2024-01-08 11:11:00', 'Yasudah ini saya kasiih beberapa obat, tolong diminum', 150000),
(2, 4, '2024-01-04 14:18:00', 'cepet sembuh ya', 150000),
(3, 8, '2024-01-08 14:31:00', 'obatnya diminum 3x sehari setelah makan', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(2, 'Anak', 'Poli anak adalah poli yang berfokus pada pananganan masalah pada anak'),
(3, 'Bedah', 'Poli bedah adalah poli yang berfokus pada pananganan masalah pada penyakit dalam'),
(4, 'Jantung', 'Poli jantung adalah poli yang berfokus pada pananganan masalah jantung'),
(5, 'Gigi', 'Poli gigi adalah poli yang berfokus pada pananganan masalah gigi'),
(6, 'Mata', 'Poli mata adalah poli yang berfokus pada pananganan masalah mata'),
(9, 'Saraf', 'Poli saraf adalah poli yang berfokus pada pananganan masalah saraf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarPoli_jadwal` (`id_jadwal`),
  ADD KEY `fk_daftarPoli_pasien` (`id_pasien`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailPeriksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailPeriksa_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarPoli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailPeriksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailPeriksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwalPeriksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarPoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
