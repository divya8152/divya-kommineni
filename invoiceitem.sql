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