-- Deliverable 1: The Number Of Retiring Employees By Title.

SELECT E.emp_no,
       E.first_name,
       E.last_name,
       TI.title,
       TI.from_date,
       TI.to_date
INTO Retirement_Titles
FROM Employees as E
INNER JOIN Titles as TI
ON (E.emp_no = TI.emp_no)
WHERE (E.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY E.emp_no;

-- Removing Duplicate Rows.
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO Unique_Titles
FROM Retirement_Titles
ORDER BY emp_no, title DESC;

-- Obtaining The Number Of Employees That Are About To Retire.
SELECT COUNT(UT.emp_no),
UT.title
INTO Retiring_Titles
FROM Unique_Titles as UT
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- Deliverable 2: The Employees Eligible For The Mentorship Program. 

SELECT DISTINCT ON(E.emp_no) E.emp_no, 
    E.first_name, 
    E.last_name, 
    E.birth_date,
    DE.from_date,
    DE.to_date,
    TI.title
INTO Mentorship_Eligibility
FROM Employees as E
INNER JOIN Dept_Emp as DE
ON (E.emp_no = DE.emp_no)
INNER JOIN Titles as TI
ON (E.emp_no = TI.emp_no)
WHERE (E.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY E.emp_no;