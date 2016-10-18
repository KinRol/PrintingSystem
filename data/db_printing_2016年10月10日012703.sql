-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 10 月 09 日 17:26
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `db_printing`
--
CREATE DATABASE IF NOT EXISTS `db_printing` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `db_printing`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_dept`
--

CREATE TABLE IF NOT EXISTS `tb_dept` (
  `deptId` int(3) NOT NULL AUTO_INCREMENT COMMENT '部门Id，自动增长',
  `deptName` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '部门名称，可为空',
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=36 ;

--
-- 插入之前先把表清空（truncate） `tb_dept`
--

TRUNCATE TABLE `tb_dept`;
--
-- 转存表中的数据 `tb_dept`
--

INSERT INTO `tb_dept` (`deptId`, `deptName`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, '党委办公室（院办）'),
(9, '宣传部（宣传中心）'),
(10, '组织部（人事处）'),
(11, '纪检监察审计室'),
(12, '教务科研处'),
(13, '学生处（留学生处）'),
(14, '团委'),
(15, '招生就业处'),
(16, '后勤管理处'),
(17, '财务处'),
(18, '公会（离退办）'),
(19, '质量管理处（督导处）'),
(20, '发展规划研究中心（高教室）'),
(21, '设备管理中心'),
(22, '保卫处'),
(23, '机械工程系'),
(24, '电气工程系'),
(25, '计算机与信息工程系'),
(26, '工商管理系'),
(27, '汽车工程系'),
(28, '建筑工程系'),
(29, '艺术设计系'),
(30, '人文科学系（公共教学部）'),
(31, '社会科学部'),
(32, '继续教育中心'),
(33, '基础技能实训中心'),
(34, '图书馆'),
(35, '信息网络管理中心（网管中心）');

-- --------------------------------------------------------

--
-- 表的结构 `tb_printtable`
--

CREATE TABLE IF NOT EXISTS `tb_printtable` (
  `printId` int(6) NOT NULL AUTO_INCREMENT COMMENT '文印申请表Id，自动增长',
  `titleName` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '标题名',
  `isSpecial` tinyint(1) NOT NULL COMMENT '是否为特殊文件',
  `format` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '格式要求',
  `applyTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间，填表时间',
  `neetTime` datetime NOT NULL COMMENT '需要时间，建议什么时候以前打印完成',
  `isDeptOk` tinyint(1) DEFAULT NULL COMMENT '是否通过部门领导审核',
  `leaderName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '部门领导的名称',
  `isCourtyardOk` tinyint(1) DEFAULT NULL COMMENT '是否通过院级领导审核',
  `courtyardName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '院级领导名称',
  `isPrintingOk` tinyint(1) DEFAULT NULL COMMENT '是否通过文印员审核',
  `printadminName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '文印员名称',
  `deptId` int(3) NOT NULL COMMENT '部门Id，可自动，可用户自己选定',
  `userId` int(6) NOT NULL COMMENT '用户Id',
  `stateId` int(2) NOT NULL COMMENT '文印状态Id',
  PRIMARY KEY (`printId`),
  KEY `deptId` (`deptId`,`userId`,`stateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- 插入之前先把表清空（truncate） `tb_printtable`
--

TRUNCATE TABLE `tb_printtable`;
-- --------------------------------------------------------

--
-- 表的结构 `tb_state`
--

CREATE TABLE IF NOT EXISTS `tb_state` (
  `stateId` int(2) NOT NULL AUTO_INCREMENT COMMENT '文印状态表，自动增长',
  `stateName` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '文印状态名',
  PRIMARY KEY (`stateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- 插入之前先把表清空（truncate） `tb_state`
--

TRUNCATE TABLE `tb_state`;
-- --------------------------------------------------------

--
-- 表的结构 `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `userId` int(6) NOT NULL AUTO_INCREMENT COMMENT '用户Id，自动增长',
  `userName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `userPwd` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `isLock` tinyint(1) NOT NULL COMMENT '用户是否锁定',
  `groupId` int(2) DEFAULT NULL COMMENT '用户所属的用户组',
  `deptId` int(3) DEFAULT NULL COMMENT '用户所属的部门',
  PRIMARY KEY (`userId`),
  KEY `groupId` (`groupId`,`deptId`),
  KEY `deptId` (`deptId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- 插入之前先把表清空（truncate） `tb_user`
--

TRUNCATE TABLE `tb_user`;
--
-- 转存表中的数据 `tb_user`
--

INSERT INTO `tb_user` (`userId`, `userName`, `userPwd`, `isLock`, `groupId`, `deptId`) VALUES
(1, 'admin', 'admin', 0, 1, NULL),
(2, 'wenxing', 'wenxing', 0, NULL, NULL),
(3, 'testlock', 'testlock', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tb_usergroup`
--

CREATE TABLE IF NOT EXISTS `tb_usergroup` (
  `groupId` int(2) NOT NULL AUTO_INCREMENT COMMENT '用户组Id，自动增长',
  `groupName` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户组名称',
  `groupPower` int(2) DEFAULT NULL COMMENT '用户组权限，可为空',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- 插入之前先把表清空（truncate） `tb_usergroup`
--

TRUNCATE TABLE `tb_usergroup`;
--
-- 转存表中的数据 `tb_usergroup`
--

INSERT INTO `tb_usergroup` (`groupId`, `groupName`, `groupPower`) VALUES
(1, '系统管理组', 0),
(2, '文印管理组', 1),
(3, '院办领导组', 2),
(4, '部门领导组', 3),
(5, '教师组', 4);

--
-- 限制导出的表
--

--
-- 限制表 `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `tb_usergroup` (`groupId`),
  ADD CONSTRAINT `tb_user_ibfk_2` FOREIGN KEY (`deptId`) REFERENCES `tb_dept` (`deptId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
