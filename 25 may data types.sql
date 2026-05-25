create database if not exists datatypedb;
use datatypedb;
-- data types in sql 
-- numeric 
create table test1(id tinyint);
insert into test1 values(-1) ,(10);
insert into test1 values(-129); -- out of range (1 byte= 8 bit =2**8) (-123 to 127)
select *from test1;

-- small int --> 2 byte 
-- medium int =-> 3 byte 
-- int -> 4
-- big int ->8 byte 
-- kaun sa kab prefer kare ?

create table test2(age tinyint);
insert into test2 values(250);
select * from test2;

create table test3(salary float, salary2 double);
insert into test3 values(1989.3434,1989.34387864);
select * from test3;

create table test4(price double(6,2));
insert into test4 values(0.7326778); -- only 2 decimal values 
insert into test4 values(44.7326778);
insert into test4 values(4453.7326778);
insert into test4 values(4453);
insert into test4 values(48447); -- 5 integer value 
select * from test4;


-- how to store string data in the table 
create table test5(countrycode char(3)); -- chr me memory fix ho jayega -- memory wastage jda hota h -- ye fast bhi hota h 
insert into test5 values('IND');
insert into test5 values('INDIA'); -- error 
insert into test5 values('hi       ');
select * , char_length(countrycode) from test5; -- it truncate the ending whithespaces
select * from test5;

create table test6(countrycode varchar(3)); -- chr me memory fix ho jayega -- memory wastage jda hota h -- ye fast bhi hota h 
insert into test6 values('IND');
insert into test6 values('INDIA'); -- error 
insert into test6 values('hi       ');
select * , char_length(countrycode) from test6;