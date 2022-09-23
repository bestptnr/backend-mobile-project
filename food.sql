-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 23, 2022 at 06:27 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `Ingredient_id` int(11) NOT NULL,
  `Ingredient` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`Ingredient_id`, `Ingredient`, `created_at`, `updated_at`) VALUES
(1, 'น้ำมะนาว', '2022-09-13 16:09:04', '2022-09-13 16:09:04'),
(2, 'น้ำปลา', '2022-09-13 16:09:08', '2022-09-13 16:09:08'),
(3, 'น้ำตาล', '2022-09-13 16:09:12', '2022-09-13 16:09:12'),
(4, 'พริก', '2022-09-13 16:09:16', '2022-09-13 16:09:16'),
(5, 'ซีอิ๋วขาว', '2022-09-13 16:09:22', '2022-09-13 16:09:22'),
(6, 'ผงชูรส', '2022-09-13 16:09:28', '2022-09-13 16:09:28'),
(7, 'ใบมะกรูด', '2022-09-13 16:09:39', '2022-09-13 16:09:39'),
(8, 'น้ำเปล่า', '2022-09-13 16:09:45', '2022-09-13 16:09:45'),
(9, 'น้ำมันพืช', '2022-09-13 16:09:52', '2022-09-13 16:09:52'),
(10, 'พริกชี้ฟ้า', '2022-09-13 16:10:01', '2022-09-13 16:10:01'),
(11, 'เนื้อไก่', '2022-09-13 16:10:09', '2022-09-13 16:10:09'),
(12, 'น้ำพริกแกงเผ็ด', '2022-09-13 16:10:16', '2022-09-13 16:10:16'),
(13, 'กระเทียม', '2022-09-13 16:10:38', '2022-09-13 16:10:38'),
(14, 'ไข่ไก่', '2022-09-13 16:10:46', '2022-09-13 16:10:46'),
(15, 'วุ้นเส้น ', '2022-09-13 16:10:50', '2022-09-13 16:10:50'),
(16, 'ซอสปรุงรส', '2022-09-13 16:10:59', '2022-09-13 16:10:59'),
(17, 'ใบกะเพรา', '2022-09-13 16:11:24', '2022-09-13 16:11:24'),
(18, 'ซอสหอย', '2022-09-13 16:11:28', '2022-09-13 16:11:28'),
(19, 'พริกไทยป่น', '2022-09-13 16:11:33', '2022-09-13 16:11:33'),
(20, 'ข้าวสวย', '2022-09-13 16:11:47', '2022-09-13 16:11:47'),
(21, 'ต้นหอม', '2022-09-13 16:11:58', '2022-09-13 16:11:58'),
(22, 'ปลาหมึก', '2022-09-13 16:12:19', '2022-09-13 16:12:19'),
(23, 'ซีอิ๊วดำ', '2022-09-13 16:12:28', '2022-09-13 16:12:28'),
(24, 'ปลากระป๋อง', '2022-09-13 16:12:47', '2022-09-13 16:12:47'),
(25, 'หอมแดงซอย', '2022-09-13 16:12:51', '2022-09-13 16:12:51'),
(26, 'พริกซอย', '2022-09-13 16:12:55', '2022-09-13 16:12:55'),
(27, 'หมูบด', '2022-09-13 16:13:15', '2022-09-13 16:13:15'),
(28, 'เนื้อหมู', '2022-09-13 16:13:19', '2022-09-13 16:13:19'),
(29, 'เนื้อวัว', '2022-09-13 16:13:23', '2022-09-13 16:13:23'),
(30, 'กุ้ง', '2022-09-13 16:13:41', '2022-09-13 16:13:41'),
(31, 'อกไก่', '2022-09-13 16:13:51', '2022-09-13 16:13:51'),
(32, 'แครอต', '2022-09-13 16:13:55', '2022-09-13 16:13:55'),
(33, 'ปลาแซลมอน', '2022-09-13 16:14:17', '2022-09-13 16:14:17'),
(34, 'น้ำมันมะกอก', '2022-09-13 16:14:21', '2022-09-13 16:14:21'),
(35, 'พริกไทย', '2022-09-13 16:14:26', '2022-09-13 16:14:26'),
(36, 'เกลือป่น', '2022-09-13 16:14:31', '2022-09-13 16:14:31'),
(37, 'พริกหวาน', '2022-09-13 16:14:40', '2022-09-13 16:14:40'),
(38, 'น้ำมันมะกอก ', '2022-09-13 16:14:47', '2022-09-13 16:14:47'),
(39, 'น้ำมันมะพร้าว ', '2022-09-13 16:14:51', '2022-09-13 16:14:51'),
(40, 'ผักชี', '2022-09-13 16:14:56', '2022-09-13 16:14:56'),
(41, 'ใบโหระพา', '2022-09-13 16:15:25', '2022-09-13 16:15:25'),
(42, 'หน่อไม้', '2022-09-13 16:15:28', '2022-09-13 16:15:28'),
(43, 'กะทิ', '2022-09-13 16:15:36', '2022-09-13 16:15:36'),
(44, 'น้ำตาลปี๊บ', '2022-09-13 16:15:51', '2022-09-13 16:15:51'),
(45, 'หอมหัวใหญ่', '2022-09-13 16:16:16', '2022-09-13 16:16:16'),
(46, 'มันฝรั่ง ', '2022-09-13 16:16:18', '2022-09-13 16:16:18'),
(47, 'อบเชย', '2022-09-13 16:16:23', '2022-09-13 16:16:23'),
(48, 'หางกะทิ', '2022-09-13 16:16:27', '2022-09-13 16:16:27'),
(49, 'ถั่วลิสงคั่ว', '2022-09-13 16:16:31', '2022-09-13 16:16:31'),
(50, 'น้ำมะขามเปียก ', '2022-09-13 16:16:35', '2022-09-13 16:16:35'),
(51, 'ดอกโป๊ยกั๊ก', '2022-09-13 16:16:41', '2022-09-13 16:16:41'),
(52, 'พริกแกงมัสมั่น ', '2022-09-13 16:16:46', '2022-09-13 16:16:46'),
(53, 'ตะไคร้', '2022-09-13 16:28:53', '2022-09-13 16:28:53'),
(54, 'ผิวมะกรูด', '2022-09-13 16:28:57', '2022-09-13 16:28:57'),
(55, 'กะปิ ', '2022-09-13 16:29:00', '2022-09-13 16:29:00'),
(56, 'ข่า', '2022-09-13 16:29:08', '2022-09-13 16:29:08'),
(58, 'เม็ดมะม่วงหิมพานต์', '2022-09-13 16:40:54', '2022-09-13 16:40:54'),
(59, 'น้ำตาลมะพร้าว', '2022-09-13 16:41:32', '2022-09-13 16:41:32'),
(60, 'หัวกะทิ', '2022-09-14 17:34:25', '2022-09-14 17:34:25'),
(61, 'มะเขือเปราะ', '2022-09-14 17:36:01', '2022-09-14 17:36:01'),
(62, 'มะเขือพวง', '2022-09-14 17:36:08', '2022-09-14 17:36:08'),
(63, 'พริกชี้ฟ้าแดง', '2022-09-14 17:36:14', '2022-09-14 17:36:14'),
(65, 'พริกแกงพะแนง', '2022-09-14 17:41:59', '2022-09-14 17:41:59'),
(66, 'หอยลาย', '2022-09-14 17:47:11', '2022-09-14 17:47:11'),
(67, 'น้ำพริกเผา', '2022-09-14 17:47:24', '2022-09-14 17:47:24'),
(68, 'พริกขี้หนูสวน', '2022-09-14 17:47:36', '2022-09-14 17:47:36'),
(69, 'น้ำมันหอย', '2022-09-14 17:47:52', '2022-09-14 17:47:52'),
(70, 'สันคอหมู', '2022-09-14 17:56:00', '2022-09-14 17:56:00'),
(71, 'กะปิ', '2022-09-14 17:56:04', '2022-09-14 17:56:04'),
(72, 'น้ำมันรำข้าว', '2022-09-14 17:56:07', '2022-09-14 17:56:07'),
(73, 'พริกจินดาเขียวแดง', '2022-09-14 17:56:10', '2022-09-14 17:56:10'),
(74, 'ตะไคร้', '2022-09-14 17:56:15', '2022-09-14 17:56:15'),
(75, 'หอมแดง', '2022-09-14 17:56:21', '2022-09-14 17:56:21'),
(76, 'น้ำเปล่า', '2022-09-14 17:59:08', '2022-09-14 17:59:08'),
(77, 'หมูบด', '2022-09-14 18:03:56', '2022-09-14 18:03:56'),
(78, 'พริกจินดา', '2022-09-14 18:04:04', '2022-09-14 18:04:04'),
(79, 'แตงกวา', '2022-09-14 18:06:27', '2022-09-14 18:06:27'),
(80, 'ผักชีฝรั่ง', '2022-09-14 18:44:01', '2022-09-14 18:44:01'),
(81, 'ตีนไก่', '2022-09-14 18:52:21', '2022-09-14 18:52:21'),
(82, 'ใบสะระแหน่', '2022-09-14 18:57:44', '2022-09-14 18:57:44'),
(83, 'เห็ดนางฟ้า', '2022-09-14 19:00:40', '2022-09-14 19:00:40'),
(84, 'แป้งทอดกรอบ', '2022-09-15 16:58:03', '2022-09-15 16:58:03'),
(85, 'คนอร์ขวดซอสข้นปรุงรส', '2022-09-15 17:00:35', '2022-09-15 17:00:35'),
(86, 'รากผักชี', '2022-09-15 17:01:55', '2022-09-15 17:01:55'),
(87, 'สะโพกไก่เลาะกระดูก', '2022-09-15 17:05:22', '2022-09-15 17:05:22'),
(88, 'ขิง', '2022-09-15 17:06:12', '2022-09-15 17:06:12'),
(89, 'น้ำซุป', '2022-09-15 17:06:51', '2022-09-15 17:06:51'),
(90, 'ซอสถั่วเหลือง', '2022-09-15 17:08:19', '2022-09-15 17:08:19'),
(91, 'สะโพกไก่', '2022-09-15 17:11:24', '2022-09-15 17:11:24'),
(92, 'สามสหาย', '2022-09-15 17:11:33', '2022-09-15 17:11:33'),
(93, 'เนื้อสะโพกไก่', '2022-09-15 17:27:08', '2022-09-15 17:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(10) NOT NULL,
  `recipe_name` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `step` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `detail`, `image`, `step`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 'แกงไข่ไก่', 'ทดสอบสำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา', 'https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg', 'ทดสอบเทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ', 1, '2022-09-13 16:24:32', '2022-09-16 15:33:54'),
