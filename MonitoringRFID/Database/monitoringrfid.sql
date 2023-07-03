-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 08:01 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoringrfid`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `firstname`, `middlename`, `lastname`) VALUES
(2, 'admin', 'admin', 'admin', '', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `coursecode` varchar(255) NOT NULL,
  `coursetitle` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`coursecode`, `coursetitle`, `day`, `starttime`, `endtime`) VALUES
('BIT1202L', 'Human Computer Interaction 1 Lab', 'Friday', '17:00:00', '18:30:00'),
('BIT1202', 'Human Computer Interaction 1 Lec', 'Tuesday, Thursday', '15:00:00', '17:00:00'),
('CCS1203L', 'Programming 2 (Lab)', 'Wednesday', '10:00:00', '13:00:00'),
('CCS1203', 'Programming 2 (Lec)', 'Wednesday', '15:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_no` varchar(100) NOT NULL,
  `student_idno` varchar(255) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `course` varchar(10) NOT NULL,
  `section` varchar(30) NOT NULL,
  `user_status` enum('IN','OUT') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'OUT',
  `time_spent` time(6) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_no`, `student_idno`, `firstname`, `middlename`, `lastname`, `course`, `section`, `user_status`, `time_spent`, `start_time`, `end_time`) VALUES
(1, '1', '22-0567-588', 'Alwyn', 'E', 'Abarquez', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(2, '2', '22-0476-610', 'Raijen', 'O', 'Arojado', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(3, '3', '22-1846-223', 'William Nickerson', 'G', 'Bataluna', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(4, '4', '20-0021-138', 'Reigne Gwyneth', 'A', 'Batonero', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(5, '5', '22-0738-346', 'Bien Carlek', 'Z', 'Belen', 'BS IT - GD', '1st - J1S', 'OUT', '00:00:18.000000', '03:15:27', '00:00:00'),
(6, '6', '22-0924-335', 'Lynard', 'S', 'Bergonia', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(7, '7', '22-0209-913', 'Andrei Luis', 'D.L', 'Bognot', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(8, '8', '22-0192-516', 'Christian Lloyd', 'S', 'Buday', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(9, '9', '22-0607-339', 'Benmar Justin', 'B', 'Cagnayo', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(10, '10', '19-1132-763', 'Zhedderic Ahlen', 'L', 'Cañeda', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(11, '11', '22-0499-219', 'Francelle Mae', 'S', 'Casubuan', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(12, '12', '22-0566-250', 'Ashton Myron', 'M', 'Cipriano', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(13, '13', '22-0408-332', 'Jhun Jerwin Jerico', 'M', 'Daygon', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(14, '14', '20-0487-257', 'Reneelyn', 'C', 'Dela Cruz', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(15, '15', '22-0459-588', 'Nicole Adrianne', '', 'Esmeralda', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(16, '16', '22-0893-854', 'Rizza Mae', 'E', 'Estoperes', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(17, '17', '20-0386-408', 'John Justin', 'R', 'Galido', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(18, '18', '22-2338-888', 'Ron Carlo', 'F', 'Gayap', 'BS IT', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(19, '19', '22-0511-876', 'Mark Anthony', 'M', 'Hernandez', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(20, '20', '22-0737-906', 'Raul Jr.', 'S', 'Higanto', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(21, '21', '22-2204-345', 'Vince Andrei', 'H', 'Ilan', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(22, '22', '22-1265-336', 'Ermil Vidge', 'I', 'Karamihan', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(23, '23', '22-1975-239', 'Tristan Kyle', 'D', 'Karamihan', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(24, '24', '22-1049-703', 'Ronard Jhiro', 'D', 'Leonardo', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(25, '25', '20-0527-150', 'Martin', 'B', 'Lobete', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(26, '26', '22-1976-581', 'John Carlo', 'R', 'Lugatiman', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(27, '27', '22-2383-402', 'Motley Abbey', 'M', 'Lumbad', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(28, '28', '22-1205-316', 'Lezly', 'B', 'Malagueño', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(29, '29', '22-0937-160', 'Ma. Kiana Jaye', 'N', 'Natividad', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(30, '30', '22-0891-773', 'Justin Aaron', 'C', 'Ocol', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(31, '31', '18-1150-566', 'Ian Kallel', 'N', 'Ocumen', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(32, '32', '22-0293-515', 'Nicole Catherine', 'M', 'Ong', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(33, '33', '22-2530-374', 'Franz Chester', 'A', 'Pabalan', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(34, '34', '16-3120-493', 'Jasper', '', 'Parojinog', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(35, '35', '22-0798-735', 'Ashanti', 'S', 'Plazo', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(36, '36', '18-0799-529', 'Reymark', 'N', 'Reyes', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(37, '37', '17-1864-557', 'Isaac Neil', 'M', 'Rodriguez', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(38, '38', '22-0204-560', 'Jhan Leobhen', 'L', 'Sanchez', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(39, '39', '22-0516-971', 'Marlhen Euge', 'E', 'Sanico', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(40, '40', '20-0887-495', 'Kenward', 'M', 'Santos', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(41, '41', '16-2805-304', 'John Eric', 'D.C', 'Serrano', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(42, '42', '20-0320-706', 'Ricky Kyle Dominic', 'O', 'Tan', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(43, '43', '22-0600-997', 'John Rey', 'B', 'Tomas', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(44, '44', '22-0681-721', 'Janmel', 'B', 'Villanueva', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(45, '45', '22-1313-220', 'Peter Miguel', 'E', 'Zulueta', 'BS IT - GD', '1st - J1S', 'OUT', NULL, NULL, '00:00:00'),
(46, '46', '22-2072-766', 'Mark Vincent', 'M', 'Aguado', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(47, '47', '19-0503-807', 'Andrea Nicole', 'T', 'Aguilar', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(48, '48', '14-1759-161', 'Angelo', 'B', 'Almendrala', 'BS IT', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(49, '49', '18-0282-159', 'Nico John', 'Y', 'Antonio', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(50, '50', '21-1860-622', 'Raymart Jomar', 'E', 'Arteza', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(51, '51', '22-1863-401', 'Niel Ain', 'D', 'Bato', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(52, '52', '22-2602-355', 'Keanna Aissen', 'L', 'Belmonte', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(53, '53', '19-0440-364', 'Kerby', 'U', 'Bongon', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(54, '54', '22-2519-768', 'Harlette Marie', 'L', 'Camigla', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(55, '55', '22-2129-246', 'Francis', 'O', 'Concepcion', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(56, '56', '22-1961-566', 'Ronin', 'A', 'Concepcion', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(57, '57', '16-3043-738', 'John Bill Lawrence', 'V', 'Daily', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(58, '58', '16-2041-346', 'Miguel Antonio', 'A', 'De Leon', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(59, '59', '22-2021-582', 'Christian Joseph', 'D', 'Dizon', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(60, '60', '17-1840-781', 'Ezra Eleazar', 'F', 'Duñgo', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(61, '61', '22-1691-264', 'Eric Michael', '', 'Engcoy', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(62, '62', '22-1508-550', 'Frank Aris', 'M', 'Ibañez', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(63, '63', '16-1840-641', 'Caissa', 'D', 'Londres', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(64, '64', '22-1437-976', 'Jillian Paul', 'P', 'Manuel', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(65, '65', '19-3113-409', 'Kevin Renz', 'A', 'Millar', 'BS IT', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(66, '66', '22-1727-247', 'David Nathaniel', 'U', 'Miranda', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(67, '67', '22-1472-403', 'Angela Nicole', 'G', 'Porteria', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(68, '68', '21-1395-281', 'Andrea Mikela', 'L', 'Pura', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(69, '69', '22-2354-378', 'David Bryan', 'A', 'San Andres', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(70, '70', '15-0489-250', 'Louise Anthonie', 'L', 'Solon', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(71, '71', '22-2070-341', 'Eon Gecko', 'M', 'Taleño', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(72, '72', '22-2541-117', 'John Carlo', 'E', 'Valendia', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(73, '73', '22-1838-901', 'Vixcen Erean Antonio', '', 'Ventura', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(74, '74', '19-0750-705', 'Jil Aesher', 'E', 'Villamala', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(75, '75', '19-2063-363', 'Luis Gabriel', 'B', 'Villaruel', 'BS IT - GD', '1st - J1T', 'OUT', NULL, NULL, '00:00:00'),
(76, '76', '22-0756-512', 'Jerome Loyd', 'M', 'Agustin', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(77, '77', '21-1866-699', 'Larie', 'B', 'Amimirog', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(78, '78', '22-0468-476', 'Kelvin Adam', '', 'Aninang', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(79, '79', '22-0361-974', 'Lance Kenneth', 'V', 'Barreno', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(80, '80', '22-0438-703', 'Nicole', 'B', 'Bermundo', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(81, '81', '22-0927-423', 'Angela', '', 'Cabanes', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(82, '82', '22-2238-475', 'Althea Claire', 'A', 'Caldona', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(83, '83', '22-2349-136', 'Johannah Richzen', 'F', 'Delos Santos', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(84, '84', '22-1008-351', 'Zynnon Kyle', 'B', 'Depoo', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(85, '85', '22-1091-649', 'Agatha Wendie', 'V', 'Floreta', 'BS COM SCI', '1st - J1A', 'IN', '00:00:12.000000', '08:27:10', '00:00:00'),
(86, '86', '22-0888-435', 'Al Jorome', 'A', 'Gonzaga', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(87, '87', '22-1771-756', 'Hiro Andrei', 'D', 'Imamura', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(88, '88', '22-0441-987', 'Michaela', 'S', 'Jornales', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(89, '89', '15-2153-995', 'Mark Edsen', 'M', 'Maulion', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(90, '90', '22-1028-614', 'Juancho Miguel', 'M', 'Ogues', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(91, '91', '20-0251-595', 'John Habacuc', 'G', 'Pavon', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(92, '92', '20-0461-159', 'Junell', 'E', 'Torres', 'BS COM SCI', '1st - J1A', 'OUT', NULL, NULL, '00:00:00'),
(93, '93', '21-1555-609', 'Florel Angelous', 'D.G', 'Acma', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(94, '94', '19-0211-670', 'Ellona Jean', 'N', 'Aguilar', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(95, '95', 'B0600083', 'Marc Aaron Noel', 'C', 'Almenanza', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(96, '96', '21-0180-340', 'Reniel', 'A', 'Ariado', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(97, '97', '20-0725-122', 'Symon Gabriel', 'M', 'Bautista', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(98, '98', '21-1589-254', 'Steven Kurt', 'H', 'Baydal', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(99, '99', '18-1516-561', 'Gabriel Nikolai', 'O', 'Boone', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(100, '100', '19-0468-408', 'Jeane Lois Grace', 'L', 'Cantorna', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(101, '101', '21-1019-185', 'Marcus Nethan', 'A', 'Cosico', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(102, '102', 'B0600119', 'Joshua Lance', 'F', 'Cristobal', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(103, '103', '19-1516-161', 'Justin Troy', 'P', 'Cualquiera', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(104, '104', '21-1461-330', 'Arman', 'A', 'De Los Santos', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(105, '105', 'B0600078', 'Niel Alexander', 'A', 'Decina', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(106, '106', '19-1431-956', 'Jenhar', 'E', 'Delos Reyes', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(107, '107', '19-0990-871', 'Mica Allana', 'P', 'Erispe', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(108, '108', '18-0994-395', 'Joshua', 'C', 'Espinosa', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(109, '109', '21-0364-297', 'Gabriel John', 'M', 'Gallano', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(110, '110', '15-1452-928', 'Gerard', 'D.M', 'Garcia', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(111, '111', '21-1455-641', 'Keithz Izzy', 'D', 'Joveres', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(112, '112', '19-1072-812', 'Jose Gabriel', 'B', 'Mejarito', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(113, '113', '21-1588-707', 'Ma. Rachelle', 'M', 'Mendez', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(114, '114', '21-1562-468', 'Michael', 'C', 'Miyake', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(115, '115', '19-1445-756', 'Fritz Lemuel', 'V', 'Namit', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(116, '116', '19-1936-805', 'Kevin', 'M', 'Patiño', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(117, '117', '19-0765-811', 'Ian Gabrielle', 'L', 'Remiter', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(118, '118', '18-0868-931', 'Mark Uriel', 'R', 'Romey', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(119, '119', '21-1202-659', 'Jimuel Ian', 'L', 'Salandanan', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(120, '120', '20-1819-345', 'Mykl Hector', 'A', 'Sanchez', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(121, '121', '21-1592-994', 'Genielyn Rose', 'L', 'Santos', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(122, '122', 'B0600157', 'Christian Daniel', 'A', 'Sarabia', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(123, '123', '21-1086-433', 'Josh Myrrden', 'T', 'Sarmiento', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(124, '124', '21-0772-575', 'John Emmanuel', 'M', 'Selisana', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(125, '125', '21-0876-807', 'Marc Raven', 'R', 'Singhid', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(126, '126', '19-0859-134', 'Carmelo', 'T', 'Vergara Jr.', 'BS IT', '2nd - J2S', 'OUT', NULL, NULL, '00:00:00'),
(127, '127', 'B1010004', 'Angelo Hiroki', '', 'Alburo', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(128, '128', '18-2082-749', 'Kurt Clarenz', 'M', 'Almarinez', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(129, '129', '15-0481-182', 'Miguel Timothy', 'A', 'Cabrera', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(130, '130', '13-1677-673', 'Jose Hiromi', 'J', 'Capacio', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(131, '131', '18-1939-102', 'Arielle Charlize', 'C', 'Castillo', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(132, '132', '21-1292-218', 'Brian Nickole', 'F', 'Dimaguila', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(133, '133', '15-0640-114', 'Paul Ruzel', 'H', 'Hernandez', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(134, '134', '21-1748-869', 'Jerico Joy', 'C', 'Ignacio', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(135, '135', '18-2719-218', 'Gabriel Nathan', 'Q', 'Igsoc', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(136, '136', '16-2891-467', 'Marcus Jasper', 'C', 'Jana', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(137, '137', '19-2137-987', 'Gabriel Frost', 'P', 'Jandoquele', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(138, '138', '19-0548-182', 'Kristina Yesha', 'M', 'Jao', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(139, '139', '19-0151-848', 'Lorenz April', 'R', 'Lagrimas', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(140, '140', '19-1730-777', 'Junella Agatha', 'B', 'Magalong', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(141, '141', '20-1263-829', 'Jonas Reeve', 'M', 'Mindoro', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(142, '142', '20-1705-485', 'James Dean', 'B', 'Molina', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(143, '143', '21-1475-495', 'Jian Hritian', 'R', 'Pabatao', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(144, '144', '17-0784-392', 'Iceine Louie', 'T', 'Palopalo', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(145, '145', '22-2005-132', 'Floyd Michael', 'C', 'Pambid', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(146, '146', '21-1285-826', 'Phillip Janhier', 'M', 'Parot', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(147, '147', '18-2522-150', 'Geon Miguel', 'S', 'Peñaranda', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(148, '148', '18-1051-616', 'Shamgar', 'N', 'Ponce Ii', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(149, '149', '18-2936-722', 'Justine Benedict', 'D', 'Rabot', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(150, '150', '21-1010-528', 'Carlos Miguel', 'F', 'Reopirio', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(151, '151', '19-0504-679', 'Joshua Nicos', 'A', 'Reyes', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(152, '152', '21-1709-298', 'Kester Robin', 'B', 'Sanoy', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(153, '153', '14-1383-847', 'John Fitz Gerald', 'P', 'Santiago', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(154, '154', '18-0223-836', 'Elvin Ross', 'B', 'Santos', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(155, '155', '19-1767-519', 'Krizia Carisse', 'M', 'Santos', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(156, '156', '20-1616-225', 'Keiji', 'M', 'Suzuki', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(157, '157', '21-0912-504', 'Kurt Luis', 'A', 'Tabaranza', 'BS COM SCI', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(158, '158', '18-1437-276', 'Kian Bunjert', 'A', 'Trinidad', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(159, '159', '21-1253-342', 'Emmanuel', '', 'Viernes', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(160, '160', '21-1372-869', 'Bon', 'M', 'Yap', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(161, '161', '21-0774-565', 'Jose Edgar', 'D', 'Zavalla', 'BS IT', '2nd - J2T/J2A', 'OUT', NULL, NULL, '00:00:00'),
(162, '162', '20-0651-647', 'Vincent Alexis', '', 'Ablaza', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(163, '163', '20-0506-319', 'Dreischelle', 'G', 'Amoranto', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(164, '164', '19-3006-876', 'Jann Mitchael', 'F', 'Angeles', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(165, '165', '18-1193-461', 'Lorenzo Gabriel', 'C', 'Arguelles', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(166, '166', '18-0715-332', 'Denn Ezekiel', 'B', 'Carandang', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(167, '167', '20-1476-726', 'Sean Johnley', 'M', 'Caranza', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(168, '168', '18-1258-183', 'Sheena', 'I', 'Codera', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(169, '169', '18-0963-899', 'Jamielyn', 'A', 'Coronado', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(170, '170', '18-0951-522', 'Joshua Russel', 'S', 'De Jesus', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(171, '171', '16-3573-863', 'Kenneth', 'A', 'De Leon', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(172, '172', '18-1911-814', 'Carla', 'T', 'Diaz', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(173, '173', '18-0429-692', 'Ralph Raymond', 'V', 'Dilag', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(174, '174', '16-2311-955', 'Elton', 'M', 'Elegino', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(175, '175', '22-1836-356', 'Carl Johnlerr', 'P', 'Forgalidad', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(176, '176', '21-0390-354', 'Joseph John', 'T', 'Francisco', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(177, '177', '20-1430-229', 'Kenuard Percival', 'M', 'Gabutero', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(178, '178', '20-0550-753', 'Jo', 'L', 'Galapon', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(179, '179', '20-0674-378', 'Yzzyl Jay', 'B', 'Gangawan', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(180, '180', '16-3433-326', 'Mick Andrei', 'A', 'Garcia', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(181, '181', '16-2891-467', 'Marcus Jasper', 'C', 'Jana', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(182, '182', '20-1498-831', 'Karolynne', 'M', 'Lacida', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(183, '183', '18-0269-938', 'Kate Honey Rose', 'B', 'Manalo', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(184, '184', '17-1894-489', 'Kevin John', 'S', 'Martinez', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(185, '185', '18-0926-125', 'Angelo', 'B', 'Munsod', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(186, '186', '19-2326-424', 'Nessa', 'M', 'Oliveros', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(187, '187', '18-2665-451', 'Keneth', 'D', 'Olvido', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(188, '188', '18-0132-794', 'Jose', 'D.L', 'Pangilinan', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(189, '189', '20-1660-101', 'Marc Donn', 'P', 'Patacsil', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(190, '190', '17-1926-249', 'Mike Justin', 'C', 'Pili', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(191, '191', '18-2073-208', 'Bryan Russel', 'D.R', 'Rioflorido', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(192, '192', '18-0969-974', 'Dyno', 'C', 'Rivera', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(193, '193', '18-0670-238', 'Aldrin Christian', 'C', 'Saporna', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(194, '194', '20-1734-531', 'Gabriel Adrian', 'N', 'Sillano', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(195, '195', '18-1643-966', 'Mark Justine', 'M', 'Taran', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(196, '196', '20-0774-832', 'Marc Edward', 'L', 'Velez', 'BS IT', '3rd - J3S', 'OUT', NULL, NULL, '00:00:00'),
(197, '197', '18-1604-996', 'Luigi', 'Q', 'Apilan', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(198, '198', '20-1796-882', 'Christine', 'C', 'Bartolome', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(199, '199', '20-0806-769', 'Clarence', 'P', 'Beltran', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(200, '200', '20-1797-979', 'Jannica Dara', 'M', 'Capuno', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(201, '201', '20-1529-248', 'John Patrick', 'D', 'Capusi', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(202, '202', '16-1762-355', 'Kirk Darren', 'M', 'Dia', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(203, '203', '18-1618-514', 'Jerome', 'P', 'Evangelista', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(204, '204', '15-2556-425', 'Rojeth Justine', 'R', 'Javaluyas', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(205, '205', '20-1528-367', 'Ralf Ervin', 'D.G', 'Obañana', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(206, '206', '19-1842-362', 'Darrell Dee', 'F', 'Polestico', 'BS COM SCI', '3rd - J3A', 'OUT', NULL, NULL, '00:00:00'),
(207, '0011783960', '19-0799-324', 'Archelle Marc', 'P', 'Agdon', 'BS COM SCI', '4th - J4A', 'OUT', '00:00:23.000000', '03:15:13', '00:00:00'),
(208, '0012141903', '17-1158-784', 'Kim Adrian', 'A', 'Belandres', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(209, '209', '19-1633-217', 'Jason Lawrence', 'M', 'Flores', 'BS COM SCI', '4th - J4A', 'IN', '00:00:26.000000', '09:23:09', '00:00:00'),
(210, '210', '18-3140-991', 'Francis', 'D.R', 'Hernandez', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(211, '211', '19-2275-671', 'Michael Andro', 'A', 'Macanang', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(212, '212', '19-2040-785', 'Jhzz Mytch', 'S', 'Malig', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(213, '213', '15-2153-995', 'Mark Edsen', 'M', 'Maulion', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(214, '0002841003', '19-3092-356', 'Darenz', 'M', 'Orias', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(215, '0012917789', '19-2713-709', 'Kyle Franchesca Mae', '', 'Perez', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(216, '0002856551', '21-0759-781', 'Tylor', 'P', 'Reyes', 'BS COM SCI', '4th - J4A', 'OUT', '00:00:29.000000', '22:26:05', '00:00:00'),
(217, '217', '17-1907-812', 'Anthony Lester', 'L', 'Tirado', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(218, '218', '18-1335-813', 'Monina Vera Anne', 'P', 'Viardo', 'BS COM SCI', '4th - J4A', 'OUT', NULL, NULL, '00:00:00'),
(219, '219', '19-0952-990', 'Jian Paul', 'M', 'Advincula', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(220, '220', '17-1399-214', 'Regandiy', 'B', 'Alatiit', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(221, '221', '17-1461-713', 'Mark Louie', 'G', 'Alemania', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(222, '222', '17-0973-282', 'Christian Luis', 'A', 'Almazora', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(223, '223', '16-1537-800', 'Christian Jerome', 'C', 'Almendral', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(224, '224', '17-2503-201', 'Adam Carlo', 'M', 'Atienza', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(225, '225', '19-0798-592', 'Mariane', 'R', 'Balaba', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(226, '226', '17-0858-512', 'Gilbert Jay', 'Y', 'Belarmino', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(227, '227', '19-2159-251', 'Ma. Regicel Joy', 'M', 'Bermudez', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(228, '228', '19-2093-647', 'Mark Stephen', 'D.R', 'Bernardo', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(229, '229', '20-1520-611', 'Ezekiel', 'G', 'Birung', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(230, '230', '19-1997-271', 'Robert Christian', 'N', 'Bronioza', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(231, '231', '17-1467-392', 'Keena Andrel', 'A', 'Cabantog', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(232, '232', '19-0925-425', 'Patrick', 'G', 'Caparas', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(233, '233', '16-2428-696', 'Mikaela Marie', 'M', 'Caringal', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(234, '234', '19-2762-887', 'Guoliang', '', 'Cui', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(235, '235', '17-0863-343', 'Bryanna Sophia', 'C', 'Cunanan', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(236, '236', '17-1601-949', 'Rochelle', 'C', 'Cunanan', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(237, '237', '17-0516-478', 'Gabriel Dominic', 'M', 'Danila', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(238, '238', '17-1987-358', 'Randel', 'M', 'Dimaranan', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(239, '239', '17-0198-356', 'Aejay', 'S', 'Ferolino', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(240, '240', '19-1244-310', 'John Martin', 'G', 'Franco', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(241, '241', '16-1527-596', 'Jedder', 'M', 'Galdonez', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(242, '242', '17-2031-967', 'Daniel Joshua', 'I', 'Galicia', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(243, '243', '17-0844-922', 'Jurella Denice', '', 'Garcia', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(244, '244', '17-0019-534', 'Nicole', 'P', 'Gonzaga', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(245, '245', '19-2965-520', 'Brian', 'T', 'Jamilla', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(246, '246', '19-2132-460', 'Onyx Raleigh', 'C', 'Jomento', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(247, '247', '19-1109-441', 'Justin Troy', 'C', 'Jopia', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(248, '248', '17-0222-542', 'Squall Yranah Aeris', 'L', 'Lavarrete', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(249, '249', '17-0587-931', 'Cris Ken', 'M', 'Liquido', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(250, '250', '20-1526-166', 'Patricia Marie', 'P', 'Lopez', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(251, '251', '19-2200-733', 'Archie', 'M', 'Medallada', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(252, '252', '17-1357-244', 'Joan Joyce', 'R', 'Mercado', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(253, '253', '19-2257-357', 'Patrick', 'M', 'Mirasol', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(254, '254', '17-0273-937', 'Chrizza Mei', 'A', 'Nero', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(255, '255', '14-1985-757', 'Reymond', 'C', 'Pernia', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(256, '256', '19-1159-192', 'Jantzen Aaron', 'E', 'Pinos', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(257, '257', '18-3116-534', 'Dean Kendric', 'C', 'Reyes', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(258, '258', '14-1383-847', 'John Fitz Gerald', 'P', 'Santiago', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(259, '259', '16-2345-961', 'Ralph Aldwin', 'S', 'Serojales', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(260, '260', '19-1019-556', 'Veronica Elsbeth', 'Q', 'Velarde', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(261, '261', '17-2730-622', 'Adrian Paul', '', 'Viernes', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(262, '262', '17-2178-662', 'Ian Miguel', 'L', 'Villanueva', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00'),
(263, '263', '17-0629-924', 'Raymond Ii', 'O', 'Villegas', 'BS IT', '4th - J4S', 'OUT', NULL, NULL, '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `time_id` int(11) NOT NULL,
  `student_no` int(6) NOT NULL,
  `student_idno` varchar(255) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `startstime` time NOT NULL,
  `endstime` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`time_id`, `student_no`, `student_idno`, `student_name`, `startstime`, `endstime`, `date`) VALUES
(504, 11783960, '19-0799-324', 'Agdon Archelle Marc', '20:15:13', '20:15:36', '2023-05-06'),
(505, 5, '22-0738-346', 'Belen Bien Carlek', '20:15:27', '20:15:45', '2023-05-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_no` (`student_no`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`time_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
