-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2022 at 01:48 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ID` bigint(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`ID`, `FirstName`, `LastName`, `Email`, `Message`) VALUES
(5, 'priya', 'patel', 'priya@gmail.com', 'yfgq3rbgtyergh'),
(6, 'dharti', 'parmar', 'd@gmail.com', 'ytgfbhejsbgjrWUFHU'),
(7, 'g', 'k', 'gk@gmail.com', 'jeshfvhejrgbvjfhegbervjef');

-- --------------------------------------------------------

--
-- Table structure for table `event_booking`
--

CREATE TABLE `event_booking` (
  `BookingId` bigint(10) NOT NULL,
  `EventId` bigint(10) NOT NULL,
  `User_id` bigint(10) NOT NULL,
  `Date` date NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Event_date` date NOT NULL,
  `NoOfGuest` varchar(50) NOT NULL,
  `EventTime` time NOT NULL,
  `Package` bigint(10) NOT NULL,
  `Amount` double NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Status` enum('Rejected','Cancelled','Paid','Booked','CheckedOut') NOT NULL DEFAULT 'Booked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_booking`
--

INSERT INTO `event_booking` (`BookingId`, `EventId`, `User_id`, `Date`, `Modified_date`, `Event_date`, `NoOfGuest`, `EventTime`, `Package`, `Amount`, `Email`, `Phone_number`, `Status`) VALUES
(12, 18, 2, '2021-10-12', '2021-10-12 15:04:50', '2021-10-14', '200-250', '09:00:00', 8, 16000, 'priya@gmail.com', 8574526352, 'Rejected'),
(13, 22, 2, '2021-08-04', '2021-08-06 15:06:29', '2021-08-14', '250-300', '09:30:00', 8, 9600, 'Priya@gmail.com', 8574859652, 'CheckedOut'),
(14, 19, 16, '2021-10-12', '2021-10-12 15:11:32', '2021-12-09', '100-200', '09:00:00', 8, 16000, 'harsh@gmail.com', 8563526352, 'Paid'),
(15, 20, 16, '2021-10-12', '2021-10-12 15:12:02', '2021-11-20', '200-250', '10:00:00', 4, 8000, 'harsh@gmail.com', 7545859652, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `event_list`
--

CREATE TABLE `event_list` (
  `EventId` bigint(10) NOT NULL,
  `EventTypeId` bigint(10) NOT NULL,
  `HallNumber` bigint(10) NOT NULL,
  `Status` enum('active','in-active') NOT NULL,
  `Booking_status` enum('Booked','Available') NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_list`
--

INSERT INTO `event_list` (`EventId`, `EventTypeId`, `HallNumber`, `Status`, `Booking_status`) VALUES
(18, 11, 1, 'active', 'Available'),
(19, 11, 2, 'active', 'Booked'),
(20, 11, 3, 'active', 'Booked'),
(21, 11, 4, 'active', 'Available'),
(22, 12, 5, 'active', 'Available'),
(23, 12, 6, 'active', 'Available'),
(24, 11, 7, 'active', 'Available'),
(25, 12, 8, 'active', 'Available'),
(26, 11, 9, 'active', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `event_payment`
--

CREATE TABLE `event_payment` (
  `PaymentId` bigint(10) NOT NULL,
  `BookingId` bigint(10) NOT NULL,
  `PaymentType` enum('Cash','Net Banking','Credit Card','Debit Card') NOT NULL,
  `PaymentDate` date NOT NULL DEFAULT current_timestamp(),
  `Amount` int(50) NOT NULL,
  `Status` enum('Paid') NOT NULL DEFAULT 'Paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_payment`
--

INSERT INTO `event_payment` (`PaymentId`, `BookingId`, `PaymentType`, `PaymentDate`, `Amount`, `Status`) VALUES
(1, 13, 'Cash', '2021-08-13', 9600, 'Paid'),
(2, 15, 'Net Banking', '2021-10-12', 8000, 'Paid'),
(3, 14, 'Debit Card', '2021-10-12', 16000, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `EventTypeId` bigint(10) NOT NULL,
  `EventType` varchar(15) NOT NULL,
  `EventImage` text NOT NULL,
  `Description` text NOT NULL,
  `Cost` double NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`EventTypeId`, `EventType`, `EventImage`, `Description`, `Cost`, `Status`) VALUES
(11, 'Wedding Hall', 'wedding.jpg', 'This hall is a space offered mainly for weddings, birthdays, bridal showers and other personal events. They could be separate or part of a hotel or restaurant.', 2000, 'active'),
(12, 'Meeting Hall', 'meeting.jpeg', 'The Killi, Kaveri and Tanjore meeting rooms are the perfect combination of space and ideal ambiance with state of the art amenities and audio visual equipments', 1200, 'active'),
(13, 'Conference Hall', 'accomadation.jpg', 'Ten distinct dining destinations featuring Indian & international cuisine along with some of the .....', 1700, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `ID` bigint(10) NOT NULL,
  `Name` text NOT NULL,
  `Address_line1` text NOT NULL,
  `Address_line2` text NOT NULL,
  `City` varchar(10) NOT NULL,
  `State` varchar(10) NOT NULL,
  `Country` varchar(10) NOT NULL,
  `Zip_code` bigint(10) NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`ID`, `Name`, `Address_line1`, `Address_line2`, `City`, `State`, `Country`, `Zip_code`, `Email`, `Phone_number`, `Description`) VALUES
(1, 'Blue diamond Hotel', ' Address:63', 'kalawad road ', 'rajkot', 'gujrat', 'India', 360001, 'bluediamond@gmail.com', 7041065488, ' Whether you book a hotel online, on the phone, or through a travel agent, it should be a simple process.                  It should be easy to contact a knowledgeable, helpful person');

-- --------------------------------------------------------

--
-- Table structure for table `room_booking`
--

CREATE TABLE `room_booking` (
  `BookingId` bigint(10) NOT NULL,
  `RoomId` bigint(10) NOT NULL,
  `User_id` bigint(10) NOT NULL,
  `Date` date NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `CheckIn` date NOT NULL,
  `CheckOut` date NOT NULL,
  `NoOfGuest` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Status` enum('Rejected','Cancelled','Paid','Booked','CheckedOut') NOT NULL DEFAULT 'Booked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_booking`
--

INSERT INTO `room_booking` (`BookingId`, `RoomId`, `User_id`, `Date`, `Modified_date`, `CheckIn`, `CheckOut`, `NoOfGuest`, `Amount`, `Email`, `Phone_number`, `Status`) VALUES
(36, 31, 2, '2022-08-16', '2022-08-16 07:46:40', '2022-08-16', '2022-08-30', '3', 49000, 'Priya@gmail.com', 9579625775, 'Paid'),
(37, 14, 2, '2022-08-22', '2022-08-22 10:11:56', '2022-08-22', '2022-08-24', '1', 2400, 'abc@gmail.com', 7589645564, 'Paid'),
(38, 21, 16, '2022-09-02', '2022-09-02 03:44:00', '2022-09-02', '2022-09-12', '2', 20000, 'abc@gmail.com', 7041065488, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `room_list`
--

CREATE TABLE `room_list` (
  `RoomId` bigint(10) NOT NULL,
  `RoomTypeId` bigint(10) NOT NULL,
  `RoomNumber` bigint(10) NOT NULL,
  `Status` enum('active','in-active') NOT NULL,
  `Booking_status` enum('Booked','Available') NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_list`
--

INSERT INTO `room_list` (`RoomId`, `RoomTypeId`, `RoomNumber`, `Status`, `Booking_status`) VALUES
(14, 11, 2, 'active', 'Booked'),
(15, 11, 3, 'active', 'Available'),
(16, 12, 4, 'active', 'Booked'),
(17, 11, 5, 'active', 'Available'),
(18, 12, 6, 'active', 'Booked'),
(19, 12, 7, 'active', 'Available'),
(20, 13, 8, 'active', 'Booked'),
(21, 13, 9, 'active', 'Booked'),
(22, 14, 10, 'active', 'Booked'),
(23, 14, 11, 'active', 'Available'),
(24, 14, 12, 'active', 'Available'),
(25, 15, 13, 'active', 'Available'),
(26, 15, 14, 'active', 'Available'),
(27, 16, 15, 'active', 'Available'),
(28, 18, 16, 'active', 'Booked'),
(29, 17, 17, 'active', 'Booked'),
(30, 16, 18, 'active', 'Available'),
(31, 17, 19, 'active', 'Booked'),
(32, 15, 20, 'active', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `room_payment`
--

CREATE TABLE `room_payment` (
  `PaymentId` bigint(10) NOT NULL,
  `BookingId` bigint(10) NOT NULL,
  `PaymentType` enum('Cash','Net Banking','Credit Card','Debit Card') NOT NULL,
  `PaymentDate` date NOT NULL DEFAULT current_timestamp(),
  `Amount` int(50) NOT NULL,
  `Status` enum('Paid') NOT NULL DEFAULT 'Paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_payment`
--

INSERT INTO `room_payment` (`PaymentId`, `BookingId`, `PaymentType`, `PaymentDate`, `Amount`, `Status`) VALUES
(7, 37, 'Net Banking', '2022-08-22', 2400, 'Paid'),
(8, 38, 'Net Banking', '2022-09-02', 20000, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `RoomTypeId` bigint(10) NOT NULL,
  `RoomType` varchar(30) NOT NULL,
  `RoomImage` text NOT NULL,
  `Description` text NOT NULL,
  `Cost` double NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`RoomTypeId`, `RoomType`, `RoomImage`, `Description`, `Cost`, `Status`) VALUES
(11, 'Family Room', 'away.jpg', '32 Inch flat screen TV, Kitchen facilities,Towels,Dining tables', 1200, 'active'),
(12, 'Bachelor Room', 'F.jpg', 'Soap & bath amenities,Mini-bar, Telephone', 1800, 'active'),
(13, 'Presidential Suites', 'A.jpg', 'Closet with hangers, HD flat-screen TV, Telephone', 2000, 'active'),
(14, 'Classic Room', 'accomadation.jpg', 'Closet with hangers, HD flat-screen TV, Telephone\r\n\r\n', 1750, 'active'),
(15, 'Club Room ', 'A.jpg', ' Closet with hangers, 24 Hour room service,Computer and Internet access', 1680, 'active'),
(16, 'Deluxe Room', 'classic.jpg', 'Closet with hangers, HD flat-screen TV, Telephone', 1900, 'active'),
(17, 'Super Deluxe ', 'club.jpg', '32 Inch flat screen TV, HD flat-screen TV,Mini-bar, Telephone', 3500, 'active'),
(18, 'Luxury', 'super.jpg', 'Closet with hangers,32 Inch flat screen TV,Mini-bar, Telephone', 3500, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `UserId` bigint(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Password` varchar(64) NOT NULL,
  `ContactNo` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `ProfileImage` text NOT NULL DEFAULT 'user.png',
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_details`
--

INSERT INTO `users_details` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `ContactNo`, `Gender`, `ProfileImage`, `Status`) VALUES
(2, 'admin', '', 'admin@gmail.com', '123', '123456789', 'female', '1.jpg', 'in-active'),
(16, 'priya', 'chaklasiya', 'priya@gmail.com', '1234', '9879879877', 'male', 't1.jfif', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD PRIMARY KEY (`BookingId`),
  ADD KEY `FK_User` (`User_id`),
  ADD KEY `FK_RoomBooking` (`EventId`);

--
-- Indexes for table `event_list`
--
ALTER TABLE `event_list`
  ADD PRIMARY KEY (`EventId`),
  ADD KEY `FK_EventType` (`EventTypeId`);

--
-- Indexes for table `event_payment`
--
ALTER TABLE `event_payment`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `Fk_Booking` (`BookingId`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`EventTypeId`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD PRIMARY KEY (`BookingId`),
  ADD KEY `FK_User` (`User_id`),
  ADD KEY `FK_RoomBooking` (`RoomId`);

--
-- Indexes for table `room_list`
--
ALTER TABLE `room_list`
  ADD PRIMARY KEY (`RoomId`),
  ADD KEY `FK_RoomType` (`RoomTypeId`);

--
-- Indexes for table `room_payment`
--
ALTER TABLE `room_payment`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `Fk_Booking` (`BookingId`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`RoomTypeId`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event_booking`
--
ALTER TABLE `event_booking`
  MODIFY `BookingId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `event_list`
--
ALTER TABLE `event_list`
  MODIFY `EventId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `event_payment`
--
ALTER TABLE `event_payment`
  MODIFY `PaymentId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `EventTypeId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_booking`
--
ALTER TABLE `room_booking`
  MODIFY `BookingId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `room_list`
--
ALTER TABLE `room_list`
  MODIFY `RoomId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `room_payment`
--
ALTER TABLE `room_payment`
  MODIFY `PaymentId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `RoomTypeId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `UserId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD CONSTRAINT `FK_EventBooking` FOREIGN KEY (`EventId`) REFERENCES `event_list` (`EventId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_UserBooking` FOREIGN KEY (`User_id`) REFERENCES `users_details` (`UserId`) ON UPDATE CASCADE;

--
-- Constraints for table `event_list`
--
ALTER TABLE `event_list`
  ADD CONSTRAINT `FK_EventType` FOREIGN KEY (`EventTypeId`) REFERENCES `event_type` (`EventTypeId`) ON UPDATE CASCADE;

--
-- Constraints for table `event_payment`
--
ALTER TABLE `event_payment`
  ADD CONSTRAINT `FK_EventPayment` FOREIGN KEY (`BookingId`) REFERENCES `event_booking` (`BookingId`) ON UPDATE CASCADE;

--
-- Constraints for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD CONSTRAINT `FK_RoomBooking` FOREIGN KEY (`RoomId`) REFERENCES `room_list` (`RoomId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`User_id`) REFERENCES `users_details` (`UserId`) ON UPDATE CASCADE;

--
-- Constraints for table `room_list`
--
ALTER TABLE `room_list`
  ADD CONSTRAINT `FK_RoomType` FOREIGN KEY (`RoomTypeId`) REFERENCES `room_type` (`RoomTypeId`) ON UPDATE CASCADE;

--
-- Constraints for table `room_payment`
--
ALTER TABLE `room_payment`
  ADD CONSTRAINT `Fk_Booking` FOREIGN KEY (`BookingId`) REFERENCES `room_booking` (`BookingId`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
