/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.20 : Database - tms
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tms`;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` varchar(255) NOT NULL,
  `closedOn` datetime DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `dayBegin` varchar(255) DEFAULT NULL,
  `dayEnd` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `licenses` bigint(20) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nextDay` bit(1) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `openedOn` datetime DEFAULT NULL,
  `pause` bit(1) NOT NULL,
  `payrollEnabled` bit(1) NOT NULL,
  `perviousDay` bit(1) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `physicalAddr` varchar(255) DEFAULT NULL,
  `postalAddr` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `teamEnabled` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tradingName` varchar(255) DEFAULT NULL,
  `timeZone_id` varchar(255) DEFAULT NULL,
  `bindPayGroup_id` varchar(255) DEFAULT NULL,
  `bindJob_id` varchar(255) DEFAULT NULL,
  `bindPosition_id` varchar(255) DEFAULT NULL,
  `bindTimeRounding_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_axf0vavaw1r0dxrvow0ekxlmd` (`timeZone_id`),
  KEY `FK_egmnp7hbbml9837a6pv1i0l0d` (`bindPayGroup_id`),
  KEY `FK_2ptpjipjagr1dy4f53v7cxmvq` (`bindJob_id`),
  KEY `FK_mic6pk49rsjxcmhkelre4phqr` (`bindPosition_id`),
  KEY `FK_fma5hph8fkh5bqfoluuk9yaml` (`bindTimeRounding_id`),
  CONSTRAINT `FK_2ptpjipjagr1dy4f53v7cxmvq` FOREIGN KEY (`bindJob_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_axf0vavaw1r0dxrvow0ekxlmd` FOREIGN KEY (`timeZone_id`) REFERENCES `timezone` (`id`),
  CONSTRAINT `FK_fma5hph8fkh5bqfoluuk9yaml` FOREIGN KEY (`bindTimeRounding_id`) REFERENCES `timerounding` (`id`),
  CONSTRAINT `FK_mic6pk49rsjxcmhkelre4phqr` FOREIGN KEY (`bindPosition_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`id`,`closedOn`,`createdOn`,`dayBegin`,`dayEnd`,`domain`,`email`,`fax`,`licenses`,`mobile`,`name`,`nextDay`,`number`,`openedOn`,`pause`,`payrollEnabled`,`perviousDay`,`phone`,`physicalAddr`,`postalAddr`,`status`,`teamEnabled`,`title`,`token`,`tradingName`,`timeZone_id`,`bindPayGroup_id`,`bindJob_id`,`bindPosition_id`,`bindTimeRounding_id`) values ('1',NULL,NULL,NULL,NULL,'domain','admin@163.com','',1,'1','name','\0','1',NULL,'\0','\0','\0','','physicalAddr','postalAddr',0,'\0','title','token1','tradingName',NULL,'5601b912-e9f2-4a11-81c6-aff646e07b3e',NULL,NULL,NULL),('12f3e4d0-0923-460d-a131-52f9fc926038',NULL,NULL,NULL,NULL,'4','44903@163.com','4',4,'4','4','','4',NULL,'','\0','','','4','4',0,'\0','4','d','43','2',NULL,NULL,NULL,NULL),('18e29472-c939-4c42-a7ee-0e26caccc3f2',NULL,NULL,'','','f','ttt5t@163.com','',3,'','','\0','ddf',NULL,'','','\0','','','',0,'','','3','d','2',NULL,NULL,NULL,NULL),('2ed11db4-0479-4b33-bab5-dc3def17c5a4',NULL,NULL,'17:06','17:18','6','555@163.com','',6,'','','\0','66',NULL,'','','\0','','6','6',0,'','','66','6','2',NULL,NULL,NULL,NULL),('4aa1c2d5-ea30-4359-8ae7-879400f36afc',NULL,NULL,'','','67','888@163.com','',6,'','','\0','886',NULL,'','','\0','','6','',0,'','','d','667','2',NULL,NULL,NULL,NULL),('5ddc73a1-1d41-42b0-b9b3-25bf03aae24a',NULL,NULL,'','','3','yyy@163.com','',3,'','','\0','54',NULL,'','','\0','','','',0,'','','y','3','2',NULL,NULL,NULL,NULL),('60ac7fd5-36e5-4897-a5c0-e62a19a21ff2',NULL,NULL,'','','567','9999@163.com','',5,'','','\0','5556',NULL,'','','\0','','','',0,'','','6','675','2',NULL,NULL,NULL,NULL),('67034ea0-68d9-4b9a-b9f4-4bf3eda1e965',NULL,NULL,'','','56','w56@163.com','',56,'','','\0','5656',NULL,'','','\0','','5','',0,'','','5','56','2',NULL,NULL,NULL,NULL),('7f2c9e58-59ae-4d69-9606-8f54cf875289',NULL,NULL,'','','3','333@163.com','3',3,'3','3','\0','3',NULL,'','','\0','3','3','3',0,'','3','d','3','2',NULL,NULL,NULL,NULL),('9d25186c-b0c6-40c6-b6b1-4aff7992df46',NULL,NULL,'17:11','20:11','55','6666@153.com','',5,'','','\0','55',NULL,'','','\0','','5','5',0,'','','5','55','1',NULL,NULL,NULL,NULL),('a33ae9fc-735f-4b83-ad87-832ac3715d54',NULL,NULL,'','','4','234@163.com','',4,'','4','\0','77',NULL,'','','\0','','4','4',0,'','','3','4','2',NULL,NULL,NULL,NULL),('f7db9ccc-eb1e-4037-9965-ef3c5deb1ae1',NULL,NULL,'','','3','3434l@163.com','',33,'','','\0','3434',NULL,'','','\0','','','',0,'','','3','34','2',NULL,NULL,NULL,NULL);

/*Table structure for table `company_features` */

DROP TABLE IF EXISTS `company_features`;

CREATE TABLE `company_features` (
  `Company_id` varchar(255) NOT NULL,
  `features_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Company_id`,`features_id`),
  KEY `FK_kr7pxgma1qadi3ra2enweio4a` (`features_id`),
  CONSTRAINT `FK_8py4oakyk3a4o4h6g66e86sfp` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_kr7pxgma1qadi3ra2enweio4a` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `company_features` */

/*Table structure for table `company_outfacetype` */

DROP TABLE IF EXISTS `company_outfacetype`;

CREATE TABLE `company_outfacetype` (
  `Company_id` varchar(255) NOT NULL,
  `outFaceTypes_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Company_id`,`outFaceTypes_id`),
  KEY `FK_518xawlgwib97wc317cvcq930` (`outFaceTypes_id`),
  CONSTRAINT `FK_518xawlgwib97wc317cvcq930` FOREIGN KEY (`outFaceTypes_id`) REFERENCES `outfacetype` (`id`),
  CONSTRAINT `FK_njk70me9vc3gr7ktwfb5m559f` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `company_outfacetype` */

/*Table structure for table `company_reportmanagement` */

DROP TABLE IF EXISTS `company_reportmanagement`;

CREATE TABLE `company_reportmanagement` (
  `Company_id` varchar(255) NOT NULL,
  `reportManagements_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Company_id`,`reportManagements_id`),
  KEY `FK_17ntauw1k8am1btiv36en4jjh` (`reportManagements_id`),
  CONSTRAINT `FK_17ntauw1k8am1btiv36en4jjh` FOREIGN KEY (`reportManagements_id`) REFERENCES `reportmanagement` (`id`),
  CONSTRAINT `FK_t6km4583434ko056828wvx46i` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `company_reportmanagement` */

insert  into `company_reportmanagement`(`Company_id`,`reportManagements_id`) values ('12f3e4d0-0923-460d-a131-52f9fc926038','1'),('2ed11db4-0479-4b33-bab5-dc3def17c5a4','1'),('7f2c9e58-59ae-4d69-9606-8f54cf875289','1'),('12f3e4d0-0923-460d-a131-52f9fc926038','2'),('2ed11db4-0479-4b33-bab5-dc3def17c5a4','2');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` varchar(255) NOT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `physicalAddr` varchar(255) DEFAULT NULL,
  `postalAddr` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_631bums8oqecyetyvls43e1x7` (`company_id`),
  KEY `FK_65cvny6rlr2o9o7pw0af5oxxk` (`parent_id`),
  CONSTRAINT `FK_631bums8oqecyetyvls43e1x7` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_65cvny6rlr2o9o7pw0af5oxxk` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`departmentName`,`email`,`fax`,`mobile`,`name`,`number`,`phone`,`physicalAddr`,`postalAddr`,`title`,`company_id`,`parent_id`,`status`) values ('01979d64-c8f0-43cb-a3a7-56a7673007bd','3',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'1','13770968-74a0-46e9-b539-242af78bcd9d','\0'),('13770968-74a0-46e9-b539-242af78bcd9d','545',NULL,NULL,NULL,NULL,'54',NULL,NULL,NULL,NULL,'1',NULL,'\0'),('312f0dcd-6616-43d6-b540-faeaca38e772','ffffff','33@163.com','33','33','33','ddd','33','333','33','33','1','b20b681a-3d54-4596-8efb-034a38c7bc2a','\0'),('4a7941f0-1cdb-4f0f-992e-ee5b88e476ab','branch','','','','','1','','','','','1',NULL,'\0'),('4ab1a6ec-8d7a-4658-8aba-2ddf848e0293','company down','','','','','6','','','','','1',NULL,'\0'),('6e74681c-58c9-452a-9405-7285081aeebf','444','','','','','5555','','','','','1','b20b681a-3d54-4596-8efb-034a38c7bc2a','\0'),('9ebf9d85-7c00-4b31-ad59-511720f7c86b','555','','','','','555','','','','','1','b20b681a-3d54-4596-8efb-034a38c7bc2a','\0'),('a5a15300-0474-4692-b45c-ff0ea3c7f513','fffdd',NULL,NULL,NULL,NULL,'4445',NULL,NULL,NULL,NULL,'1',NULL,'\0'),('ae7c854e-4e05-415e-a2e5-14ab8139d0b3','devision',NULL,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,'1','4a7941f0-1cdb-4f0f-992e-ee5b88e476ab',''),('b20b681a-3d54-4596-8efb-034a38c7bc2a','44','','','','','4','','','','','1','4ab1a6ec-8d7a-4658-8aba-2ddf848e0293','\0'),('bea59db6-f765-4ff5-9324-46594979efc3','ffd',NULL,NULL,NULL,NULL,'dd',NULL,NULL,NULL,NULL,'1','b20b681a-3d54-4596-8efb-034a38c7bc2a','\0');

/*Table structure for table `department_job` */

DROP TABLE IF EXISTS `department_job`;

CREATE TABLE `department_job` (
  `Department_id` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`job_id`),
  KEY `FK_40fpqkpthwkdvh6g17ndx6qpv` (`job_id`),
  CONSTRAINT `FK_40fpqkpthwkdvh6g17ndx6qpv` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_ppwh99qoauvcgcuuye3e2pufh` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department_job` */

/*Table structure for table `department_paygroup` */

DROP TABLE IF EXISTS `department_paygroup`;

CREATE TABLE `department_paygroup` (
  `Department_id` varchar(255) NOT NULL,
  `payGroup_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`payGroup_id`),
  KEY `FK_c6y96ai2sqcb8xgi1mf9b3per` (`payGroup_id`),
  CONSTRAINT `FK_89o6sxu5mhkb2jhru7pn16hhg` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_c6y96ai2sqcb8xgi1mf9b3per` FOREIGN KEY (`payGroup_id`) REFERENCES `paygroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department_paygroup` */

insert  into `department_paygroup`(`Department_id`,`payGroup_id`) values ('01979d64-c8f0-43cb-a3a7-56a7673007bd','5601b912-e9f2-4a11-81c6-aff646e07b3e');

/*Table structure for table `department_position` */

DROP TABLE IF EXISTS `department_position`;

CREATE TABLE `department_position` (
  `Department_id` varchar(255) NOT NULL,
  `position_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`position_id`),
  KEY `FK_kqw5u7pnuujum88s1ewdseshi` (`position_id`),
  CONSTRAINT `FK_kqw5u7pnuujum88s1ewdseshi` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_s0pyssanq9at9pe6agjsb7lir` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department_position` */

