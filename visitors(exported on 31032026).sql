-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2026 at 07:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `v`
--

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `booking_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `visiting_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `check_in_time` varchar(255) DEFAULT NULL,
  `check_out_time` varchar(255) DEFAULT NULL,
  `attendees` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `user_id`, `admin_id`, `company_id`, `booking_id`, `name`, `contact_no`, `email`, `company_name`, `visiting_date`, `reason`, `payment_id`, `amount_paid`, `added_on`, `check_in_time`, `check_out_time`, `attendees`) VALUES
(1, 216, NULL, 4, 'BKG-20260323-007', 'Manoj Kumar P Vishwakarma', '7878787878', 'mkum9417@gmail.com', 'Self-employed', '2026-03-23', 'm', '0', 1.18, '2026-03-23 11:18:55', '18:00', '19:00', 1),
(2, 216, NULL, 4, 'BKG-20260323-007', 'Manoj Kumar P Vishwakarma', '9999999999', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-23', 'm', '0', 1.18, '2026-03-23 11:20:25', '18:00', '19:00', 1),
(3, 216, NULL, 4, 'BKG-20260323-007', 'Manoj Kumar P Vishwakarma', '9999999999', 'mkum9417@gmail.com', 'Self-employed', '2026-03-24', 'sd', '0', 1.18, '2026-03-23 11:21:22', '16:50', '18:50', 1),
(4, 216, NULL, 4, 'BKG-20260324-007', 'raju', '7878787878', 'raju@gmail.com', 'Self-employed', '2026-03-24', 'sd', '0', 1.18, '2026-03-24 05:38:07', '11:07', '00:07', 1),
(5, 198, NULL, 5, 'BKG-20260324-008', 'Shreem Software', '9999999999', 'shreemsoftware@gmail.com', 'stellar companyyy', '2026-03-24', 'df', '0', 1.18, '2026-03-24 05:43:18', '00:12', '01:12', 1),
(6, 216, NULL, 4, 'BKG-20260305-006', 'ARUN SACHITHANANDAM', '9999999999', '', 'Self-employed', '2026-03-27', '', '0', 2.36, '2026-03-27 04:07:57', '09:37', '10:37', 2),
(7, 216, NULL, 4, 'BKG-20260306-001', 'Manoj Kumar P Vishwakarma', '7878787878', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-27', 'sdsd', '0', 1.18, '2026-03-27 04:19:42', '09:49', '10:49', 1),
(8, 216, NULL, 4, 'BKG-20260305-006', 'ARUN SACHITHANANDAM', '7878787878', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', 'm', '0', 1.18, '2026-03-28 05:15:41', '10:45', '11:45', 1),
(9, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '9740936259', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', 'meeting', '0', 4.72, '2026-03-28 08:36:38', '18:00', '20:00', 2),
(10, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '8431066809', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', '0', 2.36, '2026-03-28 08:51:34', '11:30', '13:30', 1),
(11, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '9999999999', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', '0', 1.18, '2026-03-28 08:57:05', '10:15', '11:15', 1),
(12, 216, NULL, 4, 'BKG-20260306-001', 'Manoj Kumar P Vishwakarma', '6767696789', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', '', '0', 1.18, '2026-03-28 09:02:07', '11:15', '12:15', 1),
(13, 216, NULL, 4, 'BKG-20260306-001', 'Manoj Kumar P Vishwakarma', '6767676767', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', '', '0', 1.18, '2026-03-28 09:08:54', '10:30', '11:30', 1),
(14, 216, NULL, 4, 'BKG-20260305-007', 'Prabhakar R', '9740936259', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', 'pay_SWanGDkbrQT2Nv', 1.18, '2026-03-28 09:14:58', '17:15', '18:15', 1),
(15, 216, NULL, 4, 'BKG-20260324-013', 'Shreem Software', '6767676767', 'mkum9417@gmail.com', 'Self-employed', '2026-03-28', '', 'pay_SWatIIG1Uuu1sv', 1.18, '2026-03-28 09:20:43', '11:30', '12:30', 1),
(16, 216, NULL, 4, 'BKG-20260328-001', 'Manoj Kumar P Vishwakarma', '9999999999', 'manojkumarpvishwakarma709@gmail.com', 'Self-employed', '2026-03-28', '', 'pay_SWaxCp4cYbYi9t', 1.18, '2026-03-28 09:24:24', '08:00', '09:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_visitors_company` (`company_id`),
  ADD KEY `fk_visitor_admin` (`admin_id`),
  ADD KEY `fk_visitors_user` (`user_id`),
  ADD KEY `fk_visitor_booking` (`booking_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `fk_visitor_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_visitor_booking` FOREIGN KEY (`booking_id`) REFERENCES `workspace_bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_visitors_company` FOREIGN KEY (`company_id`) REFERENCES `company_profile` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_visitors_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
