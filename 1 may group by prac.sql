-- group by practice on new data 

use sakila;

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;
select sum(amount) as total_sales from sales;
select sum(amount) as mobile_total_sales from sales where product='mobile';

select sum(amount) as laptop_total_sales from sales where product='laptop';

-- Q you need to find the total sales for north region but for the product laptop and mobile?
select sum(amount) as total_sales ,avg(amount) as avg_sales from sales where region='north' and product in ('laptop','mobile');

-- Q find out the maximum and the minimum amount fot the feb month ?
select max(amount) ,min(amount) from sales where month(sale_date)=2;
--       or

SELECT MONTH(sale_date) AS month,MAX(amount) AS max_amount, MIN(amount) AS min_amount
FROM sales WHERE MONTH(sale_date) = 2 GROUP BY MONTH(sale_date);

-- Q1 find out the total sales we have done for each region?
 select region, sum(amount) as total_sales from sales group by region;
 
-- Q2 find out the avg sales done by each person ?
select sales_person ,avg(amount) as avg_amount from sales group by sales_person;

-- Q3 find the total amonut and total sales done for each product but amit should not be the sales person ?
SELECT product, sales_person, SUM(amount) AS total_amount, COUNT(*) AS total_sales
FROM sales
WHERE sales_person != 'amit'
GROUP BY product, sales_person;

-- q4 find the no of  sales done by each person for the amount >10000? 
SELECT sales_person, COUNT(*) AS total_sales FROM sales
WHERE amount > 10000 GROUP BY sales_person;

-- Q5 find the the number of trans from day 1 to day 7 for any month?
SELECT SUM(amount) AS total_amount, COUNT(*) AS total_transactions from sales where day(sale_date) between 1 and 7 ;


-- Q6 find the total amount ,max ,avg for each product for each region ?
select sum(amount) as total_amount ,max(amount) as max_amount ,avg(amount) as avg_amount from sales group by product, region;
 
-- Q7find the total transc amount for each product where the product should be sold more than 13th times?
SELECT product,sum(amount) from sales group by product having count(*) > 13;
