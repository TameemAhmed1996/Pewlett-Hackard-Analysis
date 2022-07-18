SELECT first_name, last_name
FROM Employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM Employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement Eligibility.
SELECT first_name, last_name
FROM Employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number Of Employees Retiring.
SELECT COUNT(first_name)
FROM Employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Exporting The Data Into A File.
SELECT first_name, last_name
INTO Retirement_Information
FROM Employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM Retirement_Information;

-- Create New Table For Retiring Employees.
SELECT emp_no, first_name, last_name
INTO Retirement_Information
FROM Employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check The Table.
SELECT * FROM Retirement_Information;

-- Joining Departments And Managers Tables.
SELECT Departments.dept_name,
     Managers.emp_no,
     Managers.from_date,
     Managers.to_date
FROM Departments
INNER JOIN Managers
ON Departments.dept_no = Managers.dept_no;

SELECT* FROM Departments;

-- Joining Retirement_Information And Dept_Emp Tables.
SELECT Retirement_Information.emp_no,
    Retirement_Information.first_name,
Retirement_Information.last_name,
    Dept_Emp.to_date
FROM Retirement_Information
LEFT JOIN Dept_Emp 
ON Retirement_Information.emp_no = Dept_Emp.emp_no;

-- Joining Departments And Managers Tables.
SELECT Departments.dept_name,
     Managers.emp_no,
     Managers.from_date,
     Managers.to_date
FROM Departments
INNER JOIN Managers
ON Departments.dept_no = Managers.dept_no;

--Implementing A Less Complex Method Of The Code Executed Above.

SELECT D.dept_name,
     Mgs.emp_no,
     Mgs.from_date,
     Mgs.to_date
FROM Departments as D
INNER JOIN Managers as Mgs
ON D.dept_no = Mgs.dept_no;	 

SELECT RI.emp_no,
    RI.first_name,
    RI.last_name,
DE.to_date
INTO Employees
FROM Retirement_Information as RI
LEFT JOIN Dept_Emp as DE
ON RI.emp_no = DE.emp_no
WHERE DE.to_date = ('9999-01-01');

-- Employee Count By Department Number.
SELECT COUNT(E.emp_no), DE.dept_no
FROM Employees as E
LEFT JOIN Dept_Emp as DE
ON E.emp_no = DE.emp_no
GROUP BY DE.dept_no
ORDER BY DE.dept_no;

SELECT * FROM Salaries
ORDER BY to_date DESC;

-- Combining Tables To Obtain Information For The Boss.
SELECT emp_no,
    first_name,
last_name,
    gender
INTO Employees_Information
FROM Employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT E.emp_no,
    E.first_name,
E.last_name,
    E.gender,
    S.salary,
    DE.to_date
--INTO Employees_Information.
FROM Employees as E
INNER JOIN Salaries as S
ON (E.emp_no = S.emp_no)
INNER JOIN Dept_Emp as DE
ON (E.emp_no = DE.emp_no)
WHERE (E.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (E.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (DE.to_date = '9999-01-01');
	 
-- A List Of Managers In Each Department.
SELECT  Mgs.dept_no,
        D.dept_name,
        Mgs.emp_no,
        E.last_name,
        E.first_name,
        Mgs.from_date,
        Mgs.to_date
--INTO Managers_Information.
FROM Managers AS Mgs
    INNER JOIN Departments AS D
        ON (Mgs.dept_no = D.dept_no)
    INNER JOIN Employees AS E
        ON (Mgs.emp_no = E.emp_no);
		
--Information On The Number Of Retirees In Each Department.

SELECT E.emp_no,
E.first_name,
E.last_name,
D.dept_name
-- INTO Departments_Information.
FROM Employees as E
INNER JOIN Dept_Emp AS DE
ON (E.emp_no = DE.emp_no)
INNER JOIN Departments AS D
ON (DE.dept_no = D.dept_no);



