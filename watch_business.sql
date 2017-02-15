-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2016 at 06:26 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watch_business`
--
CREATE DATABASE IF NOT EXISTS `watch_business` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `watch_business`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `Name`) VALUES
(1, 'Casio'),
(2, 'Rolex'),
(3, 'Omega');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `InvoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `NgayMua` date DEFAULT NULL,
  `NgayGiao` date DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `UserId_idx` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE IF NOT EXISTS `invoice_detail` (
  `WatchId` int(11) NOT NULL,
  `InvoiceId` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `InvoiceDetailId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`InvoiceDetailId`),
  KEY `detail_watch_idx` (`WatchId`),
  KEY `detail_invoice_fk_idx` (`InvoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Role` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `Username`, `Password`, `Name`, `Email`, `Role`) VALUES
(1, 'chinguyenle', '123456', 'Lê Chí Nguyên', 'endlesslovefor123@gmail.com', 'ADMIN'),
(2, 'chipunguyen', '123456', 'Nguyễn Chi Pu', 'xspacechinguyen@gmail.com', 'CUSTOMER'),
(3, 'sotungnguyen', '123456', 'Nguyễn Sơn Tùng', 'cristineronaldo@gmail.com', 'CUSTOMER');

-- --------------------------------------------------------

--
-- Table structure for table `watch`
--

CREATE TABLE IF NOT EXISTS `watch` (
  `WatchId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Quantity` int(11) DEFAULT '0',
  `Price` double NOT NULL,
  `Image` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`WatchId`),
  KEY `watch_category_fk_idx` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `watch`
--

INSERT INTO `watch` (`WatchId`, `CategoryId`, `Name`, `Quantity`, `Price`, `Image`, `Description`) VALUES
(1, 1, 'Casio AE-00WD', 30, 120, 'pro1.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại.'),
(2, 1, 'Casio AE-210W', 30, 130, 'pro2.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại'),
(3, 1, 'Casio AE-200W', 30, 180, 'pro3.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại'),
(4, 1, 'Casio EQ-10BW', 30, 125, 'pro4.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại'),
(5, 1, 'Casio EQ-100W', 30, 129, 'pro5.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại'),
(6, 1, 'Casio AEQ-10W', 30, 220, 'pro6.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại'),
(7, 1, 'Casio BEL-10D', 30, 120, 'pro7.jpg', ' Casio được thành lập vào tháng 4 năm 1946 bởi Kashio Tadao, một kỹ sư chuyên về công nghệ chế tạo.Năm 1957, Casio phát triển máy tính đầu tiên của mình, công ty mở rộng phạm vi của nó bằng cách xâm nhập vào thị trường đồng hồ vào năm 1974 phát hành Casiotron. Và từ đó những chiếc đồng hồ casio dần dần đi theo theo sự phát triển của công nghệ nhân loại'),
(8, 2, 'OYSTER PERPETUAL', 25, 350, 'pro8.jpg', 'Rolex là thương hiệu đồng hồ nổi tiếng đến từ Thụy Sĩ, được nhiều người ưa thích sử dụng, và cũng là chiếc đồng hồ được nhiều người, đặc biệt là các doanh nhân, người làm chính trị sử dụng để khẳng định địa vị xã hội của mình.'),
(9, 2, 'LADY-DATEJUST', 25, 360, 'pro9.jpg', 'Rolex là thương hiệu đồng hồ nổi tiếng đến từ Thụy Sĩ, được nhiều người ưa thích sử dụng, và cũng là chiếc đồng hồ được nhiều người, đặc biệt là các doanh nhân, người làm chính trị sử dụng để khẳng định địa vị xã hội của mình'),
(10, 2, 'PEARLMASTER', 25, 370, 'pro10.jpg', 'Rolex là thương hiệu đồng hồ nổi tiếng đến từ Thụy Sĩ, được nhiều người ưa thích sử dụng, và cũng là chiếc đồng hồ được nhiều người, đặc biệt là các doanh nhân, người làm chính trị sử dụng để khẳng định địa vị xã hội của mình'),
(11, 2, 'GMT-MASTER II', 25, 380, 'pro11.jpg', 'Rolex là thương hiệu đồng hồ nổi tiếng đến từ Thụy Sĩ, được nhiều người ưa thích sử dụng, và cũng là chiếc đồng hồ được nhiều người, đặc biệt là các doanh nhân, người làm chính trị sử dụng để khẳng định địa vị xã hội của mình'),
(12, 3, 'SPEEDMASTER OMEGA', 15, 382, 'pro12.jpg', 'Đồng hồ OMEGA chính hãng là dòng đồng hồ cao cấp được vinh dự ghi lại những khoảnh khắc đáng nhớ trong chuyến du hành đầu tiên lên mặt trăng của nhân loại. “ Ấn tượng đầu tiên về chiếc đồng hồ Omega này là sự tinh xảo và hoàn hảo chính xác đến từng chi tiết, cũng như công nghệ chế tác cao cấp”. Đồng hồ Omega chính hãng được biết đến như một chuyên gia giữ gìn thời gian hàng đầu thế giới.'),
(13, 3, 'HOUR VISION OMEGA', 15, 322, 'pro13.jpg', 'Đồng hồ OMEGA chính hãng là dòng đồng hồ cao cấp được vinh dự ghi lại những khoảnh khắc đáng nhớ trong chuyến du hành đầu tiên lên mặt trăng của nhân loại. “ Ấn tượng đầu tiên về chiếc đồng hồ Omega này là sự tinh xảo và hoàn hảo chính xác đến từng chi tiết, cũng như công nghệ chế tác cao cấp”. Đồng hồ Omega chính hãng được biết đến như một chuyên gia giữ gìn thời gian hàng đầu thế giới.'),
(14, 3, 'AQUA15 MASTER', 15, 352, 'pro14.jpg', 'Đồng hồ OMEGA chính hãng là dòng đồng hồ cao cấp được vinh dự ghi lại những khoảnh khắc đáng nhớ trong chuyến du hành đầu tiên lên mặt trăng của nhân loại. “ Ấn tượng đầu tiên về chiếc đồng hồ Omega này là sự tinh xảo và hoàn hảo chính xác đến từng chi tiết, cũng như công nghệ chế tác cao cấp”. Đồng hồ Omega chính hãng được biết đến như một chuyên gia giữ gìn thời gian hàng đầu thế giới.');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_user_fk` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `detail_invoice_fk` FOREIGN KEY (`InvoiceId`) REFERENCES `invoice` (`InvoiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_watch_fk` FOREIGN KEY (`WatchId`) REFERENCES `watch` (`WatchId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `watch`
--
ALTER TABLE `watch`
  ADD CONSTRAINT `watch_category_fk` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
