-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 09:18 PM
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
-- Database: `toys_encore`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventoryId` int(11) NOT NULL,
  `toyCatId` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `itemPrice` float NOT NULL,
  `offerPrice` float NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventoryId`, `toyCatId`, `itemName`, `itemPrice`, `offerPrice`, `active`) VALUES
(1, 1, 'DITTY BIRD Baby Sound Book', 2500, 0, 1),
(2, 2, 'Webby Soft Animal Plush Elephant Toy', 1500, 0, 1),
(3, 4, 'Carroms', 5000, 0, 1),
(4, 3, 'Tennis Racket', 8000, 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL,
  `invoiceNo` varchar(15) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `invoiceAmount` float NOT NULL,
  `discount` float NOT NULL,
  `tax` float NOT NULL,
  `totalAmount` float NOT NULL,
  `flag` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceId`, `invoiceNo`, `vendorId`, `invoiceAmount`, `discount`, `tax`, `totalAmount`, `flag`) VALUES
(1, 'INV00001', 1, 8000, 500, 0, 7500, 1),
(2, 'INV00002', 2, 9500, 0, 18, 11210, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitem`
--

CREATE TABLE `invoiceitem` (
  `invoiceItemId` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `inventoryId` int(11) NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` float NOT NULL,
  `type` varchar(5) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoiceitem`
--

INSERT INTO `invoiceitem` (`invoiceItemId`, `invoiceId`, `inventoryId`, `price`, `qty`, `discount`, `type`, `status`) VALUES
(7, 1, 4, 8000, 1, 500, '', 1),
(8, 2, 3, 5000, 1, 0, '', 1),
(9, 2, 1, 2500, 1, 0, '', 1),
(10, 2, 2, 1500, 1, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `toycat`
--

CREATE TABLE `toycat` (
  `toyCatId` int(11) NOT NULL,
  `toyCatName` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toycat`
--

INSERT INTO `toycat` (`toyCatId`, `toyCatName`, `status`) VALUES
(1, 'Age1-2', 1),
(2, 'Age2-4', 1),
(3, 'Outdoor', 1),
(4, 'Indoor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendorId` int(11) NOT NULL,
  `vendorName` varchar(255) NOT NULL,
  `location` varchar(500) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postalCode` varchar(25) NOT NULL,
  `contactNo` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendorId`, `vendorName`, `location`, `city`, `postalCode`, `contactNo`, `email`, `active`) VALUES
(1, 'John', 'Los Angels', 'LA', '304-123', '9098729382', 'john@la.com', 1),
(2, 'World Toy Dealers', 'Spring Field', 'New Jersey', '503467', '982932938', 'business@worldtoy.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventoryId`),
  ADD KEY `fk_toyCat_id` (`toyCatId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `fk_vendor_id` (`vendorId`);

--
-- Indexes for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD PRIMARY KEY (`invoiceItemId`),
  ADD KEY `fk_invoice_id` (`invoiceId`),
  ADD KEY `fk_inventory_id` (`inventoryId`);

--
-- Indexes for table `toycat`
--
ALTER TABLE `toycat`
  ADD PRIMARY KEY (`toyCatId`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  MODIFY `invoiceItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `toycat`
--
ALTER TABLE `toycat`
  MODIFY `toyCatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_toyCat_id` FOREIGN KEY (`toyCatId`) REFERENCES `toycat` (`toyCatId`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_vendor_id` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`vendorId`);

--
-- Constraints for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD CONSTRAINT `fk_inventory_id` FOREIGN KEY (`inventoryId`) REFERENCES `inventory` (`inventoryId`),
  ADD CONSTRAINT `fk_invoice_id` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`invoiceId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
