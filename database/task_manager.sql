-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 13, 2025 at 12:36 AM
-- Server version: 8.0.40
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `act_id` int NOT NULL,
  `act_owner` int NOT NULL,
  `act_task_id` int NOT NULL,
  `act_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `act_end_time` timestamp NULL DEFAULT NULL,
  `act_uid` int NOT NULL,
  `act_recurrence` tinyint(1) NOT NULL DEFAULT '0',
  `act_interval` varchar(20) DEFAULT NULL,
  `act_frequency` int DEFAULT NULL,
  `act_weekdays` varchar(30) DEFAULT NULL,
  `act_monthdates` varchar(100) DEFAULT NULL,
  `act_start_date` date DEFAULT NULL,
  `act_end_date` date DEFAULT NULL,
  `act_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `asg_owner` int NOT NULL,
  `asg_user_id` int NOT NULL,
  `asg_task_id` int NOT NULL,
  `asg_role` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `nte_id` int NOT NULL,
  `nte_owner` int NOT NULL,
  `nte_parent_table` varchar(30) NOT NULL,
  `nte_parent_id` int NOT NULL,
  `nte_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nte_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag__text` varchar(50) NOT NULL,
  `tag_obj_type` varchar(30) NOT NULL,
  `tag_obj_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `tsk_id` int NOT NULL,
  `tsk_name` varchar(50) NOT NULL,
  `tsk_status` varchar(20) DEFAULT NULL,
  `tsk_owner` int NOT NULL,
  `tsk_parent` int NOT NULL,
  `tsk_level` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_users`
--

CREATE TABLE `tm_users` (
  `usr_id` int NOT NULL,
  `usr_username` varchar(30) NOT NULL,
  `usr_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usr_first` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usr_last` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usr_pwhash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usr_acc_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`act_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`nte_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`tsk_id`);

--
-- Indexes for table `tm_users`
--
ALTER TABLE `tm_users`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `idx_username` (`usr_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `act_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `tsk_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tm_users`
--
ALTER TABLE `tm_users`
  MODIFY `usr_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

