-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220719.04fabfdc7e
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2022 at 08:12 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vis`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `id` int(20) NOT NULL,
  `loginid` int(20) NOT NULL,
  `phone` int(15) NOT NULL,
  `house_no` varchar(30) NOT NULL,
  `road_name` varchar(30) NOT NULL,
  `pincode` int(8) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(30) NOT NULL,
  `location` varchar(25) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`id`, `loginid`, `phone`, `house_no`, `road_name`, `pincode`, `city`, `state`, `location`, `latitude`, `longitude`, `status`) VALUES
(5, 13, 2147483647, 'Swargam', 'Kanjirappally', 686002, 'Kottayam', 'Kerala', 'kanjirappally', 9.5279005, 76.8222129, '1'),
(6, 16, 2147483647, 'Attamthadthil House', 'Kanjirappally', 686003, 'Kottayam', 'Kerala', 'kanjirappally', 9.9312328, 76.2673041, '1');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pro_id` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `d_status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `order_id`, `pro_id`, `rid`, `d_status`) VALUES
(1, 63, 20, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` int(25) NOT NULL,
  `staff_name` varchar(55) NOT NULL,
  `designation_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `staff_name`, `designation_name`) VALUES
(1, 'Soja', 'Designer Gown'),
(2, 'Mahima', 'Designer Kurti'),
(3, 'Rona', 'Stitiching Gown');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(20) NOT NULL,
  `firstname` varchar(35) NOT NULL,
  `middlename` varchar(35) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `dob` date NOT NULL,
  `contact` int(30) NOT NULL,
  `address` varchar(55) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `salary` int(25) NOT NULL,
  `username` varchar(30) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `firstname`, `middlename`, `lastname`, `dob`, `contact`, `address`, `designation`, `salary`, `username`, `avatar`) VALUES
(4, 'Deepu', 'Varghese', 'Joseph', '1993-03-06', 2147483647, 'Attamthadthil', '2', 0, 'Deepu', '1358305452.jpg'),
(5, 'Soja', 'S', 'Sony', '2000-03-20', 2147483647, 'Sojabhavan', 'Stitiching Staff', 0, 'Soja', '223677162.jpg'),
(6, 'Mahima', 'V', 'Manoj', '1992-06-09', 2147483647, 'mahimayam', 'Designer', 25000, 'Mahima', '1108147869.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(20) NOT NULL,
  `loginid` int(20) NOT NULL,
  `feedback` varchar(30) NOT NULL,
  `suggestions` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leaveadd`
--

CREATE TABLE `leaveadd` (
  `leave_id` int(20) NOT NULL,
  `loginid` int(11) NOT NULL,
  `leave_type` varchar(35) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `session` varchar(15) NOT NULL,
  `applied_on` date NOT NULL,
  `reason` varchar(55) NOT NULL,
  `is_approved` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaveadd`
--

INSERT INTO `leaveadd` (`leave_id`, `loginid`, `leave_type`, `start_date`, `end_date`, `session`, `applied_on`, `reason`, `is_approved`) VALUES
(10, 21, 'Sick Leave', '2022-07-13', '2022-07-14', 'Full Day', '2022-07-13', 'food poison', 'APPROVED'),
(11, 22, 'Casual Leave', '2022-07-22', '2022-07-23', 'Full Day', '2022-07-20', 'Personal', 'REJECTED'),
(12, 23, 'Casual Leave', '2022-07-20', '2022-07-21', 'AN', '2022-07-19', 'Personal', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `leave_type_id` int(30) DEFAULT NULL,
  `reason` text NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `type` tinyint(1) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=approved, 2=denied,3=cancelled',
  `approved_by` int(30) DEFAULT NULL,
  `leave_days` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `default_credit` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `loginid` int(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(10) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`loginid`, `username`, `password`, `usertype`, `status`) VALUES
(1, 'hello', 'sona@123', 'user', 0),
(5, 'maya', 'maya@', 'user', 0),
(6, 'greenk', 'greenkk', 'user', 0),
(7, 'greenk', '', 'user', 0),
(8, 'greenk', '', 'user', 0),
(9, 'greenk', '', 'user', 0),
(10, 'mahi', 'mahi', 'user', 0),
(11, 'yellow', 'yellow@', 'user', 0),
(12, 'abc', 'abc@', 'user', 0),
(13, 'Sona', 'Sona@123', 'user', 0),
(14, 'admin', 'admin@123', 'admin', 1),
(16, 'Teena', 'Teena@123', 'user', 0),
(17, 'Soja', 'Soja@123', 'staff', 0),
(18, 'Amala', 'Amala@123', 'user', 0),
(19, 'Vimal', 'Vimal@123', 'staff', 0),
(20, 'Sammon', 'Sam@123', 'staff', 0),
(21, 'Kebin', 'Kebin@123', 'staff', 0),
(22, 'Kesin', 'Kesin@123', 'seller', 0),
(23, 'Roshan', 'Roshan@123', 'seller', 0),
(24, 'Priya', 'Priya@123', 'user', 0);

-- --------------------------------------------------------

--
-- Table structure for table `measurement`
--

CREATE TABLE `measurement` (
  `measurement_id` int(11) NOT NULL,
  `Neck` int(5) NOT NULL,
  `sleevlength` int(20) NOT NULL,
  `armhole` int(20) NOT NULL,
  `shoulder` int(20) NOT NULL,
  `Hips` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`measurement_id`, `Neck`, `sleevlength`, `armhole`, `shoulder`, `Hips`) VALUES
(4, 32, 12, 34, 21, 34),
(6, 37, 12, 10, 12, 34),
(13, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0),
(19, 34, 12, 21, 22, 12),
(20, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0),
(27, 6, 0, 0, 8, 30),
(28, 7, 7, 6, 8, 25),
(29, 0, 0, 0, 0, 0),
(30, 5, 12, 8, 9, 34),
(31, 9, 15, 8, 7, 33),
(32, 7, 15, 9, 12, 34),
(33, 8, 12, 9, 17, 28),
(34, 5, 12, 8, 23, 25),
(35, 6, 12, 4, 12, 7);

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `order_id` int(20) NOT NULL,
  `loginid` int(20) NOT NULL,
  `pro_id` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `total_price` int(35) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`order_id`, `loginid`, `pro_id`, `qty`, `total_price`, `order_date`, `order_status`) VALUES
(63, 13, 20, 1, 800, '0000-00-00', 'Placed'),
(64, 13, 19, 2, 2400, '0000-00-00', 'placed');

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

CREATE TABLE `part` (
  `part_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`part_id`, `title`, `type`, `description`) VALUES
