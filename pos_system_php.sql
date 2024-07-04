-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2024 at 02:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_system_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `is_ban` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not_ban,1=ban',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `is_ban`, `created_at`) VALUES
(12, 'sahril', 'haekal@gmail.com', '$2y$10$atY.KPeY4d.YWB2qlMq/u.BED.aXPuw24jlI2jqV2yMVPi8Ao9Cy2', '123456', 0, '2024-07-04'),
(13, 'sahril', 'sahril@gmail.com', '$2y$10$5ey0Wirsb1sibTiE5JfH2eOsc36DRgh7wz/eLSApCfsF9cDo4nmPO', '123214142', 0, '2024-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`) VALUES
(3, 'Paket Cream', 'Paket Cream', 0),
(4, 'Cream', 'Cream', 0),
(5, 'Sabun', 'Sabun', 0),
(6, 'Cleancer', 'Cleancer', 0),
(7, 'Face Toner', 'Face Toner', 0),
(8, 'Fresh Water', 'Fresh Water', 0),
(9, 'Refresh Water', 'Refresh Water', 0),
(10, 'Serum', 'Serum', 0),
(11, 'Salep', 'Salep', 0),
(12, 'Jelly', 'Jelly', 0),
(13, 'Gel', 'Gel', 0),
(14, 'BB Cream', 'BB Cream', 0),
(15, 'Cushion', 'Cushion', 0),
(16, 'Powder', 'Powder', 0),
(17, 'Masker', 'Masker', 0),
(18, 'Lipmate', 'Lipmate', 0),
(19, 'Body Serum', 'Body Serum', 0),
(20, 'Handbody', 'Handbody', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden',
  `created_at` text NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `total_amount` int(100) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash,online',
  `order_placed_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `quantity`, `image`, `status`, `created_at`) VALUES
(2, 3, 'Paket Radiance SNSR', 'Paket Radiance SNSR\r\n', 290000, 24, '', 0, '2024-06-10'),
(3, 3, 'Paket Radiance SNSR No Serum', 'Paket Radiance SNSR No Serum', 259999, 12, 'assets/uploads/products/1718011663.png', 0, '2024-06-10'),
(4, 3, 'Paket Acne SNSA', 'Paket Acne SNSA', 270000, 36, 'assets/uploads/products/1718012683.png', 0, '2024-06-10'),
(5, 3, 'Paket Spot Whitening/ Flek SNSS', 'Paket Spot Whitening/ Flek SNSS', 10000, 1, 'assets/uploads/products/1718188198.png', 0, '2024-06-12'),
(6, 0, 'LifeBoy', '', 12000, 10, '', 0, '2024-06-12'),
(7, 0, 'Sharil', '', 10000, 1, '', 0, '2024-06-12'),
(8, 0, 'oi', '', 10000, 1, '', 0, '2024-06-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
