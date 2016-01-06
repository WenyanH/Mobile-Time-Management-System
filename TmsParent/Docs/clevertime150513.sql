/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : clevertime

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2015-05-13 16:29:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
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
  `bindJob_id` varchar(255) DEFAULT NULL,
  `bindPayGroup_id` varchar(255) DEFAULT NULL,
  `bindPosition_id` varchar(255) DEFAULT NULL,
  `bindTimeRounding_id` varchar(255) DEFAULT NULL,
  `timeZone_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2ptpjipjagr1dy4f53v7cxmvq` (`bindJob_id`),
  KEY `FK_egmnp7hbbml9837a6pv1i0l0d` (`bindPayGroup_id`),
  KEY `FK_mic6pk49rsjxcmhkelre4phqr` (`bindPosition_id`),
  KEY `FK_fma5hph8fkh5bqfoluuk9yaml` (`bindTimeRounding_id`),
  KEY `FK_axf0vavaw1r0dxrvow0ekxlmd` (`timeZone_id`),
  CONSTRAINT `FK_axf0vavaw1r0dxrvow0ekxlmd` FOREIGN KEY (`timeZone_id`) REFERENCES `timezone` (`id`),
  CONSTRAINT `FK_2ptpjipjagr1dy4f53v7cxmvq` FOREIGN KEY (`bindJob_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_egmnp7hbbml9837a6pv1i0l0d` FOREIGN KEY (`bindPayGroup_id`) REFERENCES `paygroup` (`id`),
  CONSTRAINT `FK_fma5hph8fkh5bqfoluuk9yaml` FOREIGN KEY (`bindTimeRounding_id`) REFERENCES `timerounding` (`id`),
  CONSTRAINT `FK_mic6pk49rsjxcmhkelre4phqr` FOREIGN KEY (`bindPosition_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '2016-05-01 00:00:00', '2015-05-13 15:26:12', '09:00', '18:00', null, 'admin@163.com', null, '20', null, null, '', '000001', '2015-05-13 00:00:00', '', '', '', null, null, null, '0', '', null, 'fengyin', 'Feng Ying', null, null, null, null, '1');
INSERT INTO `company` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '2015-05-31 00:00:00', '2015-05-13 15:51:13', '09:00', '18:00', null, 'chibobo@126.com', null, '20', null, null, '', '000002', '2015-05-01 00:00:00', '', '', '', null, null, null, '0', '', null, 'shuimu', 'Shui Mu', null, null, null, null, '1');

-- ----------------------------
-- Table structure for `companystructure`
-- ----------------------------
DROP TABLE IF EXISTS `companystructure`;
CREATE TABLE `companystructure` (
  `id` varchar(255) NOT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `labelName` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rkbyc3wir45gw8sg87a8q9gom` (`company_id`),
  CONSTRAINT `FK_rkbyc3wir45gw8sg87a8q9gom` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companystructure
-- ----------------------------
INSERT INTO `companystructure` VALUES ('00ba9fc4-9713-448b-b260-dc08de8d5f3d', '', 'Branch', '2', '426124c5-3bf1-444a-a5cf-2b08c8455aa8');
INSERT INTO `companystructure` VALUES ('3e59da41-292a-4d1c-ae61-a523e33070cb', '', 'Branch', '2', '119cd943-b151-4269-ab1f-ba33a046cd93');
INSERT INTO `companystructure` VALUES ('4d173ee4-8be8-4eda-9a3f-97af18d3be3a', '', 'Position', '0', '119cd943-b151-4269-ab1f-ba33a046cd93');
INSERT INTO `companystructure` VALUES ('57d389b0-b679-4b58-b282-791064b5c64e', '', 'Department', '1', '426124c5-3bf1-444a-a5cf-2b08c8455aa8');
INSERT INTO `companystructure` VALUES ('5a34be24-27f3-4a5a-81db-1c0c9e65a68f', '', 'Position', '0', '426124c5-3bf1-444a-a5cf-2b08c8455aa8');
INSERT INTO `companystructure` VALUES ('6c90ee00-76c6-4a15-a2b7-62cdbe59c004', '', 'Division', '3', '426124c5-3bf1-444a-a5cf-2b08c8455aa8');
INSERT INTO `companystructure` VALUES ('ac0381ff-b019-46b3-9e8b-989d3c861c97', '', 'Department', '1', '119cd943-b151-4269-ab1f-ba33a046cd93');
INSERT INTO `companystructure` VALUES ('e6817566-7c9f-4294-a0fe-9e377503439c', '', 'Division', '3', '119cd943-b151-4269-ab1f-ba33a046cd93');

-- ----------------------------
-- Table structure for `company_features`
-- ----------------------------
DROP TABLE IF EXISTS `company_features`;
CREATE TABLE `company_features` (
  `Company_id` varchar(255) NOT NULL,
  `features_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Company_id`,`features_id`),
  KEY `FK_kr7pxgma1qadi3ra2enweio4a` (`features_id`),
  CONSTRAINT `FK_8py4oakyk3a4o4h6g66e86sfp` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_kr7pxgma1qadi3ra2enweio4a` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_features
-- ----------------------------
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '01');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '01');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '02');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '02');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '03');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '03');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '04');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '04');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '05');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '05');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '06');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '06');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '07');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '07');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '08');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '08');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '09');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '09');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '10');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '10');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '11');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '11');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '12');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '12');
INSERT INTO `company_features` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '13');
INSERT INTO `company_features` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '13');

-- ----------------------------
-- Table structure for `company_outfacetype`
-- ----------------------------
DROP TABLE IF EXISTS `company_outfacetype`;
CREATE TABLE `company_outfacetype` (
  `Company_id` varchar(255) NOT NULL,
  `outFaceTypes_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Company_id`,`outFaceTypes_id`),
  KEY `FK_518xawlgwib97wc317cvcq930` (`outFaceTypes_id`),
  CONSTRAINT `FK_njk70me9vc3gr7ktwfb5m559f` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_518xawlgwib97wc317cvcq930` FOREIGN KEY (`outFaceTypes_id`) REFERENCES `outfacetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_outfacetype
-- ----------------------------
INSERT INTO `company_outfacetype` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '01');
INSERT INTO `company_outfacetype` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '05');
INSERT INTO `company_outfacetype` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '16');
INSERT INTO `company_outfacetype` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '16');

-- ----------------------------
-- Table structure for `company_reportmanagement`
-- ----------------------------
DROP TABLE IF EXISTS `company_reportmanagement`;
CREATE TABLE `company_reportmanagement` (
  `Company_id` varchar(255) NOT NULL,
  `reportManagements_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Company_id`,`reportManagements_id`),
  KEY `FK_17ntauw1k8am1btiv36en4jjh` (`reportManagements_id`),
  CONSTRAINT `FK_t6km4583434ko056828wvx46i` FOREIGN KEY (`Company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_17ntauw1k8am1btiv36en4jjh` FOREIGN KEY (`reportManagements_id`) REFERENCES `reportmanagement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_reportmanagement
-- ----------------------------
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '01');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '01');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '02');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '02');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '03');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '03');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '04');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '04');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '05');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '05');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '06');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '06');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '07');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '07');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '08');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '08');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '09');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '09');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '10');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '10');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '11');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '11');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '12');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '12');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '13');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '13');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '14');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '14');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '15');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '15');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '16');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '16');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '17');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '17');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '18');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '18');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '19');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '19');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '20');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '20');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '21');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '21');
INSERT INTO `company_reportmanagement` VALUES ('119cd943-b151-4269-ab1f-ba33a046cd93', '22');
INSERT INTO `company_reportmanagement` VALUES ('426124c5-3bf1-444a-a5cf-2b08c8455aa8', '22');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
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
  `status` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `companyStructure_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_631bums8oqecyetyvls43e1x7` (`company_id`),
  KEY `FK_857u90q7cuw2royf83hw87gvd` (`companyStructure_id`),
  KEY `FK_65cvny6rlr2o9o7pw0af5oxxk` (`parent_id`),
  CONSTRAINT `FK_65cvny6rlr2o9o7pw0af5oxxk` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_631bums8oqecyetyvls43e1x7` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_857u90q7cuw2royf83hw87gvd` FOREIGN KEY (`companyStructure_id`) REFERENCES `companystructure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('c17912eb-9c13-4535-aa11-9a0cb6cd30b9', 'Division', null, null, null, null, '001', null, null, null, '', null, '119cd943-b151-4269-ab1f-ba33a046cd93', 'e6817566-7c9f-4294-a0fe-9e377503439c', null);

-- ----------------------------
-- Table structure for `department_job`
-- ----------------------------
DROP TABLE IF EXISTS `department_job`;
CREATE TABLE `department_job` (
  `Department_id` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`job_id`),
  KEY `FK_40fpqkpthwkdvh6g17ndx6qpv` (`job_id`),
  CONSTRAINT `FK_ppwh99qoauvcgcuuye3e2pufh` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_40fpqkpthwkdvh6g17ndx6qpv` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_job
