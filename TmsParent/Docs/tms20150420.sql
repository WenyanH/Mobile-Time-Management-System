-- MySQL dump 10.10
--
-- Host: localhost    Database: tms
-- ------------------------------------------------------
-- Server version	5.0.24a-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` varchar(255) NOT NULL,
  `branchEnabled` bit(1) NOT NULL,
  `closedOn` datetime default NULL,
  `createdOn` datetime default NULL,
  `dayBegin` varchar(255) default NULL,
  `dayEnd` varchar(255) default NULL,
  `departmentEnabled` bit(1) NOT NULL,
  `divisionEnabled` bit(1) NOT NULL,
  `domain` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `licenses` bigint(20) default NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `nextDay` bit(1) NOT NULL,
  `number` varchar(255) default NULL,
  `openedOn` datetime default NULL,
  `pause` bit(1) NOT NULL,
  `payrollEnabled` bit(1) NOT NULL,
  `perviousDay` bit(1) NOT NULL,
  `phone` varchar(255) default NULL,
  `physicalAddr` varchar(255) default NULL,
  `postalAddr` varchar(255) default NULL,
  `status` int(11) default NULL,
  `teamEnabled` bit(1) NOT NULL,
  `title` varchar(255) default NULL,
  `token` varchar(255) default NULL,
  `tradingName` varchar(255) default NULL,
  `timeZone_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_axf0vavaw1r0dxrvow0ekxlmd` (`timeZone_id`),
  CONSTRAINT `FK_axf0vavaw1r0dxrvow0ekxlmd` FOREIGN KEY (`timeZone_id`) REFERENCES `timezone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--


