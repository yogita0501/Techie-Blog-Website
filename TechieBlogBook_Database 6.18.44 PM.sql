/*
SQLyog Community v12.5.1 (64 bit)
MySQL - 10.4.21-MariaDB : Database - techblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`techblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `techblog`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categories` */

insert  into `categories`(`cid`,`name`,`description`) values 
(1,'Java Programming','Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on.'),
(2,'Python Programming','Python is a computer programming language often used to build websites and software, automate tasks, and conduct data analysis.'),
(3,'Machine Learning','Machine learning is a branch of artificial intelligence (AI) and computer science which focuses on the use of data and algorithms to imitate the way that humans learn, gradually improving its accuracy.'),
(4,'Web Development','Web development, also known as website development, refers to the tasks associated with creating, building, and maintaining websites and web applications that run online on a browser.'),
(5,'',NULL);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `uid` int(20) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `comment` */

/*Table structure for table `liked` */

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `lid` int(20) NOT NULL AUTO_INCREMENT,
  `pid` int(20) DEFAULT NULL,
  `uid` int(20) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  UNIQUE KEY `pid` (`pid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4;

/*Data for the table `liked` */

insert  into `liked`(`lid`,`pid`,`uid`) values 
(22,1,1),
(30,1,3),
(39,1,4),
(32,1,5),
(143,1,6),
(81,1,8),
(88,1,9),
(150,1,18),
(208,1,22),
(212,1,23),
(218,1,24),
(54,18,1),
(31,18,3),
(38,18,4),
(36,18,5),
(140,18,6),
(87,18,9),
(204,18,22),
(211,18,23),
(213,18,24),
(46,19,1),
(76,19,3),
(37,19,4),
(43,19,5),
(142,19,6),
(86,19,9),
(200,19,22),
(210,19,23),
(215,19,24),
(52,20,1),
(75,20,3),
(40,20,4),
(42,20,5),
(139,20,6),
(80,20,8),
(85,20,9),
(137,20,19),
(197,20,21),
(199,20,22),
(209,20,23),
(214,20,24),
(239,22,24);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `pid` int(12) NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext DEFAULT NULL,
  `pCode` longtext DEFAULT NULL,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `catId` int(12) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `catId` (`catId`),
  KEY `userId` (`userId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

/*Data for the table `posts` */

insert  into `posts`(`pid`,`pTitle`,`pContent`,`pCode`,`pPic`,`pDate`,`catId`,`userId`) values 
(1,'Machine Learning','Machine learning is a branch of artificial intelligence (AI) and computer science which focuses on the use of data and algorithms to imitate the way that humans learn, gradually improving its accuracy.','no','Applications_of_Machine_learning_SwissCognitive_The_Global_AI_Hub.webp','2023-04-11 23:42:49',3,1),
(18,'Python Programming','Python has a simple syntax similar to the English language. Python has syntax that allows developers to write programs with fewer lines than some other programming languages. Python runs on an interpreter system, meaning that code can be executed as soon as it is written. This means that prototyping can be very quick.','','Python.jpg','2023-05-10 10:58:04',2,3),
(19,'Java Programming','ava is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language. Java was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.','Syntax:\r\nclass Simple{  \r\n    public static void main(String args[]){  \r\n     System.out.println(\"Hello Java\");  \r\n    }  \r\n}  ','Java.jpg','2023-05-10 11:02:19',1,5),
(20,'HTML','The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It is often assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript.','Basic Format of HTML:\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n<head>\r\n<title>Page Title</title>\r\n</head>\r\n<body>\r\n\r\n<h1>This is a Heading</h1>\r\n<p>This is a paragraph.</p>\r\n\r\n</body>\r\n</html>','HTML-Basic-Format.png','2023-05-10 11:08:54',4,4),
(21,'Java','Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need to recompile.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[citation not found][19][20] particularly for clientâserver web applications, with a reported 9 million developers.[21]','','DB.PNG','2023-05-18 13:36:05',1,24),
(22,'C++','Java \r\nC (pronounced /ËsiË/ â like the letter c)[6] is a general-purpose computer programming language. It was created in the 1970s by Dennis Ritchie, and remains very widely used and influential. By design, C\'s features cleanly reflect the capabilities of the targeted CPUs. It has found lasting use in operating systems, device drivers, protocol stacks, though decreasingly[7] for application software. C is commonly used on computer architectures that range from the largest supercomputers to the smallest microcontrollers and embedded systems.','','DB.PNG','2023-05-18 13:37:09',1,24);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(500) DEFAULT '''Hey! I am New User''',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(100) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`password`,`gender`,`about`,`rdate`,`profile`) values 
(1,'Arya','guptaarya282@gmail.com','12345','female','Hii\r\n                                                ','2023-04-06 18:20:28','ss.jpg'),
(3,'Aru','guptaarya@gmail.com','09876','female','I am user','2023-04-07 11:32:07','default.png'),
(4,'Anushka','anu@gmail.com','1234567890','female','I am Anushka','2023-04-07 11:58:17','default.png'),
(5,'Yogita Sharma','yogitasharma0516@gmail.com','Ankita','female','Hello I am Yogita Sharma\r\n                                                ','2023-04-11 00:22:14','Girl.jpg'),
(6,'Shubham Singh','shubhamotsav01@gmail.com','098765','male','Hii I am Shubham','2023-04-11 00:23:58','default.png'),
(7,'Shubham Awasthi','shubhamawasthi102@gmail.com','102102','male','hyy I am Shubham','2023-04-11 00:25:11','default.png'),
(8,'Arpit','arpit@gmail.com','12345','male','Suiiiiiii','2023-04-11 00:26:09','default.png'),
(9,'a','a@a','a','female','k','2023-04-17 12:22:13','default.png'),
(10,'a@a','fedfrrf@dfd','a v','female','','2023-04-18 22:38:44','default.png'),
(11,'a@a','','asdfgAsd12','female','','2023-04-18 23:27:16','default.png'),
(15,'sdf','anu@gmail.c','dsf!@#SD23','female','','2023-04-18 23:28:14','default.png'),
(18,'gupta','aayesha@gmail.com','ASDFGHJKLasdfghjkl1234','female','','2023-05-08 13:58:45','default.png'),
(19,'Otis','Otis@gmail.com','Pass123@','male','','2023-05-18 11:36:09','default.png'),
(20,'Shubham','shubhamotsav@gmailcom','12@Shu','male','','2023-05-18 12:53:10','default.png'),
(21,'Shubham Singh','shubham@gmail.com','12@Shu','male','','2023-05-18 12:54:21','default.png'),
(22,'Shubham Singh','shubhamsingh@gmail.com','12@#Shu','male','','2023-05-18 12:59:59','default.png'),
(23,'Nancy','nancy@gmail.com','Nani1234','female','','2023-05-18 13:07:47','default.png'),
(24,'Ram','Ram@gmail.com','as1234@A','male','                                                \r\n                                                ','2023-05-18 13:13:41','UpdatedId.PNG');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
