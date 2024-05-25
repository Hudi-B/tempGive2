-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2024 at 05:25 PM
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
-- Database: `roster`
--
CREATE DATABASE IF NOT EXISTS `roster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `roster`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Id` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Id`, `Name`) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'IT'),
(5, 'Operations'),
(6, 'Sales'),
(7, 'Customer Service'),
(8, 'Research and Development'),
(9, 'Administration'),
(10, 'Quality Assurance');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Id` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `Position` varchar(60) NOT NULL,
  `Salary` decimal(10,0) NOT NULL,
  `HireDate` date NOT NULL,
  `EditDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Id`, `Name`, `Email`, `DepartmentId`, `Position`, `Salary`, `HireDate`, `EditDate`) VALUES
(1, 'John Smith', 'john.smith@example.com', 1, 'HR Manager', 60000, '2020-01-15', '2024-05-25 15:33:56'),
(2, 'Alice Johnson', 'alice.johnson@example.com', 2, 'Finance Director', 75000, '2019-03-20', '2024-05-25 15:33:56'),
(3, 'Michael Williams', 'michael.williams@example.com', 3, 'Marketing Specialist', 50000, '2021-05-10', '2024-05-25 15:33:56'),
(4, 'Emily Brown', 'emily.brown@example.com', 4, 'IT Manager', 65000, '2018-09-05', '2024-05-25 15:33:56'),
(5, 'James Davis', 'james.davis@example.com', 5, 'Operations Supervisor', 55000, '2022-02-28', '2024-05-25 15:33:56'),
(6, 'Emma Wilson', 'emma.wilson@example.com', 6, 'Sales Representative', 45000, '2017-11-14', '2024-05-25 15:33:56'),
(7, 'Olivia Martinez', 'olivia.martinez@example.com', 7, 'Customer Service Agent', 40000, '2019-08-03', '2024-05-25 15:33:56'),
(8, 'Daniel Taylor', 'daniel.taylor@example.com', 8, 'R&D Scientist', 70000, '2020-04-25', '2024-05-25 15:33:56'),
(9, 'Sophia Anderson', 'sophia.anderson@example.com', 9, 'Administrator', 48000, '2018-06-17', '2024-05-25 15:33:56'),
(10, 'Matthew Thomas', 'matthew.thomas@example.com', 10, 'QA Analyst', 52000, '2021-11-30', '2024-05-25 15:33:56'),
(11, 'Ethan Moore', 'ethan.moore@example.com', 1, 'HR Assistant', 40000, '2020-07-12', '2024-05-25 15:31:40'),
(12, 'Isabella Taylor', 'isabella.taylor@example.com', 2, 'Financial Analyst', 55000, '2019-10-22', '2024-05-25 15:31:40'),
(13, 'Aiden Anderson', 'aiden.anderson@example.com', 3, 'Marketing Coordinator', 48000, '2021-02-18', '2024-05-25 15:31:40'),
(14, 'Mia Harris', 'mia.harris@example.com', 4, 'IT Technician', 42000, '2018-11-08', '2024-05-25 15:31:40'),
(15, 'Noah Garcia', 'noah.garcia@example.com', 5, 'Operations Manager', 62000, '2022-03-05', '2024-05-25 15:31:40'),
(16, 'Ava Martinez', 'ava.martinez@example.com', 6, 'Sales Manager', 58000, '2017-12-15', '2024-05-25 15:31:40'),
(17, 'Liam Rodriguez', 'liam.rodriguez@example.com', 7, 'Customer Service Supervisor', 50000, '2019-09-28', '2024-05-25 15:31:40'),
(18, 'Charlotte Young', 'charlotte.young@example.com', 8, 'R&D Engineer', 67000, '2020-05-17', '2024-05-25 15:31:40'),
(19, 'Lucas Lee', 'lucas.lee@example.com', 9, 'Administrative Assistant', 43000, '2018-07-25', '2024-05-25 15:31:40'),
(20, 'Luna Walker', 'luna.walker@example.com', 10, 'QA Tester', 49000, '2021-12-10', '2024-05-25 15:31:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DepartmentId` (`DepartmentId`),
  ADD KEY `DepartmentId_2` (`DepartmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
