--
-- Part (a)
--
SELECT s.Name AS 'Student_name',
sec.Course_number,
g.Grade,
sec.Semester,
sec.Year,
sec.Section_identifier
FROM GRADE_REPORT g
JOIN STUDENT s ON g.Student_number = s.Student_number
JOIN SECTION sec ON g.Section_identifier = sec.Section_identifier;



--
-- Part (b)
--
SELECT c.Course_name,
p.Course_number,
p.Prerequisite_number AS 'Prerequisites'
FROM PREREQUISITE p
LEFT JOIN COURSE c ON p.Course_number = c.Course_number;