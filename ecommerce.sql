-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 15, 2023 at 06:35 PM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userId`, `address`) VALUES
(1, 2, 'Barisadri Rajasthan India, PINCODE :- 312403'),
(2, 2, 'Udaipur Rajasthan India, PINCODE :- 313001');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `itemId` int NOT NULL,
  `userId` int NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `rating` float NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `itemId`, `userId`, `title`, `thumbnail`, `price`, `rating`, `status`, `quantity`, `created_at`, `updated_at`) VALUES
(6, 3, 1, 'Samsung Universe 9', 'https://i.dummyjson.com/data/products/3/thumbnail.jpg', 1249, 4.09, 'pending', 2, '2023-11-28 08:20:45', '2023-11-28 08:20:45'),
(7, 5, 1, 'Huawei P30', 'https://i.dummyjson.com/data/products/5/thumbnail.jpg', 499, 4.09, 'pending', 1, '2023-11-28 08:20:53', '2023-11-28 08:20:53'),
(15, 1, 2, 'iPhone 9', 'https://i.dummyjson.com/data/products/1/thumbnail.jpg', 549, 4.69, 'pending', 2, '2023-11-29 13:32:15', '2023-11-29 13:32:15'),
(21, 10, 2, 'HP Pavilion 15-DK1056WM', 'https://i.dummyjson.com/data/products/10/thumbnail.jpeg', 1099, 4.43, 'pending', 2, '2023-11-29 13:43:33', '2023-11-29 13:43:33'),
(25, 85, 2, 'LouisWill Men Sunglasses', 'https://i.dummyjson.com/data/products/85/thumbnail.jpg', 50, 4.98, 'pending', 1, '2023-11-29 14:05:24', '2023-11-29 14:05:24'),
(26, 56, 2, 'Sneakers Joggers Shoes', 'https://i.dummyjson.com/data/products/56/thumbnail.jpg', 40, 4.38, 'pending', 1, '2023-11-29 14:07:54', '2023-11-29 14:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `orderId` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `orderId`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'vLoEws9ZYS', 3386, 'success', '2023-12-10 17:10:56', '2023-12-10 17:10:56'),
(2, 2, 'vLoEws9ZYS', 3386, 'success', '2023-12-10 17:10:56', '2023-12-10 17:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `title` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(209) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `discountPercentage` decimal(5,2) NOT NULL,
  `rating` decimal(4,2) NOT NULL,
  `stock` int NOT NULL,
  `brand` varchar(28) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail` varchar(55) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `discountPercentage`, `rating`, `stock`, `brand`, `category`, `thumbnail`) VALUES