/*Table structure for table `department_timerounding` */

DROP TABLE IF EXISTS `department_timerounding`;

CREATE TABLE `department_timerounding` (
  `Department_id` varchar(255) NOT NULL,
  `timeRoundings_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`timeRoundings_id`),
  KEY `FK_r2bk4ymofa3q7blilwgeyfpjr` (`timeRoundings_id`),
  CONSTRAINT `FK_5jm3bdoyam8c5kj7homrha62y` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_r2bk4ymofa3q7blilwgeyfpjr` FOREIGN KEY (`timeRoundings_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department_timerounding` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` varchar(255) NOT NULL,
  `changeOnDate` datetime DEFAULT NULL,
  `clockId` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `dailyHours` double NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hireOnDate` datetime DEFAULT NULL,
  `irdNumber` varchar(255) DEFAULT NULL,
  `isExport` bit(1) DEFAULT NULL,
  `isSupervisor` bit(1) DEFAULT NULL,
  `jobNumber` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `payId` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `physicalAddr` varchar(255) DEFAULT NULL,
  `postalAddr` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `terminateDate` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tmsType` int(11) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `job_id` varchar(255) DEFAULT NULL,
  `payGroup_id` varchar(255) DEFAULT NULL,
  `position_id` varchar(255) DEFAULT NULL,
  `timeRounding_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4a6a18679w576iqvi9x0cav99` (`company_id`),
  KEY `FK_lk0a412kck2kdc6slousi528s` (`department_id`),
  KEY `FK_kba6frk6xm2scyhdnyn232crr` (`job_id`),
  KEY `FK_bbi5cfl8bbgl8v1dk4lun7kqy` (`payGroup_id`),
  KEY `FK_9c4q00vudumkn18cc56spvyvr` (`position_id`),
  KEY `FK_o0ohyh4nid9kf5qob6l9dojh7` (`timeRounding_id`),
  KEY `FK_k8go8mrel1c8jrh9gh8fe0286` (`user_id`),
  CONSTRAINT `FK_4a6a18679w576iqvi9x0cav99` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_9c4q00vudumkn18cc56spvyvr` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_bbi5cfl8bbgl8v1dk4lun7kqy` FOREIGN KEY (`payGroup_id`) REFERENCES `paygroup` (`id`),
  CONSTRAINT `FK_k8go8mrel1c8jrh9gh8fe0286` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_kba6frk6xm2scyhdnyn232crr` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_lk0a412kck2kdc6slousi528s` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_o0ohyh4nid9kf5qob6l9dojh7` FOREIGN KEY (`timeRounding_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

/*Table structure for table `employee_employeeholiday` */

DROP TABLE IF EXISTS `employee_employeeholiday`;

CREATE TABLE `employee_employeeholiday` (
  `Employee_id` varchar(255) NOT NULL,
  `roles_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Employee_id`,`roles_id`),
  KEY `FK_radr51lv0ceg72obiw58yiqn5` (`roles_id`),
  CONSTRAINT `FK_2w9cuv6jsmkobii4g8iacb987` FOREIGN KEY (`Employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_radr51lv0ceg72obiw58yiqn5` FOREIGN KEY (`roles_id`) REFERENCES `employeeholiday` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee_employeeholiday` */

/*Table structure for table `employeeholiday` */

DROP TABLE IF EXISTS `employeeholiday`;

CREATE TABLE `employeeholiday` (
  `id` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7saa4hjcvs6mxvnrqv49itjy2` (`date`,`company_id`),
  KEY `FK_rsxfb356leywer0dhh4c01fiv` (`company_id`),
  CONSTRAINT `FK_rsxfb356leywer0dhh4c01fiv` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeeholiday` */

/*Table structure for table `employeeholiday_employee` */

DROP TABLE IF EXISTS `employeeholiday_employee`;

CREATE TABLE `employeeholiday_employee` (
  `EmployeeHoliday_id` varchar(255) NOT NULL,
  `users_id` varchar(255) NOT NULL,
  PRIMARY KEY (`EmployeeHoliday_id`,`users_id`),
  KEY `FK_184jol2s2542jhmyrarjrj0v4` (`users_id`),
  CONSTRAINT `FK_47a08b4lv8krsyrou05pfgm6q` FOREIGN KEY (`EmployeeHoliday_id`) REFERENCES `employeeholiday` (`id`),
  CONSTRAINT `FK_184jol2s2542jhmyrarjrj0v4` FOREIGN KEY (`users_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeeholiday_employee` */

/*Table structure for table `features` */

DROP TABLE IF EXISTS `features`;

CREATE TABLE `features` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `features` */

/*Table structure for table `holiday` */

DROP TABLE IF EXISTS `holiday`;

CREATE TABLE `holiday` (
  `id` varchar(255) NOT NULL,
  `alterdate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_xoli8jrvnwnddgb6cqbtidoo` (`company_id`),
  CONSTRAINT `FK_xoli8jrvnwnddgb6cqbtidoo` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `holiday` */

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `punchCode` varchar(255) DEFAULT NULL,
  `usePunchCode` bit(1) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `bindCompany_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nq908qxc18sooc00btm7cib95` (`code`,`company_id`),
  UNIQUE KEY `UK_2ty0vqnvwt54v10fn84os8xqj` (`code`,`name`,`punchCode`,`company_id`),
  KEY `FK_brs7mjak6ung4emnepw6a6nxk` (`company_id`),
  KEY `FK_agylmxqnsvc39tasab74pthf7` (`department_id`),
  KEY `FK_an2tyjk3mkndcb70uoxdaf36e` (`bindCompany_id`),
  CONSTRAINT `FK_agylmxqnsvc39tasab74pthf7` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_an2tyjk3mkndcb70uoxdaf36e` FOREIGN KEY (`bindCompany_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_brs7mjak6ung4emnepw6a6nxk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job` */

/*Table structure for table `leaves` */

DROP TABLE IF EXISTS `leaves`;

CREATE TABLE `leaves` (
  `id` varchar(255) NOT NULL,
  `Memo` longtext,
  `byWorkHours` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` double NOT NULL,
  `employeeID` varchar(255) DEFAULT NULL,
  `fromLeaveTime` double NOT NULL,
  `fromTime` datetime DEFAULT NULL,
  `toLeaveTime` double NOT NULL,
  `toTime` datetime DEFAULT NULL,
  `typeID` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `fromDate` datetime DEFAULT NULL,
  `toDate` datetime DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `payType_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_aa3obxn6c7htuemo8is3ibe8p` (`company_id`),
  UNIQUE KEY `UK_stntqsmxcv6ulsf4a3awvuvob` (`employee_id`,`company_id`,`fromDate`,`toDate`),
  KEY `FK_ht50lu6ue1irdgfo0j7fnwbux` (`payType_id`),
  CONSTRAINT `FK_aa3obxn6c7htuemo8is3ibe8p` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_ht50lu6ue1irdgfo0j7fnwbux` FOREIGN KEY (`payType_id`) REFERENCES `paytype` (`id`),
  CONSTRAINT `FK_jryhn49hoi92t94djy54qy9q` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `leaves` */

/*Table structure for table `outfacetype` */

DROP TABLE IF EXISTS `outfacetype`;

CREATE TABLE `outfacetype` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `other` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `outfacetype` */

/*Table structure for table `paygroup` */

DROP TABLE IF EXISTS `paygroup`;

CREATE TABLE `paygroup` (
  `id` varchar(255) NOT NULL,
  `Memo` longtext,
  `acceptEA` bit(1) NOT NULL,
  `acceptLD` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  `checkED` bit(1) NOT NULL,
  `checkLA` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `dailyHours` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `payPeriod` int(11) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `supervisorMAOT` bit(1) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qvtuubimv17coxygx3s4h28po` (`code`,`company_id`),
  UNIQUE KEY `UK_jxwwv54j66gneugrr1k5rei0` (`code`,`name`,`company_id`),
  KEY `FK_axns78s77nsb5e1de8hcbxx91` (`company_id`),
  KEY `FK_fv46jp720ggr0dtn19dfffpch` (`department_id`),
  CONSTRAINT `FK_axns78s77nsb5e1de8hcbxx91` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_fv46jp720ggr0dtn19dfffpch` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paygroup` */

insert  into `paygroup`(`id`,`Memo`,`acceptEA`,`acceptLD`,`active`,`checkED`,`checkLA`,`code`,`createdOn`,`dailyHours`,`name`,`payPeriod`,`startTime`,`supervisorMAOT`,`company_id`,`department_id`) values ('5601b912-e9f2-4a11-81c6-aff646e07b3e','','\0','\0','','\0','\0','2','2015-04-25 13:50:34',22,'222',0,'2015-04-25 00:00:00','\0','1',NULL),('70483580-ab80-43b8-8fe3-037b68927482','','\0','\0','','\0','\0','1','2015-04-25 13:30:42',2,'222',0,'2015-04-25 00:00:00','\0','12f3e4d0-0923-460d-a131-52f9fc926038',NULL);

/*Table structure for table `paytype` */

DROP TABLE IF EXISTS `paytype`;

CREATE TABLE `paytype` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `convertToDay` bit(1) NOT NULL,
  `ctDay` double NOT NULL,
  `exportCode` varchar(255) DEFAULT NULL,
  `pay_leave` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `leaveStatus` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l8pui5dh9frcsw6c3d29wx7oc` (`code`,`company_id`),
  UNIQUE KEY `UK_clyvenvgat73rtee8u3g9by0y` (`code`,`name`,`company_id`),
  KEY `FK_aiachetug5hqcy8pykq42x1ni` (`company_id`),
  CONSTRAINT `FK_aiachetug5hqcy8pykq42x1ni` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paytype` */

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `punchCode` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `bindCompany_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r3ll9by7slpsl02xkqu1ee07b` (`company_id`),
  KEY `FK_a2qog7sj9ol96skfpc0lsf5d1` (`department_id`),
  KEY `FK_idvlqwtgbqswsxfyt96tdj7ak` (`bindCompany_id`),
  CONSTRAINT `FK_a2qog7sj9ol96skfpc0lsf5d1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_idvlqwtgbqswsxfyt96tdj7ak` FOREIGN KEY (`bindCompany_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_r3ll9by7slpsl02xkqu1ee07b` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `position` */

/*Table structure for table `reportmanagement` */

DROP TABLE IF EXISTS `reportmanagement`;

CREATE TABLE `reportmanagement` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reportmanagement` */

insert  into `reportmanagement`(`id`,`descr`,`name`) values ('1','2','3'),('2','3','3');

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`id`,`content`,`type`) values ('/*',NULL,NULL),('/department/*','Department',0),('/employee/*','Employee',0),('/holiday/*','Holiday',0),('/job/*','Job',0),('/leave/*','Leave',0),('/mydetail/*','Company',0),('/paygroup/*','Paygroup',0),('/paytype/*','Paytype',0),('/position/*','Position',0),('/roundingrules/*','roundingrules',0),('/task/*','task',0),('/user/*','User',0);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`descr`,`name`) values ('1','superadmin','superadmin'),('2','admin','admin'),('3','supervisor','supervisor'),('4','payroll','payroll'),('5','employee','employee');

/*Table structure for table `role_resource` */

DROP TABLE IF EXISTS `role_resource`;

CREATE TABLE `role_resource` (
  `Role_id` varchar(255) NOT NULL,
  `resources_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Role_id`,`resources_id`),
  KEY `FK_sei0loik16omfy5nb9a9xb4g9` (`resources_id`),
  CONSTRAINT `FK_ookpcrfhnvtx24kb4duryr9i8` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_sei0loik16omfy5nb9a9xb4g9` FOREIGN KEY (`resources_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_resource` */

insert  into `role_resource`(`Role_id`,`resources_id`) values ('2','/department/*'),('2','/employee/*'),('2','/holiday/*'),('2','/job/*'),('2','/leave/*'),('2','/mydetail/*'),('2','/paygroup/*'),('2','/paytype/*'),('2','/position/*'),('2','/roundingrules/*'),('2','/task/*'),('2','/user/*');

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `punchCode` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `job_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_no0xenhhi4bn3srp964x6pj4v` (`code`,`company_id`),
  KEY `FK_dnh3ipr7pqkjpo4hx02kxd1bd` (`company_id`),
  KEY `FK_hq0y2ynliah4gvqrsmvqwcv` (`job_id`),
  CONSTRAINT `FK_dnh3ipr7pqkjpo4hx02kxd1bd` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_hq0y2ynliah4gvqrsmvqwcv` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `task` */

/*Table structure for table `timerounding` */

DROP TABLE IF EXISTS `timerounding`;

CREATE TABLE `timerounding` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `bindCompany_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3lo3llae13j4d1flni9eq403u` (`code`,`company_id`),
  KEY `FK_lttd9vt6uwd9867w5mpktj4h7` (`company_id`),
  KEY `FK_3rst14bdbxeib9ow4gnlqwbp3` (`department_id`),
  KEY `FK_dhv3k91meabuoaya1au4wl9g0` (`bindCompany_id`),
  CONSTRAINT `FK_3rst14bdbxeib9ow4gnlqwbp3` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_dhv3k91meabuoaya1au4wl9g0` FOREIGN KEY (`bindCompany_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_lttd9vt6uwd9867w5mpktj4h7` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `timerounding` */

/*Table structure for table `timeroundingrule` */

DROP TABLE IF EXISTS `timeroundingrule`;

CREATE TABLE `timeroundingrule` (
  `id` varchar(255) NOT NULL,
  `fromTime` int(11) NOT NULL,
  `toT` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `timeRounding_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_giq9p7xvl5g9i18256q0y78c5` (`timeRounding_id`),
  CONSTRAINT `FK_giq9p7xvl5g9i18256q0y78c5` FOREIGN KEY (`timeRounding_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `timeroundingrule` */

/*Table structure for table `timezone` */

DROP TABLE IF EXISTS `timezone`;

CREATE TABLE `timezone` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `timezone` */

insert  into `timezone`(`id`,`descr`,`name`) values ('1','NZ','NZ'),('2','SA','SA'),('3','CK','CK'),('4','AE','AE');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `exportDevisions` longtext,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `isSys` bit(1) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7ek00pkat74ouxb736anasf9e` (`company_id`),
  CONSTRAINT `FK_7ek00pkat74ouxb736anasf9e` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`address`,`createTime`,`email`,`exportDevisions`,`firstName`,`gender`,`isSys`,`lastName`,`mobile`,`password`,`status`,`tel`,`company_id`) values ('1',NULL,NULL,'superadmin@163.com',NULL,NULL,NULL,'',NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',0,NULL,NULL),('14f72d11-e0b7-4c0c-938e-46f19d9fce1d',NULL,'2015-04-22 17:27:22','w56@163.com',NULL,NULL,NULL,'',NULL,NULL,'baa3894263bcead1e24604b6c4932b9d',0,NULL,'67034ea0-68d9-4b9a-b9f4-4bf3eda1e965'),('35742044-8837-4885-9331-1fc30f87f17e',NULL,'2015-04-22 17:11:45','6666@153.com',NULL,NULL,NULL,'',NULL,NULL,'e9510081ac30ffa83f10b68cde1cac07',0,NULL,'9d25186c-b0c6-40c6-b6b1-4aff7992df46'),('3fde2002-d800-45df-ac61-eabf1352115a',NULL,'2015-04-22 17:06:57','555@163.com',NULL,NULL,NULL,'',NULL,NULL,'15de21c670ae7c3f6f3f1f37029303c9',0,NULL,'2ed11db4-0479-4b33-bab5-dc3def17c5a4'),('414e4450-3005-40d9-a766-08169e5ed4b5',NULL,'2015-04-22 17:25:50','234@163.com',NULL,NULL,NULL,'',NULL,NULL,'289dff07669d7a23de0ef88d2f7129e7',0,NULL,'a33ae9fc-735f-4b83-ad87-832ac3715d54'),('4916c7d9-3b0e-435b-a145-a5e562fec912',NULL,'2015-04-22 17:22:38','888@163.com',NULL,NULL,NULL,'',NULL,NULL,'0a113ef6b61820daa5611c870ed8d5ee',0,NULL,'4aa1c2d5-ea30-4359-8ae7-879400f36afc'),('5100fe34-f1d4-4012-88eb-37a4b3759ed4',NULL,'2015-04-22 17:18:18','yyy@163.com',NULL,NULL,NULL,'',NULL,NULL,'f0a4058fd33489695d53df156b77c724',0,NULL,'5ddc73a1-1d41-42b0-b9b3-25bf03aae24a'),('57f62967-b2f5-49e5-805a-0c7eb20d9cb1',NULL,'2015-04-22 17:32:46','3434l@163.com',NULL,NULL,NULL,'',NULL,NULL,'036d2e6756623e7a94cf353aaba6a7ad',0,NULL,'f7db9ccc-eb1e-4037-9965-ef3c5deb1ae1'),('658823c3-99e4-4ffe-bc93-09853bc34b58',NULL,'2015-04-22 17:15:53','9999@163.com',NULL,NULL,NULL,'',NULL,NULL,'fa246d0262c3925617b0c72bb20eeb1d',0,NULL,'60ac7fd5-36e5-4897-a5c0-e62a19a21ff2'),('672a57b3-ed13-4bd9-b670-3f104f6334eb',NULL,'2015-04-21 13:36:29','333@163.com',NULL,NULL,NULL,'',NULL,NULL,'310dcbbf4cce62f762a2aaa148d556bd',0,NULL,'7f2c9e58-59ae-4d69-9606-8f54cf875289'),('6fe834d8-7d5d-412a-a290-64264c735898',NULL,'2015-04-21 15:05:18','admin@163.com','1,4a7941f0-1cdb-4f0f-992e-ee5b88e476ab,97447aeb-0618-4979-8ea4-a051e28998b2,358754b7-966a-4246-b074-2db72ec93d41,','r',NULL,'','r',NULL,'e10adc3949ba59abbe56e057f20f883e',0,NULL,'1'),('9c0763c2-7b88-436e-b8ca-5deca6df6369',NULL,'2015-04-21 13:38:11','44903@163.com',NULL,NULL,NULL,'',NULL,NULL,'44903',0,NULL,'12f3e4d0-0923-460d-a131-52f9fc926038'),('c0e15748-4761-413f-a94c-9df851a7b266',NULL,'2015-04-22 17:17:09','ttt5t@163.com',NULL,NULL,NULL,'',NULL,NULL,'1e3415a6709a56d4aa0aa97e6c1d7438',0,NULL,'18e29472-c939-4c42-a7ee-0e26caccc3f2'),('c9aa9fde-42ef-4812-81a6-822f1a92f086',NULL,'2015-04-27 17:50:31','test@163.com','','d',NULL,'\0','d',NULL,'e10adc3949ba59abbe56e057f20f883e',0,NULL,'1');

/*Table structure for table `user_department` */

DROP TABLE IF EXISTS `user_department`;

CREATE TABLE `user_department` (
  `users_id` varchar(255) NOT NULL,
  `department_id` varchar(255) NOT NULL,
  PRIMARY KEY (`users_id`,`department_id`),
  KEY `FK_cbxyg5xoe05ydh8uf3ed5ctrx` (`department_id`),
  CONSTRAINT `FK_cbxyg5xoe05ydh8uf3ed5ctrx` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_sjhkm04jq229pcgs3er6tptsb` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_department` */

insert  into `user_department`(`users_id`,`department_id`) values ('c9aa9fde-42ef-4812-81a6-822f1a92f086','01979d64-c8f0-43cb-a3a7-56a7673007bd'),('c9aa9fde-42ef-4812-81a6-822f1a92f086','ae7c854e-4e05-415e-a2e5-14ab8139d0b3');

/*Table structure for table `user_resource` */

DROP TABLE IF EXISTS `user_resource`;

CREATE TABLE `user_resource` (
  `User_id` varchar(255) NOT NULL,
  `resources_id` varchar(255) NOT NULL,
  PRIMARY KEY (`User_id`,`resources_id`),
  KEY `FK_r5btmtq7x7j8kyalyv8rivmlx` (`resources_id`),
  CONSTRAINT `FK_46dq0x5wkd5jljqmlhia742py` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_r5btmtq7x7j8kyalyv8rivmlx` FOREIGN KEY (`resources_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_resource` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `users_id` varchar(255) NOT NULL,
  `roles_id` varchar(255) NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`),
  KEY `FK_tc5k40i3kit8944syrd366vy1` (`roles_id`),
  CONSTRAINT `FK_fk189xs0gnt2ic2ay2ukfygl` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_tc5k40i3kit8944syrd366vy1` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`users_id`,`roles_id`) values ('1','1'),('14f72d11-e0b7-4c0c-938e-46f19d9fce1d','2'),('35742044-8837-4885-9331-1fc30f87f17e','2'),('3fde2002-d800-45df-ac61-eabf1352115a','2'),('414e4450-3005-40d9-a766-08169e5ed4b5','2'),('4916c7d9-3b0e-435b-a145-a5e562fec912','2'),('5100fe34-f1d4-4012-88eb-37a4b3759ed4','2'),('57f62967-b2f5-49e5-805a-0c7eb20d9cb1','2'),('658823c3-99e4-4ffe-bc93-09853bc34b58','2'),('672a57b3-ed13-4bd9-b670-3f104f6334eb','2'),('6fe834d8-7d5d-412a-a290-64264c735898','2'),('c9aa9fde-42ef-4812-81a6-822f1a92f086','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
