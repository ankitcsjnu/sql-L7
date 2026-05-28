
select * from mysql.user;

-- permission to new user 
create user ankit321 identified by '123';
select * from mysql.user; -- check privilages 
select current_user();

create database testdb4;
use testdb4;
create table emp(id int,name varchar(20));
insert into emp values(20,'abhi'), (21 ,'naina');
select * from emp;

show grants for ankit321; 
-- define grant usage 

grant select on testdb4.emp to ankit321;
grant delete on testdb4.* to ankit321;

-- remove all privilage s from ishan user