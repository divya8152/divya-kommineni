CREATE TABLE `toycat` (
  `toyCatId` int(11) NOT NULL,
  `toyCatName` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;