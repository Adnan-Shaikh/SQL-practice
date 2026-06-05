/*  
Task 1 — PRIMARY KEY

Create a table called students.

Conditions:
	student_id should uniquely identify each student
	name should not be empty
	age should store integer values

task:
Write the CREATE TABLE query
Insert 2 records
Try inserting a duplicate student_id and observe the error
*/

create table students 
(
student_id int primary key,
name varchar(20) not null,
age int
);

insert into students values (1,"Adnan",20),(1,"Adnan",20);


/* 
Task 2 — UNIQUE KEY

Create a table called employees.

Conditions:
	emp_id should be PRIMARY KEY
	email should always be unique
	name should not be NULL
Then:
	Insert 2 valid employees
	Try inserting another employee with the same email
	Observe the error
*/


create table employees 
(
emp_id int primary key,
email varchar(30),
name varchar(20) not null,
unique(email)
);

insert into employees values (1,"abc@gmail.com","Adnan"),(2,"xyz@gmail.com","Aditya");
insert into employees value (3,"abc@gmail.com","Aarish");


/* 
Task 3 — COMPOSITE KEY
Create a table called student_courses.
Conditions:
	One student can enroll in many courses
	One course can have many students
	The combination of student_id and course_id should be unique
Columns:
	student_id
	course_id
	course_name
task:
	Create the table using a COMPOSITE PRIMARY KEY
	Insert 2 valid records
	Try inserting the same (student_id, course_id) combination again
	Observe the error
*/


create table student_courses 
(
	student_id int,
	course_id int,
	course_name varchar(200),
    primary key(student_id,course_id)
);

insert into student_courses values (1,101,"BEE"),(1,201,"ACN"),(2,101,"BEE");



/*
Task 4 — FOREIGN KEY

Create two tables:
departments
employees

Conditions:

departments table
	dept_id should be PRIMARY KEY
	dept_name should store department names
employees table
	emp_id should be PRIMARY KEY
	emp_name should NOT NULL
	dept_id should act as a FOREIGN KEY referencing departments(dept_id)

Then:
	Insert 3 departments into the parent table
	Insert 2 valid employees
	Try inserting an employee with a department ID that does not exist
	Observe the FOREIGN KEY error
*/

create table departments
(
dept_id int primary key,
dept_name varchar(200)
);

create table employee
(
emp_id int primary key,
emp_name varchar(200),
dept_id int,
foreign key (dept_id) references departments(dept_id)
);


insert into departments values (101,"HR"),(102,"IT"),(103,"Production");

insert into employee values (1,"Adnan",101),(2,"Aditya",102);
insert into employee values (3,"Aarish",104);







