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

-- Listage des données de la table arcadia_db.contact_info : ~4 rows (environ)
INSERT INTO `contact_info` (`id`, `type`, `value`) VALUES
	(1, 'Address', 'Parc Zoologique d\'Arcadia\r\n2 Avenue de Verdun\r\n69330 Meyzieu\r\nFrance'),
	(2, 'Phone', 'General Inquiries: +33 4 72 45 63 00\nTicketing: +33 4 72 45 63 01'),
	(3, 'Email', 'General Inquiries: info@parczooarcadia.fr\r\nPress Inquiries: presse@parczooarcadia.fr\r\nLost & Found: objets-trouves@parczooarcadia.fr'),
	(4, 'Hours', 'Zoo Hours:\nMonday - Friday: 9h30 - 18h00\nSaturday - Sunday: 9h30 - 19h00\nAdministrative Office Hours:\nMonday - Friday: 8h30 - 17h00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
