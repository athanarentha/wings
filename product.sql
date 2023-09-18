-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2023 at 03:03 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE `error_log` (
  `ID` bigint(50) UNSIGNED NOT NULL,
  `Table_ID` varchar(40) DEFAULT NULL,
  `Evt` varchar(20) DEFAULT NULL,
  `SqLoad` text,
  `Error_Msg` text,
  `Date_Error` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IP_Address` varchar(30) DEFAULT NULL,
  `DBase` varchar(50) DEFAULT NULL,
  `Customer_ID` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `error_log`
--

INSERT INTO `error_log` (`ID`, `Table_ID`, `Evt`, `SqLoad`, `Error_Msg`, `Date_Error`, `IP_Address`, `DBase`, `Customer_ID`) VALUES
(1, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 12:49:53', '127.0.0.1', 'product -- ', NULL),
(2, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 12:50:14', '127.0.0.1', 'product -- ', NULL),
(3, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 12:54:55', '127.0.0.1', 'product -- ', NULL),
(4, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 12:56:22', '127.0.0.1', 'product -- ', NULL),
(5, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 13:01:08', '127.0.0.1', 'product -- ', NULL),
(6, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 13:01:36', '127.0.0.1', 'product -- ', NULL),
(7, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 13:02:42', '127.0.0.1', 'product -- ', NULL),
(8, '', 'rows', 'mysqli_num_rows', '', '2023-09-18 13:03:30', '127.0.0.1', 'product -- ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uuid`, `user`, `password`) VALUES
(1, '2f9da06a-5eff-461d-865f-5f4ec313f8f4', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `product_code` varchar(18) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `stock` int(10) DEFAULT '0',
  `price` double(6,2) DEFAULT '0.00',
  `currency` varchar(5) DEFAULT 'IDR',
  `discount` double(6,2) DEFAULT '0.00',
  `dimension` varchar(50) DEFAULT NULL,
  `unit` varchar(5) DEFAULT NULL,
  `images` text,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `uuid`, `product_code`, `product_name`, `brand`, `stock`, `price`, `currency`, `discount`, `dimension`, `unit`, `images`, `description`) VALUES
