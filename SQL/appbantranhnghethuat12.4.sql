-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 02:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appbantranhnghethuat`
--

-- --------------------------------------------------------

--
-- Table structure for table `products_catalog`
--

CREATE TABLE `products_catalog` (
  `id_catalog` int(11) NOT NULL COMMENT 'Mã danh mục',
  `name_catalog` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên danh mục'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_catalog`
--

INSERT INTO `products_catalog` (`id_catalog`, `name_catalog`) VALUES
(1, 'Tranh núi rừng'),
(2, 'Tranh phố cổ'),
(5, 'Tranh thiếu nữ'),
(6, 'Tranh Phong Cảnh Biển'),
(7, 'Tranh Phong Cảnh Vùng Cao');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL COMMENT 'Mã Slider',
  `titile_sider` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề Slider',
  `image_slider` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh Slider'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `titile_sider`, `image_slider`) VALUES
(1, 'Phong cảnh đồng quê', 'tranh_phong_canh_dong_que_slider.jpg'),
(2, 'Sơn dầu phong cảnh', 'tranh_son_dau_phong_canh_slider.jpg'),
(3, 'Tranh thêu', 'tranh_theu_chu_thap_slider.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products_catalog`
--
ALTER TABLE `products_catalog`
  ADD PRIMARY KEY (`id_catalog`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products_catalog`
--
ALTER TABLE `products_catalog`
  MODIFY `id_catalog` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Slider', AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
