-- GROUP BY = group same values and perform calculations on each group -- same value ko group krke unko calculate krta h 
-- similar value ko ek satth group kr deta h 
-- group by is statemnet is used to group similar values .so that we can  perfrom calculation on that group 
-- ex - department - it , sales , marketing etc.


-- GROUP BY vs DISTINCT

-- | Feature      | DISTINCT          | GROUP BY                       |
-- | ------------ | ----------------- | ------------------------------ |
-- | Purpose      | Remove duplicates | Group data                     |
-- | Use case     | Unique values     | Aggregation (SUM, COUNT, etc.) |
-- | Aggregate fn | ❌ Not required    | ✅ Usually used                |
-- | Output       | Unique rows only  | Grouped result                 |

use sakila;
select * from employees;
select department from employees group by department;
select first_name from employees group by first_name; 
select count(department) from employees where department= 'IT';
select department, count(department) from employees group by department; 

select sum(salary) from employees where department= 'finance';
select department, sum(salary) from employees group by department; 
select department, sum(salary) ,count(department) ,avg(salary) from employees group by department; 

select * from employees;
select job_title,count(job_title) from employees group by job_title;
select * from employees where job_title='sales representative';
select job_title, sum(salary) from employees group by job_title;

select * from payment;

-- q1 from this payment table find the total amount and the avg amount ?
select sum(amount) ,avg(amount) from payment;

-- q2. from this payment table find the number of transcation done by cumtomer id 1 ?
select count(customer_id) as transaction from payment where customer_id=1;

-- q3 find the total transaction done by customer is 2 and 5 ?
select count(customer_id) from payment where customer_id =5 or customer_id= 2;
select count(customer_id) from payment where customer_id =2;


-- q4. find the avg amount spend in the year 2005 ?
 select avg(amount) from payment where year(payment_date)='2005';
 
 -- Q5. total transaction done by each customer id ?
 select customer_id ,count(customer_id) from payment group by customer_id;
 
 -- q6. find the total transaction and the total tansaction spend after customer id 3 ?
 select customer_id ,count(customer_id) as total_transaction ,sum(amount) from payment where customer_id >=3 group by customer_id;
 
 -- Q7. find the occurance for each amount value ?
 select amount, count(amount) from payment group by amount;
 
 -- Q8 find the total amonut given in your table ?
 select sum(amount) from payment;
 
 -- Q9 get the avg amount spend by each staff?
 select staff_id ,avg(amount) as avg_amount from payment group by staff_id;
 
 -- 10.get the total amount spend in each month ?
 select month(payment_date), sum(amount) from payment group by  month(payment_date);
 
 -- 11 .get the total amont for each month of each year ?
 select year(payment_date) as year ,month(payment_date) 
 as month, sum(amount) as total 
 from payment group by  year(payment_date),month(payment_date); 
 
 
 -- youtube 
 -- how to import employee database?
 -- how to solve mysql is not recgnize ?
 
 
 select * from payment;
 select count(*),count(payment_id) from payment where customer_id=2;
 select customer_id ,count(payment_id) from payment group by customer_id;
 
 select customer_id  from payment where customer_id>=3 group by customer_id;
 
  select count(customer_id)  from payment where customer_id>=3 group by customer_id;
 
 
 