-- ----------------------------

-- ----------------------------
-- Table structure for `department_paygroup`
-- ----------------------------
DROP TABLE IF EXISTS `department_paygroup`;
CREATE TABLE `department_paygroup` (
  `Department_id` varchar(255) NOT NULL,
  `payGroup_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`payGroup_id`),
  KEY `FK_c6y96ai2sqcb8xgi1mf9b3per` (`payGroup_id`),
  CONSTRAINT `FK_89o6sxu5mhkb2jhru7pn16hhg` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_c6y96ai2sqcb8xgi1mf9b3per` FOREIGN KEY (`payGroup_id`) REFERENCES `paygroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_paygroup
-- ----------------------------

-- ----------------------------
-- Table structure for `department_position`
-- ----------------------------
DROP TABLE IF EXISTS `department_position`;
CREATE TABLE `department_position` (
  `Department_id` varchar(255) NOT NULL,
  `position_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`position_id`),
  KEY `FK_kqw5u7pnuujum88s1ewdseshi` (`position_id`),
  CONSTRAINT `FK_s0pyssanq9at9pe6agjsb7lir` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_kqw5u7pnuujum88s1ewdseshi` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_position
-- ----------------------------

-- ----------------------------
-- Table structure for `department_timerounding`
-- ----------------------------
DROP TABLE IF EXISTS `department_timerounding`;
CREATE TABLE `department_timerounding` (
  `Department_id` varchar(255) NOT NULL,
  `timeRoundings_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_id`,`timeRoundings_id`),
  KEY `FK_r2bk4ymofa3q7blilwgeyfpjr` (`timeRoundings_id`),
  CONSTRAINT `FK_5jm3bdoyam8c5kj7homrha62y` FOREIGN KEY (`Department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_r2bk4ymofa3q7blilwgeyfpjr` FOREIGN KEY (`timeRoundings_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_timerounding
