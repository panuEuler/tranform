-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2022 at 07:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8mb4;

--
-- Database: `library`
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
(11, '1863', 'นาย', 'ทดสอบ ทดสอบ', 'ชั้นมัธยมศึกษาปีที่ 1', '2022-06-09 14:34:40'),
(12, '1151', 'นาย', 'sssb  ffff', 'ชั้นมัธยมศึกษาปีที่ 4', '2022-07-10 13:14:03'),
(13, '555', 'นาย', 'adad  fff', 'ชั้นมัธยมศึกษาปีที่ 5', '2022-07-10 13:14:32'),
(14, '00000', 'นาย', 'อดิศร พันธ์มณี', 'ชั้นมัธยมศึกษาปีที่ 6', '2022-08-01 09:15:40'),
(15, '0000', 'นาย', 'อดิศร พันธ์มณี', 'ชั้นมัธยมศึกษาปีที่ 6', '2022-08-01 09:16:24'),
(16, '0000', 'นาย', 'อดิศร พันธ์มณี', 'ชั้นมัธยมศึกษาปีที่ 6', '2022-08-01 09:16:45'),
(17, '1150', 'นาย', 'Aaaa dddd', 'ชั้นมัธยมศึกษาปีที่ 2', '2022-08-01 23:49:23');

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
(1, 'Admin', '$P$BtErQ4BHBacCnI7JeAUtt1ZFD9Hiy91', 'Admin', '2022-08-02 00:06:10', NULL),
(2, 'Admin2', '0123admin2', 'Admin', '2022-05-22', NULL),
(3, 'teacher23', '$P$Bt7YQgBbE907t4h6nhsaPMwrrtEigh.', 'teacher', '2022-06-07', 'InActive'),
(4, 'teacher36', '$P$B4VaFMFJAGR/jU.lLQNDLYBT033Y3B.', 'teacher3', '2022-06-08 00:12:42', 'InActive'),
(5, 'ppp', '$P$BlloQmkqE8pJlcD1eM4sg9Sq0t5g9N1', 'sfvwef', '2022-06-09 14:18:48', 'InActive'),
(6, 'jirakit1999', '$P$Ba/3AedbMhg4FUf/4UuPYCuPWottOs.', 'jirakit', '2022-07-10 13:15:32', 'InActive'),
(7, '1999', '$P$B7ZIRpJHAiW7A165fa8bipWYzlXsCp.', 'jirakit', '2022-07-10', 'InActive'),
(8, 'aaa', '$P$BB/bEaNbOjS9Vo9NnhHmTBItTFO7fu/', 'aaa', '2022-07-10 13:31:29', 'InActive'),
(9, '0123jt', '$P$B4NrEG/JRI93adrzqdpleKfJFsHJsN0', 'jirakit', '2022-07-10 13:33:00', 'InActive'),
(10, 'euler', '$P$BER5FkRLCt/xKd5naGzXuUPansuWff0', 'euler', '2022-07-10 13:39:06', 'InActive'),
(11, 'jirakit', '$P$BCNYOI74OYzquBkRpLhkgMGiiaDLNe.', 'jirakit', '2022-07-10 13:44:40', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));