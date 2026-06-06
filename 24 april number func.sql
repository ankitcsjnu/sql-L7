-- fuctions -- numeric function
-- functions -- numeric functions
use sakila;
select 43.76;

# 1 decimal ko round off => 6
select 43.26, round(43.26), round(43.26,1);
select 43.26, round(43.76), round(43.26,1);
select 43.286, round(43.286), round(43.286,1);
select 43.286, round(43.286), round(43.283,2);
select 43.286, round(43.286), round(43.236,1);
select 43.286, round(43.286), round(43.786,-1);
select 3.286, round(3.286), round(3.286,-1);
select 7.286, round(7.286), round(7.286,-1);
select 53.286, round(53.286), round(53.286,-2);
select 53.286, round(53.286), round(43.286,-2);
select 153.286, round(153.286), round(153.286,-3);
select 753.286, round(753.286), round(753.286,-3);
select 753.286, round(753.286), round(7453.286,-3);


# 463 => -3
select 34.647, round (2763.647, -3);

select round (345.68592), truncate(345.6859,2);
select round (345.68592), truncate(345.6859,2);
select round (345.68592), truncate(345.6859,3);
select round (345.68592), truncate(345.6829,3);
select round (345.68592), truncate(345.6859,-2);
select round (345.6859,2), truncate(345.6859,2);

select mod(10,2);
select ceil(5.000000000006), floor(5.999999999);
# 234 => 2*100
# 3*10 + 4*1
# one place => tenth mai convert hogi => hundrrea place mai convert

select ceil(.00000000000), floor(5.999999999);
select ceil(5.000000000006), floor(5.999999999);