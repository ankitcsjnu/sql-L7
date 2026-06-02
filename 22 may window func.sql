create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);

INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);

select * from sales;
#lag
select *, lag(sale_date,2) over() from sales;

#lead
select *, lead(sale_date,1) over() from sales;
select *, lead(amount,1) over() from sales;

select *, lead(amount,1,0) over(order by amount desc) from sales;

# cummulative sum 
select *, sum(amount) over(rows between unbounded preceding and current row) from sales;

-- Previous 1 row + current row ka sum
SELECT *,SUM(amount) OVER(ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS total
FROM sales;

-- Previous 1 row + current row ka sum
SELECT *,SUM(amount) OVER(ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS total
FROM sales;

select *, sum(amount) over(rows between unbounded preceding and 1 following) from sales;

-- calculate sum of current row and next row.
select id ,sale_date,amount,sum(amount) over(order by sale_date rows between current row and 1 following)
as current_next_sum from sales;
