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

-- Listage des données de la table arcadia_db.reviews : ~7 rows (environ)
INSERT INTO `reviews` (`id`, `visitor_name`, `review`, `rating`, `review_date`, `approved`) VALUES
	(1, 'Alice Smith', 'Had a wonderful time! The animals were amazing.', 5, '2024-09-13 08:48:10', 0),
	(2, 'Bob Johnson', 'Great experience, but the food was a bit overpriced.', 4, '2024-09-13 08:48:10', 0),
	(3, 'Carol Davis', 'The zoo was well-maintained and the staff were friendly.', 5, '2024-09-13 08:48:10', 0),
	(4, 'Dave Brown', 'A fun day out for the whole family!', 4, '2024-09-13 08:48:10', 0),
	(5, 'Eve White', 'Loved seeing the exotic animals. Will visit again.', 5, '2024-09-13 08:48:10', 0),
	(6, 'Richard', 'ljjhljlm', 3, '2024-09-14 16:26:49', 0),
	(7, 'Richard', 'ljjhljlm', 3, '2024-09-14 16:27:19', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
