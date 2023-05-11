-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 11 Μάη 2023 στις 16:18:29
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
  `SCHEDULE_ID` int(11) NOT NULL,
  `NAME` int(11) NOT NULL,
  `SURNAME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('AA101', 'Athens', 'Arta', '2023-06-01 10:00:00', 20, 20),
('AA102', 'Athens', 'Arta', '2023-06-02 21:30:40', 30, 20),
('AP101', 'Athens', 'Patra', '2023-06-01 08:00:00', 50, 10),
('AP102', 'Athens', 'Patra', '2023-06-09 08:00:00', 50, 10),
('AT101', 'Athens', 'Thessaloniki', '2023-06-01 00:00:00', 50, 40),
('AT102', 'Athens', 'Thessaloniki', '2023-05-25 00:00:00', 50, 40),
('AT103', 'Athens', 'Thessaloniki', '2023-05-25 00:00:00', 50, 40),
('AT104', 'Athens', 'Thessaloniki', '2023-05-13 00:00:00', 50, 40),
('AV101', 'Athens', 'Volos', '2023-05-20 00:00:00', 40, 30),
('AV102', 'Athens', 'Volos', '2023-05-22 00:00:00', 35, 30),
('PA101', 'Patra', 'Athens', '2023-05-24 00:00:00', 50, 10),
('PA102', 'Patra', 'Athens', '2023-05-16 00:00:00', 50, 10),
('PAR101', 'Patra', 'Arta', '2023-05-17 00:00:00', 30, 10),
('PAR102', 'Patra', 'Arta', '2023-05-17 00:00:00', 30, 10),
('PT101', 'Patra', 'Thessaloniki', '2023-05-31 00:00:00', 40, 30),
('PT102', 'Patra', 'Thessaloniki', '2023-05-31 00:00:00', 40, 30),
('TA101', 'Thessaloniki', 'Athens', '2023-06-01 00:00:00', 50, 40),
('TA102', 'Thessaloniki', 'Athens', '2023-06-01 00:00:00', 50, 40),
('TA103', 'Thessaloniki', 'Athens', '2023-06-02 00:00:00', 50, 40),
('TA104', 'Thessaloniki', 'Athens', '2023-06-02 00:00:00', 50, 40),
('TP101', 'Thessaloniki', 'Patra', '2023-05-18 00:00:00', 30, 30),
('TP102', 'Thessaloniki', 'Patra', '2023-05-26 00:00:00', 30, 30),
('TV101', 'Thessaloniki', 'Volos', '2023-05-22 00:00:00', 20, 10),
('TV102', 'Thessaloniki', 'Volos', '2023-05-25 00:00:00', 20, 10),
('VA101', 'Volos', 'Athens', '2023-05-12 00:00:00', 20, 30),
('VA102', 'Volos', 'Athens', '2023-05-24 00:00:00', 20, 30),
('VT101', 'Volos', 'Thessaloniki', '2023-05-21 00:00:00', 20, 10),
('VT102', 'Volos', 'Thessaloniki', '2023-05-28 00:00:00', 20, 10);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`SCHEDULE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
