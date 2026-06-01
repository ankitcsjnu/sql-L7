-- VIEWS IN SQL
-- Agar updatable view me change karenge to original table me bhi change hoga.

CREATE DATABASE IF NOT EXISTS viewdb;
USE viewdb;

-- Tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Data
INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',2,70000,'Jaipur'),
(102,'Priya',1,45000,'Delhi'),
(103,'Rahul',2,90000,'Mumbai'),
(104,'Sneha',3,55000,'Jaipur'),
(105,'Vikram',2,30000,'Pune');

SELECT * FROM departments;
SELECT * FROM employees;

-- Simple View
CREATE VIEW dept_view AS
SELECT *
FROM departments
WHERE dept_id < 3;

SELECT * FROM dept_view;

-- Aggregate View
CREATE VIEW city_sum AS
SELECT city,
       SUM(salary) AS total_salary
FROM employees
GROUP BY city;

SELECT * FROM city_sum;

-- Updatable View
CREATE VIEW emp_public AS
SELECT emp_id, name, dept_id, city
FROM employees;

SELECT * FROM emp_public;

-- Insert through view
INSERT INTO emp_public(emp_id, name, dept_id, city)
VALUES (106,'Karan',1,'Jaipur');

SELECT * FROM employees WHERE emp_id = 106;

-- Delete through view
DELETE FROM emp_public
WHERE emp_id = 106;

SELECT * FROM employees;

-- View with restricted columns
CREATE VIEW emp_2_col AS
SELECT emp_id, name
FROM employees;

SELECT * FROM emp_2_col;

-- Insert through restricted view
INSERT INTO emp_2_col(emp_id, name)
VALUES (107,'Yash');

SELECT * FROM emp_2_col;
SELECT * FROM employees;

-- Delete through view
DELETE FROM emp_2_col
WHERE emp_id = 107;

SELECT * FROM employees;

-- Update through view
UPDATE emp_2_col
SET name = 'Priya Sharma'
WHERE emp_id = 102;

SELECT * FROM emp_2_col;
SELECT * FROM employees;

-- Non-updatable View
CREATE VIEW not_updatable AS
SELECT MAX(salary) AS max_salary
FROM employees;

SELECT * FROM not_updatable;

-- This will give an error because aggregate views are not updatable
INSERT INTO not_updatable VALUES (100000);


-- JOINS
-- INNER JOIN
-- Sirf matching records dikhata hai
SELECT e.emp_id,e.name,d.dept_name,e.salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- LEFT JOIN
-- Employees table ke saare records dikhata hai
SELECT e.emp_id,e.name,d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- RIGHT JOIN
-- Departments table ke saare records dikhata hai
SELECT e.emp_id,e.name,d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


-- VIEW USING JOIN
CREATE VIEW emp_dept_view AS
SELECT e.emp_id,e.name,d.dept_name,e.salary,e.city
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM emp_dept_view;

CREATE VIEW high_salary_emp AS
SELECT e.emp_id,e.name, d.dept_name,e.salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;

SELECT * FROM high_salary_emp;