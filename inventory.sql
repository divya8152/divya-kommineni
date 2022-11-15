CREATE TABLE `inventory` (
  `inventoryId` int(11) NOT NULL,
  `toyCatId` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `itemPrice` float NOT NULL,
  `offerPrice` float NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;