(72, 'Neck', 1, 'Place two fingers between the tape measure and the neck as the pictures show, and make sure you can move the tape easily.'),
(73, 'sleevlength', 2, 'The sleeve measurement should be taken from exactly the same point you used earlier for the \"Shoulder\" measurement.'),
(75, 'armhole', 1, 'Place the tape measure under your armpit and around the top of your arm.'),
(77, 'shoulder', 2, 'The sleeve measurement should be taken from exactly the same point you used earlier for the \"Shoulder\" measurement.'),
(82, 'Hips', 2, 'Hips have measure the details.');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `rid` int(100) NOT NULL,
  `loginid` int(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phonenumber` int(10) NOT NULL,
  `Designation` varchar(35) NOT NULL,
  `duty` varchar(35) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`rid`, `loginid`, `name`, `date_of_birth`, `address`, `email`, `phonenumber`, `Designation`, `duty`, `image`) VALUES
(9, 13, 'Sona', '1993-06-04', 'Sonabhavan', 'sruthyvarghese19@gmail.com', 2147483647, '', '', ''),
(20, 16, 'Teena', '1993-06-04', 'Teenabhavan', 'siljavijayan99@gmail.com', 2147483647, '', '', ''),
(21, 17, 'Soja', '1993-06-04', 'Sojabhavan', 'soja@gmail.com', 2147483647, 'Designer', 'Design gow', ''),
(22, 18, 'Amala', '1999-03-18', 'Amalamo', 'amala@gmail.com', 2147483647, '', '', ''),
(23, 19, 'Vimal Thomason', '1998-06-08', 'Swargam', 'vimal19@gmail.com', 2147483647, 'Designer', 'Design the wedding dress', ''),
(24, 20, 'Sam Babu', '1995-06-08', 'Snehaveedu', 'sam19@gmail.com', 2147483647, 'Stitiching Unit', 'Stitiching Gown', ''),
(25, 21, 'Kebin', '1997-04-23', 'Attam', 'kebin12@gmail.com', 2147483647, 'Designer', 'Design the wedding dress', ''),
(28, 23, 'Kesin', '1994-06-16', 'Attam', 'kesin23@gmail.com', 2147483647, 'Delivery', 'Delivery the kids product', ''),
(29, 23, 'Roshan', '1999-03-30', 'Attam', 'roshan@gmail.com', 2147483647, 'Delivery', 'Delivery for gown', 'testimonial1.jpg'),
(30, 24, 'Priya', '2008-07-28', 'Puthyaveedu', 'priya@gmail.com', 2147483647, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(20) NOT NULL,
  `loginid` int(20) NOT NULL,
  `description` varchar(55) NOT NULL,
  `date` date NOT NULL,
  `amount` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`salary_id`, `loginid`, `description`, `date`, `amount`) VALUES
(15, 19, 'Basic Salary', '2022-06-22', 50000),
(16, 17, 'Bonus', '2022-07-01', 15000),
(17, 19, 'Bonus', '2022-07-01', 10000),
(18, 17, 'Basic Salary', '2022-07-02', 15000),
(19, 22, 'Basic Salary', '2022-07-13', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(10) NOT NULL,
  `order_id` int(12) NOT NULL,
  `rid` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `order_id`, `rid`) VALUES
(7, 63, 17),
(8, 64, 21);

-- --------------------------------------------------------

--
-- Table structure for table `staff_salary`
--

CREATE TABLE `staff_salary` (
  `id` int(11) NOT NULL,
  `loginid` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stitiching_product`
--

CREATE TABLE `stitiching_product` (
  `id` int(10) NOT NULL,
  `loginid` int(20) NOT NULL,
  `pro_id` varchar(20) NOT NULL,
  `price` int(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stitiching_product`
--

INSERT INTO `stitiching_product` (`id`, `loginid`, `pro_id`, `price`, `quantity`, `image`, `status`) VALUES
(1, 13, '2', 200, 2, 'aline.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartid` int(30) NOT NULL,
  `loginid` int(30) NOT NULL,
  `pro_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` int(30) NOT NULL,
  `totalprice` int(30) NOT NULL,
  `status` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` varchar(225) NOT NULL,
  `image` varchar(225) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `category_name`, `description`, `image`, `status`) VALUES
(6, 'Kurti', 'Kurti is category of vismaya products.', '2102791595.jpg', 'active'),
(7, 'Gown', 'Gown is main category of vismaya.', '446719647.jpg', 'active'),
(8, 'Kids Section', 'Kids section is different types of category.', '142105410.jpg', 'active'),
(9, 'Blouse', 'strappy saree blouse design is going the compliment even the simplest of your saree', '1302939107.jpg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(20) NOT NULL,
  `loginid` int(20) NOT NULL,
  `pro_id` int(20) NOT NULL,
  `order_id` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `total_price` int(11) NOT NULL,
  `pstatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `loginid`, `pro_id`, `order_id`, `qty`, `total_price`, `pstatus`) VALUES
(42, 13, 0, 0, 0, 0, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `pro_id` int(20) NOT NULL,
  `loginid` int(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `pdesc` varchar(100) NOT NULL,
  `fabric` varchar(30) NOT NULL,
  `pattern` varchar(35) NOT NULL,
  `price` int(20) NOT NULL,
  `product_image` varchar(225) NOT NULL,
  `status` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`pro_id`, `loginid`, `category`, `product_name`, `pdesc`, `fabric`, `pattern`, `price`, `product_image`, `status`) VALUES
(18, 13, '', 'Floor Gown', 'Floor Gown is formal dress.', 'creap', 'neat gown', 1200, 'bias.jpg', 0),
(19, 13, '', 'Multicolor Kurti', 'Multicolour kurti is fashion world.', 'cotton', 'print kurti', 1200, 'color.jpg', 0),
(20, 13, '', 'Aline Kurti', 'Aline Kurti available in various shape,sizes.', 'creap', 'print kurti', 800, 'aline.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `tid` int(8) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`tid`, `title`) VALUES
(1, 'kurti'),
(2, 'Gown'),
(3, 'Kids'),
(4, 'Blouse'),
(5, 'Wedding Dress');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `leaveadd`
--
ALTER TABLE `leaveadd`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`loginid`);

--
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`measurement_id`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `part`
--
ALTER TABLE `part`
  ADD PRIMARY KEY (`part_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `schedule_ibfk_2` (`rid`);

--
-- Indexes for table `staff_salary`
--
ALTER TABLE `staff_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stitiching_product`
--
ALTER TABLE `stitiching_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartid`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`tid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `designation_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leaveadd`
--
ALTER TABLE `leaveadd`
  MODIFY `leave_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `loginid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `measurement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `order_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `part`
--
ALTER TABLE `part`
  MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `rid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff_salary`
--
ALTER TABLE `staff_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stitiching_product`
--
ALTER TABLE `stitiching_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `pro_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `tid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD CONSTRAINT `contact_details_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_tbl` (`order_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `leaveadd`
--
ALTER TABLE `leaveadd`
  ADD CONSTRAINT `leaveadd_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_tbl` (`order_id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD CONSTRAINT `tbl_payment_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);

--
-- Constraints for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD CONSTRAINT `tbl_products_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
