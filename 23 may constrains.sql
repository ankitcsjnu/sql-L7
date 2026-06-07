-- CONSTRAINT 

drop database const_db;
create database const_db;
use const_db;

select database();

create table test1( id int , age int);
insert into test1 values(101,23),(102,null);
select * from test1;

-- constraint 
-- NOT null 
create table test2( id int , age int not null);
insert into test2 values(101,23);
select * from test2;

-- UNIQUE
create table test3( id int unique , age int);
insert into test3 values(101,23);
select * from test3;
insert into test3 values(101,24); -- gives an error 

-- DEFAULT
create table test4( id int default 100 , age int);
insert into test4 (age) values(20);
select * from test4;

-- PRIMARY KEY 
create table if not exists test5( id int primary key , age int);
insert into test5 values(101,23),(102,null);
select * from test5; 

-- MULTIPLE COLUMN"S primary key
create table if not exists test6( id int , age int, primary key(id , age));
insert into test6 values(1,50,500000),(2,40,20000),(1,51,205000),(3,50,10000);
select * from test6; 

-- CHECK
create table if not exists test7( id int , age int,CHECK (AGE> 18));
insert into test7 values(1,20);
select * from test7;
insert into test7 values(1,18); -- gives an error

-- FORIEGN key 
create table student (id int , name varchar(20) , cname varchar(20));
insert into student values ( 1,'naina', '10') , (1,'abhi',12);

create table class (cname varchar(20) primary key);
insert into class values(10),(8), (9);
select * from class; 


-- data type in sql is the learning assignment