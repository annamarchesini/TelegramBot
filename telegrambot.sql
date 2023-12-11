-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 11, 2023 alle 23:12
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telegrambot`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `infoproducts`
--

CREATE TABLE `infoproducts` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `title_link` varchar(500) NOT NULL,
  `price` varchar(20) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `delivery` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `infoproducts`
--

INSERT INTO `infoproducts` (`id`, `title`, `title_link`, `price`, `rating`, `delivery`) VALUES
(1, 'Wilson Federer Adult Recreational Tennis Racket - Grip Size 3 - 4 3/8\", Red/White/Black', 'https://www.amazon.com/Wilson-WRT30400U3-Federer-Tennis-Racquet/dp/B01AWLHRSO/ref=sr_1_1?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-1', '$29.99', '4.7 out of 5 stars', 'Delivery Thu, Dec 21'),
(2, 'WILSON Tour Slam Adult Recreational Tennis Rackets', 'https://www.amazon.com/Wilson-Strung-Tennis-Racquet-4-Inch/dp/B00TQKBPTU/ref=sr_1_2?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-2', '$30.00', '4.6 out of 5 stars', 'Delivery Fri, Dec 15'),
(3, 'Head Lynx String Set', 'https://www.amazon.com/HEAD-Tennis-String-Green-gauge/dp/B07FS2PCSG/ref=sr_1_3?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-3', '$13.00', '4.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(4, 'Gamma Sports String Things Vibration Dampener', 'https://www.amazon.com/Gamma-Sports-String-Vibration-Dampeners/dp/B00IL5Y52A/ref=sr_1_4?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-4', '$8.16', '4.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(5, 'Kirschbaum Reel Super Smash Tennis String', 'https://www.amazon.com/Kirschbaum-Savers-Tennis-String-Orange/dp/B009VY5GWI/ref=sr_1_5?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-5', '$57.56', '4.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(6, 'HEAD Velocity MLT Tennis Racket String 40\' Set Multifilament Racquet String', 'https://www.amazon.com/HEAD-Velocity-Tennis-String-Black/dp/B00Y3QUZXE/ref=sr_1_6?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-6', '$10.90', '4.5 out of 5 stars', 'Delivery Thu, Dec 21'),
(7, 'Head RIP Control Tennis Racket String 40\' Set - 17 Gauge Multifilament Racquet String, Natural', 'https://www.amazon.com/Head-Rip-Control-Tennis-String/dp/B0023OXNF0/ref=sr_1_7?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-7', '$12.00', '4.5 out of 5 stars', 'Delivery Thu, Dec 21'),
(8, 'Python Atlas Deluxe Racquetball String (Natural or Black Color/ 16g, 17g, 18g) (42 ft.)', 'https://www.amazon.com/Python-Atlas-Deluxe-Racquetball-String/dp/B015ZS8TFY/ref=sr_1_8?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-8', '$14.95', '4.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(9, 'HEAD Hawk Touch Tennis Racket String', 'https://www.amazon.com/HEAD-Hawk-Tennis-String-White/dp/B00GIZE4VM/ref=sr_1_9?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-9', '$16.00', '4.5 out of 5 stars', 'Delivery Thu, Dec 21'),
(10, 'Solinco Tour Bite Soft - Tennis String - 40 Foot Pack', 'https://www.amazon.com/Solinco-16-1-30mm-Tennis-String-Silver/dp/B00BCUCV5E/ref=sr_1_10?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-10', '$12.99', '4.5 out of 5 stars', 'Delivery Thu, Dec 21'),
(11, 'Alu Pearl Rough | 200m (660ft) Reel | Grooved Co-Poly Tennis Racket String', 'https://www.amazon.com/OEHMS-Pearl-Grooved-Co-Poly-Tennis-String/dp/B081TDK2MD/ref=sr_1_11?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-11', '$59.95', '4.5 out of 5 stars', 'Delivery Thu, Dec 21'),
(12, 'Duo Tennis String - Set, Yellow, Bronze and Grey', 'https://www.amazon.com/Wilson-Control-Hybrid-Tennis-Luxilon/dp/B0787KRM3Q/ref=sr_1_12?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-12', '$21.95', '4.4 out of 5 stars', 'Delivery Thu, Dec 21'),
(13, 'WILSONstring', 'https://www.amazon.com/Wilson-Sensation-Gauge-Tennis-String/dp/B07M863V2B/ref=sr_1_13?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-13', '$12.95', '4.7 out of 5 stars', 'Delivery Thu, Dec 21'),
(14, 'Babolat Vibrakill Vibration Dampener', 'https://www.amazon.com/Babolat-Vibrakill-Vibration-Dampener-Clear/dp/B002TXBF1O/ref=sr_1_14?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-14', '$12.95', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(15, 'Premium Poly Durable Tennis String', 'https://www.amazon.com/Tourna-Premium-Durable-Tennis-String/dp/B0843CKKXS/ref=sr_1_15?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-15', '$33.67', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(16, 'WILSONstring', 'https://www.amazon.com/Wilson-Spin-Effect-Hybrid-String/dp/B014M8VF9U/ref=sr_1_16?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-16', '$18.95', '4.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(17, 'Big Hitter Black7 Ultimate Spin Polyester', 'https://www.amazon.com/Tourna-unisex-adult-Tennis-String/dp/B07WC6XVQC/ref=sr_1_17?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-17', '$9.95', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(18, 'HEAD Sonic Pro Monofilament Tennis Racket String 12m Set', 'https://www.amazon.com/Head-Sonic-Tennis-Racket-String/dp/B0014GLYUY/ref=sr_1_18?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-18', '$9.95', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(19, 'Gamma Synthetic Gut Series Tennis Racket String - Balance Of Playability And Extra Durability For All Playing Levels & Styles - 16, 17 or 18 Gauge (Black, Gold, Optic Yellow, Red, Royal Blue, White)', 'https://www.amazon.com/Gamma-Synthetic-Tennis-String-Black/dp/B002N43Q5C/ref=sr_1_19?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-19', '$10.00', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(20, 'Head Sonic Pro Monofilament Tennis Racket String 660\' Reel', 'https://www.amazon.com/HEAD-Sonic-Tennis-String-660ft/dp/B002AQ51DS/ref=sr_1_20?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-20', '$96.97', '4.6 out of 5 stars', ''),
(21, 'Wilson Revolve Spin 16 Tennis String - Set, Black', 'https://www.amazon.com/WILSON-Sporting-Goods-Revole-Tennis/dp/B01MZ5VNCX/ref=sr_1_21?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-21', '$10.95', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(22, 'Gamma Synthetic Gut Series W/Weatherguard Tennis Racket String - Playability & Extra Durability For All Playing Levels & Styles - 15L, 16 or 17 Gauge (Black, Blue, Gold, Silver, White, Yellow)', 'https://www.amazon.com/Gamma-Synthetic-Tennis-String-Wearguard/dp/B001QTH6Y2/ref=sr_1_22?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-22', '$10.03', '4.2 out of 5 stars', 'Delivery Thu, Dec 21'),
(23, 'Superkill XL Racquetball String', 'https://www.amazon.com/Ashaway-Superkill-XL-Racquetball-String/dp/B0009T0174/ref=sr_1_23?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-23', '$13.95', '4.3 out of 5 stars', 'Delivery Fri, Dec 22'),
(24, 'HEADHEAD Hawk Rough Tennis Racket String 660\' Reel - 17 Gauge Monofilament Racquet String', 'https://www.amazon.com/HEAD-Synthetic-Tennis-String-Blue/dp/B096MQ7VGZ/ref=sr_1_24?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-24', '$8.49', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(25, 'UltraKill 18 Racquetball String Set', 'https://www.amazon.com/Ashaway-UltraKill-Racquetball-String-Set/dp/B004TS7XWC/ref=sr_1_25?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-25', '$17.95', '5.0 out of 5 stars', 'Delivery Thu, Dec 21'),
(26, 'Big Hitter Silver', 'https://www.amazon.com/Tourna-Hitter-Silver-17-Guage-Tennis/dp/B00196P2TS/ref=sr_1_26?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-26', '$8.99', '4.2 out of 5 stars', 'Delivery Thu, Dec 21'),
(27, 'Big Hitter Blue Rough Maximum Spin Polyester Tennis String', 'https://www.amazon.com/TOURNA-Hitter-Maximum-Polyester-Tennis/dp/B07WC7CVHW/ref=sr_1_27?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-27', '$9.56', '4.1 out of 5 stars', 'Delivery Thu, Dec 21'),
(28, 'Dunlop Sports Silk Tennis String Set', 'https://www.amazon.com/Dunlop-Sports-Silk-Tennis-String/dp/B004DFZ7AG/ref=sr_1_28?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-28', '', '4.7 out of 5 stars', ''),
(29, 'Luxilon 4G 125 (16L) Gold Tennis String Set - Best Racket String for Max Tension and Cushioned Feel on Impact', 'https://www.amazon.com/Luxilon-Element-Gold-Tennis-String/dp/B082XJGJVY/ref=sr_1_29?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-29', '', '5.0 out of 5 stars', ''),
(30, '3 Pack Tennis Balls with Practice Training Sport', 'https://www.amazon.com/Springen-Tennis-Balls-Practice-Training/dp/B07BPRD1WN/ref=sr_1_30?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-30', '$10.99', '4.0 out of 5 stars', 'Delivery Thu, Dec 21'),
(31, 'Tourna Black Zone Polyester Tennis String', 'https://www.amazon.com/Tourna-Black-Polyeser-Tennis-String/dp/B00HQZJ1EI/ref=sr_1_31?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-31', '$12.00', '4.1 out of 5 stars', 'Delivery Thu, Dec 21'),
(32, 'GOSEN Proform-Tuff, for All-Round Players, Synthetic Tennis String', 'https://www.amazon.com/Gosen-ProForm-Tuff-Natural-Reel/dp/B00I32Q0OW/ref=sr_1_32?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-32', '$49.99', '4.5 out of 5 stars', 'Delivery Wed, Dec 27'),
(33, 'MultiKill 17g Racquetball String', 'https://www.amazon.com/ASHAWAY-MultiKill-17g-Racquetball-String/dp/B07F478HZZ/ref=sr_1_33?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-33', '$15.95', '4.3 out of 5 stars', 'Delivery Thu, Dec 21'),
(34, 'Head FXP 16g Tennis String', 'https://www.amazon.com/Head-FXP-17g-Tennis-String/dp/B000PEFZJM/ref=sr_1_34?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-34', '$9.50', '4.4 out of 5 stars', 'Delivery Thu, Dec 21'),
(35, 'TNT2 Pro Plus 17G Tennis String', 'https://www.amazon.com/Gamma-Twist-Tennis-String-Black/dp/B0026RTIVC/ref=sr_1_35?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-35', '$14.77', '4.1 out of 5 stars', '$19.38 delivery'),
(36, 'Tourna Ball And String Replacement for Tennis Trainers - universal fit', 'https://www.amazon.com/Tourna-String-Replacement-Tennis-Trainers/dp/B001VYT15E/ref=sr_1_36?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-36', '$3.99', '3.9 out of 5 stars', 'Delivery Thu, Dec 21'),
(37, 'Senston Tennis Ball with String Tennis Trainer Tennis Equipment Boxing Training Ball - 2 Pack', 'https://www.amazon.com/Senston-Tennis-Trainer-Equipment-Training/dp/B01B1H5GD6/ref=sr_1_37?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-37', '$9.50', '3.9 out of 5 stars', 'Delivery Thu, Dec 21'),
(38, 'Dunlop Sports S-Gut Synthetic Tennis String', 'https://www.amazon.com/DUNLOP-S-Gut-Tennis-String-Green/dp/B085BVYP8P/ref=sr_1_38?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-38', '$9.01', '4.1 out of 5 stars', 'Delivery Thu, Dec 21'),
(39, 'Tourna Extreme Power 17g Squash and Racquetball String Reel 100 Meters', 'https://www.amazon.com/Tourna-Extreme-Squash-Racquetball-String/dp/B01DM205YI/ref=sr_1_39?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-39', '$47.96', '5.0 out of 5 stars', 'Delivery Thu, Dec 21'),
(40, 'SUPERKILL II Racquetball String Set', 'https://www.amazon.com/Ashaway-SUPERKILL-Racquetball-String-Set/dp/B0001FDWIG/ref=sr_1_40?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-40', '$8.95', '5.0 out of 5 stars', 'Delivery Thu, Dec 21'),
(41, 'Solinco Tour Bite 4-Sided Poly (Polyester) 15L/16/16L/17/18/19/20 Gauge Tennis Racquet String Sets in Multi-Packs - Best for Spin, Control, and Durability (2-4-6-8-Packs)', 'https://www.amazon.com/Solinco-4-Sided-Polyester-Tennis-Racquet/dp/B09SBN9GPR/ref=sr_1_41?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-41', '', '5.0 out of 5 stars', ''),
(42, 'Vermont Tennis Ball Pick Up Tube [15 Ball Capacity] – Simple Tennis Ball Collection | Tennis Court Equipment | Tennis Coach Equipment | Tennis Coaching Gear', 'https://www.amazon.com/Net-World-Sports-Tennis-Ball/dp/B00XQCMP9S/ref=sr_1_42?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-42', '$26.99', '3.7 out of 5 stars', '$24.15 delivery Dec 28 - Jan 16'),
(43, 'Gejoy 4 Packs Tennis Training Ball with String Tennis Trainer Balls Self Practice Trainer Tool Tennis Ball Training Equipment for Tennis Trainer Practice Exercise', 'https://www.amazon.com/Gejoy-Training-Practice-Equipment-Exercise/dp/B0872Z6VX7/ref=sr_1_43?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-43', '$10.99', '3.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(44, 'Tecnifibre Court Tennis Balls (Case)', 'https://www.amazon.com/Tecnifibre-Court-Tennis-Balls-Case/dp/B0731TC39P/ref=sr_1_44?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-44', '', '3.9 out of 5 stars', ''),
(45, 'Tennis Trainer Rebound Ball with String Solo Tennis Training Kit Portable Tennis Practice Rebounder Equipment Training Tools with Long Elastic Rope for Adults, Kids, Beginners', 'https://www.amazon.com/Wiwaplex-Training-Rebounder-Equipment-Beginners/dp/B09FYX4CGN/ref=sr_1_45?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-45', '', '3.5 out of 5 stars', ''),
(46, 'GOSEN OG-Sheep Micro Super, Natural 40\' Super All-Round Performance, Synthetic Tennis String', 'https://www.amazon.com/GOSEN-OG-Sheep-Synthetic-Surrounded-filaments/dp/B000AS82YS/ref=sr_1_46?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-46', '$9.99', '3.6 out of 5 stars', 'Delivery Thu, Dec 21'),
(47, 'Alu Pearl Rough | 12m (40ft) Set | Grooved Co-Poly Tennis Racket String', 'https://www.amazon.com/OEHMS-Grooved-Co-Poly-Tennis-Racket/dp/B09YCXZ1LK/ref=sr_1_47?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-47', '$8.95', '3.5 out of 5 stars', 'Delivery Fri, Dec 22'),
(48, 'Tourna Big Hitter Blue Rough Maximum Spin Polyester Tennis String (BHBR-200-18)', 'https://www.amazon.com/Tourna-Hitter-Maximum-Polyester-BHBR-200-18/dp/B08MN7FQFV/ref=sr_1_48?keywords=tennis+racquet+tennis+ball+guitar+string&qid=1702330381&sr=8-48', '', '3.3 out of 5 stars', ''),
(49, 'GOSEN OG-Sheep All-Round Performance, Synthetic Tennis String', 'https://www.amazon.com/sspa/click?ie=UTF8&spc=MTo2NDE0MjAwNTQ5OTM0NzA5OjE3MDIzMzAzODE6c3BfYnRmOjIwMDA4NjI1OTg3NDQ5ODo6MDo6&url=%2FGosen-OG-Sheep-Micro-Tennis-String-4906365052165%2Fdp%2FB078BDVK3K%2Fref%3Dsr_1_49_sspa%3Fkeywords%3Dtennis%2Bracquet%2Btennis%2Bball%2Bguitar%2Bstring%26qid%3D1702330381%26sr%3D8-49-spons%26sp_csd%3Dd2lkZ2V0TmFtZT1zcF9idGY%26psc%3D1', '$54.99', '4.4 out of 5 stars', 'Delivery Thu, Dec 21'),
(50, 'Tennis Trainer Rebound Ball with String, Portable Tennis Equipment/Device for Self-Practice Tennis Ball, Solo Tennis Practice Rebound replaced ball with elastic black rope - Only one replaced ball', 'https://www.amazon.com/sspa/click?ie=UTF8&spc=MTo2NDE0MjAwNTQ5OTM0NzA5OjE3MDIzMzAzODE6c3BfYnRmOjMwMDA2MTc3OTQ1ODAwMjo6MDo6&url=%2FPortable-Equipment-Self-Practice-Practice-replaced%2Fdp%2FB0CGRPZ8MW%2Fref%3Dsr_1_50_sspa%3Fkeywords%3Dtennis%2Bracquet%2Btennis%2Bball%2Bguitar%2Bstring%26qid%3D1702330381%26sr%3D8-50-spons%26sp_csd%3Dd2lkZ2V0TmFtZT1zcF9idGY%26psc%3D1', '$5.08', '', 'Delivery Thu, Dec 21'),
(51, 'GOSEN AK Pro CX, Good Control and Tension Retention, Multifilament Tennis String', 'https://www.amazon.com/sspa/click?ie=UTF8&spc=MTo2NDE0MjAwNTQ5OTM0NzA5OjE3MDIzMzAzODE6c3BfYnRmOjIwMDA5MTg3NTg3MTA5ODo6MDo6&url=%2FGOSEN-Structured-monofilamen-Surrounded-Resistant%2Fdp%2FB00GKB5PFS%2Fref%3Dsr_1_51_sspa%3Fkeywords%3Dtennis%2Bracquet%2Btennis%2Bball%2Bguitar%2Bstring%26qid%3D1702330381%26sr%3D8-51-spons%26sp_csd%3Dd2lkZ2V0TmFtZT1zcF9idGY%26psc%3D1', '$12.99', '4.0 out of 5 stars', 'Delivery Thu, Dec 21'),
(52, '27” Tennis Racket for Adult 2 Pack Men Women Tennis Racquet Set for Beginner and Professional with Bag Tennis Ball Overgrips Vibration Damper', 'https://www.amazon.com/sspa/click?ie=UTF8&spc=MTo2NDE0MjAwNTQ5OTM0NzA5OjE3MDIzMzAzODE6c3BfYnRmOjIwMDE1NzM2MjQyMDY5ODo6MDo6&url=%2FRacquet-Beginner-Professional-Overgrips-Vibration%2Fdp%2FB0BYMW5VG6%2Fref%3Dsr_1_52_sspa%3Fkeywords%3Dtennis%2Bracquet%2Btennis%2Bball%2Bguitar%2Bstring%26qid%3D1702330381%26sr%3D8-52-spons%26sp_csd%3Dd2lkZ2V0TmFtZT1zcF9idGY%26psc%3D1', '$43.87', '4.5 out of 5 stars', 'Delivery Thu, Dec 21');

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `title_link` varchar(500) NOT NULL,
  `price` varchar(20) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `delivery` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `infoproducts`
--
ALTER TABLE `infoproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `infoproducts`
--
ALTER TABLE `infoproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT per la tabella `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
