-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2024 at 02:23 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopcart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `color_img`
--

CREATE TABLE `color_img` (
  `color_id` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `color_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color_img`
--

INSERT INTO `color_img` (`color_id`, `color`, `color_img`) VALUES
(1, 'pink', 'https://singlecolorimage.com/get/e91e63/100x100'),
(2, 'red', 'https://singlecolorimage.com/get/f44336/100x100'),
(3, 'yellow', 'https://singlecolorimage.com/get/ffeb3b/100x100'),
(4, 'blue', 'https://singlecolorimage.com/get/3f51b5/100x100'),
(5, 'black', 'https://singlecolorimage.com/get/000000/100x100'),
(6, 'white', 'https://singlecolorimage.com/get/ffffff/100x100'),
(7, 'green', 'https://singlecolorimage.com/get/4caf50/100x100');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_hint` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `name`, `password`, `password_hint`, `email`) VALUES
('testuser1', 'Test User 1', 'testuser1234', 'testuser1234', 'testuser@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer_cart`
--

CREATE TABLE `customer_cart` (
  `customer_cart_id` int(11) NOT NULL,
  `selected_size` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_cart`
--

INSERT INTO `customer_cart` (`customer_cart_id`, `selected_size`, `quantity`, `item_id`, `username`, `color_id`) VALUES
(8, 'S', 1, 5, 'testuser1', 4),
(10, 'L', 1, 5, 'testuser1', 3),
(12, 'M', 1, 5, 'testuser1', 4),
(13, 'XXXL', 1, 5, 'testuser1', 7);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_id` int(11) NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_cart_id` int(11) DEFAULT NULL,
  `tot_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_description`, `price`, `product_img`, `weight`) VALUES
(1, 'Nike ACG Men\'s Dri-FIT Long-Sleeve T-Shirt', 'Made with heavyweight fabric for soft, structured comfort, this roomy ACG tee brings fresh ripple effect graphics in honor of waves and new beginnings. Plus, our sweat-wicking tech helps you stay dry while you\'re out exploring the rivers, lakes and streams.\r\n\r\n', '3850.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/08afeec4-66c3-4e62-aebc-ae3c83bb175e/acg-mens-dri-fit-long-sleeve-t-shirt-x8CjXP.png', '200.00'),
(2, 'Nike Sportswear Tech Fleece Men\'s Joggers', 'These comfy joggers bring back the signature slim fit you know for a tailored look. Our premium, smooth-on-both-sides fleece feels warmer and softer than ever, while keeping the same lightweight build you love. Tall ribbed cuffs pair with a zippered pocket on the right leg for secure storage and that signature Tech Fleece DNA. Pair them with the Tech Fleece hoodie for a uniform finish.', '9000.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/465e4cd3-e5c6-44f9-9f12-67f6ab8faeeb/sportswear-tech-fleece-mens-joggers-vWvCT5.png', '500.00'),
(3, 'Nike Sportswear Essential Women\'s Oversized T-Shirt', 'Baggy and spacious, this soft tee is perfect for when you want to rock an oversized look but still be comfy. Heavyweight cotton fabric with clean and classic branding make it an easy pick to pair with your favorite leggings or shorts.', '6000.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/c3538187-2471-4437-a46c-6e1fab5e8511/sportswear-essential-womens-oversized-t-shirt-mZkKhp.png', '100.00'),
(4, 'Nike Sportswear Chill Terry Women\'s Loose Full-Zip French Terry Hoodie', 'Grounded in style, comfort and versatility, meet our take on luxury loungewear. Perfect for warmer days, swap out your fleecy hoodie for this soft, light layer with a loose fit. It\'s cozy enough to wear around the house yet elevated enough to wear out in the city.', '4250.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/221efc95-faac-4c2e-bb14-37b5226e7348/sportswear-chill-terry-womens-loose-full-zip-french-terry-hoodie-p46mGX.png', '350.00'),
(5, 'Air Jordan 1 Retro High OG Men\'s Shoes', 'The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel. Premium materials with new colors and textures give modern expression to an all-time favorite.', '13000.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/312b0732-3206-40fa-b578-7bfb62c0675a/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.png', '900.00'),
(6, 'Nike Air Max Dn Shoes', 'Say hello to the next generation of Air technology. The Air Max Dn features our Dynamic Air unit system of dual-pressure tubes, creating a reactive sensation with every step. This results in a futuristic design that’s comfortable enough to wear from day to night. Go ahead—Feel the Unreal.', '8900.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/73300ab8-e29d-48d7-971c-012c85483422/air-max-dn-shoes-27XkSQ.png', '690.00'),
(7, 'Nike Air Max 270 Women\'s Shoes', 'Nike\'s first lifestyle Air Max brings you style, comfort and big attitude in the Nike Air Max 270. The design draws inspiration from Air Max icons, showcasing Nike\'s greatest innovation with its large window and fresh array of colors.', '12500.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/feb39c75-3aa3-44a7-9ec2-d298f19f2d27/air-max-270-womens-shoes-Pgb94t.png', '700.00'),
(8, 'Nike Air Max Plus Drift\r\nMen\'s Shoes', 'Let your attitude have the edge in the Air Max Plus Drift, a \"tuned\" Air experience that offers premium stability and cushioning. Featuring airy mesh, gradient coloring and the original wavy design lines, it celebrates your defiant style.', '5800.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/8eab79ee-a754-4526-ad7d-cd2756d48590/air-max-plus-drift-mens-shoes-FKwJ7w.png', '900.00'),
(9, 'Nike SB Big Kids\' Skate Coaches Jacket', 'Woke up to rain again? Bummer. Grab this roomy, water-repellent jacket and your board (in case things dry out) before you head out the door. Designed to help you wait out bad weather in comfort, but light enough to wear once the sun returns, it adds clean and classic style to your \'fit.', '5000.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/539e43b9-109d-44d7-9fde-10aff3bc6b5a/sb-big-kids-skate-coaches-jacket-s88Wmv.png', '600.00'),
(10, 'Jordan Women\'s Knit Cropped Top', 'This relaxed top oozes Jordan DNA with its subtle diamond detailing and tried-and-true Jumpman branding. Made from a soft cotton blend, it makes a comfortable style statement without saying a word. The cropped hem is designed to hit above the waist and features a drawcord with side ties for a distinct look you can personalize.', '7000.00', 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/a9da6880-3b88-4826-bb12-ee1187ca097f/jordan-womens-knit-cropped-top-QGW00z.png', '350.00');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `item_category_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

CREATE TABLE `item_images` (
  `image_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_images`
--

INSERT INTO `item_images` (`image_id`, `item_id`, `image_url`) VALUES
(1, 1, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/62061587-3a31-4723-b2dc-87d220ccabe8/acg-mens-dri-fit-long-sleeve-t-shirt-x8CjXP.png'),
(2, 1, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b803312b-12d4-44fb-84b6-65df475c161d/acg-mens-dri-fit-long-sleeve-t-shirt-x8CjXP.png'),
(3, 1, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2dc0e615-f684-482a-b12f-29ccfe6205fc/acg-mens-dri-fit-long-sleeve-t-shirt-x8CjXP.png'),
(4, 1, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/047bf883-9197-4884-ae70-0e25c2ab8bfd/acg-mens-dri-fit-long-sleeve-t-shirt-x8CjXP.png'),
(5, 2, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6991bd40-be5f-48da-9eeb-fa2f02ef4415/sportswear-tech-fleece-mens-joggers-vWvCT5.png'),
(6, 2, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6991bd40-be5f-48da-9eeb-fa2f02ef4415/sportswear-tech-fleece-mens-joggers-vWvCT5.png'),
(7, 2, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e5b17a99-9be1-4485-b9be-005afb5e9d01/sportswear-tech-fleece-mens-joggers-vWvCT5.png'),
(8, 2, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f5690936-b7ef-45a9-b88d-6655ca5aa2e7/sportswear-tech-fleece-mens-joggers-vWvCT5.png'),
(9, 3, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/c3538187-2471-4437-a46c-6e1fab5e8511/sportswear-essential-womens-oversized-t-shirt-mZkKhp.png'),
(10, 3, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0f38a1dd-ae57-4d5d-8375-2e3a7bf593ee/sportswear-essential-womens-oversized-t-shirt-mZkKhp.png'),
(11, 3, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f65c19ec-4634-4bc8-97fa-67bab2f11d9b/sportswear-essential-womens-oversized-t-shirt-mZkKhp.png'),
(12, 3, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a62cf0ae-0166-476f-baa3-6d1ff0c9023f/sportswear-essential-womens-oversized-t-shirt-mZkKhp.png'),
(13, 4, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/221efc95-faac-4c2e-bb14-37b5226e7348/sportswear-chill-terry-womens-loose-full-zip-french-terry-hoodie-p46mGX.png'),
(14, 4, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a44444f2-52fc-4863-a146-aed864bed20e/sportswear-chill-terry-womens-loose-full-zip-french-terry-hoodie-p46mGX.png'),
(15, 4, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8e4474e2-969e-4f26-83ea-c98b194a4111/sportswear-chill-terry-womens-loose-full-zip-french-terry-hoodie-p46mGX.png'),
(16, 4, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5bae798a-8f88-4941-a290-9819e1341408/sportswear-chill-terry-womens-loose-full-zip-french-terry-hoodie-p46mGX.png'),
(17, 5, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/bab11a0e-6ccd-4b17-a3ec-db5eb94d5e8c/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.png'),
(18, 5, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/af0301b2-8eac-4b67-8a12-ece835efe0d7/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.png'),
(19, 5, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/88fc407e-703b-4fb8-97ff-2c397e9a0ee5/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.png'),
(20, 5, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cc23898a-e59e-45e6-a539-f197f3d29599/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.png'),
(21, 6, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6cfb4ce5-2da4-4a6d-b79d-4ae520ae5e77/air-max-dn-shoes-27XkSQ.png'),
(22, 6, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/331dd749-8af9-4591-8307-41b8f0ac18a3/air-max-dn-shoes-27XkSQ.png'),
(23, 6, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/349127c6-69ed-4851-9e45-15ecdbecd6d8/air-max-dn-shoes-27XkSQ.png'),
(24, 6, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2f5930ea-9431-4a3f-acd2-d1652aaf9fea/air-max-dn-shoes-27XkSQ.png'),
(25, 7, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/pyyixbczj6u5kiwhpjik/air-max-270-womens-shoes-Pgb94t.png'),
(26, 7, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4cc89daa-c394-4ad4-9214-262f9b1a065a/air-max-270-womens-shoes-Pgb94t.png'),
(27, 7, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/64a85a88-a74c-4446-b502-275456c3a0d2/air-max-270-womens-shoes-Pgb94t.png'),
(28, 7, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/kwbianpnd3r0enjw7xq8/air-max-270-womens-shoes-Pgb94t.png'),
(29, 8, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/97b392a5-49d7-4a22-b626-bc5763986e35/air-max-plus-drift-mens-shoes-FKwJ7w.png'),
(30, 8, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/04783e2f-08f2-4511-a090-1fae2935d28c/air-max-plus-drift-mens-shoes-FKwJ7w.png'),
(31, 8, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c872c88b-3779-4e4a-bb3d-d846e06d8e14/air-max-plus-drift-mens-shoes-FKwJ7w.png'),
(32, 8, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a18f8d2f-ad6e-4eac-8a73-9bf82dc6daff/air-max-plus-drift-mens-shoes-FKwJ7w.png'),
(33, 9, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2228b455-4b13-496a-9d26-ef1e0b38b590/sb-big-kids-skate-coaches-jacket-s88Wmv.png'),
(34, 9, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/22a99d01-654e-490f-933f-703dc59e0f24/sb-big-kids-skate-coaches-jacket-s88Wmv.png'),
(35, 9, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6730c8d8-8ae9-42ea-bdbc-cc772e9ce3d4/sb-big-kids-skate-coaches-jacket-s88Wmv.png'),
(36, 9, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e002db2d-9098-4b6b-b0d7-56895b0ffc4e/sb-big-kids-skate-coaches-jacket-s88Wmv.png'),
(37, 10, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/4fa9a0f2-e217-4619-a1d0-4b9e643b2c59/jordan-womens-knit-cropped-top-QGW00z.png'),
(38, 10, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c1b91120-a0f3-4fdb-9c16-814a61372c20/jordan-womens-knit-cropped-top-QGW00z.png'),
(39, 10, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/608b1809-e1a8-45fa-a124-e7272403d828/jordan-womens-knit-cropped-top-QGW00z.png'),
(40, 10, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/d0ecbe4a-6685-4c78-b681-0aa5f5a842ed/jordan-womens-knit-cropped-top-QGW00z.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `order_notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_id`, `first_name`, `last_name`, `email`, `address`, `city`, `state`, `zipcode`, `phone_number`, `order_notes`) VALUES
(13, 5, 'abc', 'xyz', 'abc@gmail.com', 'sadasd', 'sasdas', 'asdasd', '123233', '0701234567', 'I need this'),
(14, 5, 'abc', 'xyz', 'abc@gmail.com', 'asdas', 'asdasd', 'asdasdas', '12322', '0701234567', 'I will buy this');

-- --------------------------------------------------------

--
-- Table structure for table `product_item`
--

CREATE TABLE `product_item` (
  `product_item_id` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `total`
--

CREATE TABLE `total` (
  `tot_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `shipping_total` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `color_img`
--
ALTER TABLE `color_img`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD PRIMARY KEY (`customer_cart_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `username` (`username`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_cart_id` (`customer_cart_id`),
  ADD KEY `tot_id` (`tot_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`item_category_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `item_images`
--
ALTER TABLE `item_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `product_item`
--
ALTER TABLE `product_item`
  ADD PRIMARY KEY (`product_item_id`),
  ADD KEY `item_category_id` (`item_category_id`);

--
-- Indexes for table `total`
--
ALTER TABLE `total`
  ADD PRIMARY KEY (`tot_id`),
  ADD KEY `username` (`username`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `color_img`
--
ALTER TABLE `color_img`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_cart`
--
ALTER TABLE `customer_cart`
  MODIFY `customer_cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `item_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_images`
--
ALTER TABLE `item_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_item`
--
ALTER TABLE `product_item`
  MODIFY `product_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `total`
--
ALTER TABLE `total`
  MODIFY `tot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD CONSTRAINT `customer_cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `customer_cart_ibfk_2` FOREIGN KEY (`username`) REFERENCES `customer` (`username`),
  ADD CONSTRAINT `customer_cart_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color_img` (`color_id`);

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`customer_cart_id`) REFERENCES `customer_cart` (`customer_cart_id`),
  ADD CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`tot_id`) REFERENCES `total` (`tot_id`);

--
-- Constraints for table `item_category`
--
ALTER TABLE `item_category`
  ADD CONSTRAINT `item_category_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `item_category_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color_img` (`color_id`);

--
-- Constraints for table `item_images`
--
ALTER TABLE `item_images`
  ADD CONSTRAINT `item_images_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `product_item`
--
ALTER TABLE `product_item`
  ADD CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`item_category_id`);

--
-- Constraints for table `total`
--
ALTER TABLE `total`
  ADD CONSTRAINT `total_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`),
  ADD CONSTRAINT `total_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