(1, 'b7467cc2-6c64-4b25-b93b-4e8ad594ec29', 'IPH-9', 'iPhone 9', 'Apple', 94, 549.00, 'USD', 12.96, '2cm x 2 cm', 'pcs', 'https://i.dummyjson.com/data/products/1/1.jpg,https://i.dummyjson.com/data/products/1/2.jpg,https://i.dummyjson.com/data/products/1/3.jpg,https://i.dummyjson.com/data/products/1/4.jpg,https://i.dummyjson.com/data/products/1/thumbnail.jpg', 'An apple mobile which is nothing like apple'),
(2, '14e70747-77ce-49b3-95bf-0f9616b31906', 'IPH-X', 'iPhone X', 'Apple', 34, 899.00, 'USD', 17.94, '17cm x 84 cm', 'pcs', 'https://i.dummyjson.com/data/products/2/1.jpg,https://i.dummyjson.com/data/products/2/2.jpg,https://i.dummyjson.com/data/products/2/3.jpg,https://i.dummyjson.com/data/products/2/thumbnail.jpg', 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...'),
(3, '876ec994-05c2-41cf-affb-e83b255c80a6', 'SAM-9', 'Samsung Universe 9', 'Samsung', 36, 1249.00, 'USD', 15.46, '77cm x 9 cm', 'pcs', 'https://i.dummyjson.com/data/products/3/1.jpg', 'Samsung&#039;s new variant which goes beyond Galaxy to the Universe'),
(4, '2e584ab4-bcf6-4c8c-845a-49acef68f0db', 'OPP-F19', 'OPPOF19', 'OPPO', 123, 280.00, 'USD', 17.91, '54cm x 17 cm', 'pcs', 'https://i.dummyjson.com/data/products/4/1.jpg,https://i.dummyjson.com/data/products/4/2.jpg,https://i.dummyjson.com/data/products/4/3.jpg,https://i.dummyjson.com/data/products/4/4.jpg,https://i.dummyjson.com/data/products/4/thumbnail.jpg', 'OPPO F19 is officially announced on April 2021.'),
(5, '4a43796e-b291-44f6-b583-d8dd4a31a3fb', 'HUA-P30', 'Huawei P30', 'Huawei', 32, 499.00, 'USD', 10.58, '18cm x 9 cm', 'pcs', 'https://i.dummyjson.com/data/products/5/1.jpg,https://i.dummyjson.com/data/products/5/2.jpg,https://i.dummyjson.com/data/products/5/3.jpg', 'Huaweiâ€™s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.'),
(6, '964968a8-1758-497b-902c-948733e84e83', 'MAC-Pro', 'MacBook Pro', 'Apple', 83, 1749.00, 'USD', 11.02, '1cm x 7 cm', 'pcs', 'https://i.dummyjson.com/data/products/6/1.png,https://i.dummyjson.com/data/products/6/2.jpg,https://i.dummyjson.com/data/products/6/3.png,https://i.dummyjson.com/data/products/6/4.jpg', 'MacBook Pro 2021 with mini-LED display may launch between September, November'),
(7, 'cfac5f81-b0dd-4225-b4d8-0cc310c978bc', 'SAM-Book', 'Samsung Galaxy Book', 'Samsung', 50, 1499.00, 'USD', 4.15, '70cm x 49 cm', 'pcs', 'https://i.dummyjson.com/data/products/7/1.jpg,https://i.dummyjson.com/data/products/7/2.jpg,https://i.dummyjson.com/data/products/7/3.jpg,https://i.dummyjson.com/data/products/7/thumbnail.jpg', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched'),
(8, '4ddc86d1-72d6-4dbd-8ba9-e1ec5f8cf7be', 'MIC-SL4', 'Microsoft Surface Laptop 4', 'Microsoft Surface', 68, 1499.00, 'USD', 10.23, '24cm x 27 cm', 'pcs', 'https://i.dummyjson.com/data/products/8/1.jpg,https://i.dummyjson.com/data/products/8/2.jpg,https://i.dummyjson.com/data/products/8/3.jpg,https://i.dummyjson.com/data/products/8/4.jpg,https://i.dummyjson.com/data/products/8/thumbnail.jpg', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.'),
(9, 'facaf2f2-1c8a-4ad1-a1b8-8f2ca0a69dfb', 'INF-INBOOK', 'Infinix INBOOK', 'Infinix', 96, 1099.00, 'USD', 11.83, '56cm x 59 cm', 'pcs', 'https://i.dummyjson.com/data/products/9/1.jpg,https://i.dummyjson.com/data/products/9/2.png,https://i.dummyjson.com/data/products/9/3.png,https://i.dummyjson.com/data/products/9/4.jpg,https://i.dummyjson.com/data/products/9/thumbnail.jpg', 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey â€“ 1 Year Warranty'),
(10, '87befd7c-7b9b-4931-9786-19de26141216', 'HP-P15', 'HP Pavilion 15-DK1056WM', 'HP Pavilion', 89, 1099.00, 'USD', 6.18, '57cm x 98 cm', 'pcs', 'https://i.dummyjson.com/data/products/10/1.jpg,https://i.dummyjson.com/data/products/10/2.jpg,https://i.dummyjson.com/data/products/10/3.jpg,https://i.dummyjson.com/data/products/10/thumbnail.jpeg', 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10'),
(11, '3f24740f-c52f-4cf5-900b-14f62d04b9de', 'PER-Oil', 'perfume Oil', 'Impression of Acqua Di Gio', 65, 13.00, 'USD', 8.40, '74cm x 18 cm', 'pcs', 'https://i.dummyjson.com/data/products/11/1.jpg,https://i.dummyjson.com/data/products/11/2.jpg,https://i.dummyjson.com/data/products/11/3.jpg,https://i.dummyjson.com/data/products/11/thumbnail.jpg', 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil'),
(12, '3a9a07d6-6bec-4e55-ade5-6867938e0b17', 'BRO-Per', 'Brown Perfume', 'Royal_Mirage', 52, 40.00, 'USD', 15.66, '53cm x 98 cm', 'pcs', 'https://i.dummyjson.com/data/products/12/1.jpg,https://i.dummyjson.com/data/products/12/2.jpg,https://i.dummyjson.com/data/products/12/3.png,https://i.dummyjson.com/data/products/12/4.jpg,https://i.dummyjson.com/data/products/12/thumbnail.jpg', 'Royal_Mirage Sport Brown Perfume for Men &amp; Women - 120ml'),
(13, 'ee9e1e7a-d341-4fd2-b2ee-df41060905fa', 'FOG', 'Fog Scent Xpressio Perfume', 'Fog Scent Xpressio', 61, 13.00, 'USD', 8.14, '38cm x 2 cm', 'pcs', 'https://i.dummyjson.com/data/products/13/1.jpg,https://i.dummyjson.com/data/products/13/2.png,https://i.dummyjson.com/data/products/13/3.jpg,https://i.dummyjson.com/data/products/13/4.jpg,https://i.dummyjson.com/data/products/13/thumbnail.webp', 'Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men'),
(14, 'd56603d1-2fd2-4c8d-b6ce-b9e3f644f8b6', 'NON', 'Non-Alcoholic Concentrated Perfume Oil', 'Al Munakh', 114, 120.00, 'USD', 15.60, '73cm x 43 cm', 'pcs', 'https://i.dummyjson.com/data/products/14/1.jpg,https://i.dummyjson.com/data/products/14/2.jpg,https://i.dummyjson.com/data/products/14/3.jpg,https://i.dummyjson.com/data/products/14/thumbnail.jpg', 'Original Al MunakhÂ® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil'),
(15, '6f50e142-21a8-4ade-bbd1-4d8e3a9fb510', 'EAU', 'Eau De Perfume Spray', 'Lord - Al-Rehab', 105, 30.00, 'USD', 10.99, '59cm x 64 cm', 'pcs', 'https://i.dummyjson.com/data/products/15/1.jpg,https://i.dummyjson.com/data/products/15/2.jpg,https://i.dummyjson.com/data/products/15/3.jpg,https://i.dummyjson.com/data/products/15/4.jpg,https://i.dummyjson.com/data/products/15/thumbnail.jpg', 'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality'),
(16, '5471d8f7-3d20-42ee-9c2d-55b02033b85a', 'HYA', 'Hyaluronic Acid Serum', 'L&#039;Oreal Paris', 110, 19.00, 'USD', 13.31, '89cm x 46 cm', 'pcs', 'https://i.dummyjson.com/data/products/16/1.png,https://i.dummyjson.com/data/products/16/2.webp,https://i.dummyjson.com/data/products/16/3.jpg,https://i.dummyjson.com/data/products/16/4.jpg,https://i.dummyjson.com/data/products/16/thumbnail.jpg', 'L&#039;OrÃƒÂ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid'),
(17, '1cb156ed-b544-4ea6-909e-c6515c5eac1e', 'TRE', 'Tree Oil 30ml', 'Hemani Tea', 78, 12.00, 'USD', 4.09, '9cm x 1 cm', 'pcs', 'https://i.dummyjson.com/data/products/17/1.jpg,https://i.dummyjson.com/data/products/17/2.jpg,https://i.dummyjson.com/data/products/17/3.jpg,https://i.dummyjson.com/data/products/17/thumbnail.jpg', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,'),
(18, 'fe98dbfe-964b-45ec-bea6-6fe63311d7f2', 'OIL', 'Oil Free Moisturizer 100ml', 'Dermive', 88, 40.00, 'USD', 13.10, '98cm x 89 cm', 'pcs', 'https://i.dummyjson.com/data/products/18/1.jpg,https://i.dummyjson.com/data/products/18/2.jpg,https://i.dummyjson.com/data/products/18/3.jpg,https://i.dummyjson.com/data/products/18/4.jpg,https://i.dummyjson.com/data/products/18/thumbnail.jpg', 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid &amp; sunscreen.'),
(19, '2f828c4f-e343-447c-bdcf-d81383df3f98', 'SKI', 'Skin Beauty Serum.', 'ROREC White Rice', 54, 46.00, 'USD', 10.68, '27cm x 62 cm', 'pcs', 'https://i.dummyjson.com/data/products/19/1.jpg,https://i.dummyjson.com/data/products/19/2.jpg,https://i.dummyjson.com/data/products/19/3.png,https://i.dummyjson.com/data/products/19/thumbnail.jpg', 'Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m'),
(20, 'f88a3ed3-66bb-4c77-a274-54fab65b904e', 'FRE', 'Freckle Treatment Cream- 15gm', 'Fair &amp; Clear', 140, 70.00, 'USD', 16.99, '68cm x 33 cm', 'pcs', 'https://i.dummyjson.com/data/products/20/1.jpg,https://i.dummyjson.com/data/products/20/2.jpg,https://i.dummyjson.com/data/products/20/3.jpg,https://i.dummyjson.com/data/products/20/4.jpg,https://i.dummyjson.com/data/products/20/thumbnail.jpg', 'Fair &amp; Clear is Pakistan&#039;s only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects.'),
(21, 'e0817010-2428-49ae-8894-21be49db83da', 'DAA-500', '- Daal Masoor 500 grams', 'Saaf &amp; Khaas', 133, 20.00, 'USD', 4.81, '32cm x 73 cm', 'pcs', 'https://i.dummyjson.com/data/products/21/1.png,https://i.dummyjson.com/data/products/21/2.jpg,https://i.dummyjson.com/data/products/21/3.jpg', 'Fine quality Branded Product Keep in a cool and dry place'),
(22, 'c05d4326-8045-4e75-8a2d-d1ac599c2d94', 'ELB', 'Elbow Macaroni - 400 gm', 'Bake Parlor Big', 146, 14.00, 'USD', 15.58, '87cm x 30 cm', 'pcs', 'https://i.dummyjson.com/data/products/22/1.jpg,https://i.dummyjson.com/data/products/22/2.jpg,https://i.dummyjson.com/data/products/22/3.jpg', 'Product details of Bake Parlor Big Elbow Macaroni - 400 gm'),
(23, 'beb2be28-a47d-4e48-a519-ce3e114f22ce', 'ORA', 'Orange Essence Food Flavou', 'Baking Food Items', 26, 14.00, 'USD', 8.04, '59cm x 75 cm', 'pcs', 'https://i.dummyjson.com/data/products/23/1.jpg,https://i.dummyjson.com/data/products/23/2.jpg,https://i.dummyjson.com/data/products/23/3.jpg,https://i.dummyjson.com/data/products/23/4.jpg,https://i.dummyjson.com/data/products/23/thumbnail.jpg', 'Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item'),
(24, '13a6f080-9bd9-45df-92bd-d6770c40c41b', 'CER', 'cereals muesli fruit nuts', 'fauji', 113, 46.00, 'USD', 16.80, '49cm x 86 cm', 'pcs', 'https://i.dummyjson.com/data/products/24/1.jpg,https://i.dummyjson.com/data/products/24/2.jpg,https://i.dummyjson.com/data/products/24/3.jpg,https://i.dummyjson.com/data/products/24/4.jpg,https://i.dummyjson.com/data/products/24/thumbnail.jpg', 'original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji'),
(25, 'eee57766-3868-4b10-9299-79513dffc865', 'GUL', 'Gulab Powder 50 Gram', 'Dry Rose', 47, 70.00, 'USD', 13.58, '18cm x 3 cm', 'pcs', 'https://i.dummyjson.com/data/products/25/1.png,https://i.dummyjson.com/data/products/25/2.jpg,https://i.dummyjson.com/data/products/25/3.png,https://i.dummyjson.com/data/products/25/4.jpg,https://i.dummyjson.com/data/products/25/thumbnail.jpg', 'Dry Rose Flower Powder Gulab Powder 50 Gram â€¢ Treats Wounds'),
(26, '069fc8ec-e1fd-47f5-8083-a9c2412c7c4f', 'PLA', 'Plant Hanger For Home', 'Boho Decor', 131, 41.00, 'USD', 17.86, '11cm x 62 cm', 'pcs', 'https://i.dummyjson.com/data/products/26/1.jpg,https://i.dummyjson.com/data/products/26/2.jpg,https://i.dummyjson.com/data/products/26/3.jpg,https://i.dummyjson.com/data/products/26/4.jpg,https://i.dummyjson.com/data/products/26/5.jpg,https://i.dummyjson.com/data/products/26/thumbnail.jpg', 'Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf'),
(27, 'c5c2b51c-36af-431f-af0e-0511bf3442c0', 'FLY', 'Flying Wooden Bird', 'Flying Wooden', 17, 51.00, 'USD', 15.58, '2cm x 89 cm', 'pcs', 'https://i.dummyjson.com/data/products/27/1.jpg,https://i.dummyjson.com/data/products/27/2.jpg,https://i.dummyjson.com/data/products/27/3.jpg,https://i.dummyjson.com/data/products/27/4.jpg,https://i.dummyjson.com/data/products/27/thumbnail.webp', 'Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm'),
(28, '10ea0de4-2bb1-45a2-a2b8-11e6622ed28b', '3D ', '3D Embellishment Art Lamp', 'LED Lights', 54, 20.00, 'USD', 16.49, '97cm x 26 cm', 'pcs', 'https://i.dummyjson.com/data/products/28/1.jpg,https://i.dummyjson.com/data/products/28/2.jpg,https://i.dummyjson.com/data/products/28/3.png,https://i.dummyjson.com/data/products/28/4.jpg,https://i.dummyjson.com/data/products/28/thumbnail.jpg', '3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)'),
(29, '9caac072-c416-4db2-b967-fe77c3ca71e2', 'HAN', 'Handcraft Chinese style', 'luxury palace', 7, 60.00, 'USD', 15.34, '82cm x 54 cm', 'pcs', 'https://i.dummyjson.com/data/products/29/1.jpg,https://i.dummyjson.com/data/products/29/2.jpg,https://i.dummyjson.com/data/products/29/3.webp,https://i.dummyjson.com/data/products/29/4.webp,https://i.dummyjson.com/data/products/29/thumbnail.webp', 'Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate'),
(30, '9325b785-2a7c-4c6a-86cc-132b1b046bda', 'KEY', 'Key Holder', 'Golden', 54, 30.00, 'USD', 2.92, '51cm x 54 cm', 'pcs', 'https://i.dummyjson.com/data/products/30/1.jpg,https://i.dummyjson.com/data/products/30/2.jpg,https://i.dummyjson.com/data/products/30/3.jpg,https://i.dummyjson.com/data/products/30/thumbnail.jpg', 'Attractive DesignMetallic materialFour key hooksReliable &amp; DurablePremium Quality');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `document_code` varchar(3) NOT NULL,
  `document_number` varchar(10) NOT NULL,
  `product_code` varchar(18) NOT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` double(6,2) NOT NULL,
  `unit` varchar(5) NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `currency` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `uuid`, `document_code`, `document_number`, `product_code`, `price`, `quantity`, `unit`, `subtotal`, `currency`) VALUES
(2, '51b14388-28c8-40fb-8030-57ef114871dc', 'TRX', '001', 'IPH-X', 73771.94, 1.00, 'pcs', 73771.94, 'USD'),
(3, '11d080b1-a3a0-4dc8-a366-8bd8c0f29e6b', 'TRX', '001', 'IPH-9', 47784.96, 2.00, 'pcs', 95569.92, 'USD'),
(4, '045ef18f-542d-4cba-ab2f-517118767e1c', 'TRX', '001', 'SAM-9', 1055.90, 1.00, 'pcs', 1055.90, 'USD'),
(5, 'eced9076-d996-4196-abf4-e2e01f3195ac', 'TRX', '002', 'IPH-9', 477.85, 2.00, 'pcs', 955.70, 'USD'),
(6, '07c97f1b-84ac-4dbd-80cf-6994d7905707', 'TRX', '002', 'IPH-X', 737.72, 1.00, 'pcs', 737.72, 'USD'),
(7, '7d766029-6829-4b8e-a760-5e2605caa873', 'TRX', '002', 'HAN', 50.80, 2.00, 'pcs', 101.60, 'USD'),
(8, 'e8bf5b44-bf19-4ba2-9a23-719b2df11be0', 'TRX', '003', 'IPH-9', 477.85, 2.00, 'pcs', 955.70, 'USD'),
(9, '42dae83b-103c-4377-a824-83dde860bbd5', 'TRX', '003', 'IPH-X', 737.72, 3.00, 'pcs', 2213.16, 'USD'),
(10, '7401f7d2-043d-4031-a833-d4488cf3fbb7', 'TRX', '004', 'SAM-Book', 1436.79, 2.00, 'pcs', 2873.58, 'USD'),
(11, 'c892425a-6c98-4789-a651-6e475ad81707', 'TRX', '004', 'INF-INBOOK', 968.99, 1.00, 'pcs', 968.99, 'USD'),
(12, '8ca30601-7ef6-4737-934c-bec2eea62d2e', 'TRX', '004', 'OPP-F19', 229.85, 2.00, 'pcs', 459.70, 'USD'),
(13, '53fc7db5-804a-4427-9aed-583036ae9bfc', 'TRX', '004', 'INF-INBOOK', 968.99, 1.00, 'pcs', 968.99, 'USD'),
(14, 'bf0c94f7-b199-48d4-8f87-e343ec7b4d8c', 'TRX', '004', 'PLA', 33.68, 2.00, 'pcs', 67.36, 'USD'),
(15, 'fb81fed1-6862-4cea-953a-1c0deb124081', 'TRX', '005', 'IPH-9', 477.85, 3.00, 'pcs', 1433.55, 'USD'),
(16, 'f08f6302-67fd-4763-9d15-2ba87341d6ce', 'TRX', '005', '3D ', 16.70, 3.00, 'pcs', 50.10, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_header`
--

CREATE TABLE `transaction_header` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `document_code` varchar(3) NOT NULL,
  `document_number` varchar(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `total` double(10,2) DEFAULT '0.00',
  `date` date NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_header`
--

INSERT INTO `transaction_header` (`id`, `uuid`, `document_code`, `document_number`, `user`, `total`, `date`, `status`) VALUES
(7, '96588a7c-f5a8-4907-8faf-59996611f06b', 'TRX', '001', 'admin', 170397.76, '2023-09-18', 1),
(8, '34b8b85d-7f7d-45aa-baef-5c93cc712bd6', 'TRX', '002', 'admin', 1795.02, '2023-09-18', 1),
(9, '7b6d5216-d2a8-4fbf-8d6f-f42755e1db97', 'TRX', '003', 'admin', 3168.86, '2023-09-18', 1),
(10, '86438bc1-7128-48d4-a32b-d7bd6ca8c028', 'TRX', '004', 'admin', 5338.62, '2023-09-18', 1),
(11, 'b3d681b7-8984-442d-8ed0-715341dfc4ac', 'TRX', '005', 'admin', 1483.65, '2023-09-18', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `error_log`
--
ALTER TABLE `error_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_header`
--
ALTER TABLE `transaction_header`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `error_log`
--
ALTER TABLE `error_log`
  MODIFY `ID` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `transaction_header`
--
ALTER TABLE `transaction_header`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
