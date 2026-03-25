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

-- Listage des données de la table arcadia_db.veterinary_reports : ~7 rows (environ)
INSERT INTO `veterinary_reports` (`report_id`, `animal_id`, `vet_username`, `report_date`, `health_status`, `treatment`, `follow_up_date`) VALUES
	(1, 1, 'vet1', '2024-09-01', 'Routine check-up. Healthy.', NULL, NULL),
	(2, 2, 'vet2', '2024-09-02', 'Minor injury on left leg. Treated with antiseptic.', 'Apply antiseptic daily for one week.', '2024-09-09'),
	(3, 3, 'vet1', '2024-09-03', 'Routine check-up. Healthy.', NULL, NULL),
	(4, 5, 'vet2', '2024-09-04', 'Observed signs of respiratory distress. Administered antibiotics.', 'Monitor respiratory rate daily.', '2024-09-11'),
	(5, 8, 'vet1', '2024-09-05', 'Routine check-up. Nothing to report.', NULL, NULL),
	(6, 12, 'vet2', '2024-09-06', 'Weight loss noted. Blood tests taken.', 'Pending blood test results.', '2024-09-13'),
	(7, 1, 'vet2', '2024-09-12', 'looking pale ', 'raise vitamin intake', '2024-10-30');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