-- ----------------------------

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
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
  `jobNumber` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `payId` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` longtext,
  `physicalAddr` varchar(255) DEFAULT NULL,
  `postalAddr` varchar(255) DEFAULT NULL,
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
  CONSTRAINT `FK_k8go8mrel1c8jrh9gh8fe0286` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_4a6a18679w576iqvi9x0cav99` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_9c4q00vudumkn18cc56spvyvr` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_bbi5cfl8bbgl8v1dk4lun7kqy` FOREIGN KEY (`payGroup_id`) REFERENCES `paygroup` (`id`),
  CONSTRAINT `FK_kba6frk6xm2scyhdnyn232crr` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_lk0a412kck2kdc6slousi528s` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_o0ohyh4nid9kf5qob6l9dojh7` FOREIGN KEY (`timeRounding_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('b670bcf5-35ea-49c6-a71e-6883b43df4c1', null, null, '2015-05-13 15:51:13', '0', null, null, 'chibobo', null, null, null, '', null, 'chibobo', 'chibobo', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, 'ef4949ad-df4c-40e8-8822-4e136684d71b');
INSERT INTO `employee` VALUES ('d9ab9eb1-90f4-4412-82f6-0d76a296f3a3', null, null, '2015-05-13 15:26:12', '0', null, null, 'admin', null, null, null, '', null, 'admin', 'admin', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, '3e53ab0f-4386-4396-a2d5-b00a834ed8b6');

-- ----------------------------
-- Table structure for `employeeholiday`
-- ----------------------------
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

-- ----------------------------
-- Records of employeeholiday
-- ----------------------------

-- ----------------------------
-- Table structure for `employeeholiday_employee`
-- ----------------------------
DROP TABLE IF EXISTS `employeeholiday_employee`;
CREATE TABLE `employeeholiday_employee` (
  `EmployeeHoliday_id` varchar(255) NOT NULL,
  `users_id` varchar(255) NOT NULL,
  PRIMARY KEY (`EmployeeHoliday_id`,`users_id`),
  KEY `FK_184jol2s2542jhmyrarjrj0v4` (`users_id`),
  CONSTRAINT `FK_47a08b4lv8krsyrou05pfgm6q` FOREIGN KEY (`EmployeeHoliday_id`) REFERENCES `employeeholiday` (`id`),
  CONSTRAINT `FK_184jol2s2542jhmyrarjrj0v4` FOREIGN KEY (`users_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeeholiday_employee
-- ----------------------------

-- ----------------------------
-- Table structure for `employee_employeeholiday`
-- ----------------------------
DROP TABLE IF EXISTS `employee_employeeholiday`;
CREATE TABLE `employee_employeeholiday` (
  `Employee_id` varchar(255) NOT NULL,
  `roles_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Employee_id`,`roles_id`),
  KEY `FK_radr51lv0ceg72obiw58yiqn5` (`roles_id`),
  CONSTRAINT `FK_2w9cuv6jsmkobii4g8iacb987` FOREIGN KEY (`Employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_radr51lv0ceg72obiw58yiqn5` FOREIGN KEY (`roles_id`) REFERENCES `employeeholiday` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_employeeholiday
-- ----------------------------

-- ----------------------------
-- Table structure for `features`
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of features
-- ----------------------------
INSERT INTO `features` VALUES ('01', 'Punch Support', 'Punch Support');
INSERT INTO `features` VALUES ('02', 'Project Tracking', 'Project Tracking');
INSERT INTO `features` VALUES ('03', 'Unrounding Break Punch', 'Unrounding Break Punch');
INSERT INTO `features` VALUES ('04', 'Support WorkflowMax', 'Support WorkflowMax');
INSERT INTO `features` VALUES ('05', 'Manually Support', 'Manually Support');
INSERT INTO `features` VALUES ('06', 'Client Audting', 'Client Audting');
INSERT INTO `features` VALUES ('07', 'Job Auditing', 'Job Auditing');
INSERT INTO `features` VALUES ('08', 'Manual Pos Auditing', 'Manual Pos Auditing');
INSERT INTO `features` VALUES ('09', '24 Hours Consecutive', '24 Hours Consecutive');
INSERT INTO `features` VALUES ('10', 'Ignore Break', 'Ignore Break');
INSERT INTO `features` VALUES ('11', 'Manual Job Auditing', 'Manual Job Auditing');
INSERT INTO `features` VALUES ('12', 'Support Mobile Punch', 'Support Mobile Punch');
INSERT INTO `features` VALUES ('13', 'Support Quick Books', 'Support Quick Books');

-- ----------------------------
-- Table structure for `holiday`
-- ----------------------------
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

-- ----------------------------
-- Records of holiday
-- ----------------------------

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2ty0vqnvwt54v10fn84os8xqj` (`code`,`name`,`punchCode`,`company_id`),
  KEY `FK_brs7mjak6ung4emnepw6a6nxk` (`company_id`),
  CONSTRAINT `FK_brs7mjak6ung4emnepw6a6nxk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------

-- ----------------------------
-- Table structure for `job_task`
-- ----------------------------
DROP TABLE IF EXISTS `job_task`;
CREATE TABLE `job_task` (
  `jobs_id` varchar(255) NOT NULL,
  `tasks_id` varchar(255) NOT NULL,
  PRIMARY KEY (`jobs_id`,`tasks_id`),
  KEY `FK_ov6iki6761lqxfn0wo3w5gxqj` (`tasks_id`),
  CONSTRAINT `FK_hrnh5jm7rgwbkj69e97mmc2j5` FOREIGN KEY (`jobs_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FK_ov6iki6761lqxfn0wo3w5gxqj` FOREIGN KEY (`tasks_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_task
-- ----------------------------

-- ----------------------------
-- Table structure for `leaves`
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `id` varchar(255) NOT NULL,
  `Memo` longtext,
  `byWorkHours` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` double NOT NULL,
  `fromDate` datetime DEFAULT NULL,
  `fromLeaveTime` varchar(255) DEFAULT NULL,
  `toDate` datetime DEFAULT NULL,
  `toLeaveTime` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `payType_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aa3obxn6c7htuemo8is3ibe8p` (`company_id`),
  KEY `FK_jryhn49hoi92t94djy54qy9q` (`employee_id`),
  KEY `FK_ht50lu6ue1irdgfo0j7fnwbux` (`payType_id`),
  CONSTRAINT `FK_ht50lu6ue1irdgfo0j7fnwbux` FOREIGN KEY (`payType_id`) REFERENCES `paytype` (`id`),
  CONSTRAINT `FK_aa3obxn6c7htuemo8is3ibe8p` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_jryhn49hoi92t94djy54qy9q` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaves
-- ----------------------------

-- ----------------------------
-- Table structure for `outfacetype`
-- ----------------------------
DROP TABLE IF EXISTS `outfacetype`;
CREATE TABLE `outfacetype` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `other` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outfacetype
-- ----------------------------
INSERT INTO `outfacetype` VALUES ('01', 'MYOB', 'MYOB', '');
INSERT INTO `outfacetype` VALUES ('02', 'IPAYROLL', 'IPAYROLL', '');
INSERT INTO `outfacetype` VALUES ('03', 'ACE', 'ACE', '');
INSERT INTO `outfacetype` VALUES ('04', 'IMS', 'IMS', '');
INSERT INTO `outfacetype` VALUES ('05', 'PAYGLOBAL', 'PAYGLOBAL', '');
INSERT INTO `outfacetype` VALUES ('06', 'SMOOTHPAY', 'SMOOTHPAY', '');
INSERT INTO `outfacetype` VALUES ('07', 'IMSLEAVEBYDAY', 'IMSLEAVEBYDAY', '');
INSERT INTO `outfacetype` VALUES ('08', 'MYOBEXO', 'MYOBEXO', '');
INSERT INTO `outfacetype` VALUES ('09', 'CHRYSTALPAYROLL', 'CHRYSTALPAYROLL', '');
INSERT INTO `outfacetype` VALUES ('10', 'DATACOM', 'DATACOM', '');
INSERT INTO `outfacetype` VALUES ('11', 'IPAYROLLSECOND', 'IPAYROLLSECOND', '');
INSERT INTO `outfacetype` VALUES ('12', 'ACEEXO', 'ACEEXO', '');
INSERT INTO `outfacetype` VALUES ('13', 'FLEXITIME', 'FLEXITIME', '');
INSERT INTO `outfacetype` VALUES ('14', 'MYOBEXOPOS', 'MYOBEXOPOS', '');
INSERT INTO `outfacetype` VALUES ('15', 'SMARTPAYROLL', 'SMARTPAYROLL', '');
INSERT INTO `outfacetype` VALUES ('16', 'MYOBEXO', 'MYOBEXO', '');

-- ----------------------------
-- Table structure for `paygroup`
-- ----------------------------
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jxwwv54j66gneugrr1k5rei0` (`code`,`name`,`company_id`),
  KEY `FK_axns78s77nsb5e1de8hcbxx91` (`company_id`),
  CONSTRAINT `FK_axns78s77nsb5e1de8hcbxx91` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paygroup
-- ----------------------------

-- ----------------------------
-- Table structure for `paytype`
-- ----------------------------
DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `convertToDay` bit(1) NOT NULL,
  `ctDay` double NOT NULL,
  `exportCode` varchar(255) DEFAULT NULL,
  `leaveStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_clyvenvgat73rtee8u3g9by0y` (`code`,`name`,`company_id`),
  KEY `FK_aiachetug5hqcy8pykq42x1ni` (`company_id`),
  CONSTRAINT `FK_aiachetug5hqcy8pykq42x1ni` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paytype
-- ----------------------------

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `punchCode` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r3ll9by7slpsl02xkqu1ee07b` (`company_id`),
  CONSTRAINT `FK_r3ll9by7slpsl02xkqu1ee07b` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------

-- ----------------------------
-- Table structure for `punchrecord`
-- ----------------------------
DROP TABLE IF EXISTS `punchrecord`;
CREATE TABLE `punchrecord` (
  `id` varchar(255) NOT NULL,
  `authType` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `punchTime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `workcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of punchrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `reportmanagement`
-- ----------------------------
DROP TABLE IF EXISTS `reportmanagement`;
CREATE TABLE `reportmanagement` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reportmanagement
-- ----------------------------
INSERT INTO `reportmanagement` VALUES ('01', 'TimeCard', 'TimeCard');
INSERT INTO `reportmanagement` VALUES ('02', 'TimeCardDetails', 'TimeCardDetails');
INSERT INTO `reportmanagement` VALUES ('03', 'PaySummary', 'PaySummary');
INSERT INTO `reportmanagement` VALUES ('04', 'OnSite', 'OnSite');
INSERT INTO `reportmanagement` VALUES ('05', 'Exceptional', 'Exceptional');
INSERT INTO `reportmanagement` VALUES ('06', 'LabourAnalysis', 'LabourAnalysis');
INSERT INTO `reportmanagement` VALUES ('07', 'Payroll', 'Payroll');
INSERT INTO `reportmanagement` VALUES ('08', 'AnalysisReport', 'AnalysisReport');
INSERT INTO `reportmanagement` VALUES ('09', 'EmpTimeSheetReport', 'EmpTimeSheetReport');
INSERT INTO `reportmanagement` VALUES ('10', 'JobHoursSummaryReport', 'JobHoursSummaryReport');
INSERT INTO `reportmanagement` VALUES ('11', 'JobHoursDetailReport', 'JobHoursDetailReport');
INSERT INTO `reportmanagement` VALUES ('12', 'EmpPayCardReport', 'EmpPayCardReport');
INSERT INTO `reportmanagement` VALUES ('13', 'AbsenteeReport', 'AbsenteeReport');
INSERT INTO `reportmanagement` VALUES ('14', 'DailyScheduleReport', 'DailyScheduleReport');
INSERT INTO `reportmanagement` VALUES ('15', 'WeeklyScheduleReport', 'WeeklyScheduleReport');
INSERT INTO `reportmanagement` VALUES ('16', 'AuditingReport', 'AuditingReport');
INSERT INTO `reportmanagement` VALUES ('17', 'LeaveReport', 'LeaveReport');
INSERT INTO `reportmanagement` VALUES ('18', 'JobHoursDailySummaryReport', 'JobHoursDailySummaryReport');
INSERT INTO `reportmanagement` VALUES ('19', 'TimeCardByGroup', 'TimeCardByGroup');
INSERT INTO `reportmanagement` VALUES ('20', 'FactoryTimeSheet', 'FactoryTimeSheet');
INSERT INTO `reportmanagement` VALUES ('21', 'PosHoursSummaryReport', 'PosHoursSummaryReport');
INSERT INTO `reportmanagement` VALUES ('22', 'PosHoursDetailsReport', 'PosHoursDetailsReport');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('/*', '', null);
INSERT INTO `resource` VALUES ('/department/*', 'Department', '0');
INSERT INTO `resource` VALUES ('/employee/*', 'Employee', '0');
INSERT INTO `resource` VALUES ('/holiday/*', 'Holiday', '0');
INSERT INTO `resource` VALUES ('/job/*', 'Job', '0');
INSERT INTO `resource` VALUES ('/leave/*', 'Leave', '0');
INSERT INTO `resource` VALUES ('/mydetail/*', 'Company', '0');
INSERT INTO `resource` VALUES ('/paygroup/*', 'Paygroup', '0');
INSERT INTO `resource` VALUES ('/paytype/*', 'Paytype', '0');
INSERT INTO `resource` VALUES ('/position/*', 'Position', '0');
INSERT INTO `resource` VALUES ('/roundingrules/*', 'roundingrules', '0');
INSERT INTO `resource` VALUES ('/schedule/*', 'schedule', '0');
INSERT INTO `resource` VALUES ('/structure/*', 'structure', '0');
INSERT INTO `resource` VALUES ('/task/*', 'task', '0');
INSERT INTO `resource` VALUES ('/user/*', 'User', '0');
INSERT INTO `resource` VALUES ('/payrolltransfer/*', 'payrolltransfer', '0');
INSERT INTO `resource` VALUES ('/paycard/*', 'paycard', '0');
INSERT INTO `resource` VALUES ('/calculationscript/*', 'calculationscript', '0');
INSERT INTO `resource` VALUES ('/report/*', 'report', '0');
INSERT INTO `resource` VALUES ('/recalculate/*', 'recalculate', '0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Superadmin', 'Superadmin');
INSERT INTO `role` VALUES ('2', 'Admin', 'Admin');
INSERT INTO `role` VALUES ('3', 'Supervisor', 'Supervisor');
INSERT INTO `role` VALUES ('4', 'Accountant', 'Accountant');
INSERT INTO `role` VALUES ('5', 'Employee', 'Employee');

-- ----------------------------
-- Table structure for `role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `Role_id` varchar(255) NOT NULL,
  `resources_id` varchar(255) NOT NULL,
  PRIMARY KEY (`Role_id`,`resources_id`),
  KEY `FK_sei0loik16omfy5nb9a9xb4g9` (`resources_id`),
  CONSTRAINT `FK_ookpcrfhnvtx24kb4duryr9i8` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_sei0loik16omfy5nb9a9xb4g9` FOREIGN KEY (`resources_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('2', '/department/*');
INSERT INTO `role_resource` VALUES ('2', '/employee/*');
INSERT INTO `role_resource` VALUES ('2', '/holiday/*');
INSERT INTO `role_resource` VALUES ('2', '/job/*');
INSERT INTO `role_resource` VALUES ('2', '/leave/*');
INSERT INTO `role_resource` VALUES ('2', '/mydetail/*');
INSERT INTO `role_resource` VALUES ('2', '/paygroup/*');
INSERT INTO `role_resource` VALUES ('2', '/paytype/*');
INSERT INTO `role_resource` VALUES ('2', '/position/*');
INSERT INTO `role_resource` VALUES ('2', '/roundingrules/*');
INSERT INTO `role_resource` VALUES ('2', '/schedule/*');
INSERT INTO `role_resource` VALUES ('2', '/structure/*');
INSERT INTO `role_resource` VALUES ('2', '/task/*');
INSERT INTO `role_resource` VALUES ('2', '/user/*');
INSERT INTO `role_resource` VALUES ('2', '/payrolltransfer/*');
INSERT INTO `role_resource` VALUES ('2', '/paycard/*');
INSERT INTO `role_resource` VALUES ('2', '/calculationscript/*');
INSERT INTO `role_resource` VALUES ('2', '/report/*');
INSERT INTO `role_resource` VALUES ('2', '/recalculate/*');


-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `attribute` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `days` varchar(255) DEFAULT NULL,
  `diffPeriod` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `periodOffset` varchar(255) DEFAULT NULL,
  `schedulePeriod` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ll9y7lt9odvcjvtmpq5hpo7uy` (`company_id`),
  CONSTRAINT `FK_ll9y7lt9odvcjvtmpq5hpo7uy` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `punchCode` varchar(255) DEFAULT NULL,
  `usePunchCode` bit(1) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mkk2l7py8t877o0fv7ih7xihm` (`code`,`name`,`punchCode`,`company_id`),
  KEY `FK_dnh3ipr7pqkjpo4hx02kxd1bd` (`company_id`),
  CONSTRAINT `FK_dnh3ipr7pqkjpo4hx02kxd1bd` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for `timerounding`
-- ----------------------------
DROP TABLE IF EXISTS `timerounding`;
CREATE TABLE `timerounding` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `open` bit(1) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lttd9vt6uwd9867w5mpktj4h7` (`company_id`),
  CONSTRAINT `FK_lttd9vt6uwd9867w5mpktj4h7` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timerounding
-- ----------------------------

-- ----------------------------
-- Table structure for `timeroundingrule`
-- ----------------------------
DROP TABLE IF EXISTS `timeroundingrule`;
CREATE TABLE `timeroundingrule` (
  `id` varchar(255) NOT NULL,
  `fromTime` int(11) NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `toT` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `timeRounding_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_giq9p7xvl5g9i18256q0y78c5` (`timeRounding_id`),
  CONSTRAINT `FK_giq9p7xvl5g9i18256q0y78c5` FOREIGN KEY (`timeRounding_id`) REFERENCES `timerounding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timeroundingrule
-- ----------------------------

-- ----------------------------
-- Table structure for `timezone`
-- ----------------------------
DROP TABLE IF EXISTS `timezone`;
CREATE TABLE `timezone` (
  `id` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timezone
-- ----------------------------
INSERT INTO `timezone` VALUES ('1', 'NZ', 'NZ');
INSERT INTO `timezone` VALUES ('2', 'SA', 'SA');
INSERT INTO `timezone` VALUES ('3', 'CK', 'CK');
INSERT INTO `timezone` VALUES ('4', 'AE', 'AE');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `exportDevisions` longtext,
  `isEmployee` bit(1) DEFAULT NULL,
  `isSys` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7ek00pkat74ouxb736anasf9e` (`company_id`),
  CONSTRAINT `FK_7ek00pkat74ouxb736anasf9e` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, 'superadmin@163.com', null, null, '', '96e79218965eb72c92a549dd5a330112', null, '0', null);
INSERT INTO `user` VALUES ('3e53ab0f-4386-4396-a2d5-b00a834ed8b6', '2015-05-13 15:26:12', 'admin@163.com', null, '', '', '96e79218965eb72c92a549dd5a330112', '0', '0', '119cd943-b151-4269-ab1f-ba33a046cd93');
INSERT INTO `user` VALUES ('ef4949ad-df4c-40e8-8822-4e136684d71b', '2015-05-13 15:51:13', 'chibobo@126.com', null, '', '', '96e79218965eb72c92a549dd5a330112', '0', '0', '426124c5-3bf1-444a-a5cf-2b08c8455aa8');

-- ----------------------------
-- Table structure for `user_department`
-- ----------------------------
DROP TABLE IF EXISTS `user_department`;
CREATE TABLE `user_department` (
  `users_id` varchar(255) NOT NULL,
  `management_id` varchar(255) NOT NULL,
  PRIMARY KEY (`users_id`,`management_id`),
  KEY `FK_febtorq760i7ho6fmxpdp7v0n` (`management_id`),
  CONSTRAINT `FK_sjhkm04jq229pcgs3er6tptsb` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_febtorq760i7ho6fmxpdp7v0n` FOREIGN KEY (`management_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_department
-- ----------------------------

-- ----------------------------
-- Table structure for `user_resource`
-- ----------------------------
DROP TABLE IF EXISTS `user_resource`;
CREATE TABLE `user_resource` (
  `User_id` varchar(255) NOT NULL,
  `resources_id` varchar(255) NOT NULL,
  PRIMARY KEY (`User_id`,`resources_id`),
  KEY `FK_r5btmtq7x7j8kyalyv8rivmlx` (`resources_id`),
  CONSTRAINT `FK_46dq0x5wkd5jljqmlhia742py` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_r5btmtq7x7j8kyalyv8rivmlx` FOREIGN KEY (`resources_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `users_id` varchar(255) NOT NULL,
  `roles_id` varchar(255) NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`),
  KEY `FK_tc5k40i3kit8944syrd366vy1` (`roles_id`),
  CONSTRAINT `FK_fk189xs0gnt2ic2ay2ukfygl` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_tc5k40i3kit8944syrd366vy1` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('3e53ab0f-4386-4396-a2d5-b00a834ed8b6', '2');
INSERT INTO `user_role` VALUES ('ef4949ad-df4c-40e8-8822-4e136684d71b', '2');