(1, 'iPhone 9', 'An apple mobile which is nothing like apple', 549, '12.96', '4.69', 94, 'Apple', 'smartphones', 'https://i.dummyjson.com/data/products/1/thumbnail.jpg'),
(2, 'iPhone X', 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...', 899, '17.94', '4.44', 34, 'Apple', 'smartphones', 'https://i.dummyjson.com/data/products/2/thumbnail.jpg'),
(3, 'Samsung Universe 9', 'Samsung\'s new variant which goes beyond Galaxy to the Universe', 1249, '15.46', '4.09', 36, 'Samsung', 'smartphones', 'https://i.dummyjson.com/data/products/3/thumbnail.jpg'),
(4, 'OPPOF19', 'OPPO F19 is officially announced on April 2021.', 280, '17.91', '4.30', 123, 'OPPO', 'smartphones', 'https://i.dummyjson.com/data/products/4/thumbnail.jpg'),
(5, 'Huawei P30', 'Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.', 499, '10.58', '4.09', 32, 'Huawei', 'smartphones', 'https://i.dummyjson.com/data/products/5/thumbnail.jpg'),
(6, 'MacBook Pro', 'MacBook Pro 2021 with mini-LED display may launch between September, November', 1749, '11.02', '4.57', 83, 'Apple', 'laptops', 'https://i.dummyjson.com/data/products/6/thumbnail.png'),
(7, 'Samsung Galaxy Book', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 1499, '4.15', '4.25', 50, 'Samsung', 'laptops', 'https://i.dummyjson.com/data/products/7/thumbnail.jpg'),
(8, 'Microsoft Surface Laptop 4', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 1499, '10.23', '4.43', 68, 'Microsoft Surface', 'laptops', 'https://i.dummyjson.com/data/products/8/thumbnail.jpg'),
(9, 'Infinix INBOOK', 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty', 1099, '11.83', '4.54', 96, 'Infinix', 'laptops', 'https://i.dummyjson.com/data/products/9/thumbnail.jpg'),
(10, 'HP Pavilion 15-DK1056WM', 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10', 1099, '6.18', '4.43', 89, 'HP Pavilion', 'laptops', 'https://i.dummyjson.com/data/products/10/thumbnail.jpeg'),
(11, 'perfume Oil', 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil', 13, '8.40', '4.26', 65, 'Impression of Acqua Di Gio', 'fragrances', 'https://i.dummyjson.com/data/products/11/thumbnail.jpg'),
(12, 'Brown Perfume', 'Royal_Mirage Sport Brown Perfume for Men & Women - 120ml', 40, '15.66', '4.00', 52, 'Royal_Mirage', 'fragrances', 'https://i.dummyjson.com/data/products/12/thumbnail.jpg'),
(13, 'Fog Scent Xpressio Perfume', 'Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men', 13, '8.14', '4.59', 61, 'Fog Scent Xpressio', 'fragrances', 'https://i.dummyjson.com/data/products/13/thumbnail.webp'),
(14, 'Non-Alcoholic Concentrated Perfume Oil', 'Original Al Munakh® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil', 120, '15.60', '4.21', 114, 'Al Munakh', 'fragrances', 'https://i.dummyjson.com/data/products/14/thumbnail.jpg'),
(15, 'Eau De Perfume Spray', 'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality', 30, '10.99', '4.70', 105, 'Lord - Al-Rehab', 'fragrances', 'https://i.dummyjson.com/data/products/15/thumbnail.jpg'),
(16, 'Hyaluronic Acid Serum', 'L\'OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid', 19, '13.31', '4.83', 110, 'L\'Oreal Paris', 'skincare', 'https://i.dummyjson.com/data/products/16/thumbnail.jpg'),
(17, 'Tree Oil 30ml', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 12, '4.09', '4.52', 78, 'Hemani Tea', 'skincare', 'https://i.dummyjson.com/data/products/17/thumbnail.jpg'),
(18, 'Oil Free Moisturizer 100ml', 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.', 40, '13.10', '4.56', 88, 'Dermive', 'skincare', 'https://i.dummyjson.com/data/products/18/thumbnail.jpg'),
(19, 'Skin Beauty Serum.', 'Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m', 46, '10.68', '4.42', 54, 'ROREC White Rice', 'skincare', 'https://i.dummyjson.com/data/products/19/thumbnail.jpg'),
(20, 'Freckle Treatment Cream- 15gm', 'Fair & Clear is Pakistan\'s only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects.', 70, '16.99', '4.06', 140, 'Fair & Clear', 'skincare', 'https://i.dummyjson.com/data/products/20/thumbnail.jpg'),
(21, '- Daal Masoor 500 grams', 'Fine quality Branded Product Keep in a cool and dry place', 20, '4.81', '4.44', 133, 'Saaf & Khaas', 'groceries', 'https://i.dummyjson.com/data/products/21/thumbnail.png'),
(22, 'Elbow Macaroni - 400 gm', 'Product details of Bake Parlor Big Elbow Macaroni - 400 gm', 14, '15.58', '4.57', 146, 'Bake Parlor Big', 'groceries', 'https://i.dummyjson.com/data/products/22/thumbnail.jpg'),
(23, 'Orange Essence Food Flavou', 'Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item', 14, '8.04', '4.85', 26, 'Baking Food Items', 'groceries', 'https://i.dummyjson.com/data/products/23/thumbnail.jpg'),
(24, 'cereals muesli fruit nuts', 'original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji', 46, '16.80', '4.94', 113, 'fauji', 'groceries', 'https://i.dummyjson.com/data/products/24/thumbnail.jpg'),
(25, 'Gulab Powder 50 Gram', 'Dry Rose Flower Powder Gulab Powder 50 Gram • Treats Wounds', 70, '13.58', '4.87', 47, 'Dry Rose', 'groceries', 'https://i.dummyjson.com/data/products/25/thumbnail.jpg'),
(26, 'Plant Hanger For Home', 'Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf', 41, '17.86', '4.08', 131, 'Boho Decor', 'home-decoration', 'https://i.dummyjson.com/data/products/26/thumbnail.jpg'),
(27, 'Flying Wooden Bird', 'Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm', 51, '15.58', '4.41', 17, 'Flying Wooden', 'home-decoration', 'https://i.dummyjson.com/data/products/27/thumbnail.webp'),
(28, '3D Embellishment Art Lamp', '3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)', 20, '16.49', '4.82', 54, 'LED Lights', 'home-decoration', 'https://i.dummyjson.com/data/products/28/thumbnail.jpg'),
(29, 'Handcraft Chinese style', 'Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate', 60, '15.34', '4.44', 7, 'luxury palace', 'home-decoration', 'https://i.dummyjson.com/data/products/29/thumbnail.webp'),
(30, 'Key Holder', 'Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality', 30, '2.92', '4.92', 54, 'Golden', 'home-decoration', 'https://i.dummyjson.com/data/products/30/thumbnail.jpg'),
(31, 'Mornadi Velvet Bed', 'Mornadi Velvet Bed Base with Headboard Slats Support Classic Style Bedroom Furniture Bed Set', 40, '17.00', '4.16', 140, 'Furniture Bed Set', 'furniture', 'https://i.dummyjson.com/data/products/31/thumbnail.jpg'),
(32, 'Sofa for Coffe Cafe', 'Ratttan Outdoor furniture Set Waterproof  Rattan Sofa for Coffe Cafe', 50, '15.59', '4.74', 30, 'Ratttan Outdoor', 'furniture', 'https://i.dummyjson.com/data/products/32/thumbnail.jpg'),
(33, '3 Tier Corner Shelves', '3 Tier Corner Shelves | 3 PCs Wall Mount Kitchen Shelf | Floating Bedroom Shelf', 700, '17.00', '4.31', 106, 'Kitchen Shelf', 'furniture', 'https://i.dummyjson.com/data/products/33/thumbnail.jpg'),
(34, 'Plastic Table', 'V﻿ery good quality plastic table for multi purpose now in reasonable price', 50, '4.00', '4.01', 136, 'Multi Purpose', 'furniture', 'https://i.dummyjson.com/data/products/34/thumbnail.jpg'),
(35, '3 DOOR PORTABLE', 'Material: Stainless Steel and Fabric  Item Size: 110 cm x 45 cm x 175 cm Package Contents: 1 Storage Wardrobe', 41, '7.98', '4.06', 68, 'AmnaMart', 'furniture', 'https://i.dummyjson.com/data/products/35/thumbnail.jpg'),
(36, 'Sleeve Shirt Womens', 'Cotton Solid Color Professional Wear Sleeve Shirt Womens Work Blouses Wholesale Clothing Casual Plain Custom Top OEM Customized', 90, '10.89', '4.26', 39, 'Professional Wear', 'tops', 'https://i.dummyjson.com/data/products/36/thumbnail.jpg'),
(37, 'ank Tops for Womens/Girls', 'PACK OF 3 CAMISOLES ,VERY COMFORTABLE SOFT COTTON STUFF, COMFORTABLE IN ALL FOUR SEASONS', 50, '12.05', '4.52', 107, 'Soft Cotton', 'tops', 'https://i.dummyjson.com/data/products/37/thumbnail.jpg'),
(38, 'sublimation plain kids tank', 'sublimation plain kids tank tops wholesale', 100, '11.12', '4.80', 20, 'Soft Cotton', 'tops', 'https://i.dummyjson.com/data/products/38/thumbnail.jpg'),
(39, 'Women Sweaters Wool', '2021 Custom Winter Fall Zebra Knit Crop Top Women Sweaters Wool Mohair Cos Customize Crew Neck Women\' S Crop Top Sweater', 600, '17.20', '4.55', 55, 'Top Sweater', 'tops', 'https://i.dummyjson.com/data/products/39/thumbnail.jpg'),
(40, 'women winter clothes', 'women winter clothes thick fleece hoodie top with sweat pantjogger women sweatsuit set joggers pants two piece pants set', 57, '13.39', '4.91', 84, 'Top Sweater', 'tops', 'https://i.dummyjson.com/data/products/40/thumbnail.jpg'),
(41, 'NIGHT SUIT', 'NIGHT SUIT RED MICKY MOUSE..  For Girls. Fantastic Suits.', 55, '15.05', '4.65', 21, 'RED MICKY MOUSE..', 'womens-dresses', 'https://i.dummyjson.com/data/products/41/thumbnail.webp'),
(42, 'Stiched Kurta plus trouser', 'FABRIC: LILEIN CHEST: 21 LENGHT: 37 TROUSER: (38) :ARABIC LILEIN', 80, '15.37', '4.05', 148, 'Digital Printed', 'womens-dresses', 'https://i.dummyjson.com/data/products/42/thumbnail.jpg'),
(43, 'frock gold printed', 'Ghazi fabric long frock gold printed ready to wear stitched collection (G992)', 600, '15.55', '4.31', 150, 'Ghazi Fabric', 'womens-dresses', 'https://i.dummyjson.com/data/products/43/thumbnail.jpg'),
(44, 'Ladies Multicolored Dress', 'This classy shirt for women gives you a gorgeous look on everyday wear and specially for semi-casual wears.', 79, '16.88', '4.03', 2, 'Ghazi Fabric', 'womens-dresses', 'https://i.dummyjson.com/data/products/44/thumbnail.jpg'),
(45, 'Malai Maxi Dress', 'Ready to wear, Unique design according to modern standard fashion, Best fitting ,Imported stuff', 50, '5.07', '4.67', 96, 'IELGY', 'womens-dresses', 'https://i.dummyjson.com/data/products/45/thumbnail.jpg'),
(46, 'women\'s shoes', 'Close: Lace, Style with bottom: Increased inside, Sole Material: Rubber', 40, '16.96', '4.14', 72, 'IELGY fashion', 'womens-shoes', 'https://i.dummyjson.com/data/products/46/thumbnail.jpg'),
(47, 'Sneaker shoes', 'Synthetic Leather Casual Sneaker shoes for Women/girls Sneakers For Women', 120, '10.37', '4.19', 50, 'Synthetic Leather', 'womens-shoes', 'https://i.dummyjson.com/data/products/47/thumbnail.jpeg'),
(48, 'Women Strip Heel', 'Features: Flip-flops, Mid Heel, Comfortable, Striped Heel, Antiskid, Striped', 40, '10.83', '4.02', 25, 'Sandals Flip Flops', 'womens-shoes', 'https://i.dummyjson.com/data/products/48/thumbnail.jpg'),
(49, 'Chappals & Shoe Ladies Metallic', 'Womens Chappals & Shoe Ladies Metallic Tong Thong Sandal Flat Summer 2020 Maasai Sandals', 23, '2.62', '4.72', 107, 'Maasai Sandals', 'womens-shoes', 'https://i.dummyjson.com/data/products/49/thumbnail.jpg'),
(50, 'Women Shoes', '2020 New Arrivals Genuine Leather Fashion Trend Platform Summer Women Shoes', 36, '16.87', '4.33', 46, 'Arrivals Genuine', 'womens-shoes', 'https://i.dummyjson.com/data/products/50/thumbnail.jpg'),
(51, 'half sleeves T shirts', 'Many store is creating new designs and trend every month and every year. Daraz.pk have a beautiful range of men fashion brands', 23, '12.76', '4.26', 132, 'Vintage Apparel', 'mens-shirts', 'https://i.dummyjson.com/data/products/51/thumbnail.jpg'),
(52, 'FREE FIRE T Shirt', 'quality and professional print - It doesn\'t just look high quality, it is high quality.', 10, '14.72', '4.52', 128, 'FREE FIRE', 'mens-shirts', 'https://i.dummyjson.com/data/products/52/thumbnail.jpg'),
(53, 'printed high quality T shirts', 'Brand: vintage Apparel ,Export quality', 35, '7.54', '4.89', 6, 'Vintage Apparel', 'mens-shirts', 'https://i.dummyjson.com/data/products/53/thumbnail.jpg'),
(54, 'Pubg Printed Graphic T-Shirt', 'Product Description Features: 100% Ultra soft Polyester Jersey. Vibrant & colorful printing on front. Feels soft as cotton without ever cracking', 46, '16.44', '4.62', 136, 'The Warehouse', 'mens-shirts', 'https://i.dummyjson.com/data/products/54/thumbnail.jpg'),
(55, 'Money Heist Printed Summer T Shirts', 'Fabric Jercy, Size: M & L Wear Stylish Dual Stiched', 66, '15.97', '4.90', 122, 'The Warehouse', 'mens-shirts', 'https://i.dummyjson.com/data/products/55/thumbnail.jpg'),
(56, 'Sneakers Joggers Shoes', 'Gender: Men , Colors: Same as DisplayedCondition: 100% Brand New', 40, '12.57', '4.38', 6, 'Sneakers', 'mens-shoes', 'https://i.dummyjson.com/data/products/56/thumbnail.jpg'),
(57, 'Loafers for men', 'Men Shoes - Loafers for men - Rubber Shoes - Nylon Shoes - Shoes for men - Moccassion - Pure Nylon (Rubber) Expot Quality.', 47, '10.91', '4.91', 20, 'Rubber', 'mens-shoes', 'https://i.dummyjson.com/data/products/57/thumbnail.jpg'),
(58, 'formal offices shoes', 'Pattern Type: Solid, Material: PU, Toe Shape: Pointed Toe ,Outsole Material: Rubber', 57, '12.00', '4.41', 68, 'The Warehouse', 'mens-shoes', 'https://i.dummyjson.com/data/products/58/thumbnail.jpg'),
(59, 'Spring and summershoes', 'Comfortable stretch cloth, lightweight body; ,rubber sole, anti-skid wear;', 20, '8.71', '4.33', 137, 'Sneakers', 'mens-shoes', 'https://i.dummyjson.com/data/products/59/thumbnail.jpg'),
(60, 'Stylish Casual Jeans Shoes', 'High Quality ,Stylish design ,Comfortable wear ,FAshion ,Durable', 58, '7.55', '4.55', 129, 'Sneakers', 'mens-shoes', 'https://i.dummyjson.com/data/products/60/thumbnail.jpg'),
(61, 'Leather Straps Wristwatch', 'Style:Sport ,Clasp:Buckles ,Water Resistance Depth:3Bar', 120, '7.14', '4.63', 91, 'Naviforce', 'mens-watches', 'https://i.dummyjson.com/data/products/61/thumbnail.jpg'),
(62, 'Waterproof Leather Brand Watch', 'Watch Crown With Environmental IPS Bronze Electroplating; Display system of 12 hours', 46, '3.15', '4.05', 95, 'SKMEI 9117', 'mens-watches', 'https://i.dummyjson.com/data/products/62/thumbnail.jpg'),
(63, 'Royal Blue Premium Watch', 'Men Silver Chain Royal Blue Premium Watch Latest Analog Watch', 50, '2.56', '4.89', 142, 'SKMEI 9117', 'mens-watches', 'https://i.dummyjson.com/data/products/63/thumbnail.webp'),
(64, 'Leather Strap Skeleton Watch', 'Leather Strap Skeleton Watch for Men - Stylish and Latest Design', 46, '10.20', '4.98', 61, 'Strap Skeleton', 'mens-watches', 'https://i.dummyjson.com/data/products/64/thumbnail.jpg'),
(65, 'Stainless Steel Wrist Watch', 'Stylish Watch For Man (Luxury) Classy Men\'s Stainless Steel Wrist Watch - Box Packed', 47, '17.79', '4.79', 94, 'Stainless', 'mens-watches', 'https://i.dummyjson.com/data/products/65/thumbnail.webp'),
(66, 'Steel Analog Couple Watches', 'Elegant design, Stylish ,Unique & Trendy,Comfortable wear', 35, '3.23', '4.79', 24, 'Eastern Watches', 'womens-watches', 'https://i.dummyjson.com/data/products/66/thumbnail.jpg'),
(67, 'Fashion Magnetic Wrist Watch', 'Buy this awesome  The product is originally manufactured by the company and it\'s a top selling product with a very reasonable', 60, '16.69', '4.03', 46, 'Eastern Watches', 'womens-watches', 'https://i.dummyjson.com/data/products/67/thumbnail.jpg'),
(68, 'Stylish Luxury Digital Watch', 'Stylish Luxury Digital Watch For Girls / Women - Led Smart Ladies Watches For Girls', 57, '9.03', '4.55', 77, 'Luxury Digital', 'womens-watches', 'https://i.dummyjson.com/data/products/68/thumbnail.webp'),
(69, 'Golden Watch Pearls Bracelet Watch', 'Product details of Golden Watch Pearls Bracelet Watch For Girls - Golden Chain Ladies Bracelate Watch for Women', 47, '17.55', '4.77', 89, 'Watch Pearls', 'womens-watches', 'https://i.dummyjson.com/data/products/69/thumbnail.jpg'),
(70, 'Stainless Steel Women', 'Fashion Skmei 1830 Shell Dial Stainless Steel Women Wrist Watch Lady Bracelet Watch Quartz Watches Ladies', 35, '8.98', '4.08', 111, 'Bracelet', 'womens-watches', 'https://i.dummyjson.com/data/products/70/thumbnail.jpg'),
(71, 'Women Shoulder Bags', 'LouisWill Women Shoulder Bags Long Clutches Cross Body Bags Phone Bags PU Leather Hand Bags Large Capacity Card Holders Zipper Coin Purses Fashion Crossbody Bags for Girls Ladies', 46, '14.65', '4.71', 17, 'LouisWill', 'womens-bags', 'https://i.dummyjson.com/data/products/71/thumbnail.jpg'),
(72, 'Handbag For Girls', 'This fashion is designed to add a charming effect to your casual outfit. This Bag is made of synthetic leather.', 23, '17.50', '4.91', 27, 'LouisWill', 'womens-bags', 'https://i.dummyjson.com/data/products/72/thumbnail.webp'),
(73, 'Fancy hand clutch', 'This fashion is designed to add a charming effect to your casual outfit. This Bag is made of synthetic leather.', 44, '10.39', '4.18', 101, 'Bracelet', 'womens-bags', 'https://i.dummyjson.com/data/products/73/thumbnail.jpg'),
(74, 'Leather Hand Bag', 'It features an attractive design that makes it a must have accessory in your collection. We sell different kind of bags for boys, kids, women, girls and also for unisex.', 57, '11.19', '4.01', 43, 'Copenhagen Luxe', 'womens-bags', 'https://i.dummyjson.com/data/products/74/thumbnail.jpg'),
(75, 'Seven Pocket Women Bag', 'Seven Pocket Women Bag Handbags Lady Shoulder Crossbody Bag Female Purse Seven Pocket Bag', 68, '14.87', '4.93', 13, 'Steal Frame', 'womens-bags', 'https://i.dummyjson.com/data/products/75/thumbnail.jpg'),
(76, 'Silver Ring Set Women', 'Jewelry Type:RingsCertificate Type:NonePlating:Silver PlatedShapeattern:noneStyle:CLASSICReligious', 70, '13.57', '4.61', 51, 'Darojay', 'womens-jewellery', 'https://i.dummyjson.com/data/products/76/thumbnail.jpg'),
(77, 'Rose Ring', 'Brand: The Greetings Flower Colour: RedRing Colour: GoldenSize: Adjustable', 100, '3.22', '4.21', 149, 'Copenhagen Luxe', 'womens-jewellery', 'https://i.dummyjson.com/data/products/77/thumbnail.jpg'),
(78, 'Rhinestone Korean Style Open Rings', 'Fashion Jewellery 3Pcs Adjustable Pearl Rhinestone Korean Style Open Rings For Women', 30, '8.02', '4.69', 9, 'Fashion Jewellery', 'womens-jewellery', 'https://i.dummyjson.com/data/products/78/thumbnail.jpg'),
(79, 'Elegant Female Pearl Earrings', 'Elegant Female Pearl Earrings Set Zircon Pearl Earings Women Party Accessories 9 Pairs/Set', 30, '12.80', '4.74', 16, 'Fashion Jewellery', 'womens-jewellery', 'https://i.dummyjson.com/data/products/79/thumbnail.jpg'),
(80, 'Chain Pin Tassel Earrings', 'Pair Of Ear Cuff Butterfly Long Chain Pin Tassel Earrings - Silver ( Long Life Quality Product)', 45, '17.75', '4.59', 9, 'Cuff Butterfly', 'womens-jewellery', 'https://i.dummyjson.com/data/products/80/thumbnail.jpg'),
(81, 'Round Silver Frame Sun Glasses', 'A pair of sunglasses can protect your eyes from being hurt. For car driving, vacation travel, outdoor activities, social gatherings,', 19, '10.10', '4.94', 78, 'Designer Sun Glasses', 'sunglasses', 'https://i.dummyjson.com/data/products/81/thumbnail.jpg'),
(82, 'Kabir Singh Square Sunglass', 'Orignal Metal Kabir Singh design 2020 Sunglasses Men Brand Designer Sun Glasses Kabir Singh Square Sunglass', 50, '15.60', '4.62', 78, 'Designer Sun Glasses', 'sunglasses', 'https://i.dummyjson.com/data/products/82/thumbnail.jpg'),
(83, 'Wiley X Night Vision Yellow Glasses', 'Wiley X Night Vision Yellow Glasses for Riders - Night Vision Anti Fog Driving Glasses - Free Night Glass Cover - Shield Eyes From Dust and Virus- For Night Sport Matches', 30, '6.33', '4.97', 115, 'mastar watch', 'sunglasses', 'https://i.dummyjson.com/data/products/83/thumbnail.jpg'),
(84, 'Square Sunglasses', 'Fashion Oversized Square Sunglasses Retro Gradient Big Frame Sunglasses For Women One Piece Gafas Shade Mirror Clear Lens 17059', 28, '13.89', '4.64', 64, 'mastar watch', 'sunglasses', 'https://i.dummyjson.com/data/products/84/thumbnail.jpg'),
(85, 'LouisWill Men Sunglasses', 'LouisWill Men Sunglasses Polarized Sunglasses UV400 Sunglasses Day Night Dual Use Safety Driving Night Vision Eyewear AL-MG Frame Sun Glasses with Free Box for Drivers', 50, '11.27', '4.98', 92, 'LouisWill', 'sunglasses', 'https://i.dummyjson.com/data/products/85/thumbnail.jpg'),
(86, 'Bluetooth Aux', 'Bluetooth Aux Bluetooth Car Aux Car Bluetooth Transmitter Aux Audio Receiver Handfree Car Bluetooth Music Receiver Universal 3.5mm Streaming A2DP Wireless Auto AUX Audio Adapter With Mic For Phone MP3', 25, '10.56', '4.57', 22, 'Car Aux', 'automotive', 'https://i.dummyjson.com/data/products/86/thumbnail.jpg'),
(87, 't Temperature Controller Incubator Controller', 'Both Heat and Cool Purpose, Temperature control range; -50 to +110, Temperature measurement accuracy; 0.1, Control accuracy; 0.1', 40, '11.30', '4.54', 37, 'W1209 DC12V', 'automotive', 'https://i.dummyjson.com/data/products/87/thumbnail.jpg'),
(88, 'TC Reusable Silicone Magic Washing Gloves', 'TC Reusable Silicone Magic Washing Gloves with Scrubber, Cleaning Brush Scrubber Gloves Heat Resistant Pair for Cleaning of Kitchen, Dishes, Vegetables and Fruits, Bathroom, Car Wash, Pet Care and Multipurpose', 29, '3.19', '4.98', 42, 'TC Reusable', 'automotive', 'https://i.dummyjson.com/data/products/88/thumbnail.jpg'),
(89, 'Qualcomm original Car Charger', 'best Quality CHarger , Highly Recommended to all best Quality CHarger , Highly Recommended to all', 40, '17.53', '4.20', 79, 'TC Reusable', 'automotive', 'https://i.dummyjson.com/data/products/89/thumbnail.jpg'),
(90, 'Cycle Bike Glow', 'Universal fitment and easy to install no special wires, can be easily installed and removed. Fits most standard tyre air stem valves of road, mountain bicycles, motocycles and cars.Bright led will turn on w', 35, '11.08', '4.10', 63, 'Neon LED Light', 'automotive', 'https://i.dummyjson.com/data/products/90/thumbnail.jpg'),
(91, 'Black Motorbike', 'Engine Type:Wet sump, Single Cylinder, Four Stroke, Two Valves, Air Cooled with SOHC (Single Over Head Cam) Chain Drive Bore & Stroke:47.0 x 49.5 MM', 569, '13.63', '4.04', 115, 'METRO 70cc Motorcycle - MR70', 'motorcycle', 'https://i.dummyjson.com/data/products/91/thumbnail.jpg'),
(92, 'HOT SALE IN EUROPE electric racing motorcycle', 'HOT SALE IN EUROPE electric racing motorcycle electric motorcycle for sale adult electric motorcycles', 920, '14.40', '4.19', 22, 'BRAVE BULL', 'motorcycle', 'https://i.dummyjson.com/data/products/92/thumbnail.jpg'),
(93, 'Automatic Motor Gas Motorcycles', '150cc 4-Stroke Motorcycle Automatic Motor Gas Motorcycles Scooter motorcycles 150cc scooter', 1050, '3.34', '4.84', 127, 'shock absorber', 'motorcycle', 'https://i.dummyjson.com/data/products/93/thumbnail.jpg'),
(94, 'new arrivals Fashion motocross goggles', 'new arrivals Fashion motocross goggles motorcycle motocross racing motorcycle', 900, '3.85', '4.06', 109, 'JIEPOLLY', 'motorcycle', 'https://i.dummyjson.com/data/products/94/thumbnail.webp'),
(95, 'Wholesale cargo lashing Belt', 'Wholesale cargo lashing Belt Tie Down end Ratchet strap customized strap 25mm motorcycle 1500kgs with rubber handle', 930, '17.67', '4.21', 144, 'Xiangle', 'motorcycle', 'https://i.dummyjson.com/data/products/95/thumbnail.jpg'),
(96, 'lighting ceiling kitchen', 'Wholesale slim hanging decorative kid room lighting ceiling kitchen chandeliers pendant light modern', 30, '14.89', '4.83', 96, 'lightingbrilliance', 'lighting', 'https://i.dummyjson.com/data/products/96/thumbnail.jpg'),
(97, 'Metal Ceramic Flower', 'Metal Ceramic Flower Chandelier Home Lighting American Vintage Hanging Lighting Pendant Lamp', 35, '10.94', '4.93', 146, 'Ifei Home', 'lighting', 'https://i.dummyjson.com/data/products/97/thumbnail.jpg'),
(98, '3 lights lndenpant kitchen islang', '3 lights lndenpant kitchen islang dining room pendant rice paper chandelier contemporary led pendant light modern chandelier', 34, '5.92', '4.99', 44, 'DADAWU', 'lighting', 'https://i.dummyjson.com/data/products/98/thumbnail.jpg'),
(99, 'American Vintage Wood Pendant Light', 'American Vintage Wood Pendant Light Farmhouse Antique Hanging Lamp Lampara Colgante', 46, '8.84', '4.32', 138, 'Ifei Home', 'lighting', 'https://i.dummyjson.com/data/products/99/thumbnail.jpg'),
(100, 'Crystal chandelier maria theresa for 12 light', 'Crystal chandelier maria theresa for 12 light', 47, '16.00', '4.74', 133, 'YIOSI', 'lighting', 'https://i.dummyjson.com/data/products/100/thumbnail.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
