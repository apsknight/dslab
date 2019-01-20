--
-- Database: `assignment1`
--

-- --------------------------------------------------------

--
-- Table structure for table `COURSE`
--

CREATE TABLE `COURSE` (
  `Course_name` varchar(50) NOT NULL,
  `Course_number` varchar(20) NOT NULL,
  `Credit_hours` int(11) NOT NULL,
  `Department` varchar(10) NOT NULL
);

--
-- Dumping data for table `COURSE`
--

INSERT INTO `COURSE` (`Course_name`, `Course_number`, `Credit_hours`, `Department`) VALUES
('Intro to Computer Science', 'CS1310', 4, 'CS'),
('Data Structures', 'CS3320', 4, 'CS'),
('Database', 'CS3380', 3, 'CS'),
('Discrete Mathematics', 'MATH2410', 3, 'MATH');

-- --------------------------------------------------------

--
-- Table structure for table `GRADE_REPORT`
--

CREATE TABLE `GRADE_REPORT` (
  `Student_number` int(11) NOT NULL,
  `Section_identifier` int(11) NOT NULL,
  `Grade` char(1) NOT NULL
);

--
-- Dumping data for table `GRADE_REPORT`
--

INSERT INTO `GRADE_REPORT` (`Student_number`, `Section_identifier`, `Grade`) VALUES
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A'),
(17, 112, 'B'),
(17, 119, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `PREREQUISITE`
--

CREATE TABLE `PREREQUISITE` (
  `Course_number` varchar(10) NOT NULL,
  `Prerequisite_number` varchar(10) NOT NULL
);

--
-- Dumping data for table `PREREQUISITE`
--

INSERT INTO `PREREQUISITE` (`Course_number`, `Prerequisite_number`) VALUES
('CS3380', 'CS3320'),
('CS3380', 'MATH2410'),
('CS3320', 'CS1310');

-- --------------------------------------------------------

--
-- Table structure for table `SECTION`
--

CREATE TABLE `SECTION` (
  `Section_identifier` int(11) NOT NULL,
  `Course_number` varchar(10) NOT NULL,
  `Semester` varchar(10) NOT NULL,
  `Year` char(2) NOT NULL,
  `Instructor` varchar(20) NOT NULL
);

--
-- Dumping data for table `SECTION`
--

INSERT INTO `SECTION` (`Section_identifier`, `Course_number`, `Semester`, `Year`, `Instructor`) VALUES
(85, 'MATH2410', 'Fall', '07', 'King'),
(92, 'CS1310', 'Fall', '07', 'Anderson'),
(102, 'CS3320', 'Spring', '08', 'Knuth'),
(112, 'MATH2410', 'Fall', '08', 'Chang'),
(119, 'CS1310', 'Fall', '08', 'Anderson'),
(135, 'CS3380', 'Fall', '08', 'Stone');

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT`
--

CREATE TABLE `STUDENT` (
  `Name` varchar(20) NOT NULL,
  `Student_number` int(11) NOT NULL,
  `Class` int(11) NOT NULL,
  `Major` varchar(5) NOT NULL
);

--
-- Dumping data for table `STUDENT`
--

INSERT INTO `STUDENT` (`Name`, `Student_number`, `Class`, `Major`) VALUES
('Brown', 8, 2, 'CS'),
('Smith', 17, 1, 'CS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `COURSE`
--
ALTER TABLE `COURSE`
  ADD PRIMARY KEY (`Course_number`);

--
-- Indexes for table `GRADE_REPORT`
--
ALTER TABLE `GRADE_REPORT`
  ADD PRIMARY KEY (`Student_number`,`Section_identifier`);

--
-- Indexes for table `SECTION`
--
ALTER TABLE `SECTION`
  ADD PRIMARY KEY (`Section_identifier`);

--
-- Indexes for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`Student_number`);