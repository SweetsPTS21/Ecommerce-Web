use webptit;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(60) DEFAULT NULL,
  `userPassword` varchar(30) DEFAULT NULL,
  `userName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userPhoneNumber` varchar(10) DEFAULT NULL,
  `isAdmin` int DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` VALUES (2,'bachbnvn123@gmail.com','youngbach','Bách Nguyễn','Tân Triều Thanh Trì','0986853388',1),(7,'youngbach000@gmail.com','test123','youngbach',NULL,NULL,0),(8,'youngbach123@gmail.com','test111','Bach Nguyen',NULL,NULL,0),(9,'acccloneeeno1@gmail.com','test','test',NULL,NULL,0),(10,'test@gmail.com','1','test',NULL,NULL,0),(11,'youngbach09@gmail.com','Bachn','BÃ¡ch VÄn',NULL,NULL,0),(12,'youngbach10@gmail.com','1111','BÃ¡ch Nguyá»n',NULL,NULL,0),(13,'youngbach11@gmail.com','1111','Bách Nguyễn',NULL,NULL,0);


CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productQuantity` int NOT NULL,
  `productPrice` int NOT NULL,
  `productImg` varchar(255) NOT NULL,
  `productDescription` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `productCategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `product` VALUES (1,'Laptop Acer Aspire 3 A315-56-58EG 15FHDIPS',1000,565,'img/products/lt-1.jpg','Laptop Acer Aspire 3 A315-56-58EG có thiết kế gọn nhẹ với màn hình 15.6\", chỉ 1.7 kg. Thiết bị là lựa chọn hàng đầu cho người dùng trong phân khúc laptop học tập - văn phòng với bộ vi xử lý Intel Core i5 thế hệ 10 tân tiến.','Laptop'),(2,'Laptop Acer Aspire A315-57G-573F NX.HZRSV.00B',1000,650,'img/products/lt-2.jpg','Laptop Acer Aspire A315-57G-573F NX.HZRSV.00B có thiết kế màn hình viền mỏng, 15.6 inch Full HD để người dùng có được trải nghiệm hình ảnh sắc nét. Bộ vi xử lý Intel Core i5-1035G4 mạnh mẽ. Chiếc laptop sở hữu cấu hình tầm trung với vi xử lý tiết kiệm điện Intel Core i5 1035G1, dung lượng RAM 8GB cùng bộ nhớ trong SSD 512GB. Ngoài ra, máy còn được tích hợp card đồ hoạ rời MX330 2GB giúp người dùng có thể giải trí với các tựa game nhẹ nhàng sau những giờ học tập, làm việc căng thẳng.','Laptop'),(3,'Laptop ASUS Gaming ROG Strix G15 G513QC-HN015T',1000,1220,'img/products/lt-3.jpg','Laptop ASUS ROG Strix G15 G513QC-HN015T là dòng laptop gaming với thiết kế hiện đại, cao cấp. Máy sở hữu cấu hình mạnh mẽ với vi xử lý AMD Ryzen 7 5800H, card đồ họa rời NVIDIA RTX 3050 4GB kết hợp với màn hình 15.6 inch FullHD tần số quét 144Hz hứa hẹn sẽ mang lại trải nghiệm chơi game tuyệt vời.','Laptop'),(4,'Laptop ASUS TUF Gaming FX506HM HN018T',1000,1350,'img/products/lt-4.jpg','Laptop Asus TUF Gaming FX506HM - HN018T là một trong những laptop gaming có hiệu năng vượt trội cùng thiết kế ấn tượng. Thiết bị này được rất nhiều game thủ săn đón trong thời gian qua. Thiết kế thanh thoát, thân thiện với game th','Laptop'),(5,'Laptop Dell G5 15 5500 (70252800)',1000,1220,'img/products/lt-5.jpg','Laptop Dell G5 15 5500 i7 10750H thiết kế đậm chất gaming, chắc chắn sẽ “lọt vào mắt xanh” của những game thủ chuyên nghiệp. Thiết bị sở hữu màu Đen thời thượng, chipset Intel Core i7 10750H “cân” đủ các tựa game đỉnh cao nhất. Laptop Dell G5 15 5500 i7 10750H có ngoại hình đậm chất gaming với kích thước có độ dày 31.13 mm và trọng lượng 2.65 kg, thiết bị này không quá nặng và vẫn có thể đảm bảo được tính linh động của máy, mang theo bên mình đi cafe “chiến” game cùng anh em. ','Laptop'),(6,'Laptop Dell Inspiron 15 3515',1000,650,'img/products/lt-6.jpg','Laptop Dell Inspiron 15 3515 R3-3250U sở hữu màn hình kích thước 15.6 inch lớn, có chế độ chống chói, bảo vệ mắt. Dung lượng lưu trữ lớn 512 GB hỗ trợ lưu trữ tốt các file công việc dùng lâu dài. Ngoài ra, sản phẩm còn sở hữu cấu hình khủng, pin trâu để giúp tối ưu hóa trải nghiệm người dùng.','Laptop'),(7,'Laptop Dell Vostro 3400 70270645',1000,820,'img/products/lt-7.jpg','Laptop Dell Vostro 3400 70270645 có thiết kế mỏng nhẹ nổi bật với màn hình 14 inch, độ dày dưới 2cm và trọng lượng nhẹ 1.64 kg. Thiết bị sở hữu dòng chip Intel i5 thế hệ 11 Tiger lake tiên tiến mang đến cấu hình ổn định tuyệt đỉnh.','Laptop'),(8,'Laptop Gaming Acer Nitro 5 AN515-45-R6EV NH.QBMSV.006',1000,830,'img/products/lt-8.jpg','Laptop Gaming Acer Nitro 5 AN515-45-R6EV sở hữu màn hình có kích thước 15.6 inch, độ phân giải FullHD, tần số quét 144Hz .Bộ vi xử lý AMD Ryzen 5 5600H giúp tăng tốc độ xử lý mọi dữ liệu đồng thời tiết kiệm năng lượng, góp phần kéo dài tuổi thọ pin. Laptop Gaming Acer Nitro 5 AN515-45-R6EV có vẻ ngoài hình mạnh mẽ đặc trưng của dòng Laptop gaming, cùng card đồ họa GeForce GTX 1650 sẽ mang đến sức mạnh chơi game vượt trội. Sản phẩm còn sở hữu màn hình 15.6inch FHD với tần số quét 144Hz mang đến trải nghiệm cực tốt cho người dùng.','Laptop'),(9,'iPhone 11',1000,650,'img/products/dt-1.jpg','iPhone 11 128GB chính hãng có thiết kế hiện đại, thừa hưởng khá nhiều từ sự các thế hệ trước như Xs hay X. Khung viền nhôm chắc chắn cùng với mặt kính đem lại vẻ sang trọng, đẳng cấp. Các góc cạnh được bo tròn. Mặt kính cường lực không chỉ giúp màn hình “mạnh mẽ” hơn mà còn chống xước, chống bám vân tay tốt hơn so với đời trước.','Phone'),(10,'iPhone 12',1000,870,'img/products/dt-2.jpg','iPhone 12 128GB ra mắt nổi bật với mức giá phải chăng nhưng được tích hợp hàng loạt tính năng cao cấp hấp dẫn. Apple iPhone 12 được đánh giá là điện thoại kế nhiệm iPhone 11 hoàn hảo bởi Apple đã tinh chỉnh khá nhiều chi tiết từ ngoại hình đến cấu hình.','Phone'),(11,'iPhone 13',1000,1000,'img/products/dt-3.jpg','iPhone 13 512GB cùng các phiên bản năm nay sẽ có nhiều nâng cấp từ phía camera, dung lượng pin và đặc biệt là thiết kế phần notch bé hơn. Nâng trải nghiệm cho chủ sở hữu lên một tầm cao mới.','Phone'),(12,'Samsung Galaxy Z Flip3 5G',1000,830,'img/products/dt-4.jpg','Samsung Galaxy Z Flip3 5G (Z Flip 3) được thiết kế với các góc cạnh được bo cong hoàn hảo mang lại sự chắc chắn khi sử dụng. Khác với Galaxy Fold đời đầu với cơ chế gập theo chiều dọc, giúp Galaxy Z Flip3 5G chỉ nhỏ bằng phân nửa các điện thoại khác. Bạn có thể cầm máy gọn gàng trong lòng bàn tay, bỏ vào túi quần hay túi áo một cách tiện lợi hơn bao giờ hết','Phone'),(13,'Xiaomi Redmi Note 11 Pro 5G',1000,400,'img/products/dt-5.jpg','Xiaomi Redmi Note 11 Pro 5G 128GB là chiếc điện thoại giá rẻ của Xiaomi, máy có màn hình 6.67 inches. Cấu hình ổn định với chipset Snapdragon 695 5G 8 nhân. Ngoài ra, máy còn có cụm 3 camera với cảm biến 108MP, phù hợp với mọi đối tượng người dùng.','Phone'),(14,'Samsung Galaxy A52',1000,435,'img/products/dt-6.jpg','Samsung Galaxy A52 với những cải tiến về hệ thống camera. Smartphone Samsung mới được trang bị cấu hình mạnh mẽ sẽ mang đến cho bạn những trải nghiệm tuyệt vời.','Phone'),(15,'Samsung Galaxy S21 FE',1000,570,'img/products/dt-7.jpg','Galaxy S21 FE 128GB là thế hệ smartphone tiếp theo thay thế cho người tiền nhiệm của mình là dòng Galaxy S20 FE. Samsung đã định hướng cho sản phẩm FE của mình là một dòng dành riêng cho các fan của hãng với mức giá vô cùng phải chăng nhưng vẫn mang lại hiệu năng vô cùng mạnh mẽ. Đây là chiếc điện thoại Samsung sở hữu thiết kế vô cùng trẻ trung, năng động với nhiều màu sắc cho người dùng thoải mái lựa chọn. Đi kèm với đó là màn hình 6.4 inch AMOLED 120Hz và hiệu năng vô cùng mạnh mẽ với Exynos 2100 hứa hẹn sẽ mang lại trải nghiệm vô cùng tuyệt vời đến người dùng.','Phone'),(16,'Samsung Galaxy A13',1000,210,'img/products/dt-8.jpg','Samsung Galaxy A13 128GB sẽ mang đến cho bạn trải nghiệm tốt hơn so với các dòng sản phẩm có cùng phân khúc giá rẻ bởi cấu hình hoạt động ổn định, hệ thống 3 camera chụp ảnh chi tiết ấn tượng, dung lượng pin đáp ứng tốt thời lượng sử dụng trung bình của một người và ngoại hình tinh tế, màu sắc bắt mắt, trẻ trung và kích thước tổng thể mang tính linh động cao.','Phone');


CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT '0',
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order` VALUES (5,13,'Bách Văn','0986853388','Hà Nội',2700,'2022-05-28','0'),(6,1,'Sơn','0986853388','bắc ninh',650,'2022-06-19','0');


CREATE TABLE `orderdetail` (
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `orderdetail` VALUES (5,4,2),(6,2,1);

CREATE TABLE `payment` (
  `paymentId` int NOT NULL,
  `paymentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`paymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `payment` VALUES (1,'COD'),(2,'VNP');

CREATE TABLE `vnp_return` (
	orderId int not null,
    vnp_TxnRef varchar(50) default null,
    vnp_Amount varchar(50) default null,
    vnp_OrderInfo varchar(250) default null,
    vnp_ResponseCode varchar(50) default null,
    vnp_TransactionNo varchar(50) default null,
    vnp_BankCode varchar(50) default null,
    vnp_PayDate varchar(50) default null,
    foreign key(orderId) references `order` (`orderId`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
