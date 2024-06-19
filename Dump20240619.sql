-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: kpop
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `total_count` int unsigned NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_basket_client1_idx` (`client_id`),
  CONSTRAINT `fk_basket_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (1,7500.00,4,7),(2,2300.00,1,8),(3,9200.00,5,9),(4,6500.00,2,10),(5,8500.00,4,11),(6,7000.00,2,12);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_has_products`
--

DROP TABLE IF EXISTS `basket_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket_has_products` (
  `basket_id` int NOT NULL,
  `products_id` int NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`basket_id`,`products_id`),
  KEY `fk_basket_has_products_products1_idx` (`products_id`),
  KEY `fk_basket_has_products_basket1_idx` (`basket_id`),
  CONSTRAINT `fk_basket_has_products_basket1` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`),
  CONSTRAINT `fk_basket_has_products_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_has_products`
--

LOCK TABLES `basket_has_products` WRITE;
/*!40000 ALTER TABLE `basket_has_products` DISABLE KEYS */;
INSERT INTO `basket_has_products` VALUES (1,17,2),(1,18,1),(1,19,1),(2,26,1),(3,21,2),(3,23,1),(3,27,2),(4,30,1),(4,31,1),(5,20,1),(5,22,2),(5,29,1),(6,25,1),(6,28,1);
/*!40000 ALTER TABLE `basket_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'album'),(4,'merch');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(50) NOT NULL,
  `client_email` varchar(255) NOT NULL,
  `client_phone` varchar(20) NOT NULL,
  `balance` decimal(10,2) unsigned DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_email_UNIQUE` (`client_email`),
  UNIQUE KEY `client_phone_UNIQUE` (`client_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (7,'Беляева Мария Дмитриевна','hyunmintop@gmail.com','+7954645678',0.00),(8,'Коршунова Виктория Васильевна','minho@gmail.com','+7946574685',0.00),(9,'Сатурн Дарья Владимировна','jeonghan@gmail.com','+7932546377',0.00),(10,'Богданова Виктория Алексеевна','felix@gmail.com','+7928395746',0.00),(11,'Чижова Дарья Семеновна','changbin@gmail.com','+7903295702',0.00),(12,'Якушова Карина Михайловна','detsl@gmail.com','+7973645357',0.00);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (4,'seventeen'),(5,'enhypen'),(6,'stray kids');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_summary`
--

DROP TABLE IF EXISTS `order_summary`;
/*!50001 DROP VIEW IF EXISTS `order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_summary` AS SELECT 
 1 AS `order_id`,
 1 AS `client_name`,
 1 AS `client_email`,
 1 AS `client_phone`,
 1 AS `order_date`,
 1 AS `amount`,
 1 AS `product_title`,
 1 AS `product_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `amount` decimal(10,2) unsigned NOT NULL,
  `basket_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_basket1_idx` (`basket_id`),
  CONSTRAINT `fk_orders_basket1` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (14,'2023-05-15 12:00:00',5000.00,1),(15,'2023-05-16 10:30:00',2300.00,2),(16,'2023-05-17 15:45:00',9200.00,3),(17,'2023-05-18 09:00:00',6500.00,4),(18,'2023-05-19 14:20:00',8500.00,5),(19,'2023-05-20 11:10:00',7000.00,6),(20,'2024-06-18 04:53:46',5000.00,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_order` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE product_id INT;
    DECLARE product_count INT;
    DECLARE cur CURSOR FOR
        SELECT products_id, count
        FROM basket_has_products
        WHERE basket_id = NEW.basket_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO product_id, product_count;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Уменьшаем количество продуктов
        UPDATE products
        SET quantity = quantity - product_count
        WHERE id = product_id;
    END LOOP;

    CLOSE cur;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tittle` varchar(255) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `groups_id` int NOT NULL,
  `categories_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_groups1_idx` (`groups_id`),
  KEY `fk_products_categories1_idx` (`categories_id`),
  CONSTRAINT `fk_products_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_groups1` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (17,'DARK MOON MEMORABILIA',58,2500.00,5,3),(18,'17 IS RIGHT HERE',265,2300.00,4,3),(19,'MIXTAPE',100,2200.00,6,3),(20,'CHRISTMAS EVEL',72,1800.00,6,3),(21,'17 CARAT',22,1700.00,4,3),(22,'SEMICOLON',87,2300.00,4,3),(23,'MANIFESTO',16,7400.00,5,3),(24,'THE NAME ;17',45,6000.00,4,3),(25,'Memories : STEP 1',31,6900.00,5,3),(26,'LOVE&LETTER',44,2300.00,4,3),(27,'DILEMMA',31,1200.00,5,3),(28,'SKZOO PLUSH',79,17000.00,6,4),(29,'LIGHT STICK ver.3',44,7300.00,4,4),(30,'LIGHT STICK ver.2',31,7000.00,6,4),(31,'LIGHT STICK',11,5000.00,5,4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kpop'
--

--
-- Dumping routines for database 'kpop'
--
/*!50003 DROP FUNCTION IF EXISTS `count_unique_products_in_basket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_unique_products_in_basket`(basketID INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE productCount INT;
    
    SELECT COUNT(DISTINCT products_id) INTO productCount
    FROM basket_has_products
    WHERE basket_id = basketID;
    
    RETURN productCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddProduct`(
    IN tittle VARCHAR(255),
    IN quantity INT,
    IN price DECIMAL(10,2),
    IN groups_id INT,
    IN categories_id INT
)
BEGIN
    INSERT INTO products (tittle, quantity, price, groups_id, categories_id) 
    VALUES (tittle, quantity, price, groups_id, categories_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_product_to_basket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_to_basket`(
    IN product_id INT,
    IN basket_id INT
)
BEGIN
    DECLARE product_count INT;
    DECLARE price DECIMAL(10,2);
    
    SET price = (SELECT products.price FROM products WHERE id = product_id);

    -- Проверяем, есть ли товар в корзине
    SELECT COUNT(*) INTO product_count
    FROM basket_has_products
    WHERE basket_has_products.basket_id = basket_id AND products_id = product_id;

    -- Если товар уже есть в корзине, то увеличиваем его количество
    IF product_count > 0 THEN
        UPDATE basket
        JOIN basket_has_products ON basket.id = basket_id
        SET basket.total_count = basket.total_count + 1
        WHERE basket_has_products.basket_id = basket_id AND products_id = product_id;
        
        UPDATE basket
        JOIN basket_has_products ON basket.id = basket_id
        SET basket.total_sum = basket.total_sum + price
        WHERE basket_has_products.basket_id = basket_id AND products_id = product_id;
    ELSE
        -- Иначе добавляем новую запись
        INSERT INTO basket_has_products (basket_id, products_id, count)
        VALUES (basket_id, product_id, 1);
        
        UPDATE basket
        JOIN basket_has_products ON basket.id = basket_id
        SET basket.total_sum = basket.total_sum + price
        WHERE basket_has_products.basket_id = basket_id AND products_id = product_id;
   
    END IF;
    
    SELECT price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateOrder`(
    IN p_basket_id INT,
    IN p_product_id INT,
    IN p_product_count INT,
    IN p_order_amount DECIMAL(10, 2)
)
BEGIN
    DECLARE v_current_quantity INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Откатываем все изменения в случае ошибки
        ROLLBACK;
    END;

    -- Начинаем транзакцию
    START TRANSACTION;

    -- Проверяем текущее количество продукта
    SELECT quantity INTO v_current_quantity
    FROM products
    WHERE id = p_product_id
    FOR UPDATE;

    -- Проверяем, достаточно ли продуктов на складе
    IF v_current_quantity >= p_product_count THEN
        -- Обновляем количество продукта
        UPDATE products
        SET quantity = quantity - p_product_count
        WHERE id = p_product_id;

        -- Добавляем запись в таблицу orders
        INSERT INTO orders (order_date, amount, basket_id)
        VALUES (NOW(), p_order_amount, p_basket_id);

        -- Фиксируем транзакцию
        COMMIT;
    ELSE
        -- Откатываем транзакцию, если недостаточно продуктов
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недостаточно товаров на складе';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteOrder`(
    IN order_id INT
)
BEGIN
    DELETE FROM orders WHERE id = order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `order_summary`
--

/*!50001 DROP VIEW IF EXISTS `order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_summary` AS select `orders`.`id` AS `order_id`,`client`.`client_name` AS `client_name`,`client`.`client_email` AS `client_email`,`client`.`client_phone` AS `client_phone`,`orders`.`order_date` AS `order_date`,`orders`.`amount` AS `amount`,`products`.`tittle` AS `product_title`,`basket_has_products`.`count` AS `product_count` from ((((`orders` join `basket` on((`orders`.`basket_id` = `basket`.`id`))) join `client` on((`basket`.`client_id` = `client`.`id`))) join `basket_has_products` on((`basket`.`id` = `basket_has_products`.`basket_id`))) join `products` on((`basket_has_products`.`products_id` = `products`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 16:18:27