/*!40000 ALTER TABLE `company` DISABLE KEYS */;
LOCK TABLES `company` WRITE;
INSERT INTO `company` VALUES ('1','','2015-05-01 00:00:00','2015-05-01 00:00:00','dayBegin','dayEnd','','','domain','email','fax',0,'mobile','name','','number','2015-05-01 00:00:00','','','','phone','physicalAddr','postalAddr',0,'','title','token','tradingName','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

--
-- Table structure for table `company_features`
--

DROP TABLE IF EXISTS `company_features`;
CREATE TABLE `company_features` (
  `Company_id` varchar(255) NOT NULL,
  `features_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`Company_id`,`features_id`),
  KEY `FK_kr7pxgma1qadi3ra2enweio4a` (`features_id`),
  CONSTRAINT `FK_8py4oakyk3a4o4h6g66e86sfp` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_kr7pxgma1qadi3ra2enweio4a` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_features`
--


/*!40000 ALTER TABLE `company_features` DISABLE KEYS */;
LOCK TABLES `company_features` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `company_features` ENABLE KEYS */;

--
-- Table structure for table `company_outfacetype`
--

DROP TABLE IF EXISTS `company_outfacetype`;
CREATE TABLE `company_outfacetype` (
  `Company_id` varchar(255) NOT NULL,
  `outFaceTypes_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`Company_id`,`outFaceTypes_id`),
  KEY `FK_518xawlgwib97wc317cvcq930` (`outFaceTypes_id`),
  CONSTRAINT `FK_njk70me9vc3gr7ktwfb5m559f` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_518xawlgwib97wc317cvcq930` FOREIGN KEY (`outFaceTypes_id`) REFERENCES `outfacetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_outfacetype`
--


/*!40000 ALTER TABLE `company_outfacetype` DISABLE KEYS */;
LOCK TABLES `company_outfacetype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `company_outfacetype` ENABLE KEYS */;

--
-- Table structure for table `company_reportmanagement`
--

DROP TABLE IF EXISTS `company_reportmanagement`;
CREATE TABLE `company_reportmanagement` (
  `Company_id` varchar(255) NOT NULL,
  `reportManagements_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`Company_id`,`reportManagements_id`),
  KEY `FK_17ntauw1k8am1btiv36en4jjh` (`reportManagements_id`),
  CONSTRAINT `FK_t6km4583434ko056828wvx46i` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_17ntauw1k8am1btiv36en4jjh` FOREIGN KEY (`reportManagements_id`) REFERENCES `reportmanagement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_reportmanagement`
--


/*!40000 ALTER TABLE `company_reportmanagement` DISABLE KEYS */;
LOCK TABLES `company_reportmanagement` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `company_reportmanagement` ENABLE KEYS */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` varchar(255) NOT NULL,
  `departmentName` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `level` int(11) NOT NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `number` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `physicalAddr` varchar(255) default NULL,
  `postalAddr` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  `parent_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_631bums8oqecyetyvls43e1x7` (`company_id`),
  KEY `FK_65cvny6rlr2o9o7pw0af5oxxk` (`parent_id`),
  CONSTRAINT `FK_65cvny6rlr2o9o7pw0af5oxxk` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_631bums8oqecyetyvls43e1x7` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--


/*!40000 ALTER TABLE `department` DISABLE KEYS */;
LOCK TABLES `department` WRITE;
INSERT INTO `department` VALUES ('4a7941f0-1cdb-4f0f-992e-ee5b88e476ab','branch','','',1,'','','1','','','','','1',NULL),('97447aeb-0618-4979-8ea4-a051e28998b2','devision','','',2,'','','2','','','','','1','4a7941f0-1cdb-4f0f-992e-ee5b88e476ab'),('cd7cb98e-3f54-4327-8cdf-ee987dbe14e4','department','','',3,'','','3','','','','','1','97447aeb-0618-4979-8ea4-a051e28998b2');
UNLOCK TABLES;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` varchar(255) NOT NULL,
  `changeOnDate` datetime default NULL,
  `clockId` varchar(255) default NULL,
  `createTime` datetime default NULL,
  `dailyHours` double NOT NULL,
  `email` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `firstName` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `hireOnDate` datetime default NULL,
  `irdNumber` varchar(255) default NULL,
  `isExport` bit(1) default NULL,
  `isSupervisor` bit(1) default NULL,
  `jobNumber` varchar(255) default NULL,
  `lastName` varchar(255) default NULL,
  `middleName` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `payId` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `physicalAddr` varchar(255) default NULL,
  `postalAddr` varchar(255) default NULL,
  `status` int(11) default NULL,
  `tel` varchar(255) default NULL,
  `terminateDate` datetime default NULL,
  `title` varchar(255) default NULL,
  `tmsType` int(11) default NULL,
  `company_id` varchar(255) default NULL,
  `department_id` varchar(255) default NULL,
  `job_id` varchar(255) default NULL,
  `payGroup_id` varchar(255) default NULL,
  `position_id` varchar(255) default NULL,
  `timeRounding_id` varchar(255) default NULL,
  `user_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_4a6a18679w576iqvi9x0cav99` (`company_id`),
  KEY `FK_lk0a412kck2kdc6slousi528s` (`department_id`),
  KEY `FK_kba6frk6xm2scyhdnyn232crr` (`job_id`),
  KEY `FK_bbi5cfl8bbgl8v1dk4lun7kqy` (`payGroup_id`),
  KEY `FK_9c4q00vudumkn18cc56spvyvr` (`position_id`),
  KEY `FK_o0ohyh4nid9kf5qob6l9dojh7` (`timeRounding_id`),
  KEY `FK_k8go8mrel1c8jrh9gh8fe0286` (`user_id`),
  CONSTRAINT `FK_k8go8mrel1c8jrh9gh8fe0286` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_4a6a18679w576iqvi9x0cav99` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_9c4q00vudumkn18cc56spvyvr` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_bbi5cfl8bbgl8v1dk4lun7kqy` FOREIGN KEY (`payGroup_id`) REFERENCES `paygroup` (`id`),
  CONSTRAINT `FK_kba6frk6xm2scyhdnyn232crr` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_lk0a412kck2kdc6slousi528s` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_o0ohyh4nid9kf5qob6l9dojh7` FOREIGN KEY (`timeRounding_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--


/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
LOCK TABLES `employee` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `features`
--


/*!40000 ALTER TABLE `features` DISABLE KEYS */;
LOCK TABLES `features` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `features` ENABLE KEYS */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
CREATE TABLE `holiday` (
  `id` varchar(255) NOT NULL,
  `alterdate` datetime default NULL,
  `code` varchar(255) default NULL,
  `createTime` datetime default NULL,
  `date` datetime default NULL,
  `name` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_xoli8jrvnwnddgb6cqbtidoo` (`company_id`),
  CONSTRAINT `FK_xoli8jrvnwnddgb6cqbtidoo` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holiday`
--


/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
LOCK TABLES `holiday` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `punchCode` varchar(255) default NULL,
  `usePunchCode` bit(1) NOT NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_nq908qxc18sooc00btm7cib95` (`code`,`company_id`),
  KEY `FK_brs7mjak6ung4emnepw6a6nxk` (`company_id`),
  CONSTRAINT `FK_brs7mjak6ung4emnepw6a6nxk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--


/*!40000 ALTER TABLE `job` DISABLE KEYS */;
LOCK TABLES `job` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `id` varchar(255) NOT NULL,
  `Memo` longtext,
  `byWorkHours` bit(1) NOT NULL,
  `description` varchar(255) default NULL,
  `duration` double NOT NULL,
  `employeeID` varchar(255) default NULL,
  `fromLeaveTime` double NOT NULL,
  `fromTime` datetime default NULL,
  `toLeaveTime` double NOT NULL,
  `toTime` datetime default NULL,
  `typeID` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_aa3obxn6c7htuemo8is3ibe8p` (`company_id`),
  CONSTRAINT `FK_aa3obxn6c7htuemo8is3ibe8p` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaves`
--


/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
LOCK TABLES `leaves` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;

--
-- Table structure for table `outfacetype`
--

DROP TABLE IF EXISTS `outfacetype`;
CREATE TABLE `outfacetype` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `other` bit(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outfacetype`
--


/*!40000 ALTER TABLE `outfacetype` DISABLE KEYS */;
LOCK TABLES `outfacetype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `outfacetype` ENABLE KEYS */;

--
-- Table structure for table `paygroup`
--

DROP TABLE IF EXISTS `paygroup`;
CREATE TABLE `paygroup` (
  `id` varchar(255) NOT NULL,
  `Memo` longtext,
  `acceptEA` bit(1) NOT NULL,
  `acceptLD` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  `checkED` bit(1) NOT NULL,
  `checkLA` bit(1) NOT NULL,
  `code` varchar(255) default NULL,
  `createdOn` datetime default NULL,
  `dailyHours` double NOT NULL,
  `name` varchar(255) default NULL,
  `payPeriod` int(11) default NULL,
  `startTime` datetime default NULL,
  `supervisorMAOT` bit(1) NOT NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_qvtuubimv17coxygx3s4h28po` (`code`,`company_id`),
  KEY `FK_axns78s77nsb5e1de8hcbxx91` (`company_id`),
  CONSTRAINT `FK_axns78s77nsb5e1de8hcbxx91` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paygroup`
--


/*!40000 ALTER TABLE `paygroup` DISABLE KEYS */;
LOCK TABLES `paygroup` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `paygroup` ENABLE KEYS */;

--
-- Table structure for table `paytype`
--

DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) default NULL,
  `convertToDay` bit(1) NOT NULL,
  `ctDay` double NOT NULL,
  `exportCode` varchar(255) default NULL,
  `pay_leave` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_l8pui5dh9frcsw6c3d29wx7oc` (`code`,`company_id`),
  KEY `FK_aiachetug5hqcy8pykq42x1ni` (`company_id`),
  CONSTRAINT `FK_aiachetug5hqcy8pykq42x1ni` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paytype`
--


/*!40000 ALTER TABLE `paytype` DISABLE KEYS */;
LOCK TABLES `paytype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `paytype` ENABLE KEYS */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) default NULL,
  `code` varchar(255) default NULL,
  `createTime` datetime default NULL,
  `name` varchar(255) default NULL,
  `punchCode` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_r3ll9by7slpsl02xkqu1ee07b` (`company_id`),
  CONSTRAINT `FK_r3ll9by7slpsl02xkqu1ee07b` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--


/*!40000 ALTER TABLE `position` DISABLE KEYS */;
LOCK TABLES `position` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;

--
-- Table structure for table `reportmanagement`
--

DROP TABLE IF EXISTS `reportmanagement`;
CREATE TABLE `reportmanagement` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reportmanagement`
--


/*!40000 ALTER TABLE `reportmanagement` DISABLE KEYS */;
LOCK TABLES `reportmanagement` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `reportmanagement` ENABLE KEYS */;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) default NULL,
  `type` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resource`
--


/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
LOCK TABLES `resource` WRITE;
INSERT INTO `resource` VALUES ('/*','*',0),('/department/*','Department',0),('/employee/*','Employee',0),('/holiday/*','Holiday',0),('/job/*','Job',0),('/leave/*','Leave',0),('/mydetail/*','Company',0),('/paygroup/*','Paygroup',0),('/paytype/*','Paytype',0),('/position/*','Position',0),('/user/*','User',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--


/*!40000 ALTER TABLE `role` DISABLE KEYS */;
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES ('1','superadmin','superadmin'),('2','admin','admin'),('3','supervisor','supervisor'),('4','payroll','payroll');
UNLOCK TABLES;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `role_resource`
--

DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `Role_id` varchar(255) NOT NULL,
  `resources_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`Role_id`,`resources_id`),
  KEY `FK_sei0loik16omfy5nb9a9xb4g9` (`resources_id`),
  CONSTRAINT `FK_ookpcrfhnvtx24kb4duryr9i8` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_sei0loik16omfy5nb9a9xb4g9` FOREIGN KEY (`resources_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_resource`
--


/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;
LOCK TABLES `role_resource` WRITE;
INSERT INTO `role_resource` VALUES ('1','/*'),('2','/department/*'),('2','/employee/*'),('2','/holiday/*'),('2','/job/*'),('2','/leave/*'),('2','/mydetail/*'),('2','/paygroup/*'),('2','/paytype/*'),('2','/position/*'),('2','/user/*');
UNLOCK TABLES;
/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `punchCode` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  `job_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_no0xenhhi4bn3srp964x6pj4v` (`code`,`company_id`),
  KEY `FK_dnh3ipr7pqkjpo4hx02kxd1bd` (`company_id`),
  KEY `FK_hq0y2ynliah4gvqrsmvqwcv` (`job_id`),
  CONSTRAINT `FK_hq0y2ynliah4gvqrsmvqwcv` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_dnh3ipr7pqkjpo4hx02kxd1bd` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--


