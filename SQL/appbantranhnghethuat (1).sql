-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 02:36 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appbantranhnghethuat`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL COMMENT 'Mã admin',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên đăng nhập',
  `name_admin` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên admin',
  `Password` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Password admin',
  `poto_admin` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ảnh của admin',
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email của admin',
  `Phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại admin',
  `Address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ của admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL COMMENT 'Mã khách hàng',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên đăng nhập của khách hàng',
  `name_customer` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên đầy đủ của khách hàng',
  `poto_customer` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ảnh của khách hàng',
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email của khách hàng',
  `Password` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mật khẩu của khách hàng ',
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số điện thoại của khách hàng',
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa chỉ của khách hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL COMMENT 'Mã đơn hàng',
  `id_customer` int(11) NOT NULL COMMENT 'Mã khách hàng ',
  `Payments` enum('Trả tiền mặt') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên hình thức thanh toán',
  `Order_date` datetime NOT NULL COMMENT 'Ngày đặt hàng',
  `Delivery_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa chỉ giao hàng',
  `Delivery_date` date NOT NULL COMMENT 'Ngày giao hàng',
  `Note` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú đơn hàng',
  `Total_money` float NOT NULL COMMENT 'Tổng tiền của đơn hàng',
  `Delivery_status` enum('Chưa xử lý','Đang xử lý','Đã xử lý') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tìng trạng đơn hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `id_order_detail` int(11) NOT NULL COMMENT 'Mã chi tiết đơn hàng',
  `id_product` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `id_order` int(11) NOT NULL COMMENT 'Mã đơn hàng',
  `Amount` int(11) NOT NULL COMMENT 'Số lượng sản phẩm trong đơn hàng',
  `Price` float NOT NULL COMMENT 'Giá của từng sản phẩm trong đơn hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `name_product` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên sản phẩm',
  `poto_product` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh sản phẩm',
  `price_product` float NOT NULL COMMENT 'Giá sản phẩm ',
  `product_material` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chất liệu của sản phẩm',
  `product_dimensions` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kích thước của sản phẩm',
  `year_of_creation` year(4) NOT NULL COMMENT 'Năm sáng tác sản phẩm',
  `product_description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả sản phẩm',
  `note_products` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú của sản phẩm',
  `id_catalog` int(11) NOT NULL COMMENT 'Mã danh mục sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `poto_product`, `price_product`, `product_material`, `product_dimensions`, `year_of_creation`, `product_description`, `note_products`, `id_catalog`) VALUES
(1, 'Bình minh trên biển', 'binhminhtrenbien.jpeg', 3500000, 'Acrylic', '1000 x 1200cm', 2019, 'Một bức tranh về đề tài biển của mình, cảm hứng của mình về những hôm thức dậy sớm đón bình minh trên biển.', NULL, 6),
(2, 'Tháng 3 Làng Là', 'thangbalangla.jpg', 7500000, 'Sơn dầu', ' 70x 90 cm', 2020, 'Tranh được vẽ trong chuyến trực họa tháng 3 tại Tuyên Quang', NULL, 8),
(4, 'Vườn quê', 'vuonque.jpg', 12000000, 'Acrylic', '80 x 100cm ', 2022, 'Vẽ về cảnh một góc vườn quê ngoại với hình ảnh chính là các bé gái đang cho đàn gà ăn trong khu vườn quê bình dị và thân thương, có bụi chuối đã trổ buồng, mái tường quê cũ kỉ toác nứt rõ vết gạch loang lỗ. Từng tia nắng sớm mai chiếu rọi hắt qua từng khóm lá, ngọn cỏ khiến cho khu vườn trở nên ấm áp. Tác phẩm nằm trong Series “Kí ức tuổi thơ”.\r\n', NULL, 8),
(5, 'Khúc sông quê', 'khucsongque.jpg', 7000000, 'Acrylic', '60 x 80cm', 2021, 'Tranh diễn tả một khúc sông của làng quê trong ánh nắng ban mai vàng rực rỡ, ấm áp. Dòng sông lóng lánh những tia nắng ôm ấp tiếng cười khúc khích trẻ thơ nô đùa trên sóng nước. Trên bến sông, có con trâu đang tắm mát dưới làn sóng nước cùng chú bé cưỡi mình trên lưng trâu. Phía xa là đàn vịt bơi lội tung tăng dưới dòng nước. Tất cả tạo nên một  bức tranh tuyệt đẹp về khúc sông quê.', NULL, 8),
(6, 'Vị Xưa', 'vixua.jpeg', 5000000, 'Acrylic', '55x 73cm', 2022, 'Tuổi thơ ngày xưa của người nông đân VIỆT NAM,ai cũng sẽ nhớ mãi vị thơm nức mũi của châu chấu nướng , muôm muỗm , nướng! béo ngậy để rồi vang vọng mãi trong tâm trí mùi vị ấy! đồng ruộng nhiều nơi ko còn nữa các nhà máy mọc lên khoảng trời xưa không còn nữa . tuổi thơ theo mẹ trên cánh đồng lộng gió hoà mình vào thiên nhiên cây cỏ ! đuổi bắt châu chấu có khi chật túi rồi ko biết cất đâu lại vẹn vào gấu quần gấu áo mang về, nướng ăn thơm nức mũi mà vị đặc trưng ko sao quên được ! ……… ', NULL, 8),
(7, 'Chiều quê yên bình', 'chieuqueyenbinh.jpeg', 2000000, ' Acrylic', '73x 55cm', 2022, 'Tranh tả một góc quê nghèo thân thương và gần gũi,khi những tia nắng cuối chiều còn xót cũng là lúc mọi người đi làm về , những bước chân trần trên đất mộc mạc,cái nón lá , cái quần sắn gấu cũng như thân quen với người nhà nông từ khi nào ko biết? chú bò to là vậy mà hiền lành , bước những bước chậm dãi ung dung trong trong cảnh thanh bình ấy, con người con vật nơi đây đều là nét đẹp đặc trưng của làng quê việt nam. con người việt nam thân thương dễ mến chân chất hiền lành và rất chịu khó ! phụ nữ VIỆT NAM đảm đang tảo tần . bao công việc đồng áng đều ko quản vất vả! vẫn chu toàn bếp núc nhà cửa. tia nắng cuối chiều khiễn cảnh vật nên thơ hữu tình ! như thường lệ cậu vàng lại ra cổng ngóng chủ về . chú gà trống cũng dõi theo mà nhìn chủ đang ở đằng xa! những chua gà con vẫn hồn nhiên nô đùa bên bãi cỏ lề đường! con đường quê cũng hơi xe xe khô sau cơn mưa vẫn còn lầy lội ! mùi bùn tanh mùi đất nồng như gợi nhắc ta nhớ về quê hương ta , giúp tâm hồn ta thêm bình yên và thoải mái ! cảm ơn mọi người đã xem tranh! TÔN VINH VẺ ĐẸP QUÊ HƯƠNG VIỆT NAM! ', 'Tranh đã có khung gỗ!', 8),
(8, 'Lúa vàng', 'luavang.jpg', 5000000, 'Sơn dầu', ' 60 x 80 cm', 2021, 'Mùa lúa chín vàng có lẽ là mùa hạnh phúc nhất của người nông dân qua một thời gian chăm sóc,thu hoạch xong cũng là thời gian nghỉ ngơi để chuẩn bị cho mùa vụ mới.', NULL, 8),
(9, 'Ngày cuối năm', 'ngaycuoinam.jpeg', 15000000, 'Sơn dầu', '60 x 80 cm', 2021, 'Tranh vẽ khung cảnh bàn tiệc cuối năm', 'Đã bao gồm khung', 12),
(10, 'Góc thân quen', 'gocthanquen.jpeg', 4500000, 'Sơn dầu', '30x40cm', 2021, 'Tranh tĩnh vật mộc mạc từ những đồ rất thân quen trong bếp. Một bình cỏ khô tạo không qian rất đáng yêu.', NULL, 12),
(11, 'Tĩnh vật hoa quả', 'tinhvathoaqua.jpeg', 4000000, 'Sơn dầu', '60×80cm', 2021, 'Tranh mô tả cách trang trí bố cục đĩa hoa quả đơn giản', NULL, 12),
(12, 'Chớm Đông', 'chomdong.jpeg', 7000000, 'Sơn dầu', '40 cm x 40 cm', 2021, 'Tranh mô tả sự vật một chút lãng đãng khi Đông về…', NULL, 12),
(13, 'Chở che yêu thương', 'chechoyeuthuong.jpg', 5000000, 'Acrylic', '80x 60cm', 2022, 'Sư yêu thương đùm bọc che chở là rất cần thiết đối với con người. Thể hiện lòng tương ái thân thương trong gđ và ngoài xã hội. Tp ẩn dụ muốn nói lên lòng vị tha của mỗi người trong cuộc sống.', NULL, 16),
(14, 'Cô gái bên sen', 'cogaibensen.jpg', 22000000, 'Sơn dầu', '125× 125cm', 2020, 'Vẻ đẹp thanh tao của cô gái được hoạ sỹ bộc bạch như 1 cành sen. Nét vẽ dân gian và đương đại đc hội tụ trong tác phẩm.', NULL, 16),
(15, 'Nàng Sen', 'nangsen.jpg', 18000000, 'Sơn mài', '60x 80cm', 2020, 'Bức tranh mô tả một cô gái đẹp đang đứng cạnh những bông hoa sen rực rỡ.', NULL, 16),
(16, 'Đón nắng', 'donnang.jpg', 10000000, 'Acrylic', '80 x100cm', 2022, 'hững đóa sen trắng tinh khiết nở rộ, giọt sương sớm còn đọng lại trên cánh sen, bầy vịt tắm mình dưới dòng nước mát lạnh, trong xanh khiến cho cả đầm sen trở nên lung linh, bừng tỉnh.', NULL, 16),
(17, 'Sắc vàng', 'sacvang.jpg', 2000000, 'Acrylic', '50x 40 cm', 2021, 'Sắc vàng của hoa hồng rực rỡ bức tranh thật đẹp.', NULL, 17),
(18, 'Đóa hồng trắng', 'doahongtrang.jpg', 6000000, 'Sơn dầu', '50x60cm', 2021, 'Tôi vẫn luôn yêu thích màu trắng của các loài hoa, màu trắng đó nhẹ nhàng thanh thoát. Không rực rỡ sắc màu, không kiêu sa hay nổi bật nhưng vẫn tràn đầy hương và sắc.\r\nBức tranh này cũng xuất phát từ cảm xúc với hoa trăng ấy. Tôi muốn đặc biệt nhấn mạnh vào màu trắng, muốn nhấn mạnh về sự thanh thoát, tinh khôi ấy, để hông hoa hồng trắng bản thân tự bừng sáng lên.', NULL, 17),
(19, 'Hồng vàng', 'hongvang.jpg', 10000000, 'Acrylic', '65X81cm', 2020, 'Tác phẩm này với gam màu nâu hồng thể hiện sự ấm áp.Một bức tranh hoa nhưng nao nức trong lòng,nếu như vào những ngày đông nó sẽ là những gì an ủi nhất cho những người xa quê.', NULL, 17),
(20, 'Vườn hồng ngày xuân', 'vuonhongngayxuan.jpeg', 3000000, 'Arcylic', '50x 60cm', 2019, 'Bức tranh mô tả những cành hồng rực rỡ khi xuân về...', NULL, 17),
(21, 'Rừng hoa mẫu đơn', 'rungmaudon.jpg', 4000000, 'Acrylic', '60x100cm', 2020, 'Hoa mẫu đơn dày đặc khiến chúng ta đang tưởng lạc vào rừng hoa ', NULL, 18),
(22, 'Mẫu đơn trắng', 'maudontrang.jpeg', 3800000, 'Acrylic', '50x80cm', 2021, 'Hoa mẫu đơn trắng trong sương vàng, tinh khôi dịu dàng, đằm thắm….', NULL, 18),
(23, 'Ngày rực rỡ', 'ngayrucro.jpeg', 3000000, 'Acrylic', '50x60cm', 2021, 'Bức tranh mô tả những đóa hoa mẫu đơn giúp cho ngày làm việc hiệu quả và rực rỡ.', NULL, 18),
(24, 'Biển Hát', 'bienhat.jpg', 7000000, 'Sơn dầu', '40x 90cm', 2018, 'Trong bức tranh sơn dầu Biển hát họa sĩ như vẽ nên một đại dương rộng lớn với những con sóng trùng trùng điệp điệp xô vào bờ. Những con sóng như nhảy múa dưới khoảng trời mênh mông. Điệu múa của nó như làm chủ chủ thiên hạ bởi giai điệu sôi động, âm thanh thanh gầm rú của mình. Trong khung cảnh khắc nghiệt ấy của thiên nhiên, mà họa sĩ có thể đưa đến người xem một cảm giác thơ mộng. Không có nhiều màu sắc rực rỡ trong bức tranh nhưng hoạ sĩ vẫn thành công trong việc đưa người xem đến với khung cảnh chân thật như hiện ra trước mắt. Ở khung cảnh đó người xem có thể cùng nhảy múa với vũ điệu biển cả.', NULL, 6),
(25, 'Ven phá tam giang', 'venphatamgiang.jpeg', 8000000, 'Acrylic', '1mx1m2', 2020, 'Bức tranh phong cảnh này đã được họa sĩ Lê Hữu Long trực họa tại ven phá Tam Giang của Huế. Phong cảnh trong bức tranh mang một sắc màu tươi sáng, hài hòa, với bầu trời trong xanh, với màu nước biển cũng xanh nhưng là xanh thăm thẳm, với một con thuyền lớn đang được neo lại ở gần bến. Con thuyền có màu sơn còn rất mới, đang sẵn sàng căng buồm đón gió để chuẩn bị ra khơi. Đặc biệt bức tranh con được điểm xuyết bởi hình ảnh sinh hoạt đời thường rất thân thuộc, gần gũi của con người. Đó là người vợ đang đứng tiễn chồng ở bến, chuẩn bị cho người chồng một cuộc hành trình ra khơi sắp tới. Bức tranh vừa miêu tả cảnh sắc hữu tình của quê hương, vừa gợi nên tấm lòng thủy chung, thiết tha, mặn nồng – cái hữu tình giữa người với người ở nơi xứ Huế mộng mơ.', NULL, 6),
(26, 'Bến Vắng', 'benvang.jpeg', 12000000, 'Sơn dầu ', '100 x 80 cm', 2019, 'Bên bến sông vắng có những con thuyền đang neo đậu, chờ những người chủ của chúng quay về..', NULL, 6),
(27, 'Sóng xô', 'songxo.jpg', 12000000, 'Arcylic', '90 x 90 cm', 2019, 'Bức tranh miêu tả về những con sóng xô với góc nhìn từ trên cao nhìn xuống những con sóng trở nên lạ thường hai tông màu trắng và đen hòa quyện với nhau hình ảnh những con sóng như những hiện tượng kì lạ để lại những tò mò những cảm xúc khó quên. À thì ra, sóng cũng có những tính cách của sóng, đặc trưng của nó, không hề chỉ có một màu tẻ nhạt.', NULL, 6),
(28, 'THUYỀN và BẾN\r\n', 'thuyenvaben.jpg', 15000000, 'Sơn dầu', '80 × 100 cm', 2019, 'Vẽ về một làng chài, bà con ngư dân đang chuẩn bị ra khơi!\r\nBức tranh phong cảnh Thuyền Và Biển miêu tả cảnh những con thuyền của bà con ngư dân đang chuẩn bị ra khơi bố cục của bức tranh rất cân xứng màu nền của trời và biển hài hòa với nhau trung tâm là hình ảnh ngọn núi và cuộc sống của người dân trong cái nét thanh bình, trong cái nền trời nhẹ nhàng với những đám mây trắng đang in trên dòng nước thì bên cạnh đó là cuộc sống tấp nập đông vui trong cảnh biển trao đổi chuẩn bị cho chuyến đi mới.', NULL, 6),
(29, 'Ra khơi bám biển', 'rakhoibambien.jpg', 14000000, 'Sơn dầu', '90 cm x 120 cm', 2020, 'Những thuyền đánh cá cứ nhấp nhô nhấp nhô hoà cùng với màu xanh như ngọc của  biển cảc bên trên là mây trời đã cho tôi một ấn tượng khó quên sau một lần đi qua vùng biển ấy và tôi đã sáng tác nên tác phẩm này.', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `products_catalog`
--

CREATE TABLE `products_catalog` (
  `id_catalog` int(11) NOT NULL COMMENT 'Mã danh mục',
  `name_catalog` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên danh mục'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_catalog`
