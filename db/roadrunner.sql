-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 27 Μάη 2023 στις 16:02:41
-- Έκδοση διακομιστή: 10.4.14-MariaDB
-- Έκδοση PHP: 7.4.11

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
  `SURNAME` varchar(11) NOT NULL,
  `EMAIL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `bookings`
--

INSERT INTO `bookings` (`BOOKING_ID`, `SCHEDULE_ID`, `NAME`, `SURNAME`, `EMAIL`) VALUES
(1, 'AT102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(2, 'AT102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(3, 'AT102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(4, 'AT102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(5, 'VA101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(6, 'AV101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(7, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(8, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(9, 'AA101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(10, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(11, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(12, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(13, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(14, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(15, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(16, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(17, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(18, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(19, 'AT102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(20, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(21, 'AP102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(22, 'AA101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(23, 'TA101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(24, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(25, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(26, 'AA102', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(27, 'AT101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(28, 'AA101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(29, 'AA101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(30, 'AP101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com'),
(31, 'AV101', 'Ελένη', 'Βέρα', 'vera19elena@gmail.com');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD UNIQUE KEY `BOOKING_ID` (`BOOKING_ID`),
  ADD KEY `SCHEDULE_ID` (`SCHEDULE_ID`);

--
-- Ευρετήρια για πίνακα `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`SCHEDULE_ID`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BOOKING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