/*!40000 ALTER TABLE `task` DISABLE KEYS */;
LOCK TABLES `task` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;

--
-- Table structure for table `timerounding`
--

DROP TABLE IF EXISTS `timerounding`;
CREATE TABLE `timerounding` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_3lo3llae13j4d1flni9eq403u` (`code`,`company_id`),
  KEY `FK_lttd9vt6uwd9867w5mpktj4h7` (`company_id`),
  CONSTRAINT `FK_lttd9vt6uwd9867w5mpktj4h7` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timerounding`
--


/*!40000 ALTER TABLE `timerounding` DISABLE KEYS */;
LOCK TABLES `timerounding` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `timerounding` ENABLE KEYS */;

--
-- Table structure for table `timeroundingrule`
--

DROP TABLE IF EXISTS `timeroundingrule`;
CREATE TABLE `timeroundingrule` (
  `id` varchar(255) NOT NULL,
  `fromTime` int(11) NOT NULL,
  `toT` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `timeRounding_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_giq9p7xvl5g9i18256q0y78c5` (`timeRounding_id`),
  CONSTRAINT `FK_giq9p7xvl5g9i18256q0y78c5` FOREIGN KEY (`timeRounding_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timeroundingrule`
--


/*!40000 ALTER TABLE `timeroundingrule` DISABLE KEYS */;
LOCK TABLES `timeroundingrule` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `timeroundingrule` ENABLE KEYS */;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
CREATE TABLE `timezone` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timezone`
--


/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
LOCK TABLES `timezone` WRITE;
INSERT INTO `timezone` VALUES ('1','NZ','NZ'),('2','SA','SA'),('3','CK','CK'),('4','AE','AE');
UNLOCK TABLES;
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) default NULL,
  `createTime` datetime default NULL,
  `email` varchar(255) default NULL,
  `exportDevisions` longtext,
  `firstName` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `isSys` bit(1) NOT NULL,
  `lastName` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `status` int(11) default NULL,
  `tel` varchar(255) default NULL,
  `company_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_7ek00pkat74ouxb736anasf9e` (`company_id`),
  CONSTRAINT `FK_7ek00pkat74ouxb736anasf9e` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--


/*!40000 ALTER TABLE `user` DISABLE KEYS */;
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('12516f63-06a9-49a1-b9a4-8abe05d3cf83',NULL,'2015-04-20 13:20:44','admin@163.com',NULL,'3',NULL,'\0','3',NULL,'e10adc3949ba59abbe56e057f20f883e',0,NULL,'1'),('217e7ff0-72df-4994-b28d-6e117d7b16bb',NULL,'2015-04-20 15:47:25','superadmin@163.com',NULL,'1',NULL,'\0','1',NULL,'e10adc3949ba59abbe56e057f20f883e',0,NULL,'1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Table structure for table `user_department`
--

DROP TABLE IF EXISTS `user_department`;
CREATE TABLE `user_department` (
  `users_id` varchar(255) NOT NULL,
  `department_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`users_id`,`department_id`),
  KEY `FK_cbxyg5xoe05ydh8uf3ed5ctrx` (`department_id`),
  CONSTRAINT `FK_sjhkm04jq229pcgs3er6tptsb` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_cbxyg5xoe05ydh8uf3ed5ctrx` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_department`
--


/*!40000 ALTER TABLE `user_department` DISABLE KEYS */;
LOCK TABLES `user_department` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_department` ENABLE KEYS */;

--
-- Table structure for table `user_resource`
--

DROP TABLE IF EXISTS `user_resource`;
CREATE TABLE `user_resource` (
  `User_id` varchar(255) NOT NULL,
  `resources_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`User_id`,`resources_id`),
  KEY `FK_r5btmtq7x7j8kyalyv8rivmlx` (`resources_id`),
  CONSTRAINT `FK_46dq0x5wkd5jljqmlhia742py` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_r5btmtq7x7j8kyalyv8rivmlx` FOREIGN KEY (`resources_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_resource`
--


/*!40000 ALTER TABLE `user_resource` DISABLE KEYS */;
LOCK TABLES `user_resource` WRITE;
INSERT INTO `user_resource` VALUES ('217e7ff0-72df-4994-b28d-6e117d7b16bb','/*'),('217e7ff0-72df-4994-b28d-6e117d7b16bb','/employee/*'),('217e7ff0-72df-4994-b28d-6e117d7b16bb','/holiday/*'),('217e7ff0-72df-4994-b28d-6e117d7b16bb','/job/*'),('217e7ff0-72df-4994-b28d-6e117d7b16bb','/mydetail/*'),('217e7ff0-72df-4994-b28d-6e117d7b16bb','/paygroup/*'),('217e7ff0-72df-4994-b28d-6e117d7b16bb','/position/*');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_resource` ENABLE KEYS */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `users_id` varchar(255) NOT NULL,
  `roles_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`users_id`,`roles_id`),
  KEY `FK_tc5k40i3kit8944syrd366vy1` (`roles_id`),
  CONSTRAINT `FK_fk189xs0gnt2ic2ay2ukfygl` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_tc5k40i3kit8944syrd366vy1` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--


/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES ('217e7ff0-72df-4994-b28d-6e117d7b16bb','1'),('12516f63-06a9-49a1-b9a4-8abe05d3cf83','2');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