--

INSERT INTO `products_catalog` (`id_catalog`, `name_catalog`) VALUES
(1, 'Tranh Núi Rừng'),
(2, 'Tranh Phố Cổ'),
(5, 'Tranh Thiếu Nữ'),
(6, 'Tranh Phong Cảnh Biển'),
(7, 'Tranh Phong Cảnh Vùng Cao'),
(8, 'Tranh Phong Cảnh Đồng Quê'),
(9, 'Tranh Ngõ Nhỏ,Phố Nhỏ'),
(12, 'Tranh Tĩnh Vật'),
(13, 'Tranh Phật Giáo'),
(14, 'Tranh Trừu Tượng'),
(15, 'Tranh Khắc Gỗ'),
(16, 'Tranh Hoa Sen'),
(17, 'Tranh Hoa Hồng'),
(18, 'Tranh Hoa Mẫu Đơn');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL COMMENT 'Mã Slider',
  `titile_sider` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề Slider',
  `image_slider` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh Slider'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `titile_sider`, `image_slider`) VALUES
(1, 'Phong cảnh đồng quê', 'tranh_phong_canh_dong_que_slider.jpg'),
(2, 'Sơn dầu phong cảnh', 'tranh_son_dau_phong_canh_slider.jpg'),
(3, 'Tranh thêu', 'tranh_theu_chu_thap_slider.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `id_product` (`id_product`,`id_order`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_catalog` (`id_catalog`),
  ADD KEY `id_catalog_2` (`id_catalog`);

--
-- Indexes for table `products_catalog`
--
ALTER TABLE `products_catalog`
  ADD PRIMARY KEY (`id_catalog`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã admin';

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã khách hàng';

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn hàng';

--
-- AUTO_INCREMENT for table `order details`
--
ALTER TABLE `order details`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã chi tiết đơn hàng';

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products_catalog`
--
ALTER TABLE `products_catalog`
  MODIFY `id_catalog` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã Slider', AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `order details_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_catalog`) REFERENCES `products_catalog` (`id_catalog`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
