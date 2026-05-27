-- Create Database
create database rajdb;

-- Use Database
use rajdb;

-- Create Table
create table raj45(
    id int
);

-- Insert Data
insert into raj45 values (10);

-- Show Data
select * from raj45;


-- =========================
-- TCL (Transaction Control Language)
-- =========================

-- Start Transaction
start transaction;

-- Insert Multiple Rows
insert into raj45 values (100), (89);

-- Check Data
select * from raj45;

-- Save Changes Permanently
commit;


-- =========================
-- Rollback Example
-- =========================

start transaction;

-- Disable Safe Update Mode
set SQL_SAFE_UPDATES = 0;

-- Update All Rows
update raj45
set id = 500;

-- Check Updated Data
select * from raj45;

-- Revert Pending Changes
rollback;

-- Check Data After Rollback
select * from raj45;


-- =========================
-- Auto Commit Example
-- =========================

-- Check Auto Commit Status
select @@autocommit;

-- By default value = 1
-- SQL automatically commits changes


-- =========================
-- Commit + Rollback Example
-- =========================

start transaction;

insert into raj45 values (100), (89), (23), (45);

delete from raj45
where id = 10;

select * from raj45;

-- Save Changes
commit;

-- Rollback will not work after commit
rollback;

select * from raj45;


-- =========================
-- SAVEPOINT Example
-- =========================

start transaction;

insert into raj45 values (456), (869), (236), (400);

select * from raj45;

-- Create Savepoint
savepoint raj45_savepoint_ins;

-- Update Data
update raj45
set id = 1000;

-- Rollback to Savepoint
rollback to raj45_savepoint_ins;

-- Check Data
select * from raj45;

-- Final Commit
commit;


-- Create Another Table
create table tr(
    id int
);