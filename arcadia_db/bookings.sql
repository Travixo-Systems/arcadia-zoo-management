-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.32-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage des données de la table arcadia_db.bookings : ~24 rows (environ)
INSERT INTO `bookings` (`id`, `visitor_username`, `service_id`, `booking_date`, `status`, `group_size`, `is_pair`) VALUES
	(1, 'visitor1', 2, '2024-09-25', 'Pending', NULL, 1),
	(2, 'visitor2', 3, '2024-09-25', 'Pending', NULL, 0),
	(3, 'visitor2', 2, '2024-10-27', 'Pending', NULL, 0),
	(4, 'visitor2', 3, '2024-09-26', 'Pending', 9, 0),
	(5, 'team_simiba', 2, '2024-09-20', 'Pending', NULL, 0),
	(6, 'team_kaa', 3, '2024-10-12', 'Pending', NULL, 0),
	(7, 'team_kaa', 3, '2024-09-21', 'Pending', NULL, 0),
	(8, 'team_simiba', 3, '2024-09-20', 'Pending', NULL, 0),
	(9, 'team_simiba', 3, '2024-09-20', 'Pending', NULL, 0),
	(10, 'team_simiba', 3, '2024-09-20', 'Pending', NULL, 0),
	(11, 'team_kaa', 3, '2024-09-21', 'Pending', NULL, 0),
	(12, 'team_kaa', 2, '2024-09-21', 'Pending', NULL, 0),
	(13, 'team_kaa', 2, '2024-09-27', 'Pending', NULL, 0),
	(14, 'team_kaa', 2, '2024-09-27', 'Pending', NULL, 0),
	(15, 'team_kaa', 2, '2024-09-27', 'Pending', NULL, 0),
	(16, 'team_kaa', 2, '2024-09-27', 'Pending', NULL, 0),
	(17, 'team_kaa', 3, '2024-09-27', 'Pending', NULL, 0),
	(18, 'equipecyrelle', 3, '2024-09-15', 'Pending', NULL, 0),
	(19, 'team_kaa', 2, '2024-09-22', 'Pending', NULL, 0),
	(20, 'team_kaalil', 3, '2024-09-15', 'Pending', NULL, 0),
	(21, 'team_kaalil', 3, '2024-09-15', 'Pending', NULL, 0),
	(22, 'team_kaalil', 3, '2024-09-15', 'Pending', NULL, 0),
	(23, 'equipecyrelle', 3, '2024-09-19', 'Pending', NULL, 0),
	(24, 'team_kaalil', 3, '2024-09-15', 'Pending', NULL, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
