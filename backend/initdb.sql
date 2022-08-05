-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 03:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `stadent_register`
--

CREATE TABLE `stadent_register` (
  `id` int(11) NOT NULL,
  `no` varchar(10) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stadent_register`
--

INSERT INTO `stadent_register` (`id`, `no`, `title`, `name`, `class`, `date`) VALUES
(1, '13132', 'นาย', 'ทดสอบ', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-04 01:00:32'),
(2, '5412', 'นาย', 'ทดสอบ2', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-04 01:05:31'),
(3, '5412', 'นาย', 'ทดสอบ25', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-04 01:07:25'),
(4, '5412', 'นาย', 'ทดสอบ258', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-04 01:08:29'),
(5, '61186', 'นาย', 'ทดสอบ', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-04 01:14:39'),
(6, '1561', 'นาย', 'ภานุวัฒน์ กองอยู่', 'ชั้นมัธยมศึกษาปีที่ 3', '2022-06-06 20:29:47'),
(7, '1695', 'นาย', 'ภานุวัฒน์ กองอยู่', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-06 21:47:13'),
(8, '9653', 'นาย', 'ภานุวัฒน์ กองอยู่', 'ชั้นมัธยมศึกษาปีที่ 2', '2022-06-06 21:49:01'),
(9, '1561', 'นาย', 'ทดสอบ11', 'ชั้นมัธยมศึกษาปีที่ 3', '2022-06-06 21:49:20'),
(10, '1999', 'นาย', 'test test', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-08 20:16:39'),
(11, '1863', 'นาย', 'ทดสอบ ทดสอบ', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-09 14:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `activeDate` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `activeDate`, `status`) VALUES
(1, 'Admin', '$P$BtErQ4BHBacCnI7JeAUtt1ZFD9Hiy91', 'Admin', '2022-06-09 17:17:29', NULL),
(2, 'Admin2', '0123admin2', 'Admin', '2022-05-22', NULL),
(3, 'teacher23', '$P$Bt7YQgBbE907t4h6nhsaPMwrrtEigh.', 'teacher', '2022-06-07', NULL),
(4, 'teacher36', '$P$B4VaFMFJAGR/jU.lLQNDLYBT033Y3B.', 'teacher3', '2022-06-08 00:12:42', NULL),
(5, 'ppp', '$P$BlloQmkqE8pJlcD1eM4sg9Sq0t5g9N1', 'sfvwef', '2022-06-09 14:18:48', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stadent_register`
--
ALTER TABLE `stadent_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stadent_register`
--
ALTER TABLE `stadent_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