(3, 'แกงเนื้อ', 'สำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา', 'https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg', 'เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ', 1, '2022-09-14 17:32:24', '2022-09-14 17:32:24'),
(4, 'แกงพะแนง', 'แกงพะแนง อีกเมนูแกงไทยภาคกลางสุดฮิต สูตรนี้ใส่เนื้อหมู ที่ขาดไม่ได้เลยคือน้ำพริกแกงพะแนง ดัดแปลงเป็นแกงพะแนงกุ้ง แกงพะแนงไก่ หรือแกงพะแนงเนื้อก็อร่อย', 'https://s359.thaibuffer.com/pagebuilder/a9ec90d9-7bed-472c-a5f6-12630aec4b79.jpg', 'ใส่น้ำมันลงในกระทะ นำขึ้นตั้งไฟอ่อน ใส่น้ำพริกแกงพะแนงลงผัดจนหอม เติมกะทิลงผัดจนหอม และแตกมัน,\r\nใส่เนื้อหมูและใบมะกรูด ปรุงรสด้วยน้ำปลา และน้ำตาลปี๊บ ผัดผสมจนเนื้อหมูสุก และน้ำเริ่มข้น ใส่ใบโหระพาลงไป เคล้าพอเข้ากัน ยกลงจากเตา ตักใส่จาน โรยด้วยใบมะกรูดซอย และพริกชี้ฟ้าแดงซอย', 1, '2022-09-14 17:38:23', '2022-09-14 17:38:23'),
(5, 'หอยลายผัดพริกเผา', 'ถ้าพูดถึงเมนูอาหารไทยที่มีหอยเป็นวัตถุดิบหลักล่ะก็ คงจะลืมเมนู “หอยลายผัดพริกเผา” ไปไม่ได้เลยล่ะ เนื้อหอยลายสด ๆ ผัดกับน้ำพริกเผาและเครื่องปรุงรสให้เข้าเนื้อ แถมยังมีกลิ่นหอม ๆ จากใบโหระพาที่ช่วยให้เจริญอาหารขึ้น เพริ่นมาขนาดนี้แล้วอยากกินกันแล้วใช่ไหม', 'https://img.wongnai.com/p/400x0/2018/12/11/947dfd6a48504a45852cbc4b7dcc51a2.jpg', 'นำหอยลายมาล้างนำให้สะอาด หรือแช่น้ำให้หอยลายคายขี้โคลนออกมา หลังจากนั้นต้มน้ำให้เดือด แล้วใส่หอยลายลงไป ลวกประมาณ 30 - 40 วินาที ตักแช่ในน้ำเย็นจัด พักให้สะเด็ดน้ำ,ใส่น้ำมันพืชลงไปในกระทะ นำกระเทียมสับผัดพริกกับพริกขี้หนูสวน จนมีกลิ่นหอม ปรุงรสด้วยน้ำตาลทราย น้ำมันหอย ซีอิ๊วขาว น้ำปลา และน้ำพริกเผา ผัดจนให้ทุกอย่างเข้ากัน นำหอยลายและใบโหระพาใส่ลงไปผัด จนหอยลายสุก (จนฝาหอยเป็นสีส้ม) ', 2, '2022-09-14 17:46:35', '2022-09-14 17:46:35'),
(6, 'หมูสามชั้นผัดกะปิ', 'หมูผัดกะปิ อาหารใต้ยอดนิยม เลือกใช้หมูส่วนที่มีติดมัน เช่น สันคอหรือสามชั้น หั่นไม่หนาไม่บางเกินไป เพื่อให้ซอสซึมเข้าในเนื้อหมูได้ทั่วถึง และเนื่องจากกะปิเป็นเครื่องปรุงรสหลักของเมนูนี้ กะปิดีทำให้รสชาติรวมโดดเด่นขึ้นได้มากทีเดียว', 'https://www.eatandsleep.blog/wp-content/uploads/2021/02/%E0%B8%AB%E0%B8%A1%E0%B8%B9%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B8%81%E0%B8%B0%E0%B8%9B%E0%B8%B4-20-2.jpg', 'โขลกกระเทียม หอมแดง พริกจินดา และกะปิให้พอแหลก,นำเครื่องกะปิไปผัดกับน้ำมันจนหอมดีกี ใส่สันคอหมูสไลด์ลงไปผัดให้พอสุก เติมน้ำสะอาดเล็กน้อย,ปรุงรสด้วยน้ำตาล และซีอิ๊วขาว ใส่ตะไคร้ซอย และใบมะกรูดฉีก เร่งไฟ ผัดให้งวดขึ้นเล็กน้อย', 2, '2022-09-14 17:55:49', '2022-09-14 17:55:49'),
(7, 'ข้าวผัดกระเทียมหมูสับ', 'เอาใจคนชอบกลิ่นและรสชาติของกระเทียมเจียว กับข้าวผัดหมูบด และน้ำปลาหอมๆ บีบมะนาวเล็กน้อย ก็กลมกล่อม อร่อยกินเพลินแล้ว', 'https://www.pholfoodmafia.com/wp-content/uploads/2022/04/4Minced-Pork-Garlic-Fried-500x314.jpg', 'ตั้งกระทะใส่น้ำมัน พอเริ่มอุ่น นำกระเทียมลงไปเจียวให้กรอบดี ตักออกมาพักไว้ แยกน้ำมันออก,ใส่น้ำมันที่เหลือจากการเจียวกระเทียม 2 ช้อนโต๊ะลงในกระทะ นำหมูบดลงไปผัดให้สุก และขึ้นสีเล็กน้อย ใส่พริกจินดา,ปรุงรสด้วยน้ำปลา ใส่ข้าว ผัดให้เข้ากันดี ใส่กระเทียมเจียวลงไปครึ่งหนึ่ง เคล้าให้เข้ากัน ตักเสิร์ฟ,โรยด้วยกระเทียมเจียวที่เหลือ เสิร์ฟกับแตงกวา ต้นหอม และมะนาว', 2, '2022-09-14 18:03:46', '2022-09-14 18:03:46'),
(8, 'ต้มยำไข่น้ำ', 'เมนูต้มที่ใครกินก็ต้องติดใจ จะซดกินเปล่า ๆ หรือกินกับข้าวสวยร้อน ๆ ก็ได้ แต่สูตรนี้จะเพิ่มความแซ่บโดยทำเป็นซุปต้มยำ รับรองถูกปากแน่นอน ถ้าพร้อมแล้วรีบสวมผ้ากันเปื้อนแล้วตามเข้าครัวมาเลย', 'https://food.mthai.com/app/uploads/2019/08/Spicy-Omelette-Soup-14.jpg', 'ทอดไข่เจียวตามปกติ ทอดเสร็จแล้วก็หั่นไข่เจียวเป็นชิ้นสี่เหลี่ยม พอดีคำ,ตั้งหม้อต้มน้ำ ใส่เครื่องต้มยำลงไป จากนั้นก็ใส่น้ำปลา และน้ำพริกเผา,ใส่พริกขี้หนูสับตามชอบ ใส่ผักชีฝรั่งซอย จากนั้นก็เทไข่เจียวลงไป และปิดไฟทันที บีบมะนาวลงไป (ใส่มะนาวหลังจากปิดไฟ เป็นเทคนิคที่ไม่ทำให้น้ำมะนาวขม)', 3, '2022-09-14 18:43:42', '2022-09-14 18:43:42'),
(9, 'ต้มยำซุปเปอร์ตีนไก่', 'ซุปเปอร์ตีนไก่ กินจริงจังก็ได้หรือจะกินเป็นกับแกล้มก็ดี รสชาติดีไปหมด ไม่ต้องพูดถึงว่าตีนไก่ต้องเปื่อยแค่ไหน กับขั้นตอนการทำให้เปื่อยนั้นไม่ยาก จากนั้นนำมาต้มปรุงรสให้แซ่บ รสชาติถึงใจอย่างที่ใครๆ ก็ปฏิเสธไม่ได้', 'https://food.mthai.com/app/uploads/2017/11/Spicy-Chicken-Feet-Soup.jpg', 'ตั้งน้ำให้เดือด ใส่ข่า ตะไคร้ลงไป ตามด้วยเกลือและผงปรุงรส ใส่ตีนไก่ที่ผ่านการต้มจนเปื่อย ตุ๋นทิ้งไว้ 1 ชั่วโมง,ปรุงรสด้วยซีอิ๊วขาว ซีอิ๊วดำ น้ำปลา น้ำตาลทราย ตุ๋นทิ้งไว้ 30 นาที,ปิดไฟ แล้ว ใส่พริกขี้หนู ใส่น้ำมะนาว ผักชี และ ผักชีฝรั่ง คนให้เข้ากัน จากนั้นก็เทใส่ถ้วยหรือหากนำไปกินเป็นกับแกล้ม ให้ร้อนนานๆ ก็ใช้หม้อไฟได้เลยค่ะ', 3, '2022-09-14 18:52:10', '2022-09-14 18:52:10'),
(10, 'ต้มยําปลากระป๋อง', 'เป็นอาหารที่อยู่คู่ครัวไทยมานาน เรียกได้ว่าต้องมีติดบ้านไว้แทบทุกบ้านเลย เปรียบเหมือนอาหารสามัญประจำบ้านก็ว่าได้ เพราะกินง่าย สะดวก เวลาหิวแบบฉุกเฉินขึ้นมาก็แค่เปิดกระป๋องเทใส่จานกินกับข้าวสวยร้อน ๆ ก็อิ่มอร่อยไปหนึ่งมื้อแล้ว', 'https://img.kapook.com/u/pirawan/Cooking1/mackerel%20soup.jpg', 'ใส่น้ำลงในชามทนความร้อน ใส่ข่า ตะไคร้ ใบมะกรูด หอมแดง และพริก ลงไป นำเข้าไมโครเวฟ โดยใช้ความร้อน 1100 วัตต์ เป็นเวลา 4 นาที,นำออกมาจากไมโครเวฟ จากนั้นใส่ปลากระป๋อง เห็ดนางฟ้า น้ำปลา และน้ำตาลตามลงไป คนให้เข้ากัน นำเข้าไมโครเวฟใช้ความร้อน 1,100 วัตต์ เป็นเวลา 2 นาที,นำออกมาจากไมโครเวฟแล้วบีบมะนาวใส่ลงไปคนให้เข้ากันอีกครั้ง ตักเสิร์ฟตกแต่งด้วยใบสะระแหน่กับพริกขี้หนูเป็นอันเสร็จ', 3, '2022-09-14 18:57:19', '2022-09-14 18:57:19'),
(11, 'ปลากระป๋องทอดกระเทียม', 'ต้นเดือนกินอย่างพระราชา กลางเดือนเป็นสามัญชน สิ้นเดือนกลายเป็นยาจก! จะทำยังไงดีเมื่อเงินในกระเป๋ามีแต่แบงค์เขียว Wongnai มีทางออก! นี่เลย “ปลากระป๋องทอดกระเทียม” เมนูเอาใจคนกระเป๋าแฟ่บ ที่ทำง่ายแถมยังช่วยต่อชีวิตได้อีกมื้อ ถ้าเงินเริ่มหมดกันแล้ว ก็ตามไปดู', 'https://f.ptcdn.info/858/064/000/pu7l63o2i9f7d7eoz71-o.jpg', 'ผสมแป้งทอดกรอบกับพริกไทยให้เข้ากัน นำปลากระป๋องคลุกแป้งให้ทั่วชิ้น,โขลกกระเทียมพอหยาบ นำลงทอดจนเหลืองทอง แล้วตักขึ้นสะเด็ดน้ำมันพักไว้ ใส่ปลากระป๋องที่ชุบแป้งไว้ลงไปทอดต่อในน้ำมันเดิม ช่วยเพิ่มความหอมให้กับชิ้นปลา เมื่อทอดจนเหลืองทอง ตักขึ้นสะเด็ดน้ำมัน,จัดใส่จานเสิร์ฟ', 4, '2022-09-15 16:56:50', '2022-09-15 16:56:50'),
(12, 'กุ้งคั่วพริกเกลือ', 'โดนใจคนรักกุ้งแน่นอน! กับเมนู “กุ้งคั่วพริกเกลือ” เนื้อกุ้งแน่น ๆ กับความเข้มข้นจัดจ้านของซอสข้นผัดพริกกระเทียม เข้ากันแบบไร้ที่ติ! แถมทำง่าย ๆ ได้ที่บ้านคุณ!', 'https://s359.kapook.com/pagebuilder/9f1fe7a4-b19a-4f0d-a0db-33e49802c9ab.jpg', 'นำกุ้งขาวที่ผ่าหลังและทำความสะอาดเรียบร้อยแล้วมาชุบกับแป้งทอดกรอบ แล้วนำลงทอดในน้ำมันจนกุ้งสุกกรอบเหลืองทอง ตักขึ้นพักไว้,โขลกกระเทียม พริกขี้หนู รากผักชี และเกลือ ให้พอหยาบ ตั้งกระทะใส่น้ำมัน นำเครื่องที่โขลกไว้ใส่ลงไปผัดให้ส่งกลิ่นหอม แล้วใส่กุ้งที่ทอดไว้ลงไปคั่วให้เข้ากัน ปรุงรสด้วย คนอร์ขวด ซอสข้นปรุงรส รสไก่ 1 ช้อนโต๊ะ ผัดให้เข้ากัน,ตักขึ้นใส่จานจัดเสิร์ฟ', 4, '2022-09-15 16:59:48', '2022-09-15 16:59:48'),
(13, 'ไก่ทอดขิงกรอบ', 'ใครที่ชอบกินไก่ทอดมาทางนี้เลย! เพราะเมนูวันนี้บอกเลยว่าเด็ดถูกใจชาวรักไก่ทอดแน่นอน! กับเมนู “ไก่ทอดขิงกรอบ” ไก่ทอดชิ้นพอดีคำ หอมกลิ่นขิง พร้อมขิงฝอยทอดกรอบ ๆ โรยหน้า กินคู่กันรับรองรสเด็ดโดนใจ!', 'https://www.cpbrandsite.com/contents/recipe/vslupd470kecxzskbikuklh4ndpws5lejdxzpo6a.jpg', 'หั่นสะโพกไก่เป็นชิ้นพอดีคำ แล้วนำไปหมักกับ ขิงบด พริกไทย ซอสหอยนางรม ซีอิ๊วขาว แป้งทอดกรอบ และน้ำซุป\r\nคลุกเคล้าให้เข้ากันแล้วหมักไว้ประมาณ 15 - 20 นาที,หั่นขิงเป็นเส้นฝอย แล้วนำลงไปทอดในน้ำมันร้อนจนเหลืองกรอบ ใช้กระชอนตักขึ้นพักไว้สะเด็ดน้ำมัน นำไก่ที่หมักไว้ลงทอดในน้ำมันเดิม จะช่วยเพิ่มกลิ่นหอมของขิง ทอดจนไก่เริ่มเป็นสีเหลืองทอด แล้วตักขึ้น,นำไก่ที่ทอดไว้จัดใส่จานเสิร์ฟ', 4, '2022-09-15 17:04:54', '2022-09-15 17:04:54'),
(14, 'ไก่ย่างพริกไทยดำ', 'ไก่ย่างพริกไทยดำ หอมเครื่องเทศรสเด็ด เผ็ดร้อน เป็นไก่ย่างยอดนิยม ส่งกลิ่นเย้ายวนชวนรับประทานจริงเชียว แค่นึกก็อยากจะกัดกิน เนื้อไก่นุ่ม ๆ ให้หมดภายในพริบตา ลองทำกันดูค่ะคุณแม่บ้าน ทำง่ายมาก ๆ', 'https://img.thaibuffer.com/u/2017/surauch/cooking/a5_1.jpg', 'หมักสะโพกไก่กับน้ำมันหอยและสามสหายเข้าด้วยกัน โรยพริกไทยดำลงไปคลุกเคล้าให้เข้ากัน หมักทิ้งไว้เป็นเวลา 1 ชั่วโมง,พอหมักไก่ได้ที่แล้วก็ตั้งกระทะใช้ไฟแรงสุด นำไก่ลงไปย่างบนกระทะ โดยเอาส่วนที่เป็นหนังลงไปก่อน,ปิดฝาแล้วลดเป็นไฟอ่อน พอไก่สุกได้ที่ก็กลับด้าน ปิดฝาแล้วรอจนกว่าจะสุกทั่ว,พอไก่สุกแล้วให้กลับด้าน และเอาส่วนที่เป็นหนังลงไปนาบกระทะอีกครั้ง แล้วใช้ไฟแรงสุด เพื่อให้หนังเกรียมสวย เป็นอันเสร็จ,ทำน้ำจิ้มแจ่ว โดยผสมน้ำปลา น้ำมะนาว ข้าวคั่ว น้ำตาลทราย พริกป่น ผักชีใบเลื่อยและต้นหอมให้เข้ากัน เสิร์ฟพร้อมกับไก่ย่างพริกไทยดำ ผักสลัด หรือผักอื่น ๆ ตามชอบ', 5, '2022-09-15 17:11:09', '2022-09-15 17:11:09'),
(15, 'เนื้อย่าง', 'ใครอยากทำเนื้อย่างลองมาหมักตามสูตรนี้กัน ความพิเศษคือหมักด้วยน้ำมันมะกอกและน้ำมันหอย เพิ่มพริกไทยดำและผงปรุงรสหน่อย เสิร์ฟกับน้ำจิ้มแจ่ว', 'https://s359.thaibuffer.com/pagebuilder/c91e3abc-a0b2-4886-a83f-5d0fc7d638e0.jpg', 'หมักเนื้อด้วยน้ำมันมะกอก และผงปรุงรส ​ใส่น้ำมันหอย คลุกให้ทั่วชิ้นเนื้อ โรยพริกไทยดำป่นตามชอบ เสร็จแล้วปิดพลาสติกนำเข้าตู้เย็น หมักไว้อย่างน้อย 1 ชั่วโมง,​ระหว่างหมักเนื้อมาทำน้ำจิ้มแจ่ว โดยใส่น้ำตาลปี๊บลงในถ้วย ตามด้วยน้ำมะขามเปียก และน้ำมะนาว ใส่พริกป่นกับน้ำปลา คนให้เข้ากันชิมรสตามชอบ ใส่หอมแดงซอย ​ใส่ผักชีฝรั่งซอยกับข้าวคั่วใหม่ ๆ คนให้เข้ากัน ชิมรสตามชอบ,พอหมักครบเวลานำเนื้อไปย่าง ถ้ามีเตาถ่านก็จะดี เพราะจะหอม แต่ถ้าไม่มีก็ย่างเตาที่มี ย่างข้างละประมาณ 7-8 นาที ใช้ไฟกลาง ๆ แล้วแต่ชิ้นเนื้อด้วย อย่าเอาสุกมากไป จากนั้นก็เอามาหั่นชิ้นพอคำ จิ้มกับน้ำจิ้มแจ่ว กินกับข้าวเหนียวร้อน ๆ อร่อย', 5, '2022-09-15 17:16:14', '2022-09-15 17:16:14'),
(16, 'ไก่ย่างหนังกรอบ', 'หากพูดถึงเมนูที่หากินง่ายในบ้านเราและราคาไม่แพง แน่นอนว่า \"ไก่ย่าง\" เป็นเมนูอันดับแรก ๆ ยิ่งถ้ามีข้าวเหนียว ส้มตำ ต้มแซ่บ โอ้โห... (พูดแล้วเปรี้ยวปาก) ซึ่งเมนูไก่ย่างนี้จะบอกว่าทำง่ายก็ไม่เชิง เพราะแต่ละร้านจะมีสูตรเด็ดที่แตกต่างกันออกไป', 'https://image.bangkokbiznews.com/image/kt/media/image/fileupload1/source/159736078730.jpg?1597447178823', '​ นำส่วนผสมที่เตรียมไว้มาคลุกเคล้ากับเนื้อสะโพกไก่\r\n(ยกเว้น น้ำมันมะกอก),นวดให้เข้ากัน,หมักไว้ประมาณ 45 นาที หรือ 1 ชั่วโมง,เมื่อครบเวลาหมักแล้ว นำน้ำมันมะกอกมาทาบนผิวสะโพกไก่ให้ทั่ว,จากนั้นนำไปย่างโดยใช้ไฟกลาง (ในสูตรใช้หม้อทอดไร้น้ำมันที่อุณหภูมิประมาณ 165 องศาเซลเซียส) เป็นเวลา 15 นาที,ค่อย ๆ ย่างไปจ้า ใช้เวลาหน่อยแต่ไม่ต้องรีบ หนังจะกรอบหรือไม่กรอบวัดกันตรงนี้เลย 15 นาทีแรก หนังไก่เริ่มฟูพองมาแล้ว แต่เนื้อในยังไม่สุก,​ให้นำน้ำมันมะกอกทาบนผิวหนังสะโพกไก่อีกครั้ง จากนั้นนำไปย่างต่ออีกประมาณ 10 นาที จนสุกทั่ว', 5, '2022-09-15 17:26:39', '2022-09-15 17:26:39'),
(17, 'แกงเนื้อ', 'สำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา', 'https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg', 'เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ', 1, '2022-09-16 09:19:55', '2022-09-16 09:19:55'),
(18, 'แกงเนื้อ', 'สำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา', 'https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg', 'เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ', 1, '2022-09-16 09:20:39', '2022-09-16 09:20:39'),
(19, 'แกงเนื้อ', 'สำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา', 'https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg', 'เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ', 1, '2022-09-16 09:20:40', '2022-09-16 09:20:40'),
(20, 'แกงเนื้อ', 'สำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา', 'https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg', 'เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ', 1, '2022-09-16 09:21:14', '2022-09-16 09:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `recipes_ingredient`
--

CREATE TABLE `recipes_ingredient` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `Ingredient_id` int(11) NOT NULL,
  `qty` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipes_ingredient`
--

INSERT INTO `recipes_ingredient` (`id`, `recipe_id`, `unit_id`, `Ingredient_id`, `qty`) VALUES
(1, 1, 20, 11, '5'),
(2, 1, 5, 52, '200'),
(3, 1, 1, 43, '2'),
(4, 1, 1, 48, '3'),
(5, 1, 1, 45, '3'),
(6, 1, 5, 46, '500'),
(7, 1, 5, 58, '200'),
(8, 1, 2, 59, '2'),
(9, 1, 21, 36, '1'),
(10, 1, 2, 2, '3'),
(11, 1, 2, 50, '4'),
(15, 3, 17, 60, '200'),
(16, 3, 2, 3, '1+1/2'),
(17, 3, 2, 2, '3'),
(18, 3, 7, 61, '3-5'),
(19, 3, 7, 62, '2-3'),
(20, 3, 12, 10, '1-2'),
(21, 4, 22, 9, 'สำหรับผัด'),
(22, 4, 2, 65, '2'),
(23, 4, 1, 43, '1'),
(24, 4, 5, 28, '300'),
(25, 4, 3, 7, '3'),
(26, 4, 2, 2, '1'),
(27, 4, 2, 44, '1'),
(28, 4, 5, 41, '50'),
(29, 5, 6, 66, '1'),
(30, 5, 4, 2, '1'),
(31, 5, 13, 68, '10'),
(32, 5, 2, 3, '1/2'),
(33, 5, 2, 69, '1'),
(34, 5, 2, 5, '1/2'),
(35, 5, 5, 13, '15'),
(36, 6, 5, 70, '250'),
(37, 6, 24, 13, '4'),
(38, 6, 23, 75, '3'),
(39, 6, 13, 73, '9'),
(40, 6, 2, 71, '1'),
(41, 6, 2, 72, '2'),
(42, 6, 2, 76, '4'),
(43, 6, 4, 3, '1'),
(44, 6, 12, 53, '2'),
(45, 6, 3, 7, '4'),
(46, 7, 1, 72, '1/4'),
(47, 7, 5, 77, '180'),
(48, 7, 5, 20, '300'),
(49, 7, 5, 13, '30'),
(50, 7, 2, 2, '1'),
(51, 7, 13, 78, '2'),
(52, 8, 11, 14, '4'),
(53, 8, 4, 2, '2'),
(54, 8, 16, 8, '1'),
(55, 8, 5, 56, '30'),
(56, 8, 5, 53, '10'),
(57, 8, 5, 7, '10'),
(58, 8, 2, 2, '2'),
(59, 8, 2, 67, '1'),
(60, 8, 5, 68, '50'),
(61, 8, 5, 80, '20'),
(62, 8, 17, 1, '20'),
(63, 9, 5, 81, '500'),
(64, 9, 5, 56, '20'),
(65, 9, 12, 53, '3'),
(66, 9, 3, 7, '3'),
(67, 9, 23, 75, '5'),
(68, 9, 2, 68, '3'),
(69, 9, 2, 80, '2'),
(70, 9, 2, 2, '2'),
(71, 9, 2, 1, '3'),
(72, 10, 17, 8, '400'),
(73, 10, 25, 56, '3 (หั่นแว่น)'),
(74, 10, 12, 53, '1'),
(75, 10, 3, 7, '3'),
(76, 10, 23, 75, '1'),
(77, 10, 5, 83, '30'),
(78, 10, 8, 24, '1'),
(79, 10, 2, 2, '2'),
(80, 10, 4, 3, '1'),
(81, 10, 13, 68, '5'),
(82, 10, 2, 1, '2'),
(83, 11, 8, 24, '2'),
(84, 11, 15, 84, '1'),
(85, 11, 2, 13, '1'),
(86, 12, 6, 30, '1'),
(87, 12, 15, 84, '2'),
(88, 12, 2, 85, '1'),
(89, 12, 13, 68, '20'),
(90, 12, 24, 13, '20'),
(91, 12, 26, 86, '3'),
(92, 12, 4, 36, '1'),
(93, 12, 22, 9, 'สำหรับทอด'),
(94, 13, 25, 87, '4'),
(95, 13, 23, 88, '1'),
(96, 13, 1, 89, '1'),
(97, 13, 1, 84, '1'),
(98, 13, 1, 84, '1'),
(99, 13, 2, 19, '1/2'),
(100, 13, 2, 18, '1'),
(101, 13, 2, 90, '1'),
(102, 13, 22, 40, 'สำหรับตกแต่ง'),
(103, 14, 5, 91, '600'),
(104, 14, 2, 69, '3'),
(105, 14, 2, 92, '1 '),
(106, 14, 4, 35, '1'),
(107, 14, 25, 29, '2'),
(108, 14, 2, 34, '2'),
(109, 15, 2, 6, '1'),
(110, 15, 25, 29, '2'),
(111, 15, 2, 34, '2'),
(112, 15, 2, 69, '2'),
(113, 15, 4, 35, '1'),
(114, 16, 25, 93, '4'),
(115, 16, 2, 5, '2-3'),
(116, 16, 2, 69, '2-3'),
(117, 16, 4, 35, '2-3'),
(118, 16, 4, 40, '2-3'),
(119, 16, 4, 6, '2'),
(120, 16, 1, 34, '1'),
(121, 17, 5, 29, '400'),
(122, 17, 17, 48, '400'),
(123, 17, 2, 12, '2'),
(124, 18, 5, 29, '400'),
(125, 18, 17, 48, '400'),
(126, 18, 2, 12, '2'),
(127, 18, 17, 60, '200'),
(128, 18, 2, 3, '1+1/2'),
(129, 18, 2, 2, '3'),
(130, 18, 7, 61, '3-5'),
(131, 18, 7, 62, '2-3'),
(132, 18, 12, 10, '1-2'),
(133, 19, 5, 29, '400'),
(134, 19, 17, 48, '400'),
(135, 19, 2, 12, '2'),
(136, 19, 17, 60, '200'),
(137, 19, 2, 3, '1+1/2'),
(138, 19, 2, 2, '3'),
(139, 19, 7, 61, '3-5'),
(140, 19, 7, 62, '2-3'),
(141, 19, 12, 10, '1-2'),
(142, 20, 5, 29, '400'),
(143, 20, 17, 48, '400'),
(144, 20, 2, 12, '2'),
(145, 20, 17, 60, '200'),
(146, 20, 2, 3, '1+1/2'),
(147, 20, 2, 2, '3'),
(148, 20, 7, 61, '3-5'),
(149, 20, 7, 62, '2-3'),
(150, 20, 12, 10, '1-2');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'แกง', '2022-09-13 16:08:00', '2022-09-13 16:08:00'),
(2, 'ผัด', '2022-09-13 16:08:04', '2022-09-13 16:08:04'),
(3, 'ต้ม', '2022-09-13 16:08:08', '2022-09-13 16:08:08'),
(4, 'ทอด', '2022-09-13 16:08:12', '2022-09-13 16:08:12'),
(5, 'ย่าง', '2022-09-13 16:08:16', '2022-09-13 16:08:16'),
(6, 'ยำ', '2022-09-13 16:08:20', '2022-09-13 16:08:20'),
(7, 'คลีน', '2022-09-13 16:08:24', '2022-09-13 16:08:24'),
(8, 'คิโต', '2022-09-13 16:08:29', '2022-09-13 16:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unit`) VALUES
(1, 'ถ้วย'),
(2, 'ช้อนโต๊ะ'),
(3, 'ใบ'),
(4, 'ช้อนชา'),
(5, 'กรัม'),
(6, 'กิโลกรัม'),
(7, 'ลูก'),
(8, 'กระป๋อง'),
(9, 'จับ'),
(10, 'ตัว'),
(11, 'ฟอง'),
(12, 'ต้น'),
(13, 'เม็ด'),
(14, 'ช้อนตวง'),
(15, 'ถ้วยตวง\r\n'),
(16, 'ลิตร'),
(17, 'มิลลิลิตร'),
(18, 'ออนซ์'),
(19, 'ปอนด์'),
(20, 'น่อง\r\n'),
(21, 'หยิบมือ'),
(22, '-'),
(23, 'หัว'),
(24, 'กลีบ'),
(25, 'ชิ้น'),
(26, 'ราก');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`Ingredient_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `Type_id` (`type_id`);

--
-- Indexes for table `recipes_ingredient`
--
ALTER TABLE `recipes_ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `Ingredient_id` (`Ingredient_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `Ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `recipes_ingredient`
--
ALTER TABLE `recipes_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
