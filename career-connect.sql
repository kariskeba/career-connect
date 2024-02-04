-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 07:22 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `career-connect`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `message_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`message_id`, `name`, `email`, `message`) VALUES
(1, 'Kesia', 'kesia@gmail.com', 'hi'),
(2, 'Kesia', 'kesia@gmail.com', 'hi'),
(3, 'Kesia', 'kesia@gmail.com', 'u'),
(4, 'Kesia', 'kesia@gmail.com', 'yu'),
(5, 'Kesia', 'kesia@gmail.com', 'bh'),
(6, 'Kesia', 'kesia@gmail.com', 'kl'),
(7, 'Kesia', 'kesia@gmail.com', 'ghy'),
(8, 'Kesia', 'kesia@gmail.com', 'nm,'),
(9, 'Kesia', 'kesia@gmail.com', 'mnm'),
(10, 'Kesia', 'kesia@gmail.com', 'sasa'),
(11, 'Kesia', 'kesia@gmail.com', 'wewe'),
(12, 'Kesia', 'kesia@gmail.com', 'bhg'),
(13, 'Kesia', 'kesia@gmail.com', 'bgbg'),
(14, 'Kesia', 'kesia@gmail.com', 'hg'),
(15, 'Kesia', 'kesia@gmail.com', 'kj');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `lecturer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_id` int(11) NOT NULL,
  `module_code` varchar(20) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `semester` enum('1','2') NOT NULL,
  `description` text DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `module_lecturers`
--

CREATE TABLE `module_lecturers` (
  `assignment_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, 'kesia', '1234'),
(2, 'kesia@gmail.com', '1234'),
(3, 'kesiakeb@gmail.com', '12345'),
(4, 'kesiakeb@gmail.com', '55555'),
(5, 'kesiakeb@gmail.com', '12345'),
(6, 'kesiakeb@gmail.com', '55555'),
(7, 'kesiakeb@gmail.com', '2323'),
(8, 'kesiakeb@gmail.com', '1'),
(9, 'kesiakeb@gmail.com', '3434');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lecturer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Indexes for table `module_lecturers`
--
ALTER TABLE `module_lecturers`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_lecturers`
--
ALTER TABLE `module_lecturers`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `module_lecturers`
--
ALTER TABLE `module_lecturers`
  ADD CONSTRAINT `module_lecturers_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`),
  ADD CONSTRAINT `module_lecturers_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
