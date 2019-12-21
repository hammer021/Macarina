-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 06:20 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `macarina`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `kd_admin` varchar(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL,
  `alamat_admin` varchar(50) NOT NULL,
  `gambar` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kd_admin`, `user`, `password`, `alamat_admin`, `gambar`) VALUES
('1', 'hammer', 'sad', '12321', 'dagytgimage.jpg'),
('2', 'ww', '12', 'qwewqe', 'usa-flag-wallpaper-united-states-world-170984.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` varchar(5) NOT NULL,
  `nama_bank` varchar(25) NOT NULL,
  `no_rek` varchar(25) NOT NULL,
  `nama_rek` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar_brg` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `harga`, `stok`, `gambar_brg`) VALUES
('1', 'Jagung Manis (150gr)', 6000, 20, 'jagung.jpg'),
('2', 'Original (150gr)', 2000, 20, 'ori.jpg'),
('3', 'BBQ (150gr)', 2000, 20, 'bbq.jpg'),
('4', 'Balado (150gr)', 2000, 20, 'balado.jpg'),
('5', 'Coklat (150gr)', 6000, 20, 'cokalt.jpg'),
('6', 'Keju (150gr)', 6000, 20, 'keju.jpg'),
('7', 'Seawed (150gr)', 6000, 20, 'seawed.jpg'),
('8', 'Indomie(150gr)', 6000, 20, 'indomie.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` varchar(5) NOT NULL,
  `kd_barang` varchar(5) NOT NULL,
  `id_reseller` varchar(5) NOT NULL,
  `qty_det` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `status` enum('Added to cart','Confirmed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `kd_barang`, `id_reseller`, `qty_det`, `subtotal`, `status`) VALUES
('', '5', '5', 0, 0, 'Added to cart'),
('', '1', '5', 0, 0, 'Added to cart'),
('', '6', '5', 0, 0, 'Added to cart'),
('', '3', '5', 0, 0, 'Added to cart');

-- --------------------------------------------------------

--
-- Table structure for table `konten`
--

CREATE TABLE `konten` (
  `id_konten` varchar(8) NOT NULL,
  `judul` varchar(25) NOT NULL,
  `isi` varchar(25) NOT NULL,
  `gambar` varchar(25) NOT NULL,
  `video` varchar(25) NOT NULL,
  `kd_admin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konten`
--

INSERT INTO `konten` (`id_konten`, `judul`, `isi`, `gambar`, `video`, `kd_admin`) VALUES
('1', 'aku', 'asdas', 'xxx', 'xxx', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(5) NOT NULL,
  `id_bank` varchar(5) NOT NULL,
  `kd_transaksi` int(11) NOT NULL,
  `kd_admin` varchar(5) NOT NULL,
  `bukti_bayar` varchar(25) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `nama_rek_res` varchar(25) NOT NULL,
  `no_rek_res` varchar(25) NOT NULL,
  `status_pesan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE `point` (
  `kd_point` varchar(3) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reseller`
--

CREATE TABLE `reseller` (
  `id_reseller` int(11) NOT NULL,
  `nama_reseller` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `scan_ktp` varchar(50) NOT NULL,
  `no_ktp` varchar(16) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(8) NOT NULL,
  `status` varchar(10) NOT NULL,
  `pas_foto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `nama_reseller`, `alamat`, `no_tlp`, `scan_ktp`, `no_ktp`, `email`, `password`, `status`, `pas_foto`) VALUES
(5, 'Eilham Wahyu Pratama', 'Banyuwangi ', '08989841713', '8e93f3f5b2cf9507091720964670523c.png', '3510101210990005', 'ham@gmail.com  ', 'ham  ', '1', 'bruno3.jpg'),
(6, 'Luqman H', 'Jember ', '12312312312', '2a25162698cb2f7b1b17779eadb185a9.png', '123456789023 ', 'luqman@gmail.com  ', 'q1  ', '0', 'images (1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `no` int(11) NOT NULL,
  `sys_code` varchar(16) NOT NULL,
  `code` varchar(5) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `kab_kota` varchar(20) NOT NULL,
  `kecamatan` varchar(30) NOT NULL,
  `kelurahan` varchar(30) NOT NULL,
  `kode_pos` varchar(30) NOT NULL,
  `zona` varchar(8) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracking`
--

INSERT INTO `tracking` (`no`, `sys_code`, `code`, `provinsi`, `kab_kota`, `kecamatan`, `kelurahan`, `kode_pos`, `zona`, `price`) VALUES
(1, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Ambulu', '68172', 'C', 10000),
(2, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Andongsari', '68172', 'C', 10000),
(3, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Karang Anyar', '68132', 'C', 10000),
(4, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Pontang', '68172', 'C', 10000),
(5, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Sabrang', '68172', 'C', 10000),
(6, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Sumberrejo', '68172', 'C', 10000),
(7, 'JBR20200JBR10001', 'JBR', 'Jawa Timur', 'Jember', 'Ambulu', 'Tegalsari', '68172', 'C', 10000),
(8, 'JBR20200JBR10002', 'JBR', 'Jawa Timur', 'Jember', 'Arjasa', 'Arjasa', '68191', 'C', 10000),
(9, 'JBR20200JBR10002', 'JBR', 'Jawa Timur', 'Jember', 'Arjasa', 'Biting', '68191', 'C', 10000),
(10, 'JBR20200JBR10002', 'JBR', 'Jawa Timur', 'Jember', 'Arjasa', 'Candijati', '68191', 'C', 10000),
(11, 'JBR20200JBR10002', 'JBR', 'Jawa Timur', 'Jember', 'Arjasa', 'Darsono', '68191', 'C', 10000),
(12, 'JBR20200JBR10002', 'JBR', 'Jawa Timur', 'Jember', 'Arjasa', 'Kamal', '68191', 'C', 10000),
(13, 'JBR20200JBR10002', 'JBR', 'Jawa Timur', 'Jember', 'Arjasa', 'Kemuningllor', '68191', 'C', 10000),
(14, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Balung Kidul', '68161', 'C', 10000),
(15, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Balung Kulon', '68161', 'C', 10000),
(16, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Balung Lor', '68161', 'C', 10000),
(17, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Curahlele', '68161', 'C', 10000),
(18, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Gumelar', '68161', 'C', 10000),
(19, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Karang Duren', '68161', 'C', 10000),
(20, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Karang Semanding', '68161', 'C', 10000),
(21, 'JBR20200JBR10003', 'JBR', 'Jawa Timur', 'Jember', 'Balung', 'Tutul', '68161', 'C', 10000),
(22, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Badean', '68154', 'C', 10000),
(23, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Bangsalsari', '68154', 'C', 10000),
(24, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Banjarsari', '68154', 'C', 10000),
(25, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Curah Kalong', '68154', 'C', 10000),
(26, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Gambirono', '68154', 'C', 10000),
(27, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Karangsono', '68154', 'C', 10000),
(28, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Langkap', '68154', 'C', 10000),
(29, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Petung', '68154', 'C', 10000),
(30, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Sukorejo', '68154', 'C', 10000),
(31, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Tisnogambar', '68154', 'C', 10000),
(32, 'JBR20200JBR10004', 'JBR', 'Jawa Timur', 'Jember', 'Bangsalsari', 'Tugusari', '68154', 'C', 10000),
(33, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Bagorejo', '68165', 'C', 10000),
(34, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Gumukmas', '68165', 'C', 10000),
(35, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Karang Rejo', '68165', 'C', 10000),
(36, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Kepanjen', '68165', 'C', 10000),
(37, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Mayangan', '68165', 'C', 10000),
(38, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Menampu', '68165', 'C', 10000),
(39, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Purwoasri', '68165', 'C', 10000),
(40, 'JBR20200JBR10005', 'JBR', 'Jawa Timur', 'Jember', 'Gumuk Mas', 'Tembokrejo', '68165', 'C', 10000),
(41, 'JBR20200JBR10006', 'JBR', 'Jawa Timur', 'Jember', 'Jelbuk', 'Jelbuk', '68192', 'C', 10000),
(42, 'JBR20200JBR10006', 'JBR', 'Jawa Timur', 'Jember', 'Jelbuk', 'Panduman', '68192', 'C', 10000),
(43, 'JBR20200JBR10006', 'JBR', 'Jawa Timur', 'Jember', 'Jelbuk', 'Suco Pangepok', '68192', 'C', 10000),
(44, 'JBR20200JBR10006', 'JBR', 'Jawa Timur', 'Jember', 'Jelbuk', 'Suger Kidul', '68192', 'C', 10000),
(45, 'JBR20200JBR10006', 'JBR', 'Jawa Timur', 'Jember', 'Jelbuk', 'Suko Jember', '68192', 'C', 10000),
(46, 'JBR20200JBR10006', 'JBR', 'Jawa Timur', 'Jember', 'Jelbuk', 'Sukowiryo', '68192', 'C', 10000),
(47, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Cangkring', '68171', 'C', 10000),
(48, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Jatimulyo', '68171', 'C', 10000),
(49, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Jatisari', '68171', 'C', 10000),
(50, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Jenggawah', '68171', 'C', 10000),
(51, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Kemuning Sari Kidul', '68171', 'C', 10000),
(52, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Kertonegoro', '68171', 'C', 10000),
(53, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Seruni', '68171', 'C', 10000),
(54, 'JBR20200JBR10007', 'JBR', 'Jawa Timur', 'Jember', 'Jenggawah', 'Wonojati', '68171', 'C', 10000),
(55, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Ajung', '68193', 'C', 10000),
(56, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Gambiran', '68193', 'C', 10000),
(57, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Glagahwero', '68193', 'C', 10000),
(58, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Gumuksari', '68193', 'C', 10000),
(59, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Kalisat', '68193', 'C', 10000),
(60, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Patempuran', '68193', 'C', 10000),
(61, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Plalangan', '68113', 'C', 10000),
(62, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Sebanen', '68193', 'C', 10000),
(63, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Sukoreno', '68193', 'C', 10000),
(64, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Sumber Jeruk', '68193', 'C', 10000),
(65, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Sumber Kalong', '68193', 'C', 10000),
(66, 'JBR20200JBR10008', 'JBR', 'Jawa Timur', 'Jember', 'Kalisat', 'Sumber Ketempah', '68193', 'C', 10000),
(67, 'JBR20200JBR10009', 'JBR', 'Jawa Timur', 'Jember', 'Kencong', 'Cakru', '68167', 'C', 10000),
(68, 'JBR20200JBR10009', 'JBR', 'Jawa Timur', 'Jember', 'Kencong', 'Kencong', '68167', 'C', 10000),
(69, 'JBR20200JBR10009', 'JBR', 'Jawa Timur', 'Jember', 'Kencong', 'Kraton', '68167', 'C', 10000),
(70, 'JBR20200JBR10009', 'JBR', 'Jawa Timur', 'Jember', 'Kencong', 'Paseban', '68167', 'C', 10000),
(71, 'JBR20200JBR10009', 'JBR', 'Jawa Timur', 'Jember', 'Kencong', 'Wonorejo', '68167', 'C', 10000),
(72, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Karang Paiton', '68196', 'C', 10000),
(73, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Ledokombo', '68196', 'C', 10000),
(74, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Lembengan', '68196', 'C', 10000),
(75, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Slateng', '68196', 'C', 10000),
(76, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Sukogidri', '68196', 'C', 10000),
(77, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Sumber Anget', '68196', 'C', 10000),
(78, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Sumber Bulus', '68196', 'C', 10000),
(79, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Sumber Lesung', '68196', 'C', 10000),
(80, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Sumber Salak', '68196', 'C', 10000),
(81, 'JBR20200JBR10010', 'JBR', 'Jawa Timur', 'Jember', 'Ledokombo', 'Suren', '68196', 'C', 10000),
(82, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Mayang', '68182', 'C', 10000),
(83, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Mrawan', '68182', 'C', 10000),
(84, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Seputih', '68182', 'C', 10000),
(85, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Sidomukti', '68182', 'C', 10000),
(86, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Sumber Kejayan', '68182', 'C', 10000),
(87, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Tegal Waru', '68182', 'C', 10000),
(88, 'JBR20200JBR10011', 'JBR', 'Jawa Timur', 'Jember', 'Mayang', 'Tegalrejo', '68118', 'C', 10000),
(89, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Karangkedawung', '68174', 'C', 10000),
(90, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Kawangrejo', '68174', 'C', 10000),
(91, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Lampeji', '68174', 'C', 10000),
(92, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Lengkong', '68174', 'C', 10000),
(93, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Mumbulsari', '68174', 'C', 10000),
(94, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Suco', '68174', 'C', 10000),
(95, 'JBR20200JBR10012', 'JBR', 'Jawa Timur', 'Jember', 'Mumbulsari', 'Tamansari', '68174', 'C', 10000),
(96, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Bedadung', '68181', 'C', 10000),
(97, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Jatian', '68181', 'C', 10000),
(98, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Kertosari', '68181', 'C', 10000),
(99, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Pakusari', '68181', 'C', 10000),
(100, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Patemon', '68181', 'C', 10000),
(101, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Subo', '68181', 'C', 10000),
(102, 'JBR20200JBR10013', 'JBR', 'Jawa Timur', 'Jember', 'Pakusari', 'Sumber Pinang', '68181', 'C', 10000),
(103, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Glagahwero', '68153', 'C', 10000),
(104, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Kemiri', '68153', 'C', 10000),
(105, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Kemuningsari Lor', '68153', 'C', 10000),
(106, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Pakis', '68153', 'C', 10000),
(107, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Panti', '68153', 'C', 10000),
(108, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Serut', '68153', 'C', 10000),
(109, 'JBR20200JBR10014', 'JBR', 'Jawa Timur', 'Jember', 'Panti', 'Suci', '68153', 'C', 10000),
(110, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Bagon', '68164', 'C', 10000),
(111, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Grenden', '68164', 'C', 10000),
(112, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Jambearum', '68164', 'C', 10000),
(113, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Kasiyan', '68164', 'C', 10000),
(114, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Kasiyan Timur', '68164', 'C', 10000),
(115, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Mlokorejo', '68164', 'C', 10000),
(116, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Mojomulyo', '68164', 'C', 10000),
(117, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Mojosari', '68164', 'C', 10000),
(118, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Puger Kulon', '68164', 'C', 10000),
(119, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Puger Wetan', '68164', 'C', 10000),
(120, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Wonosari', '68164', 'C', 10000),
(121, 'JBR20200JBR10015', 'JBR', 'Jawa Timur', 'Jember', 'Puger', 'Wringin Telu', '68164', 'C', 10000),
(122, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Curahmalang', '68152', 'C', 10000),
(123, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Gugut', '68152', 'C', 10000),
(124, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Kaliwining', '68152', 'C', 10000),
(125, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Nogosari', '68152', 'C', 10000),
(126, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Pecoro', '68152', 'C', 10000),
(127, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Rambigundam', '68152', 'C', 10000),
(128, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Rambipuji', '68152', 'C', 10000),
(129, 'JBR20200JBR10016', 'JBR', 'Jawa Timur', 'Jember', 'Rambipuji', 'Rowotamtu', '68152', 'C', 10000),
(130, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Garahan', '68184', 'C', 10000),
(131, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Harjomolyo', '68184', 'C', 10000),
(132, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Karangharjo', '68184', 'C', 10000),
(133, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Mulyorejo', '68184', 'C', 10000),
(134, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Pace', '68184', 'C', 10000),
(135, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Sempolan', '68184', 'C', 10000),
(136, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Sidomulyo', '68184', 'C', 10000),
(137, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Silo', '68184', 'C', 10000),
(138, 'JBR20200JBR10017', 'JBR', 'Jawa Timur', 'Jember', 'Silo', 'Sumberjati', '68184', 'C', 10000),
(139, 'JBR20200JBR10018', 'JBR', 'Jawa Timur', 'Jember', 'Sukorambi', 'Dukuh Mencek', '68151', 'C', 10000),
(140, 'JBR20200JBR10018', 'JBR', 'Jawa Timur', 'Jember', 'Sukorambi', 'Jubung', '68151', 'C', 10000),
(141, 'JBR20200JBR10018', 'JBR', 'Jawa Timur', 'Jember', 'Sukorambi', 'Karangpring', '68151', 'C', 10000),
(142, 'JBR20200JBR10018', 'JBR', 'Jawa Timur', 'Jember', 'Sukorambi', 'Kelungkung', '68151', 'C', 10000),
(143, 'JBR20200JBR10018', 'JBR', 'Jawa Timur', 'Jember', 'Sukorambi', 'Sukorambi', '68151', 'C', 10000),
(144, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Arjasa', '68194', 'C', 10000),
(145, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Balet Baru', '68194', 'C', 10000),
(146, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Dawuhan Mangli', '68194', 'C', 10000),
(147, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Mojogeni', '68194', 'C', 10000),
(148, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Pocangan', '68194', 'C', 10000),
(149, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sukokerto', '68194', 'C', 10000),
(150, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sukorejo', '68194', 'C', 10000),
(151, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sukosari', '68194', 'C', 10000),
(152, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sukowono', '68194', 'C', 10000),
(153, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sumber Wringin', '68194', 'C', 10000),
(154, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sumberdanti', '68194', 'C', 10000),
(155, 'JBR20200JBR10019', 'JBR', 'Jawa Timur', 'Jember', 'Sukowono', 'Sumberwaru', '68194', 'C', 10000),
(156, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Gelang', '68156', 'C', 10000),
(157, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Jambesari', '68156', 'C', 10000),
(158, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Jamintoro', '68156', 'C', 10000),
(159, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Jatiroto', '68156', 'C', 10000),
(160, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Kaliglagah', '68156', 'C', 10000),
(161, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Karang Bayat', '68156', 'C', 10000),
(162, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Pringgowirawan', '68156', 'C', 10000),
(163, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Rowo Tengah', '68156', 'C', 10000),
(164, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Sumber Agung', '68156', 'C', 10000),
(165, 'JBR20200JBR10020', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Baru', 'Yosorati', '68156', 'C', 10000),
(166, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Cumedak', '68195', 'C', 10000),
(167, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Gunung Malang', '68195', 'C', 10000),
(168, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Jambe Arum', '68195', 'C', 10000),
(169, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Plereyan', '68195', 'C', 10000),
(170, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Pringgondani', '68195', 'C', 10000),
(171, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Randu Agung', '68195', 'C', 10000),
(172, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Rowosari', '68195', 'C', 10000),
(173, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Sumber Pakem', '68195', 'C', 10000),
(174, 'JBR20200JBR10021', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Jambe', 'Sumberjambe', '68195', 'C', 10000),
(175, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Darungan', '68155', 'C', 10000),
(176, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Klatakan', '68155', 'C', 10000),
(177, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Kramat Sukoharjo', '68155', 'C', 10000),
(178, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Manggisan', '68155', 'C', 10000),
(179, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Patemon', '68155', 'C', 10000),
(180, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Selodakon', '68155', 'C', 10000),
(181, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Tanggul Kulon', '68155', 'C', 10000),
(182, 'JBR20200JBR10022', 'JBR', 'Jawa Timur', 'Jember', 'Tanggul', 'Tanggul Wetan', '68155', 'C', 10000),
(183, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Andongrejo', '68173', 'C', 10000),
(184, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Curahnongko', '68173', 'C', 10000),
(185, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Curahtakir', '68173', 'C', 10000),
(186, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Pondokrejo', '68173', 'C', 10000),
(187, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Sanenrejo', '68173', 'C', 10000),
(188, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Sidodadi', '68173', 'C', 10000),
(189, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Tempurejo', '68173', 'C', 10000),
(190, 'JBR20200JBR10023', 'JBR', 'Jawa Timur', 'Jember', 'Tempurejo', 'Wonoasri', '68173', 'C', 10000),
(191, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Gadingrejo', '68166', 'C', 10000),
(192, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Gunungsari', '68166', 'C', 10000),
(193, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Mundurejo', '68166', 'C', 10000),
(194, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Paleran', '68166', 'C', 10000),
(195, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Sidorejo', '68166', 'C', 10000),
(196, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Sukoreno', '68166', 'C', 10000),
(197, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Tanjungsari', '68166', 'C', 10000),
(198, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Tegal Wangi', '68166', 'C', 10000),
(199, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Umbulrejo', '68166', 'C', 10000),
(200, 'JBR20200JBR10024', 'JBR', 'Jawa Timur', 'Jember', 'Umbulsari', 'Umbulsari', '68166', 'C', 10000),
(201, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Ampel', '68162', 'C', 10000),
(202, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Dukuh Dempok', '68162', 'C', 10000),
(203, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Glundengan', '68162', 'C', 10000),
(204, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Kesilir', '68162', 'C', 10000),
(205, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Lojejer', '68162', 'C', 10000),
(206, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Tamansari', '68162', 'C', 10000),
(207, 'JBR20200JBR10025', 'JBR', 'Jawa Timur', 'Jember', 'Wuluhan', 'Tanjung Rejo', '68162', 'C', 10000),
(208, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Ajung', '68175', 'C', 10000),
(209, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Klompangan', '68175', 'C', 10000),
(210, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Mangaran', '68175', 'C', 10000),
(211, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Pancakarya', '68175', 'C', 10000),
(212, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Rowo Indah', '68175', 'C', 10000),
(213, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Sukamakmur', '68175', 'C', 10000),
(214, 'JBR20200JBR10026', 'JBR', 'Jawa Timur', 'Jember', 'Ajung', 'Wirowongso', '68175', 'C', 10000),
(215, 'JBR20200JBR10027', 'JBR', 'Jawa Timur', 'Jember', 'Jombang', 'Jombang', '68168', 'C', 10000),
(216, 'JBR20200JBR10027', 'JBR', 'Jawa Timur', 'Jember', 'Jombang', 'Keting', '68168', 'C', 10000),
(217, 'JBR20200JBR10027', 'JBR', 'Jawa Timur', 'Jember', 'Jombang', 'Ngampelrejo', '68168', 'C', 10000),
(218, 'JBR20200JBR10027', 'JBR', 'Jawa Timur', 'Jember', 'Jombang', 'Padomasan', '68168', 'C', 10000),
(219, 'JBR20200JBR10027', 'JBR', 'Jawa Timur', 'Jember', 'Jombang', 'Sarimulyo', '68168', 'C', 10000),
(220, 'JBR20200JBR10027', 'JBR', 'Jawa Timur', 'Jember', 'Jombang', 'Wringin Agung', '68168', 'C', 10000),
(221, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Jember Kidul', '68131', 'A', 8000),
(222, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Kaliwates', '68133', 'A', 8000),
(223, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Kebon Agung', '68137', 'A', 8000),
(224, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Kepatihan', '68137', 'A', 8000),
(225, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Mangli', '68136', 'A', 8000),
(226, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Sempusari', '68135', 'A', 8000),
(227, 'JBR20200JBR10028', 'JBR', 'Jawa Timur', 'Jember', 'Kaliwates', 'Tegal Besar', '68132', 'A', 8000),
(228, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Banjar Sengon', '68118', 'A', 8000),
(229, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Baratan', '68112', 'A', 8000),
(230, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Bintoro', '68113', 'A', 8000),
(231, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Gebang', '68117', 'A', 8000),
(232, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Jember Lor', '68118', 'A', 8000),
(233, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Jumerto', '68114', 'A', 8000),
(234, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Patrang', '68111', 'A', 8000),
(235, 'JBR20200JBR10029', 'JBR', 'Jawa Timur', 'Jember', 'Patrang', 'Slawu', '68116', 'A', 8000),
(236, 'JBR20200JBR10030', 'JBR', 'Jawa Timur', 'Jember', 'Semboro', 'Pondok Dalem', '68157', 'C', 10000),
(237, 'JBR20200JBR10030', 'JBR', 'Jawa Timur', 'Jember', 'Semboro', 'Pondok Joyo', '68157', 'C', 10000),
(238, 'JBR20200JBR10030', 'JBR', 'Jawa Timur', 'Jember', 'Semboro', 'Rejo Agung', '68157', 'C', 10000),
(239, 'JBR20200JBR10030', 'JBR', 'Jawa Timur', 'Jember', 'Semboro', 'Semboro', '68157', 'C', 10000),
(240, 'JBR20200JBR10030', 'JBR', 'Jawa Timur', 'Jember', 'Semboro', 'Sidomekar', '68157', 'C', 10000),
(241, 'JBR20200JBR10030', 'JBR', 'Jawa Timur', 'Jember', 'Semboro', 'Sidomulyo', '68157', 'C', 10000),
(242, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Antirogo', '68125', 'A', 8000),
(243, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Karangrejo', '68124', 'A', 8000),
(244, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Kebonsari', '68122', 'A', 8000),
(245, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Keranjingan', '68126', 'A', 8000),
(246, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Sumbersari', '68121', 'A', 8000),
(247, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Tegal Gede', '68124', 'A', 8000),
(248, 'JBR20200JBR10031', 'JBR', 'Jawa Timur', 'Jember', 'Sumber Sari', 'Wirolegi', '68124', 'A', 8000),
(249, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Kampung Mandar', '68419', 'B', 8000),
(250, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Kampung Melayu', '68412', 'B', 8000),
(251, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Karangrejo', '68411', 'B', 8000),
(252, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Kebalenan', '68417', 'B', 8000),
(253, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Kepatihan', '68411', 'B', 8000),
(254, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Kertosari', '68418', 'B', 8000),
(255, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Lateng', '68413', 'B', 8000),
(256, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Pakis', '68419', 'B', 8000),
(257, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Panderejo', '68415', 'B', 8000),
(258, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Penganjuran', '68416', 'B', 8000),
(259, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Pengantigan', '68414', 'B', 8000),
(260, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Singonegaran', '68415', 'B', 8000),
(261, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Singotrunan', '68414', 'B', 8000),
(262, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Sobo', '68418', 'B', 8000),
(263, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Sumberrejo', '68419', 'B', 8000),
(264, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Tamanbaru', '68416', 'B', 8000),
(265, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Temenggungan', '68412', 'B', 8000),
(266, 'JBR20200JBR20100', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Banyuwangi', 'Tukangkayu', '68416', 'B', 8000),
(267, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Bangorejo', '68487', 'C', 10000),
(268, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Kebondalem', '68487', 'C', 10000),
(269, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Ringintelu', '68487', 'C', 10000),
(270, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Sambimulyo', '68487', 'C', 10000),
(271, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Sambirejo', '68487', 'C', 10000),
(272, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Sukorejo', '68487', 'C', 10000),
(273, 'JBR20200JBR20101', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Bangorejo', 'Temurejo', '68487', 'C', 10000),
(274, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Benculuk', '68482', 'C', 10000),
(275, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Cluring', '68482', 'C', 10000),
(276, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Kaliploso', '68482', 'C', 10000),
(277, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Plampangrejo', '68482', 'C', 10000),
(278, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Sarimulyo', '68482', 'C', 10000),
(279, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Sembulung', '68482', 'C', 10000),
(280, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Sraten', '68482', 'C', 10000),
(281, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Tamanagung', '68482', 'C', 10000),
(282, 'JBR20200JBR20102', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Cluring', 'Tampo', '68482', 'C', 10000),
(283, 'JBR20200JBR20103', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Gambiran', 'Gambiran', '68486', 'C', 10000),
(284, 'JBR20200JBR20103', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Gambiran', 'Jajag', '68486', 'C', 10000),
(285, 'JBR20200JBR20103', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Gambiran', 'Purwodadi', '68486', 'C', 10000),
(286, 'JBR20200JBR20103', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Gambiran', 'Wringin Agung', '68486', 'C', 10000),
(287, 'JBR20200JBR20103', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Gambiran', 'Wringinrejo', '68486', 'C', 10000),
(288, 'JBR20200JBR20103', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Gambiran', 'Yosomulyo', '68486', 'C', 10000),
(289, 'JBR20200JBR20104', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Genteng', 'Genteng Kulon', '68465', 'B', 8000),
(290, 'JBR20200JBR20104', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Genteng', 'Genteng Wetan', '68465', 'B', 8000),
(291, 'JBR20200JBR20104', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Genteng', 'Kaligondo', '68465', 'B', 8000),
(292, 'JBR20200JBR20104', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Genteng', 'Kembiritan', '68465', 'B', 8000),
(293, 'JBR20200JBR20104', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Genteng', 'Setail', '68465', 'B', 8000),
(294, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Bumiharjo', '68466', 'C', 10000),
(295, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Karangharjo', '68466', 'C', 10000),
(296, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Margomulyo', '68466', 'C', 10000),
(297, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Sepanjang', '68466', 'C', 10000),
(298, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Sumbergondo', '68466', 'C', 10000),
(299, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Tegalharjo', '68466', 'C', 10000),
(300, 'JBR20200JBR20105', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glenmore', 'Tulungrejo', '68466', 'C', 10000),
(301, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Badean', '68461', 'C', 10000),
(302, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Bareng', '68461', 'C', 10000),
(303, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Benelan Lor', '68461', 'C', 10000),
(304, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Bunder', '68461', 'C', 10000),
(305, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Dadapan', '68461', 'C', 10000),
(306, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Gombolirang', '68461', 'C', 10000),
(307, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Kabat', '68461', 'C', 10000),
(308, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Kalirejo', '68461', 'C', 10000),
(309, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Kedayunan', '68461', 'C', 10000),
(310, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Labanasem', '68461', 'C', 10000),
(311, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Macan Putih', '68461', 'C', 10000),
(312, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Pakistaji', '68461', 'C', 10000),
(313, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Pendarungan', '68461', 'C', 10000),
(314, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Pondoknongko', '68461', 'C', 10000),
(315, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Sukojati', '68461', 'C', 10000),
(316, 'JBR20200JBR20106', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kabat', 'Tambong', '68461', 'C', 10000),
(317, 'JBR20200JBR20107', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalibaru', 'Banyuanyar', '68467', 'C', 10000),
(318, 'JBR20200JBR20107', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalibaru', 'Kajarharjo', '68467', 'C', 10000),
(319, 'JBR20200JBR20107', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalibaru', 'Kalibaru Kulon', '68467', 'C', 10000),
(320, 'JBR20200JBR20107', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalibaru', 'Kalibaru Manis', '68467', 'C', 10000),
(321, 'JBR20200JBR20107', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalibaru', 'Kalibaru Wetan', '68467', 'C', 10000),
(322, 'JBR20200JBR20107', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalibaru', 'Kebonrejo', '68467', 'C', 10000),
(323, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Blambangan', '68472', 'C', 10000),
(324, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Kedungrejo', '68472', 'C', 10000),
(325, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Kedungringin (Kedungpringin)', '68472', 'C', 10000),
(326, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Kumendung', '68472', 'C', 10000),
(327, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Sumberberas', '68472', 'C', 10000),
(328, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Sumbersewu', '68472', 'C', 10000),
(329, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Tambakrejo', '68472', 'C', 10000),
(330, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Tapanrejo', '68472', 'C', 10000),
(331, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Tembokrejo', '68472', 'C', 10000),
(332, 'JBR20200JBR20108', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Muncar', 'Wringin Putih', '68472', 'C', 10000),
(333, 'JBR20200JBR20109', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Pesanggaran', 'Kandangan', '68488', 'C', 10000),
(334, 'JBR20200JBR20109', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Pesanggaran', 'Pesanggaran', '68488', 'C', 10000),
(335, 'JBR20200JBR20109', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Pesanggaran', 'Sarongan', '68488', 'C', 10000),
(336, 'JBR20200JBR20109', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Pesanggaran', 'Sumberagung', '68488', 'C', 10000),
(337, 'JBR20200JBR20109', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Pesanggaran', 'Sumbermulyo', '68488', 'C', 10000),
(338, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Bulurejo', '68483', 'C', 10000),
(339, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Glagahagung', '68483', 'C', 10000),
(340, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Grajagan', '68483', 'C', 10000),
(341, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Karetan (Keretan)', '68483', 'C', 10000),
(342, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Kradenan', '68483', 'C', 10000),
(343, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Purwoharjo', '68483', 'C', 10000),
(344, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Sidorejo', '68483', 'C', 10000),
(345, 'JBR20200JBR20110', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Purwoharjo', 'Sumberasri', '68483', 'C', 10000),
(346, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Aliyan', '68462', 'C', 10000),
(347, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Blimbing Sari', '68462', 'C', 10000),
(348, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Bomo', '68462', 'C', 10000),
(349, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Bubuk', '68462', 'C', 10000),
(350, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Gintangan', '68462', 'C', 10000),
(351, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Gitik', '68462', 'C', 10000),
(352, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Gladag', '68462', 'C', 10000),
(353, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Kaligung', '68462', 'C', 10000),
(354, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Kaotan', '68462', 'C', 10000),
(355, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Karang Bendo', '68462', 'C', 10000),
(356, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Karangrejo', '68462', 'C', 10000),
(357, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Kedaleman', '68462', 'C', 10000),
(358, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Lemahbang Dewo', '68462', 'C', 10000),
(359, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Mangir', '68462', 'C', 10000),
(360, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Patoman', '68462', 'C', 10000),
(361, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Pengantigan', '68462', 'C', 10000),
(362, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Rogojampi', '68462', 'C', 10000),
(363, 'JBR20200JBR20111', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Rogojampi', 'Watu Kebo', '68462', 'C', 10000),
(364, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Alas Malang', '68464', 'C', 10000),
(365, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Benelan Kidul', '68464', 'C', 10000),
(366, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Cantuk', '68464', 'C', 10000),
(367, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Gambor', '68464', 'C', 10000),
(368, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Gumirih', '68464', 'C', 10000),
(369, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Kemiri', '68464', 'C', 10000),
(370, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Lemahbang Kulon', '68464', 'C', 10000),
(371, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Padang', '68464', 'C', 10000),
(372, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Singojuruh', '68464', 'C', 10000),
(373, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Singolatren', '68464', 'C', 10000),
(374, 'JBR20200JBR20112', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Singojuruh', 'Sumber Baru', '68464', 'C', 10000),
(375, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Balak', '68463', 'C', 10000),
(376, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Bangunsari', '68463', 'C', 10000),
(377, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Bayu', '68463', 'C', 10000),
(378, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Bedewang', '68463', 'C', 10000),
(379, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Parangharjo', '68463', 'C', 10000),
(380, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Songgon', '68463', 'C', 10000),
(381, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Sragi', '68463', 'C', 10000),
(382, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Sumber Arum', '68463', 'C', 10000),
(383, 'JBR20200JBR20113', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Songgon', 'Sumber Bulu', '68463', 'C', 10000),
(384, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Bagorejo', '68471', 'C', 10000),
(385, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Kebaman', '68471', 'C', 10000),
(386, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Kepundungan', '68471', 'C', 10000),
(387, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Parijatah Kulon', '68471', 'C', 10000),
(388, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Parijatah Wetan', '68471', 'C', 10000),
(389, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Rejoagung', '68471', 'C', 10000),
(390, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Sukomaju', '68471', 'C', 10000),
(391, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Sukonatar', '68471', 'C', 10000),
(392, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Sumbersari', '68471', 'C', 10000),
(393, 'JBR20200JBR20114', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Srono', 'Wonosobo', '68471', 'C', 10000),
(394, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Kalipait', '68484', 'C', 10000),
(395, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Kedungasri', '68484', 'C', 10000),
(396, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Kedunggebang', '68484', 'C', 10000),
(397, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Kedungwungu', '68484', 'C', 10000),
(398, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Kendalrejo', '68484', 'C', 10000),
(399, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Purwoagung', '68484', 'C', 10000),
(400, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Purwoasri', '68484', 'C', 10000),
(401, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Tegaldlimo', '68484', 'C', 10000),
(402, 'JBR20200JBR20115', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegaldlimo', 'Wringinpitu', '68484', 'C', 10000),
(403, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Alasbulu', '68453', 'C', 10000),
(404, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Alasrejo', '68453', 'C', 10000),
(405, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Bajulmati', '68453', 'C', 10000),
(406, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Bangsring', '68453', 'C', 10000),
(407, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Bengkak', '68453', 'C', 10000),
(408, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Bimorejo', '68453', 'C', 10000),
(409, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Sidodadi', '68453', 'C', 10000),
(410, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Sidowangi', '68453', 'C', 10000),
(411, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Sumberanyar', '68453', 'C', 10000),
(412, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Sumberkencono', '68453', 'C', 10000),
(413, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Watukebo', '68453', 'C', 10000),
(414, 'JBR20200JBR20116', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Wongsorejo', 'Wongsorejo', '68453', 'C', 10000),
(415, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Bakungan', '68431', 'C', 10000),
(416, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Banjarsari', '68432', 'C', 10000),
(417, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Glagah', '68432', 'C', 10000),
(418, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Kampunganyar', '68432', 'C', 10000),
(419, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Kemiren', '68432', 'C', 10000),
(420, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Kenjo', '68432', 'C', 10000),
(421, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Olehsari', '68432', 'C', 10000),
(422, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Paspan', '68432', 'C', 10000),
(423, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Rejosari', '68432', 'C', 10000),
(424, 'JBR20200JBR20117', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Glagah', 'Tamansuruh', '68432', 'C', 10000),
(425, 'JBR20200JBR20118', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Giri', 'Boyolangu', '68424', 'C', 10000),
(426, 'JBR20200JBR20118', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Giri', 'Giri', '68423', 'C', 10000),
(427, 'JBR20200JBR20118', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Giri', 'Grogol', '68425', 'C', 10000),
(428, 'JBR20200JBR20118', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Giri', 'Jambesari', '68425', 'C', 10000),
(429, 'JBR20200JBR20118', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Giri', 'Mojopanggung', '68425', 'C', 10000),
(430, 'JBR20200JBR20118', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Giri', 'Penataban', '68422', 'C', 10000),
(431, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Bulusan', '68455', 'C', 10000),
(432, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Bulusari', '68455', 'C', 10000),
(433, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Gombengsari', '68455', 'C', 10000),
(434, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Kalipuro', '68455', 'C', 10000),
(435, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Kelir', '68455', 'C', 10000),
(436, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Ketapang', '68455', 'C', 10000),
(437, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Klatak', '68421', 'C', 10000),
(438, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Pesucen', '68455', 'C', 10000),
(439, 'JBR20200JBR20119', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Kalipuro', 'Telemung', '68455', 'C', 10000),
(440, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Banjar', '68454', 'C', 10000),
(441, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Gumuk', '68454', 'C', 10000),
(442, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Jelun', '68454', 'C', 10000),
(443, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Kluncing', '68454', 'C', 10000),
(444, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Licin', '68454', 'C', 10000),
(445, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Pakel', '68454', 'C', 10000),
(446, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Segobang', '68454', 'C', 10000),
(447, 'JBR20200JBR20120', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Licin', 'Tamansari', '68454', 'C', 10000),
(448, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Gendoh', '68468', 'C', 10000),
(449, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Jambewangi', '68468', 'C', 10000),
(450, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Karangsari', '68468', 'C', 10000),
(451, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Sempu', '68468', 'C', 10000),
(452, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Tegalarum', '68468', 'C', 10000),
(453, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Temuasri', '68468', 'C', 10000),
(454, 'JBR20200JBR20121', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Sempu', 'Temuguruh', '68468', 'C', 10000),
(455, 'JBR20200JBR20122', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Siliragung', 'Barurejo', '68488', 'C', 10000),
(456, 'JBR20200JBR20122', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Siliragung', 'Buluagung', '68488', 'C', 10000),
(457, 'JBR20200JBR20122', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Siliragung', 'Kesilir', '68488', 'C', 10000),
(458, 'JBR20200JBR20122', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Siliragung', 'Seneporejo', '68488', 'C', 10000),
(459, 'JBR20200JBR20122', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Siliragung', 'Siliragung', '68488', 'C', 10000),
(460, 'JBR20200JBR20123', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegalsari', 'Dasri', '68485', 'C', 10000),
(461, 'JBR20200JBR20123', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegalsari', 'Karangdoro', '68485', 'C', 10000),
(462, 'JBR20200JBR20123', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegalsari', 'Karangmulyo', '68485', 'C', 10000),
(463, 'JBR20200JBR20123', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegalsari', 'Tamansari', '68485', 'C', 10000),
(464, 'JBR20200JBR20123', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegalsari', 'Tegalrejo', '68485', 'C', 10000),
(465, 'JBR20200JBR20123', 'JBR', 'Jawa Timur', 'Banyuwangi', 'Tegalsari', 'Tegalsari', '68485', 'C', 10000),
(466, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Badean', '68214', 'B', 5000),
(467, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Blindungan', '68212', 'B', 5000),
(468, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Dabasah', '68211', 'B', 5000),
(469, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Kademangan', '68217', 'B', 5000),
(470, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Kembang', '68219', 'B', 5000),
(471, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Kotakulon', '68213', 'B', 5000),
(472, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Nangkaan', '68215', 'B', 5000),
(473, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Pancoran', '68219', 'B', 5000),
(474, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Pejaten', '68218', 'B', 5000),
(475, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Sukowiryo', '68219', 'B', 5000),
(476, 'JBR20200JBR20200', 'JBR', 'Jawa Timur', 'Bondowoso', 'Bondowoso', 'Tamansari', '68216', 'B', 5000),
(477, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Bajuran', '68286', 'C', 10000),
(478, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Batu Ampar', '68286', 'C', 10000),
(479, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Batu Salang', '68286', 'C', 10000),
(480, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Bercak', '68286', 'C', 10000),
(481, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Bercak Asri', '68286', 'C', 10000);
INSERT INTO `tracking` (`no`, `sys_code`, `code`, `provinsi`, `kab_kota`, `kecamatan`, `kelurahan`, `kode_pos`, `zona`, `price`) VALUES
(482, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Cermee', '68286', 'C', 10000),
(483, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Grujugan', '68261', 'C', 10000),
(484, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Jirek Mas', '68286', 'C', 10000),
(485, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Kladi', '68286', 'C', 10000),
(486, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Pelalangan', '68286', 'C', 10000),
(487, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Ramban Kulon', '68286', 'C', 10000),
(488, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Ramban Wetan', '68286', 'C', 10000),
(489, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Solor', '68286', 'C', 10000),
(490, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Suling Kulon', '68286', 'C', 10000),
(491, 'JBR20200JBR20201', 'JBR', 'Jawa Timur', 'Bondowoso', 'Cermee', 'Suling Wetan', '68286', 'C', 10000),
(492, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Curahdami', '68251', 'B', 5000),
(493, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Curahpoh', '68251', 'B', 5000),
(494, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Jetis', '68251', 'B', 5000),
(495, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Kupang', '68251', 'B', 5000),
(496, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Locare', '68251', 'B', 5000),
(497, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Pakuwesi', '68251', 'B', 5000),
(498, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Penambangan', '68251', 'B', 5000),
(499, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Petung', '68251', 'B', 5000),
(500, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Poncogati', '68251', 'B', 5000),
(501, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Silolembu', '68251', 'B', 5000),
(502, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Sumber Salak', '68251', 'B', 5000),
(503, 'JBR20200JBR20202', 'JBR', 'Jawa Timur', 'Bondowoso', 'Curahdami', 'Sumbersuko', '68251', 'B', 5000),
(504, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Dadapan', '68261', 'B', 5000),
(505, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Dawuhan', '68261', 'B', 5000),
(506, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Grujugan Kidul', '68261', 'B', 5000),
(507, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Kabuaran', '68261', 'B', 5000),
(508, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Kejawan', '68261', 'B', 5000),
(509, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Pekauman', '68261', 'B', 5000),
(510, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Sumberpandan', '68261', 'B', 5000),
(511, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Taman', '68261', 'B', 5000),
(512, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Tegalmijin', '68261', 'B', 5000),
(513, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Wanisodo', '68261', 'B', 5000),
(514, 'JBR20200JBR20203', 'JBR', 'Jawa Timur', 'Bondowoso', 'Grujugan', 'Wonosari', '68261', 'B', 5000),
(515, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Besuk', '68284', 'C', 5000),
(516, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Blimbing', '68284', 'C', 5000),
(517, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Karang Sengon', '68284', 'C', 5000),
(518, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Karanganyar', '68284', 'C', 5000),
(519, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Klabang', '68284', 'C', 5000),
(520, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Klampokan', '68284', 'C', 5000),
(521, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Leprak', '68284', 'C', 5000),
(522, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Pandak', '68284', 'C', 5000),
(523, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Sumbersuko', '68284', 'C', 5000),
(524, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Wonoboyo', '68284', 'C', 5000),
(525, 'JBR20200JBR20204', 'JBR', 'Jawa Timur', 'Bondowoso', 'Klabang', 'Wonokerto', '68284', 'C', 5000),
(526, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Gambangan', '68262', 'B', 5000),
(527, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Gunung Sari', '68262', 'B', 5000),
(528, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Maesan', '68262', 'B', 5000),
(529, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Pakuniran', '68262', 'B', 5000),
(530, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Penanggungan', '68262', 'B', 5000),
(531, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Pujerbaru', '68262', 'B', 5000),
(532, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Sucolor', '68262', 'B', 5000),
(533, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Suger Lor', '68262', 'B', 5000),
(534, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Sumber Anyar', '68262', 'B', 5000),
(535, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Sumberpakem', '68262', 'B', 5000),
(536, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Sumbersari', '68262', 'B', 5000),
(537, 'JBR20200JBR20205', 'JBR', 'Jawa Timur', 'Bondowoso', 'Maesan', 'Tanahwulan', '68262', 'B', 5000),
(538, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Andungsari', '68253', 'B', 5000),
(539, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Ardisaeng', '68253', 'B', 5000),
(540, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Gadingsari', '68253', 'B', 5000),
(541, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Kupang', '68253', 'B', 5000),
(542, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Pakem', '68253', 'B', 5000),
(543, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Patemon', '68253', 'B', 5000),
(544, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Petung', '68253', 'B', 5000),
(545, 'JBR20200JBR20206', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pakem', 'Sumber Dumpyong', '68253', 'B', 5000),
(546, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Bandilan', '68285', 'B', 5000),
(547, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Cangkring', '68285', 'B', 5000),
(548, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Prajekan Kidul', '68285', 'B', 5000),
(549, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Prajekan Lor', '68285', 'B', 5000),
(550, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Sempol', '68285', 'B', 5000),
(551, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Tarum', '68285', 'B', 5000),
(552, 'JBR20200JBR20207', 'JBR', 'Jawa Timur', 'Bondowoso', 'Prajekan', 'Walidono', '68285', 'B', 5000),
(553, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Alassumur', '68271', 'C', 5000),
(554, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Kejayan', '68271', 'C', 5000),
(555, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Mangli', '68271', 'C', 5000),
(556, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Maskuning Kulon', '68271', 'C', 5000),
(557, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Maskuning Wetan', '68271', 'C', 5000),
(558, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Mengok', '68271', 'C', 5000),
(559, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Padasan', '68271', 'C', 5000),
(560, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Randucangkring', '68271', 'C', 5000),
(561, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Sukodono', '68271', 'C', 5000),
(562, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Sukokerto', '68271', 'C', 5000),
(563, 'JBR20200JBR20208', 'JBR', 'Jawa Timur', 'Bondowoso', 'Pujer', 'Sukowono', '68271', 'C', 5000),
(564, 'JBR20200JBR20209', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sempol', 'Jampit', '68288', 'B', 10000),
(565, 'JBR20200JBR20209', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sempol', 'Kalianyar', '68288', 'B', 10000),
(566, 'JBR20200JBR20209', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sempol', 'Kaligedang', '68288', 'B', 10000),
(567, 'JBR20200JBR20209', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sempol', 'Kalisat', '68288', 'B', 10000),
(568, 'JBR20200JBR20209', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sempol', 'Sempol', '68288', 'B', 10000),
(569, 'JBR20200JBR20209', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sempol', 'Sumber Rejo', '68288', 'B', 10000),
(570, 'JBR20200JBR20210', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sukosari', 'Kerang', '68287', 'C', 10000),
(571, 'JBR20200JBR20210', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sukosari', 'Nogosari', '68287', 'C', 10000),
(572, 'JBR20200JBR20210', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sukosari', 'Pecalongan', '68287', 'C', 10000),
(573, 'JBR20200JBR20210', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sukosari', 'Sukosari Lor', '68287', 'C', 10000),
(574, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Kalianyar', '68263', 'B', 5000),
(575, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Karangmelok', '68263', 'B', 5000),
(576, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Kemirian', '68263', 'B', 5000),
(577, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Mengen', '68263', 'B', 5000),
(578, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Sukosari', '68263', 'B', 5000),
(579, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Sumber Anom', '68263', 'B', 5000),
(580, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Sumberkemuning', '68263', 'B', 5000),
(581, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Tamanan', '68263', 'B', 5000),
(582, 'JBR20200JBR20211', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tamanan', 'Wonosuko', '68263', 'B', 5000),
(583, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Cindogo', '68283', 'B', 5000),
(584, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Gununganyar', '68283', 'B', 5000),
(585, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Jurangsapi', '68283', 'B', 5000),
(586, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Kalitapen', '68283', 'B', 5000),
(587, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Mangli Wetan', '68283', 'B', 5000),
(588, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Mrawan', '68283', 'B', 5000),
(589, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Taal', '68283', 'B', 5000),
(590, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Tapen', '68283', 'B', 5000),
(591, 'JBR20200JBR20212', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tapen', 'Wonokusumo', '68283', 'B', 5000),
(592, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Karanganyar', '68291', 'B', 5000),
(593, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Klabang', '68291', 'B', 5000),
(594, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Klabang Agung', '68291', 'B', 5000),
(595, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Mandiro', '68291', 'B', 5000),
(596, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Purnama', '68291', 'B', 5000),
(597, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Sekarputih', '68291', 'B', 5000),
(598, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Tanggulangin', '68291', 'B', 5000),
(599, 'JBR20200JBR20213', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tegalampel', 'Tegalampel', '68291', 'B', 5000),
(600, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Bataan', '68281', 'B', 5000),
(601, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Dawuhan', '68281', 'B', 5000),
(602, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Gebang', '68281', 'B', 5000),
(603, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Kajar', '68281', 'B', 5000),
(604, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Kesemek (Kasemek)', '68281', 'B', 5000),
(605, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Koncer Darul Alam', '68281', 'B', 5000),
(606, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Koncer Kidul', '68281', 'B', 5000),
(607, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Lojajar', '68281', 'B', 5000),
(608, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Pekalangan', '68281', 'B', 5000),
(609, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Sumbersalam', '68281', 'B', 5000),
(610, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Tangsil Kulon', '68281', 'B', 5000),
(611, 'JBR20200JBR20214', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tenggarang', 'Tenggarang', '68281', 'B', 5000),
(612, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Brambang Darussolah', '68272', 'B', 10000),
(613, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Gunosari', '68272', 'B', 10000),
(614, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Jebung Kidul', '68272', 'B', 10000),
(615, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Jebung Lor', '68272', 'B', 10000),
(616, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Kembang', '68272', 'B', 10000),
(617, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Pakisan', '68272', 'B', 10000),
(618, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Patemon', '68272', 'B', 10000),
(619, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Sulek', '68272', 'B', 10000),
(620, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Tlogosari', '68272', 'B', 10000),
(621, 'JBR20200JBR20215', 'JBR', 'Jawa Timur', 'Bondowoso', 'Tlogosari', 'Trotosari', '68272', 'B', 10000),
(622, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Bendoarum', '68282', 'B', 5000),
(623, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Jumpong', '68282', 'B', 5000),
(624, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Kapuran', '68282', 'B', 5000),
(625, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Lombok Kulon', '68282', 'B', 5000),
(626, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Lombok Wetan', '68282', 'B', 5000),
(627, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Pasarejo', '68282', 'B', 5000),
(628, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Pelalangan', '68282', 'B', 5000),
(629, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Sumberkalong', '68282', 'B', 5000),
(630, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Tangsil Wetan', '68282', 'B', 5000),
(631, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Traktakan', '68282', 'B', 5000),
(632, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Tumpeng', '68282', 'B', 5000),
(633, 'JBR20200JBR20216', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wonosari', 'Wonosari', '68282', 'B', 5000),
(634, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Ambulu', '68252', 'C', 5000),
(635, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Ampelan', '68252', 'C', 5000),
(636, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Banyuputih', '68252', 'C', 5000),
(637, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Banyuwulu', '68252', 'C', 5000),
(638, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Bukor', '68252', 'C', 5000),
(639, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Glingseran', '68252', 'C', 5000),
(640, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Gubrih', '68252', 'C', 5000),
(641, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Jambewungu', '68252', 'C', 5000),
(642, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Jatisari', '68252', 'C', 5000),
(643, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Jatitamban', '68252', 'C', 5000),
(644, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Sumbercanting', '68252', 'C', 5000),
(645, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Sumbermalang', '68252', 'C', 5000),
(646, 'JBR20200JBR20217', 'JBR', 'Jawa Timur', 'Bondowoso', 'Wringin', 'Wringin', '68252', 'C', 5000),
(647, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Baratan', '68251', 'C', 5000),
(648, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Bendelan', '68251', 'C', 5000),
(649, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Binakal', '68251', 'C', 5000),
(650, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Gadingsari', '68251', 'C', 5000),
(651, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Jeruksoksok', '68251', 'C', 5000),
(652, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Kembangan', '68251', 'C', 5000),
(653, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Sumbertengah', '68251', 'C', 5000),
(654, 'JBR20200JBR20218', 'JBR', 'Jawa Timur', 'Bondowoso', 'Binakal', 'Sumberwaru', '68251', 'C', 5000),
(655, 'JBR20200JBR20219', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sumber Wringin', 'Rejoagung', '68287', 'C', 10000),
(656, 'JBR20200JBR20219', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sumber Wringin', 'Sukorejo', '68287', 'C', 10000),
(657, 'JBR20200JBR20219', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sumber Wringin', 'Sukosari Kidul', '68287', 'C', 10000),
(658, 'JBR20200JBR20219', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sumber Wringin', 'Sumber Gading', '68287', 'C', 10000),
(659, 'JBR20200JBR20219', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sumber Wringin', 'Sumber Wringin', '68287', 'C', 10000),
(660, 'JBR20200JBR20219', 'JBR', 'Jawa Timur', 'Bondowoso', 'Sumber Wringin', 'Tegaljati', '68287', 'C', 10000),
(661, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Gentong', '68291', 'C', 10000),
(662, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Kemuningan', '68291', 'C', 10000),
(663, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Kretek', '68291', 'C', 10000),
(664, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Paguan', '68291', 'C', 10000),
(665, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Sumberkokap', '68291', 'C', 10000),
(666, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Taman', '68291', 'C', 10000),
(667, 'JBR20200JBR20220', 'JBR', 'Jawa Timur', 'Bondowoso', 'Taman Krocok', 'Trebungan', '68291', 'C', 10000),
(668, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Grujugan Lor', '68261', 'C', 10000),
(669, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Jambe Anom', '68263', 'C', 10000),
(670, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Jambe Sari', '68263', 'C', 10000),
(671, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Pejagan', '68261', 'C', 10000),
(672, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Pengarang', '68271', 'C', 10000),
(673, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Pucang Anom', '68263', 'C', 10000),
(674, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Sumber Anyar', '68263', 'C', 10000),
(675, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Sumber Jeruk', '68263', 'C', 10000),
(676, 'JBR20200JBR20221', 'JBR', 'Jawa Timur', 'Bondowoso', 'Jambe Sari Darus Sholah', 'Tegalpasir', '68263', 'C', 10000),
(677, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Botolinggo', '68284', 'C', 10000),
(678, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Gayam', '68285', 'C', 10000),
(679, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Gayam Lor', '68285', 'C', 10000),
(680, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Klekehan (Klekean)', '68285', 'C', 10000),
(681, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Lanas', '68284', 'C', 10000),
(682, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Lumutan', '68284', 'C', 10000),
(683, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Penang', '68285', 'C', 10000),
(684, 'JBR20200JBR20222', 'JBR', 'Jawa Timur', 'Bondowoso', 'Botolinggo', 'Sumbercanting', '68284', 'C', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kd_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `grand_total` int(11) NOT NULL,
  `kd_admin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kd_admin`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `barang` (`kd_barang`);

--
-- Indexes for table `konten`
--
ALTER TABLE `konten`
  ADD PRIMARY KEY (`id_konten`),
  ADD KEY `admin2` (`kd_admin`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `bank` (`id_bank`),
  ADD KEY `transaksi` (`kd_transaksi`),
  ADD KEY `admin1` (`kd_admin`);

--
-- Indexes for table `point`
--
ALTER TABLE `point`
  ADD PRIMARY KEY (`kd_point`);

--
-- Indexes for table `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `admin` (`kd_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kd_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `barang` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`);

--
-- Constraints for table `konten`
--
ALTER TABLE `konten`
  ADD CONSTRAINT `admin2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `admin1` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`),
  ADD CONSTRAINT `bank` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `admin` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
