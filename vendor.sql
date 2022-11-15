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
