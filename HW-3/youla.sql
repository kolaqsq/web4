-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: youla
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subcategory_id` int NOT NULL,
  `user_id` int NOT NULL,
  `lot_name` varchar(255) NOT NULL,
  `lot_description` varchar(2047) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `geo` varchar(255) NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `favourites` int NOT NULL DEFAULT '0',
  `publication_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lots_id_uindex` (`id`),
  KEY `lots_product_subcategories_id_fk` (`subcategory_id`),
  KEY `lots_users_id_fk` (`user_id`),
  CONSTRAINT `lots_product_subcategories_id_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `product_subcategories` (`id`),
  CONSTRAINT `lots_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
INSERT INTO `lots` VALUES (1,8,1,'Винтажный шоссейный велосипед SHAUFF MIGLIA D’ORO','Размеры рамы: 56 см (M\\L)',45000,'Санкт-Петербург',85,5,'2021-04-23 17:08:07'),(2,8,2,'Шоссейный велосипед Trek 54см.','Шоссейный велосипед TREK\n\nВилка карбоновая, рама из облегченного сплава алюминия. Колеса: 700x23c с антипрокольными покрышками. Рама идет под размерный ряд “M” - 54 см, рост ~172-185 см.\n\nПроведено полное ТО и установлены новые тросы, рубашки для тросиков и обмотка на руль с противоскользящим покрытием. Есть незаметные потертости.\n\nКомплект с GPS велокомпьютером + 4400₽ (крепление в комплекте)\n\n- Возможна доставка в любую страну и регион (осмотр по видеосвязи)',55990,'Москва',18,0,'2021-05-18 14:20:00'),(3,8,3,'Спортивный шоссейный велосипед хвз старт шоссе','велосипед \"Cтapт-шoccе\" 1985г.\nРостовка рамы 560мм. состояние хорошее, в родном цвете зелёный металлик (есть сколы и царапины по лкп и хром). вce завoдскoe ХВЗ готов к эксплуатации.Pама и вилка геометрия не нарушена все ровное. Тopмoзa клeщевого типа, колeсa обoдныe дюрaлюминиевыe пoвышeнной жесткoсти, шины oднотрубные ( перед/зад б/у импортная и ссср в целом неплохие ), привод: педали с усиленным корпусом, передние звезды 48 и 51, задние: 13,15,17,19,21, цепь роликовая 12,7х2,4, количество скоростей 10.\n\nДля поиска. ХВЗ#Старт шоссе#ХВЗ Спорт#Спецзаказ#Советский велосипед#Шоссейный велосипед',11000,'Москва',108,5,'2021-05-13 17:08:58');
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_sets`
--

DROP TABLE IF EXISTS `parameter_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_sets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_id` int NOT NULL,
  `parameter_id` int NOT NULL,
  `value_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parameter_sets_id_uindex` (`id`),
  KEY `parameter_sets_lots_id_fk` (`lot_id`),
  KEY `parameter_sets_parameter_values_id_fk` (`value_id`),
  KEY `parameter_sets_product_parameters_id_fk` (`parameter_id`),
  CONSTRAINT `parameter_sets_lots_id_fk` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`),
  CONSTRAINT `parameter_sets_parameter_values_id_fk` FOREIGN KEY (`value_id`) REFERENCES `parameter_values` (`id`),
  CONSTRAINT `parameter_sets_product_parameters_id_fk` FOREIGN KEY (`parameter_id`) REFERENCES `product_parameters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_sets`
--

LOCK TABLES `parameter_sets` WRITE;
/*!40000 ALTER TABLE `parameter_sets` DISABLE KEYS */;
INSERT INTO `parameter_sets` VALUES (1,1,7,2),(2,1,8,5),(3,1,9,10),(4,2,7,2),(5,2,8,4),(6,2,9,9),(7,3,7,2),(8,3,8,5),(9,3,9,8);
/*!40000 ALTER TABLE `parameter_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_values`
--

DROP TABLE IF EXISTS `parameter_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parameter_id` int NOT NULL,
  `value_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parameter_values_id_uindex` (`id`),
  KEY `parameter_values_product_parameters_id_fk` (`parameter_id`),
  CONSTRAINT `parameter_values_product_parameters_id_fk` FOREIGN KEY (`parameter_id`) REFERENCES `product_parameters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_values`
--

LOCK TABLES `parameter_values` WRITE;
/*!40000 ALTER TABLE `parameter_values` DISABLE KEYS */;
INSERT INTO `parameter_values` VALUES (1,7,'Горные, MTB'),(2,7,'Шоссейные'),(3,7,'Круизеры'),(4,8,'M (168-180 см)'),(5,8,'L (178-190 см)'),(6,8,'XL (185-197 см)'),(7,9,'Белый'),(8,9,'Зеленый'),(9,9,'Синий'),(10,9,'Разноцветный');
/*!40000 ALTER TABLE `parameter_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_id` int NOT NULL,
  `order_in_lot` int NOT NULL,
  `path` varchar(511) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photos_path_uindex` (`path`),
  UNIQUE KEY `photos_id_uindex` (`id`),
  KEY `photos_lots_id_fk` (`lot_id`),
  CONSTRAINT `photos_lots_id_fk` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1,'zexrtycjuvkijlhg.jpg'),(2,1,2,'ewzrgdfthyjj.jpg'),(3,1,3,'werdgtfhyjuki.jpg'),(4,2,1,'edcrgfdvytjhg.jpg'),(5,2,2,'refghjuki.jpg'),(6,2,3,'edfvbghyjuhkil.jpg'),(7,3,1,'p;olkjmnghbfv.jpg'),(8,3,2,'likujyhtgrf.jpg'),(9,3,3,'kuijhgtrfdc.jpg');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_categories_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Мужской гардероб'),(2,'Компьютерная техника'),(3,'Спорт и отдых'),(4,'Хобби и развлечения');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_parameters`
