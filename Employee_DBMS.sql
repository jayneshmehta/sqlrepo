-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Generation Time: May 11, 2023 at 02:18 PM
-- Server version: 10.6.12-MariaDB-1:10.6.12+maria~ubu2004-log
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Employee_DBMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(3) NOT NULL,
  `state_id` int(3) NOT NULL,
  `city_name` varchar(35) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `state_id`, `city_name`) VALUES
(1, 1, 'Mumbai'),
(2, 1, 'Pune'),
(3, 1, 'Aurangabad'),
(4, 2, 'Ahemdabad'),
(5, 2, 'Vadodara'),
(6, 2, 'Surat'),
(7, 3, 'Kochi'),
(8, 3, 'Kozhikode'),
(9, 3, 'Kannur');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(3) NOT NULL,
  `country_name` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'Pakistan'),
(3, 'Russia'),
(4, 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country` int(11) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `gender`, `email`, `password`, `street_address`, `city`, `state`, `postcode`, `country`, `phone_number`, `birth_date`, `profile_pic`, `register_date`, `status`) VALUES
(1, 'Jaynesh mehta', 'M', 'jayneshmehta34@gmail.com', 'jaynesh@123', 'lokhandwala', 1, 1, '400053', 1, '9857957844', '2001-02-22', 'img1', '2023-05-11 14:01:19', '1'),
(2, 'Krishna mehta', 'M', 'krishnamehta34@gmail.com', 'krishna@123', 'chandkheda', 2, 4, '300019', 1, '9038543342', '2013-05-24', 'img2', '2023-05-11 14:08:25', '0'),
(3, 'Aftab Shaikh', 'M', 'shakihaftab34@gmail.com', 'Aftab@123', 'Muzaffarabad', 2, 4, '803045', 1, '9348353422', '2013-05-01', 'img3', '2023-05-11 14:07:46', '1');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(3) NOT NULL,
  `country_id` int(3) NOT NULL,
  `state_name` varchar(35) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `country_id`, `state_name`) VALUES
(1, 1, 'Maharastra'),
(2, 1, 'Gujarat'),
(3, 1, 'Kerela'),
(4, 1, 'Haryana'),
(5, 1, 'MP'),
(6, 2, 'Balochistan'),
(7, 2, 'Khyber Pakhtunkhwa'),
(8, 2, 'Sindh'),
(9, 2, 'Azad Kashmir'),
(10, 3, 'Chelyabinsk Region'),
(11, 3, 'Amur Region'),
(12, 3, 'Astrakhan Region'),
(13, 3, 'Bryansk Region'),
(14, 4, 'Florida'),
(15, 4, 'California'),
(16, 4, 'Alaska'),
(17, 4, 'Nebraska');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `fk_city_state` (`state_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `f_key_country` (`country`),
  ADD KEY `fk_state` (`state`),
  ADD KEY `fk_city` (`city`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `f_key_state_country` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
