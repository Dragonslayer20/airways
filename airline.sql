-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 05, 2014 at 11:48 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE IF NOT EXISTS `flights` (
  `fno` int(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `src` varchar(50) NOT NULL,
  `dest` varchar(50) NOT NULL,
  `atime` varchar(50) NOT NULL,
  `dtime` varchar(50) NOT NULL,
  `nsg` int(50) NOT NULL,
  `nsy` int(50) NOT NULL,
  `rj` int(50) NOT NULL,
  `ry` int(50) NOT NULL,
  `doi` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`fno`, `fname`, `src`, `dest`, `atime`, `dtime`, `nsg`, `nsy`, `rj`, `ry`, `doi`) VALUES
(1111, 'Jet', 'Hyd', 'Singapore', '01:00 PM', '09:30 AM', 20, 30, 30000, 20000, '4/9/2014'),
(2222, 'Air India', 'Hyderabad', 'USA', '02 :30 PM', '02 :30 PM', 25, 35, 35000, 25000, '4/9/2014');

-- --------------------------------------------------------

--
-- Table structure for table `lappd`
--

CREATE TABLE IF NOT EXISTS `lappd` (
  `pid` varchar(50) NOT NULL,
  `ltype` varchar(50) NOT NULL,
  `dola` varchar(50) NOT NULL,
  `dolf` varchar(50) NOT NULL,
  `dolt` varchar(50) NOT NULL,
  `lstatus` varchar(50) NOT NULL,
  `leaveid` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lappd`
--

INSERT INTO `lappd` (`pid`, `ltype`, `dola`, `dolf`, `dolt`, `lstatus`, `leaveid`) VALUES
('1001', 'SIC', '4/9/2014', '5/4/2014', '3', 'Grant', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmstab`
--

CREATE TABLE IF NOT EXISTS `lmstab` (
  `leaveid` varchar(20) NOT NULL,
  `leavedesc` text NOT NULL,
  `leavemean` varchar(500) NOT NULL,
  `nol` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmstab`
--

INSERT INTO `lmstab` (`leaveid`, `leavedesc`, `leavemean`, `nol`) VALUES
('SPE', 'Special sick leave', 'It is granted where an emp suffers from 1)T.B.,leprosy,cancer, heart diseases, paralyses, mental illness.2)disease/ailment/injury requiring hospitalization or prolonged bed rest.3)Other illness requiring hospitalization  for 3 months(with approval)', '16'),
('PRE', 'Previlege leave', 'An employee shall be for 30 days of privilege leave 11 monthe of service.This leave is cumulative upto 300 days.', '14'),
('SIC', 'Sick leave', 'An employee shall be eligible for sick leave of 20 days on half pay,which may be commuted to 10 days on full pay for each calendar year.', '15'),
('ACC', 'Accident and disabilty leave', 'Leave due to Accidents / Crime', '10'),
('CAS', 'Casual leave', 'An employee shall be eligible for casual leave to the extent of 10 days in a financial year either for private affiars or on grounds of sickness.', '11'),
('ENC', 'Encasement of leave', 'An employee shall be eligible to encash privilege leave once in a financial year.', '12'),
('ENS', 'Encashment of sick leave', 'Encashment of sick leave will be permitted at the time of retirement upto a maximum number of days for which accumulation is allowed I.e;120 days,employee covered by the Aircraft Engineering ND Genera', '13');

-- --------------------------------------------------------

--
-- Table structure for table `pilots`
--

CREATE TABLE IF NOT EXISTS `pilots` (
  `lname` varchar(20) NOT NULL,
  `lpwd` varchar(20) NOT NULL,
  `lid` varchar(20) NOT NULL,
  `lcontact` varchar(20) NOT NULL,
  `ldor` varchar(20) NOT NULL,
  `ldoa` varchar(20) NOT NULL,
  `llic` varchar(20) NOT NULL,
  `gmailid` varchar(30) NOT NULL,
  PRIMARY KEY (`gmailid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilots`
--

INSERT INTO `pilots` (`lname`, `lpwd`, `lid`, `lcontact`, `ldor`, `ldoa`, `llic`, `gmailid`) VALUES
('admin', 'admin', '1000', '9966330623', '4/5/2014', '9/7/2014', '----', 'admin@gmail.com'),
('srfsrd', 'sgfsg', '1002', 'fsgfg', '4/9/2014', '5/8/2014', 'SPL', 'ds@gmail.com'),
('charan', 'charan', '1001', 'Chennai', '4/9/2014', '8/82014', 'SPL', 'ss@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pleave`
--

CREATE TABLE IF NOT EXISTS `pleave` (
  `pid` int(20) NOT NULL,
  `nacc` int(20) NOT NULL,
  `ncas` int(20) NOT NULL,
  `nenc` int(20) NOT NULL,
  `nens` int(20) NOT NULL,
  `npre` int(20) NOT NULL,
  `nsic` int(20) NOT NULL,
  `nspe` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pleave`
--

INSERT INTO `pleave` (`pid`, `nacc`, `ncas`, `nenc`, `nens`, `npre`, `nsic`, `nspe`) VALUES
(1001, 11, 12, 13, 14, 15, 13, 17),
(1002, 11, 12, 13, 14, 15, 16, 17),
(1003, 11, 12, 13, 14, 15, 16, 17);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `schedid` varchar(20) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `fcode` varchar(20) NOT NULL,
  `pid` varchar(20) NOT NULL,
  `sdat` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedid`, `sid`, `fcode`, `pid`, `sdat`, `status`) VALUES
('1', '1', '1111', '1001', '20/9/2014', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `sectors`
--

CREATE TABLE IF NOT EXISTS `sectors` (
  `sid` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `scountry` varchar(50) NOT NULL,
  `doo` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sectors`
--

INSERT INTO `sectors` (`sid`, `sname`, `scountry`, `doo`) VALUES
('2', 'James', 'USA', '4/9/2014'),
('1', 'Hyderabad', 'India', '4/9/2014');