--

DROP TABLE IF EXISTS `product_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_parameters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subcategory_id` int NOT NULL,
  `parameter_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_parameters_id_uindex` (`id`),
  KEY `product_parameters_product_subcategories_id_fk` (`subcategory_id`),
  CONSTRAINT `product_parameters_product_subcategories_id_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `product_subcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_parameters`
--

LOCK TABLES `product_parameters` WRITE;
/*!40000 ALTER TABLE `product_parameters` DISABLE KEYS */;
INSERT INTO `product_parameters` VALUES (1,5,'Тип'),(2,5,'Оперативная память'),(3,5,'Тип видеокарты'),(4,5,'Игровой'),(5,5,'Срок использования'),(6,5,'Тип оптического привода'),(7,8,'Тип'),(8,8,'Рама / Рост велосипедиста'),(9,8,'Цвет');
/*!40000 ALTER TABLE `product_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_subcategories`
--

DROP TABLE IF EXISTS `product_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_subcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_subcategory_id_uindex` (`id`),
  KEY `product_subcategory_product_categories_id_fk` (`category_id`),
  CONSTRAINT `product_subcategory_product_categories_id_fk` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_subcategories`
--

LOCK TABLES `product_subcategories` WRITE;
/*!40000 ALTER TABLE `product_subcategories` DISABLE KEYS */;
INSERT INTO `product_subcategories` VALUES (1,1,'Аксессуары'),(2,1,'Верхняя одежда'),(3,1,'Головные уборы'),(4,2,'Ноутбуки'),(5,2,'Компьютеры'),(6,2,'Мониторы'),(7,3,'Спортивная защита'),(8,3,'Велосипеды'),(9,3,'Ролики и скейтбординг'),(10,4,'Игровые приставки'),(11,4,'Книги и журналы'),(12,4,'Настольные игры');
/*!40000 ALTER TABLE `product_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `e-mail` varchar(255) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `confirmed_user` tinyint(1) NOT NULL DEFAULT '0',
  `active_lots` int NOT NULL DEFAULT '0',
  `rating` float DEFAULT '0',
  `reviews` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_phone_uindex` (`phone`),
  UNIQUE KEY `user_id_uindex` (`id`),
  UNIQUE KEY `user_e-mail_uindex` (`e-mail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Евгений','Игорев','+7 800 555-35-35','sample@text.com','2021-04-23',1,2,0,0),(2,'Максим','Корень','+7 800 555-35-36','sample2@text.com','2021-03-02',1,3,0,0),(3,'Павел','Сидоров','+7 800 555-35-37','sample3@text.com','2016-07-13',1,2,4.9,7);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 17:59:51
