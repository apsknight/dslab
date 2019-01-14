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