/*
SQLyog  v12.2.6 (64 bit)
MySQL - 8.0.11 : Database - toy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`toy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `toy`;

/*Table structure for table `content` */

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `content` */

insert  into `content`(`id`,`title`,`pic`) values 
(1,'123玩具','wan1.png'),
(2,'234','wan2.png'),
(3,'345','wan3.png'),
(4,'456','wan4.png');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sell_point` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `brand` varchar(500) DEFAULT NULL,
  `image1` varchar(500) DEFAULT NULL,
  `image2` varchar(500) DEFAULT NULL,
  `fenlei` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`id`,`item_name`,`title`,`sell_point`,`price`,`num`,`image`,`brand`,`image1`,`image2`,`fenlei`) values 
(12,' aw',' alienware',' jiushidui',10000,20,'D:\\332.jpg',' dell',NULL,NULL,' '),
(13,'Ship','BigShip','ii',100,1,NULL,'HAIZHIBAO',NULL,NULL,'dads');

/*Table structure for table `item_cart` */

DROP TABLE IF EXISTS `item_cart`;

CREATE TABLE `item_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `item_cart` */

insert  into `item_cart`(`id`,`itemId`,`username`) values 
(1,12,'huang'),
(9,12,'huang'),
(10,12,'huang'),
(11,12,'huang'),
(12,12,'huang'),
(13,12,'huang'),
(14,12,'huang');

/*Table structure for table `item_cat` */

DROP TABLE IF EXISTS `item_cat`;

CREATE TABLE `item_cat` (
  `id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_parent` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_cat` */

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `managerName` varchar(255) DEFAULT NULL,
  `managerPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `manager` */

insert  into `manager`(`id`,`managerName`,`managerPassword`) values 
(1,'001','123');

/*Table structure for table `toyorder` */

DROP TABLE IF EXISTS `toyorder`;

CREATE TABLE `toyorder` (
  `order_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `payment_time` datetime(6) DEFAULT NULL,
  `consign_time` datetime(6) DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_code` varchar(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `toyorder` */

insert  into `toyorder`(`order_id`,`username`,`payment`,`payment_type`,`status`,`create_time`,`payment_time`,`consign_time`,`shipping_name`,`shipping_code`,`image`) values 
('321','huang','123','123','2',NULL,NULL,NULL,'123','1232',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`email`,`sex`,`birth`) values 
(1,'huang','huang','18335155476',NULL,NULL,NULL),
(2,'huang','huang','18335155476',NULL,NULL,NULL),
(3,'shi','shi','',NULL,NULL,NULL),
(4,'','','',NULL,NULL,NULL),
(5,'h','h','123','123',NULL,NULL),
(6,'hua','123','123','123',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
