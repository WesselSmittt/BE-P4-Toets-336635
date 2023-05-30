-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2023 at 10:06 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc-oop-toets-p4`
--

-- --------------------------------------------------------

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
CREATE TABLE IF NOT EXISTS `examen` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `StudentId` int(6) NOT NULL,
  `Rijschool` varchar(30) NOT NULL,
  `Stad` varchar(30) NOT NULL,
  `Rijbewijscategorie` varchar(2) NOT NULL,
  `Datum` date NOT NULL,
  `Uitslag` varchar(10) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examen`
--

INSERT INTO `examen` (`Id`, `StudentId`, `Rijschool`, `Stad`, `Rijbewijscategorie`, `Datum`, `Uitslag`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 100234, 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(2, 123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(3, 103234, 'LinksomRechtsom', 'Dordrecht', 'D', '2023-05-15', 'Geslaagd', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(4, 106452, 'OpDeVluchtStrook', 'Zwijdrecht', 'AM', '2023-05-08', 'Gezakt', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(5, 104546, 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-04-17', 'Gezakt', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(6, 100333, 'AltijdGeslaagd', 'Dordrecht', 'B', '2023-05-12', 'Geslaagd', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
(7, 124444, 'RijlesVoorJou', 'Rotterdam', 'B', '2023-04-12', 'Geslaagd', b'1', NULL, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `examenperexaminator`
--

DROP TABLE IF EXISTS `examenperexaminator`;
CREATE TABLE IF NOT EXISTS `examenperexaminator` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ExamenId` tinyint(3) UNSIGNED NOT NULL,
  `ExaminatorId` tinyint(3) UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ExamenPerExaminator_Examen_Id` (`ExamenId`),
  KEY `FK_ExamenPerExaminator_Examinator_Id` (`ExaminatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examenperexaminator`
--

INSERT INTO `examenperexaminator` (`Id`, `ExamenId`, `ExaminatorId`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 3, b'1', NULL, '2023-05-30 12:06:01.199527', '2023-05-30 12:06:01.199529'),
(2, 3, 3, b'1', NULL, '2023-05-30 12:06:01.199580', '2023-05-30 12:06:01.199581'),
(3, 2, 2, b'1', NULL, '2023-05-30 12:06:01.199600', '2023-05-30 12:06:01.199600'),
(4, 4, 1, b'1', NULL, '2023-05-30 12:06:01.199610', '2023-05-30 12:06:01.199611'),
(5, 7, 3, b'1', NULL, '2023-05-30 12:06:01.199620', '2023-05-30 12:06:01.199620'),
(6, 6, 2, b'1', NULL, '2023-05-30 12:06:01.199629', '2023-05-30 12:06:01.199629'),
(7, 5, 4, b'1', NULL, '2023-05-30 12:06:01.199639', '2023-05-30 12:06:01.199640');

-- --------------------------------------------------------

--
-- Table structure for table `examinator`
--

DROP TABLE IF EXISTS `examinator`;
CREATE TABLE IF NOT EXISTS `examinator` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(12) NOT NULL,
  `Tussenvoegsel` varchar(20) NOT NULL,
  `Achternaam` varchar(30) NOT NULL,
  `Mobiel` varchar(11) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examinator`
--

INSERT INTO `examinator` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Manuel', 'van', 'Meekeren', '06-28493823', b'1', NULL, '2023-05-30 12:06:01.142696', '2023-05-30 12:06:01.142699'),
(2, 'Lissette', 'den', 'Dongen', '06-24383299', b'1', NULL, '2023-05-30 12:06:01.142735', '2023-05-30 12:06:01.142735'),
(3, 'Jurswailly', '', 'Luciano', '06-48293846', b'1', NULL, '2023-05-30 12:06:01.142749', '2023-05-30 12:06:01.142750'),
(4, 'Naswha', '', 'Salawi', '06-34291219', b'1', NULL, '2023-05-30 12:06:01.142755', '2023-05-30 12:06:01.142756');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `examenperexaminator`
--
ALTER TABLE `examenperexaminator`
  ADD CONSTRAINT `FK_ExamenPerExaminator_Examen_Id` FOREIGN KEY (`ExamenId`) REFERENCES `examen` (`Id`),
  ADD CONSTRAINT `FK_ExamenPerExaminator_Examinator_Id` FOREIGN KEY (`ExaminatorId`) REFERENCES `examinator` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
