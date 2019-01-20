--
-- (a) For every project located in ‘Stafford’, list the project name, 
-- the controlling department name, and the department manager’s name, address, and birth date.
--
select p.pLocation AS 'Project Location',
p.Pname AS 'Project Name',
d.Dname AS 'Department Name',
CONCAT(e.Fname, ' ', e.Minit, ' ', e.Lname) AS 'Manager NAME',
e.Address AS 'Manager Address',
e.Bdate AS 'Manager Date of Birth'
FROM DEPARTMENT d 
INNER JOIN PROJECT p ON p.Dnum = d.Dnumber 
INNER JOIN EMPLOYEE e ON e.Ssn = d.Mgr_ssn 
WHERE p.Plocation='Stafford';


--
-- (b) If every employee working on the ‘ProductX’ project is given a 10 percent raise, 
-- show the resulting salaries along with names of the employees.
--
SELECT CONCAT(e.Fname, ' ', e.Minit, ' ', e.Lname) AS 'Employee NAME',
e.Salary AS 'Employee Current Salary',
e.salary*1.1 AS 'Employee Raised Salary'
FROM EMPLOYEE e
INNER JOIN WORKS_ON w ON w.Essn = e.Ssn
INNER JOIN PROJECT p ON p.Pnumber = w.Pno
WHERE p.Pname='ProductX';

--
-- (c) Retrieve a list of employees and the projects they are working on, ordered by department 
-- and, within each department, ordered alphabetically by last name, then first name.
--
SELECT CONCAT(e.Fname, ' ', e.Minit, ' ', e.Lname) AS 'Employee NAME',
p.Pname AS 'Project',
d.Dname AS 'Department'
FROM EMPLOYEE e
INNER JOIN WORKS_ON w ON w.Essn = e.Ssn
INNER JOIN PROJECT p ON p.Pnumber = w.Pno
INNER JOIN DEPARTMENT d ON d.Dnumber = p.Dnum
ORDER BY d.Dname, e.Lname, e.Fname;

--
-- (d) Retrieve the names of all employees and their direct managers in department 5 who work 
-- more than 10 hours per week on the ProductX project.
--
SELECT CONCAT(e1.Fname, ' ', e1.Minit, ' ', e1.Lname) AS 'Employee NAME',
CONCAT(e2.Fname, ' ', e2.Minit, ' ', e2.Lname) AS 'Manager NAME'
FROM EMPLOYEE e1
LEFT JOIN EMPLOYEE e2 ON e1.Super_ssn = e2.Ssn
LEFT JOIN WORKS_ON w ON e1.Ssn = w.Essn
LEFT JOIN PROJECT p on w.Pno = p.Pnumber
WHERE e1.Dno = 5 AND w.Hours > 10 AND p.Pname = 'ProductX';

--
-- (e) Retrieve the Essns of all employees who work the same (project, hours) combination on some 
-- project that employee ‘John Smith’ (whose Ssn =‘123456789’) works on. [Use nested query structure]
--
SELECT w.Essn AS 'Essn' FROM WORKS_ON w
WHERE w.Pno IN
(SELECT w_t.Pno FROM WORKS_ON w_t WHERE w_t.Essn='12345678')
AND
w.Hours IN
(SELECT w_temp.Hours FROM WORKS_ON w_temp WHERE w_temp.Essn='12345678');

--
-- (f) Retrieve the name of each employee who has a dependent with the same first name and is the 
-- same sex as the employee. [Use nested query structure]
--
SELECT CONCAT(e.Fname, ' ', e.Minit, ' ', e.Lname) AS 'Employee NAME' FROM EMPLOYEE e
WHERE EXISTS
(SELECT * FROM DEPENDENT d WHERE e.Fname = d.Dependent_name AND e.Sex = d.Sex);

--
-- (g) Find the sum of the salaries of all employees of the ‘Research’ department, as well as the 
-- maximum salary, the minimum salary, and the average salary in this department.
--
SELECT SUM(e.Salary) AS 'Sum',
MAX(e.Salary) AS 'Maximum',
MIN(e.Salary) AS 'Minimum',
AVG(e.Salary) AS 'Average'
FROM EMPLOYEE e
WHERE e.Dno IN
(SELECT d.Dnumber FROM DEPARTMENT d WHERE d.Dname='Research');

--
-- (h) For each department that has more than or equal to 3 employees, retrieve the department 
-- number and the number of its employees who are making more than $30,000.
--
SELECT e.Dno, COUNT(e.Dno)
FROM EMPLOYEE e WHERE e.Salary > 30000
GROUP BY e.Dno HAVING COUNT(e.Dno) >= 3;

--
-- Set Savepoint for the Start of Queries which modify the database.
--
SAVEPOINT SP;

--
-- (i) Raise salaries of those employees by 10 percent whose dependent are daughter.
--
UPDATE EMPLOYEE e
SET e.Salary = e.Salary / 1.1
WHERE EXISTS
(SELECT * FROM DEPENDENT d WHERE d.Relationship = 'Daughter' AND d.Sex = 'F' AND e.Ssn = d.Essn);

--
-- (j) Transfer those employees to department located in Stafford whose date of birth is in 1965.
--

ROLLBACK TO SP;