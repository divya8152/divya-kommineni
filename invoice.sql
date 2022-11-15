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
