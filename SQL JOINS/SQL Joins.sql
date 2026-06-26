/*
======================================================================
                         SQL JOINS PRACTICE
======================================================================

Project:
    Understanding SQL JOIN operations

Objective:
    Practice combining data from multiple tables using JOIN operations.

Concepts Covered:

    • INNER JOIN
    • LEFT JOIN
    • RIGHT JOIN
    • Aggregate Functions with JOIN
    • GROUP BY
    • HAVING
    • NULL handling

======================================================================
                        STEP 1 : TABLE CREATION
======================================================================
*/

create database joins;
use joins;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department_id INT
);


/*
======================================================================
                         STEP 2 : INSERT DATA
======================================================================
*/


INSERT INTO departments (department_id, department_name) VALUES
(10, 'HR'),
(20, 'Engineering'),
(30, 'Marketing'),
(40, 'Finance');


INSERT INTO employees 
(employee_id, first_name, last_name, salary, department_id) 
VALUES

(1, 'Alice', 'Smith', 70000, 10),
(2, 'Bob', 'Jones', 95000, 20),
(3, 'Charlie', 'Brown', 60000, 10),
(4, 'David', 'Miller', 110000, 20),
(5, 'Emma', 'Davis', 80000, 30),
(6, 'Frank', 'Wilson', 55000, NULL);



/*
======================================================================
                         INNER JOIN
======================================================================

Purpose:

Returns only matching records from both tables.

Example:
Employee must have a valid department.
*/


-- Display employee names with their department names

SELECT 
    employees.first_name,
    employees.last_name,
    departments.department_name

FROM employees

INNER JOIN departments

ON employees.department_id = departments.department_id;



-- Find total salary spent on Engineering department


SELECT 
    departments.department_name,
    SUM(employees.salary) AS total_salary

FROM employees

INNER JOIN departments

ON employees.department_id = departments.department_id

GROUP BY departments.department_name

HAVING departments.department_name = 'Engineering';



-- Find employees earning more than 80000


SELECT 
    employees.first_name,
    departments.department_name,
    employees.salary

FROM employees

INNER JOIN departments

ON employees.department_id = departments.department_id

WHERE salary > 80000;



-- Count employees working in HR


SELECT 
    departments.department_name,
    COUNT(employees.employee_id) AS employee_count

FROM employees

INNER JOIN departments

ON employees.department_id = departments.department_id

GROUP BY departments.department_name

HAVING departments.department_name = 'HR';



-- Departments having at least one employee


SELECT 
    departments.department_name,
    COUNT(employees.employee_id) AS employee_count

FROM departments

INNER JOIN employees

ON employees.department_id = departments.department_id

GROUP BY departments.department_name

HAVING COUNT(employees.employee_id) >= 1;



/*
======================================================================
                         LEFT JOIN
======================================================================

Purpose:

Returns all records from the left table,
including unmatched records.

Example:
Employees without departments are still displayed.
*/


-- Display all employees with their department

SELECT 
    employees.first_name,
    employees.last_name,
    departments.department_name

FROM employees

LEFT JOIN departments

ON employees.department_id = departments.department_id;



-- Find employees without departments


SELECT 
    employees.first_name,
    employees.last_name

FROM employees

LEFT JOIN departments

ON employees.department_id = departments.department_id

WHERE departments.department_name IS NULL;



-- Display all departments with employee count

SELECT

    departments.department_name,
    COUNT(employees.employee_id) AS employee_count

FROM departments

LEFT JOIN employees

ON employees.department_id = departments.department_id

GROUP BY departments.department_name;



/*
======================================================================
                         RIGHT JOIN
======================================================================

Purpose:

Returns all records from the right table,
including unmatched records.

Example:
Departments without employees are still displayed.
*/


-- Display all departments and employees


SELECT

    employees.first_name,
    departments.department_name

FROM employees

RIGHT JOIN departments

ON employees.department_id = departments.department_id;



-- Find departments with no employees


SELECT

    departments.department_name

FROM employees

RIGHT JOIN departments

ON employees.department_id = departments.department_id

WHERE employees.employee_id IS NULL;



-- Find maximum salary in each department

SELECT

    departments.department_name,
    MAX(employees.salary) AS maximum_salary

FROM employees

RIGHT JOIN departments

ON employees.department_id = departments.department_id

GROUP BY departments.department_name;



/*
======================================================================
                         KEY LEARNINGS
======================================================================


INNER JOIN:
    Returns only matching rows between tables.


LEFT JOIN:
    Returns all rows from the left table
    and matching rows from the right table.


RIGHT JOIN:
    Returns all rows from the right table
    and matching rows from the left table.


Important Concepts Learned:

• How tables communicate using common columns
• How JOIN conditions work
• Handling NULL values
• Combining JOINs with aggregate functions
• Using GROUP BY after joining tables


======================================================================
                         END OF PRACTICE
======================================================================
*/
```
