-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: kutuphane
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `Kategori_No` int NOT NULL,
  `Kategori_Adi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Kategori_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Anı'),(2,'Roman'),(3,'Hikaye'),(4,'Gezi'),(5,'Şiir');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kayit`
--

DROP TABLE IF EXISTS `kayit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kayit` (
  `Kayit_No` int NOT NULL,
  `Uye_No` int DEFAULT NULL,
  `Kitap_No` int DEFAULT NULL,
  `Verilis_Tarihi` timestamp NULL DEFAULT NULL,
  `Teslim_Tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Kayit_No`),
  KEY `Uye_No` (`Uye_No`),
  KEY `Kitap_No` (`Kitap_No`),
  CONSTRAINT `kayit_ibfk_1` FOREIGN KEY (`Uye_No`) REFERENCES `uye` (`Uye_No`),
  CONSTRAINT `kayit_ibfk_2` FOREIGN KEY (`Kitap_No`) REFERENCES `kitap` (`Kitap_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kayit`
--

LOCK TABLES `kayit` WRITE;
/*!40000 ALTER TABLE `kayit` DISABLE KEYS */;
INSERT INTO `kayit` VALUES (1,1,1,'2023-01-07 21:00:00','2023-02-07 21:00:00'),(2,2,2,'2023-02-09 21:00:00','2023-03-09 21:00:00'),(3,3,3,'2023-03-29 21:00:00','2023-04-29 21:00:00'),(4,4,4,'2023-04-11 21:00:00','2023-04-16 21:00:00'),(5,5,5,'2023-01-18 21:00:00','2023-04-26 21:00:00');
/*!40000 ALTER TABLE `kayit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitap`
--

DROP TABLE IF EXISTS `kitap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitap` (
  `Kitap_No` int NOT NULL,
  `Kitap_Adi` varchar(255) DEFAULT NULL,
  `Kategori_No` int DEFAULT NULL,
  `Yazar_No` int DEFAULT NULL,
  `Yayinevi_No` int DEFAULT NULL,
  `Sayfa_Sayisi` int DEFAULT NULL,
  PRIMARY KEY (`Kitap_No`),
  KEY `Yazar_No` (`Yazar_No`),
  KEY `Yayinevi_No` (`Yayinevi_No`),
  KEY `Kategori_No` (`Kategori_No`),
  CONSTRAINT `kitap_ibfk_1` FOREIGN KEY (`Yazar_No`) REFERENCES `yazar` (`Yazar_No`),
  CONSTRAINT `kitap_ibfk_2` FOREIGN KEY (`Yayinevi_No`) REFERENCES `yayinevi` (`Yayinevi_No`),
  CONSTRAINT `kitap_ibfk_3` FOREIGN KEY (`Kategori_No`) REFERENCES `kategori` (`Kategori_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitap`
--

LOCK TABLES `kitap` WRITE;
/*!40000 ALTER TABLE `kitap` DISABLE KEYS */;
INSERT INTO `kitap` VALUES (1,'Suç ve Ceza',1,1,1,639),(2,'Sefiller',2,2,2,856),(3,'Anna Karenina',3,3,3,1089),(4,'Aşk ve Gurur',4,4,4,110),(5,'Romeo ve Juliet',5,5,5,580);
/*!40000 ALTER TABLE `kitap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uye`
--

DROP TABLE IF EXISTS `uye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uye` (
  `Uye_No` int NOT NULL,
  `Ad` varchar(255) DEFAULT NULL,
  `Soyad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Uye_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uye`
--

LOCK TABLES `uye` WRITE;
/*!40000 ALTER TABLE `uye` DISABLE KEYS */;
INSERT INTO `uye` VALUES (1,'Muhammet','Güler'),(2,'Mehmet','Yıldız'),(3,'Ahmet','Yılmaz'),(4,'Ayşe','Yıldırım'),(5,'Fatma','Şahin');
/*!40000 ALTER TABLE `uye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yayinevi`
--

DROP TABLE IF EXISTS `yayinevi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yayinevi` (
  `Yayinevi_No` int NOT NULL,
  `Yayinevi_Adi` varchar(255) DEFAULT NULL,
  `Aciklama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Yayinevi_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yayinevi`
--

LOCK TABLES `yayinevi` WRITE;
/*!40000 ALTER TABLE `yayinevi` DISABLE KEYS */;
INSERT INTO `yayinevi` VALUES (1,'Can Yayınları','Türk Yayın Evi'),(2,'İş Bankası','Türk Yayın Evi'),(3,'Pegasus Yayınları','Türk Yayın Evi'),(4,'Timaş Yayınları','Türk Yayın Evi'),(5,'Tübitak Yayınları','Türk Yayın Evi');
/*!40000 ALTER TABLE `yayinevi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yazar`
--

DROP TABLE IF EXISTS `yazar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yazar` (
  `Yazar_No` int NOT NULL,
  `Yazar_Adi` varchar(255) DEFAULT NULL,
  `Yazar_Soyadi` varchar(255) DEFAULT NULL,
  `Yazar_Bio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Yazar_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yazar`
--

LOCK TABLES `yazar` WRITE;
/*!40000 ALTER TABLE `yazar` DISABLE KEYS */;
INSERT INTO `yazar` VALUES (1,'Fyodor','Dostoyevski','Ünlü Yazar'),(2,'Victor','Hugo','Ünlü Yazar'),(3,'Lev','Tolstoy','Ünlü Yazar'),(4,'Jane','Austen','Ünlü Yazar'),(5,'William','Shakespeare','Ünlü Yazar');
/*!40000 ALTER TABLE `yazar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 18:25:43
