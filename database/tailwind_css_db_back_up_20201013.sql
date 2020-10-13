/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.6-MariaDB : Database - tailwind_css
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tailwind_css` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tailwind_css`;

/*Table structure for table `add_carts` */

DROP TABLE IF EXISTS `add_carts`;

CREATE TABLE `add_carts` (
  `id` char(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` char(36) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_note` varchar(255) DEFAULT NULL,
  `order_historie_id` varchar(255) DEFAULT NULL,
  `item_price` double(8,2) NOT NULL,
  `item_order_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `add_carts` */

insert  into `add_carts`(`id`,`user_id`,`item_id`,`quantity`,`item_note`,`order_historie_id`,`item_price`,`item_order_status`,`created_at`,`updated_at`,`deleted_at`) values 
('3bcef198-5c94-4128-8615-c4d67b7455f7',1,'9d16ff72-066b-46b2-92b1-9a0354cde40d',1,NULL,'202010131-4811602566361',300.00,2,'2020-10-13 05:19:21','2020-10-13 05:19:21',NULL),
('8372aca0-1995-4189-8687-f20b8fa47007',1,'c53022b7-58d2-450a-a18f-acd5dcafaecc',1,NULL,'202010111-33991602414464',280.00,3,'2020-10-11 11:07:44','2020-10-11 11:07:44',NULL),
('9299d03e-38aa-4981-8517-ae4e9c13c042',1,'6fc0f2e7-92e7-44bb-b965-28b9d7835f9b',1,NULL,'202010131-4811602566361',12.00,2,'2020-10-13 05:19:21','2020-10-13 05:19:21',NULL),
('caff1183-ba43-4ed9-b0a4-506bbb57393a',1,'68d53335-20cd-47b6-a371-3328a1dc9011',1,NULL,'202010111-33991602414464',190.00,3,'2020-10-11 11:07:44','2020-10-11 11:07:44',NULL),
('d87d049c-d79a-4698-aa51-937835cb22f8',1,'0f9b35a3-ae3a-4981-a99a-62c17604564e',1,NULL,'202010131-72261602571283',17.00,2,'2020-10-13 06:41:23','2020-10-13 06:41:23',NULL),
('ed984e1b-b294-4c51-ae93-d645d8d8ca89',1,'d28381fb-98df-408a-a765-964080cb0111',1,NULL,'202010131-4811602566361',320.00,2,'2020-10-13 05:19:21','2020-10-13 05:19:21',NULL),
('f483f09e-4f14-4d0a-848d-c224df026d16',1,'6fc0f2e7-92e7-44bb-b965-28b9d7835f9b',1,NULL,'202010111-33991602414464',12.00,3,'2020-10-11 11:07:44','2020-10-11 11:07:44',NULL);

/*Table structure for table `data_rows` */

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_rows` */

insert  into `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) values 
(1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),
(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),
(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),
(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),
(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),
(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),
(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),
(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),
(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),
(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),
(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),
(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),
(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),
(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),
(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),
(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),
(22,4,'id','hidden','Id',1,0,0,0,0,0,'{}',1),
(23,4,'item_name','text','Item Name',0,1,1,1,1,1,'{}',2),
(24,4,'item_price','number','Item Price',0,1,1,1,1,1,'{}',3),
(25,4,'item_banners','multiple_images','Item Banners',0,0,1,1,1,1,'{\"validation\":{\"rule\":\"required\"},\"resize\":{\"width\":\"200\",\"height\":\"240\"},\"quality\":\"100%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"},{\"type\":\"resize\",\"name\":\"resize\",\"width\":500,\"height\":500},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',4),
(26,4,'item_desc','rich_text_box','Item Desc',0,0,1,1,1,1,'{}',5),
(27,4,'status_id','select_dropdown','Status Id',0,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Enable\",\"2\":\"Disable\"}}',6),
(28,4,'created_by','select_dropdown','Created By',0,1,1,1,1,1,'{}',7),
(29,4,'updated_by','select_dropdown','Updated By',0,1,1,1,1,1,'{}',8),
(30,4,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',9),
(31,4,'updated_at','timestamp','Updated At',0,0,1,0,0,0,'{}',10),
(32,4,'deleted_at','timestamp','Deleted At',0,0,1,0,0,0,'{}',11),
(33,5,'id','hidden','Id',1,0,0,0,0,0,'{}',1),
(34,5,'user_id','select_dropdown','User Id',1,1,1,1,1,1,'{}',2),
(35,5,'item_id','select_dropdown','Item Id',1,1,1,1,1,1,'{}',3),
(36,5,'quantity','number','Quantity',1,1,1,1,1,1,'{}',4),
(37,5,'item_note','text','Item Note',0,0,1,1,1,1,'{}',5),
(38,5,'order_historie_id','select_dropdown','Order Historie Id',0,0,1,1,1,1,'{}',6),
(39,5,'item_price','text','Item Price',1,0,1,1,1,1,'{}',7),
(40,5,'item_order_status','select_dropdown','Item Order Status',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Added to Cart\",\"2\":\"Payment Successfull\",\"3\":\"Payment Un-Successfull\",\"4\":\"Shipped Out\",\"5\":\"Delivered\"}}',8),
(41,5,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',9),
(42,5,'updated_at','timestamp','Updated At',0,0,1,0,0,0,'{}',10),
(43,5,'deleted_at','timestamp','Deleted At',0,0,1,0,0,0,'{}',11);

/*Table structure for table `data_types` */

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_types` */

insert  into `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) values 
(1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2020-10-11 02:52:53','2020-10-11 02:52:53'),
(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-10-11 02:52:53','2020-10-11 02:52:53'),
(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2020-10-11 02:52:54','2020-10-11 02:52:54'),
(4,'items','items','Item','Items',NULL,'App\\Item',NULL,NULL,NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2020-10-11 04:38:54','2020-10-13 06:24:11'),
(5,'add_carts','add-carts','Add Cart','Add Carts',NULL,'App\\AddCart',NULL,NULL,NULL,1,1,'{\"order_column\":\"updated_at\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}','2020-10-11 08:21:05','2020-10-11 08:21:05');

/*Table structure for table `favorites` */

DROP TABLE IF EXISTS `favorites`;

CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `favorites` */

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` char(36) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` float DEFAULT NULL,
  `item_banners` longtext DEFAULT NULL,
  `item_desc` longtext DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `items` */

insert  into `items`(`id`,`item_name`,`item_price`,`item_banners`,`item_desc`,`status_id`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values 
('0f9b35a3-ae3a-4981-a99a-62c17604564e','Gore-Tex Under Mitt',17,'[\"items\\\\October2020\\\\7DBPg3jJJ8oGamxw3SZ0.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">The Ski Chalet &amp; Treasure Cove Scuba</a>.</em></p>\r\n<ul>\r\n<li>Screen Grab&Acirc;&reg; Toughgrip&acirc;&bdquo;&cent; Palm for Total Touchscreen Control</li>\r\n<li>DRYRIDE Durashell&acirc;&bdquo;&cent; 2-Layer Fabric</li>\r\n<li>Durably Waterproof, Windproof, and Breathable GORE-TEX&Acirc;&reg; Membrane + Gore warm technology</li>\r\n<li>Thermacore&acirc;&bdquo;&cent; Insulation</li>\r\n<li>Brushed Microfiber Fixed Lining</li>\r\n<li>Removable, 4-Way Stretch DRYRIDE Thermex&acirc;&bdquo;&cent; Liner with Sticky Icky&acirc;&bdquo;&cent; Grip Palm</li>\r\n<li>Hidden Heater/Vent Pocket</li>\r\n<li>Ergonomic Pre-Curved Fit</li>\r\n</ul>\r\n<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">The Ski Chalet &amp; Treasure Cove Scuba</a>.</em></p>\r\n<ul>\r\n<li>Guaranteed to keep you Dry GORE-TEX waterproof, breathable</li>\r\n<li>Zippered heater pack pocket</li>\r\n<li>Over the cuff gauntlet</li>\r\n<li>Single-handed drawcordPre-curved articulated fit</li>\r\n<li>Adjustable wrist strap</li>\r\n<li>Nylon Dobby Weave with XtCoating and Spylon+DWR</li>\r\n<li>3M Thinsulate Insulation (15g)</li>\r\n</ul>',1,NULL,NULL,'2020-10-13 06:02:41','2020-10-13 06:31:23',NULL),
('68d53335-20cd-47b6-a371-3328a1dc9011','GT Bike',190,'[\"items\\\\October2020\\\\nhEfXJBi8pHy0MNUmTeX.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p><strong>SmartAss, an emergency fender that\'s there when you need it, gone when you don\'t.</strong></p>\r\n<p>Tired of sitting at the office with a wet ass all day just because it rained this morning? Do you live in a climate where a shower can come out of nowhere even though the sun was shining just a minute ago? Not ready to bike in a wet suit or burden your bike with fenders? Relax. It\'s finally here.</p>\r\n<p>This updated version of the original Ass Saver now comes in a whopping 10 colors! It fits the Pure Fix drome &amp; comfort saddles perfectly, and also works with a wide range of other saddles!</p>\r\n<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p>Pure Fix Bar tape for our&Acirc;&nbsp;<a title=\"\">bull horn</a>&Acirc;&nbsp;and&Acirc;&nbsp;<a>drop</a>&Acirc;&nbsp;handlebars. &Acirc;&nbsp;This tape is the highest quality and of course, the end caps are included.</p>\r\n<p>We highly recommend having your bars wrapped professionally.</p>',1,NULL,NULL,'2020-10-11 05:08:00','2020-10-13 06:30:29',NULL),
('6fc0f2e7-92e7-44bb-b965-28b9d7835f9b','15mm Combo Wrench',12,'[\"items\\\\October2020\\\\P7Nlkdj61JXAV1KeKGOX.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<div id=\"\" class=\"\">\r\n<p class=\"\">This wrench packs a 10mm open-ended, 15mm pedal wrench &amp; 14x15mm&Acirc;&nbsp;sockets for crank fixing bolts and axle nuts. It\'s constructed with CrMo steel and is the perfect wrench to keep your wheels and pedals on tight!</p>\r\n<p class=\"\">&Acirc;&nbsp;</p>\r\n</div>',1,NULL,NULL,'2020-10-11 04:59:44','2020-10-13 06:25:35',NULL),
('8a621f4c-d404-4cc7-a93d-e01af874dadc','Jaxon',16,'[\"items\\\\October2020\\\\qvYkSNI5LHFj30POEdf3.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">The Ski Chalet &amp; Treasure Cove Scuba</a>.</em></p>\r\n<ul>\r\n<li>All leather glove</li>\r\n<li>Wool lining</li>\r\n<li>Gunn cut at palm for extra fit and dexterity</li>\r\n<li>Elasticized wrist</li>\r\n<li>Water-Resistant Goat Skin Leather</li>\r\n</ul>\r\n<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">The Ski Chalet &amp; Treasure Cove Scuba</a>.</em></p>\r\n<ul>\r\n<li>T-Hot back of palm for lightweight warmth</li>\r\n<li>Exclusive Nano technology keeps the body warm by absorbing heat, increasing the fabric temperature +5 degrees, and lasts the lifetime of the garment</li>\r\n<li>Light weight material, works for handheld touch screen devices</li>\r\n<li>Brushed Stretch THOT Interlock Fleece</li>\r\n</ul>',1,NULL,NULL,'2020-10-13 06:04:00','2020-10-13 06:31:46',NULL),
('9d16ff72-066b-46b2-92b1-9a0354cde40d','Trek Bicycle',300,'[\"items\\\\October2020\\\\KLkEZznkW0L6Wb5MqIkH.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p>Pure Fix Bar tape for our&Acirc;&nbsp;<a title=\"\">bull horn</a>&Acirc;&nbsp;and&Acirc;&nbsp;<a>drop</a>&Acirc;&nbsp;handlebars. &Acirc;&nbsp;This tape is the highest quality and of course, the end caps are included.</p>\r\n<p>We highly recommend having your bars wrapped professionally.</p>',1,NULL,NULL,'2020-10-11 05:02:54','2020-10-13 06:26:04',NULL),
('a1728e73-817d-462f-8d01-0d20b1be5f1d','Bianchi Bike',350,'[\"items\\\\October2020\\\\2LEVV8UmZRqelAE1QkNn.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a href=\"https://www.purefixcycles.com\" target=\"_blank\" rel=\"noopener\">Pure Fix Cycles</a></em></p>\r\n<p>This is arguably the best maintenance tool to carry as a rider. The 4mm, 5mm, 6mm Y-Wrench will tighten almost every single allen screw on your bike. It\'s a cycling must!</p>\r\n<p><em>This is a demonstration store. You can purchase products like this from <a href=\"https://www.purefixcycles.com\" target=\"_blank\" rel=\"noopener\">Pure Fix Cycles</a></em></p>\r\n<p>Ready to take your riding to another level, literally?&Acirc;&nbsp; Our adjustable stem can help you do just that.&Acirc;&nbsp; Compatible with all our standard bikes, the Pure Fix adjustable stem allows for the handlebars to be raised, providing a more comfortable, upright riding position.&Acirc;&nbsp; This not only increases rider visibility, but also makes your back really, really happy.</p>',1,NULL,NULL,'2020-10-11 05:06:38','2020-10-13 06:29:12',NULL),
('c53022b7-58d2-450a-a18f-acd5dcafaecc','Scott Bicycle',280,'[\"items\\\\October2020\\\\dKUerjABMuopDw5G47bU.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p>Our Pure Fix 50mm brake pads are designed to work with any standard road caliper brake, including all Pure Fix brake sets.&Acirc;&nbsp;</p>\r\n<p>List of Specs:</p>\r\n<ul>\r\n<li>Threaded</li>\r\n<li>Screw attachment</li>\r\n<li>Tough and durable material</li>\r\n<li>50mm</li>\r\n<li>Fits all standard road caliper brakes</li>\r\n<li>Sold in pairs</li>\r\n<li>Available in white or black</li>\r\n</ul>',1,NULL,NULL,'2020-10-11 05:05:00','2020-10-13 06:27:13',NULL),
('d28381fb-98df-408a-a765-964080cb0111','Specialized Bike',320,'[\"items\\\\October2020\\\\pwTnIKOkn6iZHbEmrrj6.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p>Our Tektro brakes come as a full, dual-pivot, forged alloy set, which includes a brake, caliper, lever, cable, housing, and brake pads. These brakes also come in two awesome colors: alloy and black.</p>\r\n<p>All of our standard fixies ship with a front brake but if you want that extra safety in the back, be sure to grab a rear brake as well!</p>\r\n<ul class=\"\">\r\n<li><span class=\"\">Brake reach: </span><span class=\"\">41mm-57mm&Acirc;&nbsp;</span></li>\r\n</ul>',1,NULL,NULL,'2020-10-11 05:04:04','2020-10-13 06:26:31',NULL),
('db346c2c-4911-4886-817c-88cb83920b19','Approach Under Glove',12.5,'[\"items\\\\October2020\\\\XwCX7rdVGA6WfirbFAt2.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">The Ski Chalet &amp; Treasure Cove Scuba</a>.</em></p>\r\n<ul>\r\n<li>Screen Grab&Acirc;&reg; Toughgrip&acirc;&bdquo;&cent; Palm for Total Touchscreen Control</li>\r\n<li>DRYRIDE Ultrashell&acirc;&bdquo;&cent; 2-Layer Fabric</li>\r\n<li>220G Removable Fleece Liner</li>\r\n<li>Soft Chamois Goggle Wipe</li>\r\n<li>Ergonomic Pre-Curved Fit</li>\r\n</ul>',1,NULL,NULL,'2020-10-13 06:01:11','2020-10-13 06:31:04',NULL),
('e5f7b21a-9905-4ad2-a55e-6b5e6028f289','Nicky',230,'[\"items\\\\October2020\\\\ioGMOWcHQKDuhL9ogQ0z.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">The Ski Chalet &amp; Treasure Cove Scuba</a>.</em></p>\r\n<ul class=\"\">\r\n<li>Feminine down jacket</li>\r\n<li>Extremely water resistant (20,000 mm water column), highly breathable ski nylon</li>\r\n<li>Breathability of 20,000 g / m&Acirc;&sup2; / 24h</li>\r\n<li>Figure-hugging fit</li>\r\n<li>Multi-pattern quilting detail</li>\r\n<li>Width-adjustable, zip-off hood</li>\r\n<li>Hood is fur compatible with fur trim HOODFUR2, sold separately</li>\r\n<li>Star embroidery accented with Swarovski crystals on left sleeve</li>\r\n<li>Two zip pockets, one sleeve pocket</li>\r\n<li>Two-way zipper</li>\r\n<li>Zipper pocket on the inside</li>\r\n<li>Elastic wrist gaiters</li>\r\n<li>Powder skirt</li>\r\n<li>Lined with leopard print, 100% polyester</li>\r\n<li>650 Fill Power</li>\r\n<li>Filling 80% goose down, 20% feathers</li>\r\n</ul>',1,NULL,NULL,'2020-10-13 06:05:46','2020-10-13 06:24:40',NULL),
('f4910d84-d7ac-414e-ac5a-08acf2d84ec7','Cannondale Bicycle',150,'[\"items\\\\October2020\\\\AhTyKPVElx1ww68y7BbY.jpeg\"]','<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p>These 42cm alloy bull horn handlebars are a thing of beauty. Designed by Pure Fix Cycles in California.</p>\r\n<div class=\"\">List of Specs:\r\n<ul>\r\n<li>17\"\" Wide</li>\r\n<li>2.5\"\" High</li>\r\n<li>These bars have an ISO standard 25.4mm stem clamp diameter and 22.2mm brake clamp diameter</li>\r\n</ul>\r\n</div>\r\n<p><em>This is a demonstration store. You can purchase products like this from <a target=\"\">Pure Fix Cycles</a></em></p>\r\n<p>These heavy-duty, light-weight chain tensioners are available in black and silver. &Acirc;&nbsp;Sold as a pair, our Pure Fix tensioners fit all of our awesome standard fixies.<br /><br />List of Specs:</p>\r\n<ul>\r\n<li>Screw attachment</li>\r\n<li>20mm extension</li>\r\n<li>Fits all standard drop-outs</li>\r\n<li>Available in black or silver</li>\r\n<li>Sold in pairs</li>\r\n</ul>',1,NULL,NULL,'2020-10-11 05:05:53','2020-10-13 06:28:27',NULL);

/*Table structure for table `menu_items` */

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

insert  into `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) values 
(1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2020-10-11 02:53:00','2020-10-11 02:53:00','voyager.dashboard',NULL),
(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2020-10-11 02:53:00','2020-10-11 05:11:16','voyager.media.index',NULL),
(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2020-10-11 02:53:01','2020-10-11 02:53:01','voyager.users.index',NULL),
(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2020-10-11 02:53:01','2020-10-11 02:53:01','voyager.roles.index',NULL),
(5,1,'Tools','','_self','voyager-tools',NULL,NULL,5,'2020-10-11 02:53:01','2020-10-11 05:11:16',NULL,NULL),
(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2020-10-11 02:53:02','2020-10-11 05:11:16','voyager.menus.index',NULL),
(7,1,'Database','','_self','voyager-data',NULL,5,2,'2020-10-11 02:53:02','2020-10-11 05:11:16','voyager.database.index',NULL),
(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2020-10-11 02:53:02','2020-10-11 05:11:16','voyager.compass.index',NULL),
(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2020-10-11 02:53:03','2020-10-11 05:11:16','voyager.bread.index',NULL),
(10,1,'Settings','','_self','voyager-settings',NULL,NULL,6,'2020-10-11 02:53:03','2020-10-11 05:11:16','voyager.settings.index',NULL),
(11,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2020-10-11 02:53:21','2020-10-11 05:11:16','voyager.hooks',NULL),
(12,1,'Items','','_self',NULL,NULL,NULL,7,'2020-10-11 04:38:55','2020-10-11 05:11:16','voyager.items.index',NULL),
(13,1,'Add Carts','','_self',NULL,NULL,NULL,8,'2020-10-11 08:21:05','2020-10-11 08:21:05','voyager.add-carts.index',NULL);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'admin','2020-10-11 02:53:00','2020-10-11 02:53:00');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2016_01_01_000000_add_voyager_user_fields',2),
(4,'2016_01_01_000000_create_data_types_table',2),
(5,'2016_05_19_173453_create_menu_table',2),
(6,'2016_10_21_190000_create_roles_table',2),
(7,'2016_10_21_190000_create_settings_table',2),
(8,'2016_11_30_135954_create_permission_table',2),
(9,'2016_11_30_141208_create_permission_role_table',2),
(10,'2016_12_26_201236_data_types__add__server_side',2),
(11,'2017_01_13_000000_add_route_to_menu_items_table',2),
(12,'2017_01_14_005015_create_translations_table',2),
(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',2),
(14,'2017_03_06_000000_add_controller_to_data_types_table',2),
(15,'2017_04_21_000000_add_order_to_data_rows_table',2),
(16,'2017_07_05_210000_add_policyname_to_data_types_table',2),
(17,'2017_08_05_000000_add_group_to_settings_table',2),
(18,'2017_11_26_013050_add_user_role_relationship',2),
(19,'2017_11_26_015000_create_user_roles_table',2),
(20,'2018_03_11_000000_add_user_settings',2),
(21,'2018_03_14_000000_add_details_to_data_types_table',2),
(22,'2018_03_16_000000_make_settings_value_nullable',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('admin@admin.com','$2y$10$FzIe152VZgAin5xLaJ.iy.l1ES1dNci74xHvBI3lI.wY5Nm.pOkF2','2020-10-11 04:11:08');

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) values 
(1,'browse_admin',NULL,'2020-10-11 02:53:04','2020-10-11 02:53:04'),
(2,'browse_bread',NULL,'2020-10-11 02:53:05','2020-10-11 02:53:05'),
(3,'browse_database',NULL,'2020-10-11 02:53:05','2020-10-11 02:53:05'),
(4,'browse_media',NULL,'2020-10-11 02:53:05','2020-10-11 02:53:05'),
(5,'browse_compass',NULL,'2020-10-11 02:53:06','2020-10-11 02:53:06'),
(6,'browse_menus','menus','2020-10-11 02:53:06','2020-10-11 02:53:06'),
(7,'read_menus','menus','2020-10-11 02:53:06','2020-10-11 02:53:06'),
(8,'edit_menus','menus','2020-10-11 02:53:07','2020-10-11 02:53:07'),
(9,'add_menus','menus','2020-10-11 02:53:07','2020-10-11 02:53:07'),
(10,'delete_menus','menus','2020-10-11 02:53:08','2020-10-11 02:53:08'),
(11,'browse_roles','roles','2020-10-11 02:53:08','2020-10-11 02:53:08'),
(12,'read_roles','roles','2020-10-11 02:53:08','2020-10-11 02:53:08'),
(13,'edit_roles','roles','2020-10-11 02:53:09','2020-10-11 02:53:09'),
(14,'add_roles','roles','2020-10-11 02:53:09','2020-10-11 02:53:09'),
(15,'delete_roles','roles','2020-10-11 02:53:09','2020-10-11 02:53:09'),
(16,'browse_users','users','2020-10-11 02:53:09','2020-10-11 02:53:09'),
(17,'read_users','users','2020-10-11 02:53:10','2020-10-11 02:53:10'),
(18,'edit_users','users','2020-10-11 02:53:10','2020-10-11 02:53:10'),
(19,'add_users','users','2020-10-11 02:53:10','2020-10-11 02:53:10'),
(20,'delete_users','users','2020-10-11 02:53:12','2020-10-11 02:53:12'),
(21,'browse_settings','settings','2020-10-11 02:53:13','2020-10-11 02:53:13'),
(22,'read_settings','settings','2020-10-11 02:53:13','2020-10-11 02:53:13'),
(23,'edit_settings','settings','2020-10-11 02:53:14','2020-10-11 02:53:14'),
(24,'add_settings','settings','2020-10-11 02:53:14','2020-10-11 02:53:14'),
(25,'delete_settings','settings','2020-10-11 02:53:14','2020-10-11 02:53:14'),
(26,'browse_hooks',NULL,'2020-10-11 02:53:21','2020-10-11 02:53:21'),
(27,'browse_items','items','2020-10-11 04:38:55','2020-10-11 04:38:55'),
(28,'read_items','items','2020-10-11 04:38:55','2020-10-11 04:38:55'),
(29,'edit_items','items','2020-10-11 04:38:55','2020-10-11 04:38:55'),
(30,'add_items','items','2020-10-11 04:38:55','2020-10-11 04:38:55'),
(31,'delete_items','items','2020-10-11 04:38:55','2020-10-11 04:38:55'),
(32,'browse_add_carts','add_carts','2020-10-11 08:21:05','2020-10-11 08:21:05'),
(33,'read_add_carts','add_carts','2020-10-11 08:21:05','2020-10-11 08:21:05'),
(34,'edit_add_carts','add_carts','2020-10-11 08:21:05','2020-10-11 08:21:05'),
(35,'add_add_carts','add_carts','2020-10-11 08:21:05','2020-10-11 08:21:05'),
(36,'delete_add_carts','add_carts','2020-10-11 08:21:05','2020-10-11 08:21:05');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) values 
(1,'admin','Administrator','2020-10-11 02:53:03','2020-10-11 02:53:03'),
(2,'user','Normal User','2020-10-11 02:53:04','2020-10-11 02:53:04');

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) values 
(1,'site.title','Site Title','Site Title','','text',1,'Site'),
(2,'site.description','Site Description','Site Description','','text',2,'Site'),
(3,'site.logo','Site Logo','','','image',3,'Site'),
(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),
(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),
(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),
(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),
(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),
(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');

/*Table structure for table `translations` */

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `translations` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_roles` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`avatar`,`email_verified_at`,`password`,`remember_token`,`settings`,`created_at`,`updated_at`) values 
(1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$VIiPPoKsrjlET3k65EDw3OStT7tHpaVfuYKdmtyFEVPPHQcV7BLGm',NULL,NULL,'2020-10-11 02:53:38','2020-10-11 02:53:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
