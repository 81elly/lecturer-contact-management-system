-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 03:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lecturer_contact`
--

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `name`, `email`, `phone`) VALUES
(2, 'SETH MWEGO', 'sethmwego@gmail.com', '0712564300'),
(3, 'MUGENDI M', 'mugendim12@gmail.com', '0712376532'),
(4, 'ANOLD ALOYCE', 'anoldaloyce23@gmail.com', '073456789'),
(5, 'FINIAN MWALONGO', 'finianmwalongo43@gmail.com', '0784500017'),
(6, 'ALFRED KAJIRUNGA', 'alfredkajirunga23@gmail.com', '0783522000'),
(7, 'RAPHAEL JESSE', 'raphaeljesse67@gmail.com', '0786523119'),
(9, 'HAJI FIMBOMBAYA', 'hajifimbombaya89@gmail.com', '0732667789'),
(28, 'ISAKWISA TENDE', 'isakwisatende@gmail.com', '0723456788');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userType` enum('student','admin') NOT NULL,
  `registrationNumber` varchar(20) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `userType`, `registrationNumber`, `createdAt`, `updatedAt`) VALUES
(1, 'admin@gmail.com', 'admin', 'student', NULL, '2024-02-02 14:20:39', '2024-02-02 14:20:39'),
(2, 'natasha@gmail.com', 'natasha', 'student', NULL, '2024-02-02 14:20:39', '2024-02-02 14:20:39'),
(3, 'eliud@gmail.com', 'eliud', 'student', NULL, '2024-02-02 14:20:39', '2024-02-02 14:20:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
