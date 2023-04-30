-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webptit
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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT '0',
  `paymentId` int DEFAULT NULL,
  `isPaid` int DEFAULT '0',
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (14,1,'Test pro','12312312','Tầng 8 nhà B2, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng',1220,'2023-04-27','0',NULL,0),(15,1,'Bách Nguyễn','12312312','Tầng 8 nhà B2, Xã Chỉ Đạo, Huyện Văn Lâm, Tỉnh Hưng Yên',1300,'2023-04-27','0',NULL,0),(16,1,'Thanh Sơn','0987678678','Tầng 8 nhà B2, Xã Tả Củ Tỷ, Huyện Bắc Hà, Tỉnh Lào Cai',1300,'2023-04-27','0',NULL,0),(17,1,'Thanh Sơn','0987678678','Tầng 8 nhà B2, Xã Bảo Toàn, Huyện Bảo Lạc, Tỉnh Cao Bằng',1695,'2023-04-27','0',NULL,0),(18,1,'Bách Nguyễn','12312312','Tầng 8 nhà B2, Xã Pải Lủng, Huyện Mèo Vạc, Tỉnh Hà Giang',2440,'2023-04-27','0',NULL,0),(19,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Xã Xín Cái, Huyện Mèo Vạc, Tỉnh Hà Giang',2260,'2023-04-27','0',NULL,0),(20,1,'Thanh Son','0978765345','Nha B2, Xã Hiệp Lực, Huyện Ninh Giang, Tỉnh Hải Dương',650,'2023-04-27','0',NULL,0),(21,1,'Thanh Son','0978765345','Nha B2, Phường Phả Lại, Thành phố Chí Linh, Tỉnh Hải Dương',1695,'2023-04-27','0',NULL,0),(22,1,'Thanh Son','21923123123','Nha B2, Xã Việt Hải, Huyện Cát Hải, Thành phố Hải Phòng',565,'2023-04-27','0',NULL,0),(23,1,'Thanh Son','0978765345','Nha B2, Xã Sủng Trái, Huyện Đồng Văn, Tỉnh Hà Giang',565,'2023-04-27','0',NULL,0),(24,1,'Bách Nguyễn','12312312','Tầng 8 nhà B2, Xã Minh Quang, Huyện Chiêm Hóa, Tỉnh Tuyên Quang',1220,'2023-04-27','0',NULL,0),(25,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Xã Sủng Tráng, Huyện Yên Minh, Tỉnh Hà Giang',1220,'2023-04-27','0',NULL,0),(26,1,'Thanh Sơn','0987678678','Tầng 8 nhà B2, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng',565,'2023-04-27','0',NULL,0),(27,1,'sonnnnn','0987678678','Tầng 8 nhà B2, Xã Hoàng Hanh, Thành phố Hưng Yên, Tỉnh Hưng Yên',650,'2023-04-27','0',NULL,0),(28,1,'Thanh Sơn','12312312','Tầng 8 nhà B2, Thị trấn Chợ Rã, Huyện Ba Bể, Tỉnh Bắc Kạn',830,'2023-04-27','0',NULL,0),(29,1,'Bách Nguyễn','12312312','Tầng 8 nhà B2, Thị trấn Bảo Lạc, Huyện Bảo Lạc, Tỉnh Cao Bằng',650,'2023-04-27','0',NULL,0),(30,1,NULL,NULL,'null, null, null, null',1300,'2023-04-27','0',NULL,0),(31,1,'Bách Nguyễn Van','0987678678','123213, Xã Phìn Ngan, Huyện Bát Xát, Tỉnh Lào Cai',650,'2023-04-28','0',NULL,0),(32,1,'Test pro','0987678678','Tầng 8 nhà B2, Xã Hà Hiệu, Huyện Ba Bể, Tỉnh Bắc Kạn',650,'2023-04-28','0',NULL,0),(33,1,'Test pro','0987678678','Tầng 8 nhà B2, Xã Chiêu Yên, Huyện Yên Sơn, Tỉnh Tuyên Quang',1130,'2023-04-28','0',NULL,0),(34,1,'sonnnnn','0987678678','Tầng 8 nhà B2, Phường Khắc Niệm, Thành phố Bắc Ninh, Tỉnh Bắc Ninh',1130,'2023-04-28','0',NULL,0),(35,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Xã Vũ Muộn, Huyện Bạch Thông, Tỉnh Bắc Kạn',435,'2023-04-28','0',NULL,0),(36,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Xã Đình Chu, Huyện Lập Thạch, Tỉnh Vĩnh Phúc',565,'2023-04-28','0',NULL,0),(37,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Xã Ngọc Đào, Huyện Hà Quảng, Tỉnh Cao Bằng',650,'2023-04-29','0',NULL,0),(38,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Xã Minh Khương, Huyện Hàm Yên, Tỉnh Tuyên Quang',1220,'2023-04-29','0',NULL,0),(39,1,'Bách Nguyễn LOL','12312312','Tầng 8 nhà B2, Xã Nghĩa Thuận, Huyện Quản Bạ, Tỉnh Hà Giang',650,'2023-04-29','0',NULL,0),(40,1,'Bách Nguyễn','0987678678','Tầng 8 nhà B2, Phường Hiệp An, Thị xã Kinh Môn, Tỉnh Hải Dương',1220,'2023-04-29','0',NULL,0),(41,1,'Bách Nguyễn','0987678678','123213, Xã Má Lé, Huyện Đồng Văn, Tỉnh Hà Giang',650,'2023-04-29','0',NULL,0),(42,15,'Thanh Sơn','0987678678','Tầng 8 nhà B2, Xã Đồng Lạc, Huyện Nam Sách, Tỉnh Hải Dương',565,'2023-04-29','0',NULL,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (14,3,1),(15,9,2),(16,2,2),(17,1,3),(18,3,2),(19,1,4),(20,2,1),(21,1,3),(22,1,1),(23,1,1),(24,3,1),(25,3,1),(26,1,1),(27,2,1),(28,12,1),(29,9,1),(30,6,2),(31,2,1),(32,2,1),(33,1,2),(34,1,2),(35,14,1),(36,1,1),(37,2,1),(38,3,1),(40,3,1),(41,2,1),(42,1,1);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentId` int NOT NULL,
  `paymentName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`paymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'COD'),(2,'VNPay');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `productQuantity` int NOT NULL,
  `productPrice` int NOT NULL,
  `productImg` varchar(255) NOT NULL,
  `productDescription` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `productCategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop Acer Aspire 3 A315-56-58EG 15FHDIPS',1000,565,'img/products/lt-1.jpg','Laptop Acer Aspire 3 A315-56-58EG có thiết kế gọn nhẹ với màn hình 15.6\", chỉ 1.7 kg. Thiết bị là lựa chọn hàng đầu cho người dùng trong phân khúc laptop học tập - văn phòng với bộ vi xử lý Intel Core i5 thế hệ 10 tân tiến.','Laptop'),(2,'Laptop Acer Aspire A315-57G-573F NX.HZRSV.00B',1000,650,'img/products/lt-2.jpg','Laptop Acer Aspire A315-57G-573F NX.HZRSV.00B có thiết kế màn hình viền mỏng, 15.6 inch Full HD để người dùng có được trải nghiệm hình ảnh sắc nét. Bộ vi xử lý Intel Core i5-1035G4 mạnh mẽ. Chiếc laptop sở hữu cấu hình tầm trung với vi xử lý tiết kiệm điện Intel Core i5 1035G1, dung lượng RAM 8GB cùng bộ nhớ trong SSD 512GB. Ngoài ra, máy còn được tích hợp card đồ hoạ rời MX330 2GB giúp người dùng có thể giải trí với các tựa game nhẹ nhàng sau những giờ học tập, làm việc căng thẳng.','Laptop'),(3,'Laptop ASUS Gaming ROG Strix G15 G513QC-HN015T',1000,1220,'img/products/lt-3.jpg','Laptop ASUS ROG Strix G15 G513QC-HN015T là dòng laptop gaming với thiết kế hiện đại, cao cấp. Máy sở hữu cấu hình mạnh mẽ với vi xử lý AMD Ryzen 7 5800H, card đồ họa rời NVIDIA RTX 3050 4GB kết hợp với màn hình 15.6 inch FullHD tần số quét 144Hz hứa hẹn sẽ mang lại trải nghiệm chơi game tuyệt vời.','Laptop'),(4,'Laptop ASUS TUF Gaming FX506HM HN018T',1000,1350,'img/products/lt-4.jpg','Laptop Asus TUF Gaming FX506HM - HN018T là một trong những laptop gaming có hiệu năng vượt trội cùng thiết kế ấn tượng. Thiết bị này được rất nhiều game thủ săn đón trong thời gian qua. Thiết kế thanh thoát, thân thiện với game th','Laptop'),(5,'Laptop Dell G5 15 5500 (70252800)',1000,1220,'img/products/lt-5.jpg','Laptop Dell G5 15 5500 i7 10750H thiết kế đậm chất gaming, chắc chắn sẽ “lọt vào mắt xanh” của những game thủ chuyên nghiệp. Thiết bị sở hữu màu Đen thời thượng, chipset Intel Core i7 10750H “cân” đủ các tựa game đỉnh cao nhất. Laptop Dell G5 15 5500 i7 10750H có ngoại hình đậm chất gaming với kích thước có độ dày 31.13 mm và trọng lượng 2.65 kg, thiết bị này không quá nặng và vẫn có thể đảm bảo được tính linh động của máy, mang theo bên mình đi cafe “chiến” game cùng anh em. ','Laptop'),(6,'Laptop Dell Inspiron 15 3515',1000,650,'img/products/lt-6.jpg','Laptop Dell Inspiron 15 3515 R3-3250U sở hữu màn hình kích thước 15.6 inch lớn, có chế độ chống chói, bảo vệ mắt. Dung lượng lưu trữ lớn 512 GB hỗ trợ lưu trữ tốt các file công việc dùng lâu dài. Ngoài ra, sản phẩm còn sở hữu cấu hình khủng, pin trâu để giúp tối ưu hóa trải nghiệm người dùng.','Laptop'),(7,'Laptop Dell Vostro 3400 70270645',1000,820,'img/products/lt-7.jpg','Laptop Dell Vostro 3400 70270645 có thiết kế mỏng nhẹ nổi bật với màn hình 14 inch, độ dày dưới 2cm và trọng lượng nhẹ 1.64 kg. Thiết bị sở hữu dòng chip Intel i5 thế hệ 11 Tiger lake tiên tiến mang đến cấu hình ổn định tuyệt đỉnh.','Laptop'),(8,'Laptop Gaming Acer Nitro 5 AN515-45-R6EV NH.QBMSV.006',1000,830,'img/products/lt-8.jpg','Laptop Gaming Acer Nitro 5 AN515-45-R6EV sở hữu màn hình có kích thước 15.6 inch, độ phân giải FullHD, tần số quét 144Hz .Bộ vi xử lý AMD Ryzen 5 5600H giúp tăng tốc độ xử lý mọi dữ liệu đồng thời tiết kiệm năng lượng, góp phần kéo dài tuổi thọ pin. Laptop Gaming Acer Nitro 5 AN515-45-R6EV có vẻ ngoài hình mạnh mẽ đặc trưng của dòng Laptop gaming, cùng card đồ họa GeForce GTX 1650 sẽ mang đến sức mạnh chơi game vượt trội. Sản phẩm còn sở hữu màn hình 15.6inch FHD với tần số quét 144Hz mang đến trải nghiệm cực tốt cho người dùng.','Laptop'),(9,'iPhone 11',1000,650,'img/products/dt-1.jpg','iPhone 11 128GB chính hãng có thiết kế hiện đại, thừa hưởng khá nhiều từ sự các thế hệ trước như Xs hay X. Khung viền nhôm chắc chắn cùng với mặt kính đem lại vẻ sang trọng, đẳng cấp. Các góc cạnh được bo tròn. Mặt kính cường lực không chỉ giúp màn hình “mạnh mẽ” hơn mà còn chống xước, chống bám vân tay tốt hơn so với đời trước.','Phone'),(10,'iPhone 12',1000,870,'img/products/dt-2.jpg','iPhone 12 128GB ra mắt nổi bật với mức giá phải chăng nhưng được tích hợp hàng loạt tính năng cao cấp hấp dẫn. Apple iPhone 12 được đánh giá là điện thoại kế nhiệm iPhone 11 hoàn hảo bởi Apple đã tinh chỉnh khá nhiều chi tiết từ ngoại hình đến cấu hình.','Phone'),(11,'iPhone 13',1000,1000,'img/products/dt-3.jpg','iPhone 13 512GB cùng các phiên bản năm nay sẽ có nhiều nâng cấp từ phía camera, dung lượng pin và đặc biệt là thiết kế phần notch bé hơn. Nâng trải nghiệm cho chủ sở hữu lên một tầm cao mới.','Phone'),(12,'Samsung Galaxy Z Flip3 5G',1000,830,'img/products/dt-4.jpg','Samsung Galaxy Z Flip3 5G (Z Flip 3) được thiết kế với các góc cạnh được bo cong hoàn hảo mang lại sự chắc chắn khi sử dụng. Khác với Galaxy Fold đời đầu với cơ chế gập theo chiều dọc, giúp Galaxy Z Flip3 5G chỉ nhỏ bằng phân nửa các điện thoại khác. Bạn có thể cầm máy gọn gàng trong lòng bàn tay, bỏ vào túi quần hay túi áo một cách tiện lợi hơn bao giờ hết','Phone'),(13,'Xiaomi Redmi Note 11 Pro 5G',1000,400,'img/products/dt-5.jpg','Xiaomi Redmi Note 11 Pro 5G 128GB là chiếc điện thoại giá rẻ của Xiaomi, máy có màn hình 6.67 inches. Cấu hình ổn định với chipset Snapdragon 695 5G 8 nhân. Ngoài ra, máy còn có cụm 3 camera với cảm biến 108MP, phù hợp với mọi đối tượng người dùng.','Phone'),(14,'Samsung Galaxy A52',1000,435,'img/products/dt-6.jpg','Samsung Galaxy A52 với những cải tiến về hệ thống camera. Smartphone Samsung mới được trang bị cấu hình mạnh mẽ sẽ mang đến cho bạn những trải nghiệm tuyệt vời.','Phone'),(15,'Samsung Galaxy S21 FE',1000,570,'img/products/dt-7.jpg','Galaxy S21 FE 128GB là thế hệ smartphone tiếp theo thay thế cho người tiền nhiệm của mình là dòng Galaxy S20 FE. Samsung đã định hướng cho sản phẩm FE của mình là một dòng dành riêng cho các fan của hãng với mức giá vô cùng phải chăng nhưng vẫn mang lại hiệu năng vô cùng mạnh mẽ. Đây là chiếc điện thoại Samsung sở hữu thiết kế vô cùng trẻ trung, năng động với nhiều màu sắc cho người dùng thoải mái lựa chọn. Đi kèm với đó là màn hình 6.4 inch AMOLED 120Hz và hiệu năng vô cùng mạnh mẽ với Exynos 2100 hứa hẹn sẽ mang lại trải nghiệm vô cùng tuyệt vời đến người dùng.','Phone'),(16,'Samsung Galaxy A13',1000,210,'img/products/dt-8.jpg','Samsung Galaxy A13 128GB sẽ mang đến cho bạn trải nghiệm tốt hơn so với các dòng sản phẩm có cùng phân khúc giá rẻ bởi cấu hình hoạt động ổn định, hệ thống 3 camera chụp ảnh chi tiết ấn tượng, dung lượng pin đáp ứng tốt thời lượng sử dụng trung bình của một người và ngoại hình tinh tế, màu sắc bắt mắt, trẻ trung và kích thước tổng thể mang tính linh động cao.','Phone');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(60) DEFAULT NULL,
  `userPassword` varchar(250) DEFAULT NULL,
  `userName` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userPhoneNumber` varchar(12) DEFAULT NULL,
  `isAdmin` int DEFAULT NULL,
  `isGoogleUser` int DEFAULT '0',
  `googleUserId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'swptsnotexist@duck.com','jCcS6Gf9WosvjjbTSY2QT/2JERydrNdDq4HIzEDO8Wo=','Thanh Son',NULL,NULL,1,0,NULL),(2,'bachbnvn123@gmail.com','youngbach','Bách Nguyễn','Tân Triều Thanh Trì','0986853388',1,0,NULL),(7,'youngbach000@gmail.com','test123','youngbach',NULL,NULL,0,0,NULL),(8,'youngbach123@gmail.com','test111','Bach Nguyen',NULL,NULL,0,0,NULL),(9,'acccloneeeno1@gmail.com','test','test',NULL,NULL,0,0,NULL),(10,'test@gmail.com','1','test',NULL,NULL,0,0,NULL),(11,'youngbach09@gmail.com','Bachn','BÃ¡ch VÄn',NULL,NULL,0,0,NULL),(12,'youngbach10@gmail.com','1111','BÃ¡ch Nguyá»n',NULL,NULL,0,0,NULL),(13,'youngbach11@gmail.com','1111','Bách Nguyễn',NULL,NULL,0,0,NULL),(15,'pts.28032001@gmail.com',NULL,NULL,NULL,NULL,0,1,'118425059557945567815');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vnp_return`
--

DROP TABLE IF EXISTS `vnp_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vnp_return` (
  `orderId` int NOT NULL,
  `vnp_TxnRef` varchar(50) DEFAULT NULL,
  `vnp_Amount` varchar(50) DEFAULT NULL,
  `vnp_OrderInfo` varchar(250) DEFAULT NULL,
  `vnp_ResponseCode` varchar(50) DEFAULT NULL,
  `vnp_TransactionNo` varchar(50) DEFAULT NULL,
  `vnp_BankCode` varchar(50) DEFAULT NULL,
  `vnp_PayDate` varchar(50) DEFAULT NULL,
  KEY `orderId` (`orderId`),
  CONSTRAINT `vnp_return_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vnp_return`
--

LOCK TABLES `vnp_return` WRITE;
/*!40000 ALTER TABLE `vnp_return` DISABLE KEYS */;
INSERT INTO `vnp_return` VALUES (39,'08767737','149500000','Thanh toan don hang:08767737','00','14002065','NCB','20230429085121');
/*!40000 ALTER TABLE `vnp_return` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-30  9:26:24
