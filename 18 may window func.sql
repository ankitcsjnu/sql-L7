drop database windowsdb;
create database windowsdb;
use windowsdb;

CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2021),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);
  
  
  select * from employees;
  
  select * , sum(salary) over(partition by hire_year
  ) from employees ;
  
  select * , sum(salary) over(partition by hire_year order by salary) from employees;
  
  select * , max(salary) over(partition by dept order by hire_year) from employees;
  
-- with case statement 
select * , avg(salary) over(partition by dept) ,
case 
	when salary > avg(salary) over(partition by dept) then 'above avg salary'
    else 'less then avg salary'
end  as comparision
 from employees ;
 
--  ROW_NUMBER
 -- generate a unique number for all data 
 select * , row_number() over(order by salary) from employees ;
 select * , row_number() over(partition by dept) from employees;
 
 select * , row_number() over(partition by dept order by salary desc) from employees; 
 
 
 -- RANK()
-- RANK() is used to give a ranking/position to rows based on some column like salary, marks, etc.
select *, rank() over() from employees;
select * , rank() over(order by salary) from employees;

select * , sum(salary) over(partition by dept order by salary)from employees;

select * , row_number() over(order by salary),
rank() over(order by salary),
dense_rank() over(order by salary) from employees;

select *,
rank() over(partition by dept order by salary desc) from employees;

select *,
rank() over(partition by dept order by hire_year) from employees;

select *,
rank() over(partition by dept order by salary desc) from employees;

select * from employees as e 
where salary=(select max(salary) from employees where dept=e.dept);

-- max 
select * from
(select * ,max(salary) over(partition by dept) as deptSalary from employees) as trh
 where salary=deptsalary;
 
 -- subqueries 
  select * from 
( select *,dense_rank() over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk=1
-- correalted -- kyu slow hota h ? A correlated subquery is a subquery that depends on the outer query for its values.
-- It means the inner query runs once for every row of the outer query.  
-- subqueries -- 
(select * ,dense_rank() over(order by salary desc) as drank from employees) as xyz
where drank=2;

-- windows func 
select * from employees where salary=
(select max(salary) from employees where salary < (select max(salary) from employees));

-- 2nd highest salary (most imp) always using subqueries
select max(salary) from employees where salary <(select max(salary) from employees);

-- 4th lowest salary 
select min(salary)  from employees  where salary >(select min(salary) from employees 
where salary > (select min(salary) from employees
 where salary >(select min(salary) from employees)));
 
 
 -- ROW_NUMBER()	Unique numbering
 
-- RANK()	Ranking with gaps

-- DENSE_RANK()	Ranking without gaps
select *, dense_rank() over() from employees;

-- NTILE()	Divide rows into buckets
SELECT *,DENSE_RANK() OVER(ORDER BY salary DESC) AS drank
FROM employees;

-- LAG()	Previous row value
SELECT *,LAG(salary) OVER(ORDER BY emp_id) AS prev_salary
FROM employees;

-- LEAD()	Next row value
SELECT *,LEAD(salary) OVER(ORDER BY emp_id) AS prev_salary
FROM employees;





-- using window function 
select * from 
(select * ,dense_rank() over(order by salary desc) as drank from employees) as xyz
where drank=4;


-- Main Difference
-- Feature	  			RANK()			 ROW_NUMBER()
-- Duplicate_values	   Same rank	   Different numbers
-- Skips ranks	         Yes				  No
-- Unique_numbering	      No				  Yes

-- assignment learn & written assignment
 -- window function / group by 
-- rank , dense_rank , row_number
-- where and having clause 
-- type's of join in sql 
-- natural join and cartesal join 
-- what is super key , primary , unique , foriegn key

-- Constraints in SQL
-- Constraints are rules applied on table columns to maintain:
-- data accuracy
-- data consistency
-- data integrity
-- They prevent invalid data from entering the table.

-- Types of Constraints in SQL
-- Constraint	            Purpose
-- NOT NULL	           Column cannot store NULL
-- UNIQUE	           No duplicate values
-- PRIMARY KEY      	Unique + Not Null
-- FOREIGN KEY   	   Creates relationship between tables
-- CHECK         	     Applies condition
-- DEFAULT       	    Sets default value
-- AUTO_INCREMENT    	Automatically increases value

