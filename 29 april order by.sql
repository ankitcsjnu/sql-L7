use sakila;
select * from employees;

select * from employees order by first_name;

select * from employees order by salary;

select * from employees order by department;

select * from employees order by salary desc ; -- bade se chota 

select first_name ,department, salary from employees order by department;

select first_name ,department, salary from employees order by department,salary;

select salary,hire_date,year(hire_date) from employees 
order by year(hire_date);

select salary,hire_date, year(hire_date) from employees 
order by year(hire_date),salary desc;

-- operator -- between in and like -- and or not 
-- string funcrtion -- substr ,instr , trim , lpad ,rpad , replace ,lemngth ,concat
-- numeric function -- round ,mod ,truncate ,ceil ,floor 
-- date -- adddate ,month ,year ,extract,datediff,date_format

-- function   

-- distinct it gives you all the unique value -- duplicate ko remove krta h 
select  department from employees;
select  distinct (department) from employees;

select  salary ,department from employees; 
-- distinct me calculation  nhi lagti h 
select  distinct department,salary from employees;

-- calculate on your data => aggregate func
-- count ,max ,min ,avg ,sum

-- count-- null value ko count nhi krta h  --- null means empty/no data
select  count(department) from employees;
select  count(first_name) from employees;  
select sum(salary) ,count(salary), avg(salary) from employees;
select sum(salary) from employees where department= 'IT';
select sum(salary), count(salary) from employees where department= 'IT';

select * from address;
select  count(district) from address;  
select  count(district), count(address_id) ,count(address2) from address; 

select * from employees;
select count(department),count(distinct department)from employees;

select count(salary) from employees;

select salary ,count(salary) from employees; -- basic error 
select sum(salary) ,count(salary) from employees;
select max(salary), min(salary), avg(salary) from employees;
select sum(salary), sum(distinct salary) from employees;

-- asg SQL 0 TO 3 
-- WHAT IS GROUP BY 