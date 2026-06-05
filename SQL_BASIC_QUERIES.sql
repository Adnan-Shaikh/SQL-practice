CREATE TABLE Dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

INSERT INTO Dept VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Maintenance'),
(40, 'Production'),
(50, 'QA'),
(60, 'QC');

CREATE TABLE Org (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES Dept(dept_id)
);

INSERT INTO Org (emp_id, emp_name, dept_id) VALUES
(101, 'Liam Smith', 10),
(102, 'Noah Johnson', 10),
(103, 'Oliver Williams', 20),
(104, 'Elijah Brown', 20),
(105, 'William Jones', 30),
(106, 'James Garcia', 30),
(107, 'Benjamin Miller', 40),
(108, 'Lucas Davis', 40),
(109, 'Henry Rodriguez', 10),
(110, 'Alexander Martinez', 20),
(111, 'Mia Hernandez', 30),
(112, 'Ava Lopez', 40),
(113, 'Emma Gonzalez', 10),
(114, 'Sophia Wilson', 20),
(115, 'Amelia Anderson', 30),
(116, 'Isabella Thomas', 40),
(117, 'Charlotte Taylor', 10),
(118, 'Harper Moore', 20),
(119, 'Evelyn Jackson', 30),
(120, 'Abigail Martin', 40);

-- SELECT
Select * from ORG;

-- WHERE & IN 
Select * from ORG where dept_id in (20,30,50);

-- AND & LIKE 
Select * from ORG where (emp_id Between 101 And 120) AND (emp_name like 'A%');

-- OR & Silent errors in perenthesis
Select * from ORG where (emp_id Between 101 And 115) AND ((emp_name like 'A%') 
OR (emp_name like 'J%')) ;

-- UPDATE & DELETE
update ORG set emp_name = "Praful sir" where emp_id = 105;
Delete from employee where emp_id = 105;

-- BETWEEN
Select * from ORG where emp_id between 101 AND 115;


-- GROUP BY
SELECT dept_id,
COUNT(emp_id)
FROM Org
GROUP BY dept_id;

-- Group by Having

SELECT dept_id,
COUNT(emp_id)
FROM Org
GROUP BY dept_id
HAVING COUNT(emp_id) > 4;

-- WHERE VS HAVING Both queries below return similar results However, using `WHERE` is more efficient because unnecessary rows are removed before grouping begins.

SELECT dept_id,
COUNT(emp_id)
FROM Org
WHERE dept_id != 10
GROUP BY dept_id;

SELECT dept_id,
COUNT(emp_id)
FROM Org
GROUP BY dept_id
HAVING dept_id != 10;

-- Practice Queries

-- 1. Count total employees
SELECT COUNT(emp_id)
FROM Org;

-- 2. Count employees per department
SELECT dept_id,
COUNT(emp_id)
FROM Org
GROUP BY dept_id;

-- 3. Find lowest and highest employee ID's
SELECT MIN(emp_id),
MAX(emp_id)
FROM Org;

-- 4. Departments having more than four employees
SELECT dept_id,
COUNT(emp_id)
FROM Org
GROUP BY dept_id
HAVING COUNT(emp_id) > 4;

-- 5. Dataset 2 : Staff Salary Table

CREATE TABLE Staff (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);

INSERT INTO Staff (emp_id, emp_name, dept_name, salary) VALUES
(201, 'Liam Smith', 'Sales', 55000),
(202, 'Noah Johnson', 'Sales', 62000),
(203, 'Oliver Williams', 'Tech', 85000),
(204, 'Elijah Brown', 'Tech', 92000),
(205, 'William Jones', 'HR', 48000),
(206, 'James Garcia', 'HR', 51000),
(207, 'Benjamin Miller', 'Finance', 75000),
(208, 'Lucas Davis', 'Finance', 81000),
(209, 'Henry Rodriguez', 'Sales', 58000),
(210, 'Alexander Martinez', 'Tech', 105000),
(211, 'Mia Hernandez', 'HR', 53000),
(212, 'Ava Lopez', 'Finance', 79000),
(213, 'Emma Gonzalez', 'Sales', 61000),
(214, 'Sophia Wilson', 'Tech', 88000),
(215, 'Amelia Anderson', 'HR', 47000),
(216, 'Isabella Thomas', 'Finance', 83000),
(217, 'Charlotte Taylor', 'Sales', 54000),
(218, 'Harper Moore', 'Tech', 95000),
(219, 'Evelyn Jackson', 'HR', 52000),
(220, 'Abigail Martin', 'Finance', 77000);

-- Average Salary by Department

SELECT dept_name,
AVG(salary)
FROM Staff
WHERE salary >= 50000
GROUP BY dept_name
HAVING AVG(salary) > 75000;

-- Total Salary Budget by Department

SELECT dept_name,
SUM(salary)
FROM Staff
WHERE salary > 60000
GROUP BY dept_name
HAVING SUM(salary) > 150000;

-- Maximum Salary per Department
SELECT dept_name,
MAX(salary)
FROM Staff
WHERE dept_name != 'HR'
GROUP BY dept_name
HAVING MAX(salary) > 80000;



