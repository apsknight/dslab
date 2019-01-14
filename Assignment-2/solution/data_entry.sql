--
-- Database: `Assignment2`
--

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTMENT`
--

CREATE TABLE IF NOT EXISTS `DEPARTMENT` (
  `Dname` varchar(20) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date NOT NULL,
  PRIMARY KEY (`Dnumber`)
);

--
-- Dumping data for table `DEPARTMENT`
--

INSERT INTO `DEPARTMENT` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `DEPENDENT`
--

CREATE TABLE IF NOT EXISTS `DEPENDENT` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(20) NOT NULL,
  `SEX` char(1) NOT NULL,
  `Bdate` date NOT NULL,
  `Relationship` varchar(15) NOT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`)
);

--
-- Dumping data for table `DEPENDENT`
--

INSERT INTO `DEPENDENT` (`Essn`, `Dependent_name`, `SEX`, `Bdate`, `Relationship`) VALUES
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
('123456789', 'Elizabeth', 'F', '1967-05-05', 'F'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
('33344555', 'Theodore', 'M', '1983-10-25', 'Son'),
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');

-- --------------------------------------------------------

--
-- Table structure for table `DEPT_LOCATIONS`
--

CREATE TABLE IF NOT EXISTS `DEPT_LOCATIONS` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(20) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`)
);

--
-- Dumping data for table `DEPT_LOCATIONS`
--

INSERT INTO `DEPT_LOCATIONS` (`Dnumber`, `Dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
  `Fname` varchar(12) NOT NULL,
  `Minit` char(1) NOT NULL,
  `Lname` varchar(12) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date NOT NULL,
  `Address` text NOT NULL,
  `Sex` char(1) NOT NULL,
  `Salary` int(11) NOT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL,
  PRIMARY KEY (`Ssn`)
);

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`Fname`, `Minit`, `Lname`, `Ssn`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Sprint, TX', 'F', 25000, '987654321', 4);

-- --------------------------------------------------------

--
-- Table structure for table `PROJECT`
--

CREATE TABLE IF NOT EXISTS `PROJECT` (
  `Pname` varchar(20) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(20) NOT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`)
);

--
-- Dumping data for table `PROJECT`
--

INSERT INTO `PROJECT` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table `WORKS_ON`
--

CREATE TABLE IF NOT EXISTS `WORKS_ON` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` float DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`)
);

--
-- Dumping data for table `WORKS_ON`
--

INSERT INTO `WORKS_ON` (`Essn`, `Pno`, `Hours`) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, NULL),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);