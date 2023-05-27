-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 27 Μάη 2023 στις 14:27:00
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `roadrunner`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `bookings`
--

CREATE TABLE `bookings` (
  `BOOKING_ID` int(11) NOT NULL,
  `SCHEDULE_ID` varchar(11) NOT NULL,
  `NAME` varchar(11) NOT NULL,
  `SURNAME` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `schedule`
--

CREATE TABLE `schedule` (
  `SCHEDULE_ID` varchar(10) NOT NULL,
  `FROM_CITY` varchar(15) NOT NULL,
  `TO_CITY` varchar(15) NOT NULL,
  `DATE_T` datetime DEFAULT NULL,
  `SEATS_AVAIL` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `schedule`
--

INSERT INTO `schedule` (`SCHEDULE_ID`, `FROM_CITY`, `TO_CITY`, `DATE_T`, `SEATS_AVAIL`, `PRICE`) VALUES
('AA101', 'Athens', 'Arta', '2023-06-01 09:00:00', 20, 20),
('AA102', 'Athens', 'Arta', '2023-06-02 12:30:00', 30, 20),
('AP101', 'Athens', 'Patra', '2023-06-01 10:00:00', 50, 10),
('AP102', 'Athens', 'Patra', '2023-06-09 11:00:00', 50, 10),
('AT101', 'Athens', 'Thessaloniki', '2023-06-01 10:00:00', 50, 40),
('AT102', 'Athens', 'Thessaloniki', '2023-05-25 09:00:00', 50, 40),
('AT103', 'Athens', 'Thessaloniki', '2023-05-25 09:30:00', 50, 40),
('AT104', 'Athens', 'Thessaloniki', '2023-05-13 10:00:00', 50, 40),
('AV101', 'Athens', 'Volos', '2023-05-20 10:00:00', 40, 30),
('AV102', 'Athens', 'Volos', '2023-05-22 11:00:00', 35, 30),
('PA101', 'Patra', 'Athens', '2023-05-24 07:00:00', 50, 10),
('PA102', 'Patra', 'Athens', '2023-05-16 12:00:00', 50, 10),
('PAR101', 'Patra', 'Arta', '2023-05-17 16:00:00', 30, 10),
('PAR102', 'Patra', 'Arta', '2023-05-17 09:00:00', 30, 10),
('PT101', 'Patra', 'Thessaloniki', '2023-05-31 06:00:00', 40, 30),
('PT102', 'Patra', 'Thessaloniki', '2023-05-31 10:30:00', 40, 30),
('TA101', 'Thessaloniki', 'Athens', '2023-06-01 09:00:00', 50, 40),
('TA102', 'Thessaloniki', 'Athens', '2023-06-01 10:00:00', 50, 40),
('TA103', 'Thessaloniki', 'Athens', '2023-06-02 09:30:00', 50, 40),
('TA104', 'Thessaloniki', 'Athens', '2023-06-02 16:00:00', 50, 40),
('TP101', 'Thessaloniki', 'Patra', '2023-05-18 17:00:00', 30, 30),
('TP102', 'Thessaloniki', 'Patra', '2023-05-26 09:00:00', 30, 30),
('TV101', 'Thessaloniki', 'Volos', '2023-05-22 10:00:00', 20, 10),
('TV102', 'Thessaloniki', 'Volos', '2023-05-25 09:00:00', 20, 10),
('VA101', 'Volos', 'Athens', '2023-05-12 12:00:00', 20, 30),
('VA102', 'Volos', 'Athens', '2023-05-24 09:00:00', 20, 30),
('VT101', 'Volos', 'Thessaloniki', '2023-05-21 10:00:00', 20, 10),
('VT102', 'Volos', 'Thessaloniki', '2023-05-28 08:00:00', 20, 10);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user_emails`
--

CREATE TABLE `user_emails` (
  `id` int(11) NOT NULL,
  `schedule_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `user_emails`
--

INSERT INTO `user_emails` (`id`, `schedule_id`, `first_name`, `last_name`, `email`, `created_at`) VALUES
(1, 'AT102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:34:23'),
(2, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:38:40'),
(3, 'AT101', 'Christina', 'Achilleopoulou', '', '2023-05-24 16:39:45'),
(4, 'AT101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:39:48'),
(5, 'AT102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:40:38'),
(6, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:42:27'),
(7, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:45:42'),
(8, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:46:20'),
(9, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:47:29'),
(10, 'AT101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:49:50'),
(11, 'AT102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:51:32'),
(12, 'AP101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 16:52:23'),
(13, 'TP102', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 16:53:35'),
(14, 'AT101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:54:14'),
(15, 'AA102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:54:20'),
(16, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 16:57:31'),
(17, 'AT101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:01:04'),
(18, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:04:50'),
(19, 'AP101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 17:08:07'),
(20, 'AT102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:09:17'),
(21, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:12:00'),
(22, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:13:33'),
(23, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:14:42'),
(24, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:19:20'),
(25, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:20:10'),
(26, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:23:18'),
(27, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:25:31'),
(28, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:26:58'),
(29, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:28:16'),
(30, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:30:26'),
(31, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:31:18'),
(32, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:32:21'),
(33, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:33:05'),
(34, 'AP101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 17:33:54'),
(35, 'AA102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:35:12'),
(36, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:35:54'),
(37, 'TP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:36:30'),
(38, 'AP101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 17:36:56'),
(39, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:38:55'),
(40, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:41:09'),
(41, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:43:05'),
(42, 'TA101', 'Christina', 'Maria', 'cachilleopoulou@gmail.com', '2023-05-24 17:44:27'),
(43, 'AA101', 'Christina', 'Maria', 'cachilleopoulou@gmail.com', '2023-05-24 17:46:21'),
(44, 'TA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:48:58'),
(45, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 17:49:43'),
(46, 'AP102', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 17:59:33'),
(47, 'AT101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:00:38'),
(48, 'AA101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 18:01:25'),
(49, 'AP101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 18:03:09'),
(50, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:04:13'),
(51, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:11:31'),
(52, 'AP101', 'Christina', 'Maria', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:14:17'),
(53, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:16:21'),
(54, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:20:39'),
(55, 'AA102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:21:07'),
(56, 'TA101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 18:22:53'),
(57, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:23:46'),
(58, 'AA102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:25:17'),
(59, 'AT102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:25:47'),
(60, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:26:16'),
(61, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 18:26:48'),
(62, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 21:55:21'),
(63, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 21:56:25'),
(64, 'TP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 21:56:58'),
(65, 'AA102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 21:58:25'),
(66, 'AP101', 'Christina', 'Achilleopoulou', 'cachilleopoulou@gmail.com', '2023-05-24 21:59:38'),
(67, 'TA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:00:59'),
(68, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:02:16'),
(69, 'AP101', 'Christina', '', '', '2023-05-24 22:04:07'),
(70, 'AP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:05:54'),
(71, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:06:36'),
(72, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:09:15'),
(73, 'TA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:10:47'),
(74, 'TP102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:13:32'),
(75, 'TA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:15:59'),
(76, 'AA102', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:18:54'),
(77, 'TA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:21:04'),
(78, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:27:44'),
(79, 'TP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:29:01'),
(80, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:30:26'),
(81, 'AA101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:32:25'),
(82, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-24 22:40:14'),
(83, 'AT101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-25 13:41:51'),
(84, 'AP101', 'Christina', 'Achilleopoulou', 'christina.achilleopoulou@yahoo.com', '2023-05-27 12:23:30');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD KEY `SCHEDULE_ID` (`SCHEDULE_ID`);

--
-- Ευρετήρια για πίνακα `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`SCHEDULE_ID`);

--
-- Ευρετήρια για πίνακα `user_emails`
--
ALTER TABLE `user_emails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BOOKING_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `user_emails`
--
ALTER TABLE `user_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`SCHEDULE_ID`) REFERENCES `schedule` (`SCHEDULE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
