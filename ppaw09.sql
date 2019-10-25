-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: ppaw09
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas` (
  `kelas_id` int(11) NOT NULL,
  `kelas_unx` varchar(100) NOT NULL,
  `kelas_kode` varchar(50) NOT NULL,
  `matakuliah_id` int(11) DEFAULT NULL,
  `ruang` varchar(100) NOT NULL,
  `waktu` varchar(100) NOT NULL,
  `semester` varchar(5) NOT NULL,
  PRIMARY KEY (`kelas_id`),
  KEY `fk_matakuliah` (`matakuliah_id`),
  CONSTRAINT `fk_matakuliah` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`matakuliah_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelasdetail`
--

DROP TABLE IF EXISTS `kelasdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelasdetail` (
  `kelasdetail_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  PRIMARY KEY (`kelasdetail_id`),
  KEY `fk_mahasiswa` (`mahasiswa_id`),
  KEY `fk_kelas` (`kelas_id`),
  CONSTRAINT `fk_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mahasiswa` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`mahasiswa_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelasdetail`
--

LOCK TABLES `kelasdetail` WRITE;
/*!40000 ALTER TABLE `kelasdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelasdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `mahasiswa_id` int(11) NOT NULL,
  `mahasiswa_unx` varchar(100) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `mahasiswa_nama` varchar(200) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  PRIMARY KEY (`mahasiswa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (1,'4692c8f73f8f8c45fb9b225c520a096e','1177050001','Aaz Muhammad Hafidz Azis','2019-01-01','L'),(2,'f7eb63c66fc68b989289d87b64a23768','1177050002','Acep Razif Andriyan','2019-01-01','L'),(3,'b8510a3b9f0a0513486e54bf9ddb601c','1177050010','Aisyah Amini Nur','2019-01-01','P'),(4,'caf53e78db05a172047299fb04e86a20','1177050017','Arham Aulia Nugraha','2019-01-01','L'),(5,'dc1a6baacd1bbb8e9fdef63043288687','1177050030','Dimas Adi Putra Pratama','2019-01-01','L'),(6,'0f25e296b51e24402bb55d97e6fa3dae','1177050050','Hanny Hutaminingrum','2019-01-01','P'),(7,'078452cab72c7d7eff06ccdb026bb4d0','1177050053','Ihsanul Muttaqiin Bin Abdul Malik','2019-01-01','L'),(8,'fd3b08cea34375d7f599033852beee13','1177050058','Kartika Aprila','2019-01-01','P'),(9,'a78dc126a0cc4ff29a60e497a6eb57c0','1177050060','Melani Nurul Mudyawati','2019-01-01','P'),(10,'1d079b771bba2e574b637b099a74033b','1177050061','Miftahul Jannah','2019-01-01','P'),(11,'953fbed09d85344bdd26f990bf1d200e','1177050069','Muhammad Humam Wahisyam','2019-01-01','L'),(12,'025e1cc489428ebae9018e1262175eff','1177050072','Muhammad Izzul Islam','2019-01-01','L'),(13,'bbf6a99dc82bae40aea621793073d506','1177050078','Nida Luthfi Awaliyah','2019-01-01','P'),(14,'e416cfe4404fd51c75a1986edd8ec7be','1177050079','Nina Nadia Syafitri Husein','2019-01-01','P'),(15,'ab6d3d5c71e848f43a931ad1ab95a994','1177050093','Rafli Indra Gunawan','2019-01-01','L'),(16,'1098a1ebb7f90ebfa1bea4e6dd97ac24','1177050097','Ridwan Maulana','2019-01-01','L'),(17,'542f832635768c35079315b9e434c96d','1177050104','Salma Nurzaqiah','2019-01-01','P'),(18,'cc02e18e1a84dcb9fb80029c40d31115','1177050124','Muhammad Ridhwan Ramadhan','2019-01-01','L'),(19,'e615a07b9b1d4ca80679fcdbf6172988','1177050129','Luthfi Muhammad Fasya','2019-01-01','L'),(20,'7ea86e9f176e9578d39ee8140e66075e','1167050119','OPA PAWITIUL MURSADAD','2019-01-01','L'),(21,'3c42231dc0f7a3ab53153ea471b32e9e','1177050016','Angelyna','2019-01-01','P'),(22,'250773752bb81a79f160ebc37625c897','1177050021','Aulia Yasmin Putri Almi','2019-01-01','P'),(23,'56749018fbf434e89230c93995d84b64','1177050031','Dimas Bayu Aji','2019-01-01','L'),(24,'817759ae5ee31459db93849e9d3c03e9','1177050032','Dinda Meysya Rochma','2019-01-01','P'),(25,'c1930e2608294de309acb0bcc2a90faf','1177050042','Faridah Dewi Khansa','2019-01-01','P'),(26,'19d0e1e5cb0ce9f67907b78d374b45a1','1177050045','Fikry Dzulfikar Rasyid','2019-01-01','L'),(27,'be750af55c66a2757f10ab965e690936','1177050051','Hazli Al Fadli','2019-01-01','L'),(28,'b37648c829d2c6806c22870572c73a64','1177050052','Hishna Difa Ismail','2019-01-01','L'),(29,'6846077588568461cebc2043e52e429b','1177050056','Kamal Zaki Abdurrafi','2019-01-01','L'),(30,'6c201c1b0fa2592ad2bf5f1af2abb90b','1177050077','Muhammad Thariq Sabiq Bilhaq','2019-01-01','L'),(31,'1c3d880ebc491fe5345d632f33416511','1177050080','Nisvy Sya`Bana Nugraha','2019-01-01','P'),(32,'786b35f739d6ed3cc3ff142df4ffedd6','1177050082','Nurul Dwi Cahya','2019-01-01','P'),(33,'f71f3fcc6bf18fbb9d8141b3e2bd7cb2','1177050087','Peny Agustin','2019-01-01','P'),(34,'bf940fdd0c77d11408785d2a8d9cb436','1177050101','Risnandy Maulana','2019-01-01','L'),(35,'4a181dafbeadfad1532efed47a3f1acd','1177050102','Riyadi Fauzy','2019-01-01','L'),(36,'aeddf6434e8050061c7a1c6de75a890c','1177050111','Syafti Dhanusafitri','2019-01-01','P'),(37,'37b21a352bd624c24dd0fcd94124ca3c','1177050113','Taufik Ramadhan','2019-01-01','L'),(38,'114c2ad35532246cafa9ca913dd76e51','1177050116','Triana Ridhaswari','2019-01-01','P'),(39,'38bc6e920f4967b5aaa945a85a42491f','1177050118','Wawan Kurniawan','2019-01-01','L'),(40,'2c83fd3b7b8ee69a7a3dc038b12c299f','1177050011','Aji Zulkifli Ramdani','2019-01-01','L'),(41,'93b3e9a3942729d0de0d101c607245b2','1177050027','Deden Muhamad Furqon','2019-01-01','L'),(42,'d061c0d17be1a94fb265cfb7d527468f','1177050047','Firman Nudin','2019-01-01','L'),(43,'f9e215def7949ec256dc858788c253a5','1177050068','Muhammad Azka Khowarizmi','2019-01-01','L'),(44,'cdde0852f1b0939611a28eb5946e4e59','1177050070','Muhammad Iqbal Hadad','2019-01-01','L'),(45,'2e3ec4b32d406424696b213f903da17f','1177050096','Reza Sulanjana Purnama','2019-01-01','L'),(46,'0417c9cb31242192e0fb0bd13aad9a52','1177050100','Riki Ahmad Maulana','2019-01-01','L'),(47,'63cb4a43a44c44cb50bf7ff51c2937bc','1177050103','Ryan Noorfauzan','2019-01-01','L'),(48,'8e3d00d399168cdcae265b520ad57907','1177050106','Seno Tresna Galang Pradana','2019-01-01','L'),(49,'702711d87a045615b2e059a434152c96','1177050114','Toni Maulana','2019-01-01','L'),(50,'dcef1c62ddb1664b292c2f1747bbd97c','1177050127','Fahmi Fauzi Kadarmanto','2019-01-01','L'),(51,'91387f5f5c2f9170679d7cbd004f24b2','1177050128','Ryan Reliovani','2019-01-01','L'),(52,'e0c60ac39bebce1fbe653fa170c4cc8c','1147050096','M.FARID IQBAL','2019-01-01','L'),(53,'fbe27ca7fef7097c78974b45513f4888','1167050127','RAHMAT NURDIN NUGRAHA','2019-01-01','L'),(54,'d64d9ea8ce31845ee5347a76fc0e934d','1177050006','Adjie Wafi','2019-01-01','L'),(55,'ed3dbf10c2dc95f2f19f2ceec3a32ff6','1177050008','Agung Satrio Budi Prakoso','2019-01-01','L'),(56,'d93cb9eb8a75623d35bd7db47162a95a','1177050025','Cecep Rafqi Al-Husni','2019-01-01','L'),(57,'b0cffdbea6caabec5e5f7ee1ef9d9322','1177050040','Fajrian Fatan Abdillah','2019-01-01','L'),(58,'46f1250e1b4742769902f964ae692ee1','1177050057','Karima Marwazia Shaliha','2019-01-01','P'),(59,'73af3ec7d2c0ef35f9884779ff4b139c','1177050063','Molly Siti Mauliah Suzazi Permana','2019-01-01','P'),(60,'5a79ef098bf9d5018a53d5f975db356f','1177050075','Muhammad Rifa Al`Afghani','2019-01-01','L'),(61,'10ca2fba8bb2e4f4fea5af5ec7ce2eb2','1177050083','Nurul Rachmayani Sadi','2019-01-01','P'),(62,'d13e90b47b8a0e36d080850b8f08adb2','1177050085','Pebri Alkautsar','2019-01-01','L'),(63,'1d049720351e3e23e70168a439fcf42e','1177050089','Pramadita Sielda Dewi','2019-01-01','P'),(64,'e59a7b7eed91ded36a82048454cbb591','1177050094','Rahagi Ahnaf Saidani','2019-01-01','L'),(65,'d7790255b420215cf617caa29c66fc73','1177050120','Yayang Kurnia','2019-01-01','L'),(66,'78f29c782e01fe383aca3569d4164dd2','1177050123','Zanuar Ekaputra Rus\'an','2019-01-01','L'),(67,'6a0459853d06cb51b8517cba4146d87c','1177050126','Nden Awalludin','2019-01-01','L');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matakuliah`
--

DROP TABLE IF EXISTS `matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matakuliah` (
  `matakuliah_id` int(11) NOT NULL,
  `matakuliah_unx` varchar(100) NOT NULL,
  `matakuliah_kode` varchar(50) NOT NULL,
  `matakuliah_deskripsi` varchar(200) NOT NULL,
  `sks` int(11) NOT NULL,
  PRIMARY KEY (`matakuliah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matakuliah`
--

LOCK TABLES `matakuliah` WRITE;
/*!40000 ALTER TABLE `matakuliah` DISABLE KEYS */;
INSERT INTO `matakuliah` VALUES (1,'3272331996836ae2f2468c574999f901','IF15501','Sistem Basis Data',2),(2,'17eff65f1d2c6cb7f5968ce116553759','IF15504L','Praktikum Pengembangan Aplikasi Web',1),(3,'df73d3ef5f628e45c9d993bca7a6e80d','IF15504','Pengembangan Aplikasi Web',2),(4,'bf418f9830233f8af6b1524590f2d8c0','IF15501L','Praktikum Sistem Basis Data',1);
/*!40000 ALTER TABLE `matakuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ppaw09'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-24 15:49:01
