-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2019 at 06:13 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kodedokter` int(11) NOT NULL,
  `namadokter` varchar(64) NOT NULL,
  `jeniskelamin` varchar(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `ruangdokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `kodepsn` int(10) NOT NULL,
  `alamatpsn` text NOT NULL,
  `tglmasuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `kodepykt` varchar(10) NOT NULL,
  `namapykt` varchar(64) NOT NULL,
  `obat` text NOT NULL,
  `kodedokter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perawatan`
--

CREATE TABLE `perawatan` (
  `kodedokter` int(11) NOT NULL,
  `kodepsn` int(10) NOT NULL,
  `kodepykt` varchar(10) NOT NULL,
  `koderawat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat`
--

CREATE TABLE `rawat` (
  `koderawat` int(10) NOT NULL,
  `namarawat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kodedokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`kodepsn`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`kodepykt`),
  ADD KEY `kodedokter` (`kodedokter`);

--
-- Indexes for table `perawatan`
--
ALTER TABLE `perawatan`
  ADD KEY `kodedokter` (`kodedokter`),
  ADD KEY `kodepsn` (`kodepsn`),
  ADD KEY `kodepykt` (`kodepykt`),
  ADD KEY `koderawat` (`koderawat`);

--
-- Indexes for table `rawat`
--
ALTER TABLE `rawat`
  ADD PRIMARY KEY (`koderawat`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD CONSTRAINT `penyakit_ibfk_1` FOREIGN KEY (`kodedokter`) REFERENCES `perawatan` (`kodedokter`);

--
-- Constraints for table `perawatan`
--
ALTER TABLE `perawatan`
  ADD CONSTRAINT `perawatan_ibfk_1` FOREIGN KEY (`kodedokter`) REFERENCES `dokter` (`kodedokter`),
  ADD CONSTRAINT `perawatan_ibfk_2` FOREIGN KEY (`kodepsn`) REFERENCES `pasien` (`kodepsn`),
  ADD CONSTRAINT `perawatan_ibfk_3` FOREIGN KEY (`kodepykt`) REFERENCES `penyakit` (`kodepykt`),
  ADD CONSTRAINT `perawatan_ibfk_4` FOREIGN KEY (`koderawat`) REFERENCES `rawat` (`koderawat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
