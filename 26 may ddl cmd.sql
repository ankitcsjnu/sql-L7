-- current databases dekhne ke liye
SHOW DATABASES;

-- database select/use karne ke liye
USE datatypedb;

-- =========================================================
-- DDL COMMANDS
-- =========================================================

-- CREATE TABLE
-- nayi table create karne ke liye
CREATE TABLE test10 (
    id INT,
    name VARCHAR(20)
);

-- data insert karna
INSERT INTO test10
VALUES
(1, 'abhi'),
(2, 'shimi'),
(3, 'yash');   -- duplicate id avoid kiya

-- table ka data dekhne ke liye
SELECT * FROM test10;

-- =========================================================
-- TRUNCATE
-- table ka sirf data delete hota hai
-- structure same rehta hai
-- internally table recreate hoti hai
-- =========================================================

TRUNCATE TABLE test10;

SELECT * FROM test10;

-- =========================================================
-- DROP
-- pura table delete ho jata hai
-- structure + data dono remove
-- =========================================================

DROP TABLE test10;

-- =========================================================
-- dobara table create kar rahe hain
-- kyunki drop ke baad table exist nahi karti
-- =========================================================

CREATE TABLE test10 (
    id INT,
    name VARCHAR(20)
);

-- =========================================================
-- ALTER TABLE
-- existing table me changes karne ke liye
-- =========================================================

-- new column add karna
ALTER TABLE test10
ADD COLUMN salary INT;

-- default value ke sath column add karna
ALTER TABLE test10
ADD COLUMN age INT DEFAULT 18;

-- column delete karna
ALTER TABLE test10
DROP COLUMN salary;

-- column rename karna
ALTER TABLE test10
RENAME COLUMN age TO newage;

-- primary key add karna
ALTER TABLE test10
ADD CONSTRAINT pk_test10 PRIMARY KEY(id);

-- table structure dekhne ke liye
DESC test10;

-- =========================================================
-- QUESTION 1
-- name column se pehle column add karna
-- MySQL me FIRST/AFTER use hota hai
-- =========================================================

ALTER TABLE test10
ADD COLUMN gender VARCHAR(10) BEFORE name;

-- =========================================================
-- QUESTION 2
-- name column ka datatype integer me change karna
-- =========================================================

ALTER TABLE test10
MODIFY COLUMN name INT;

-- agar wapas varchar karna ho
ALTER TABLE test10
MODIFY COLUMN name VARCHAR(20);

-- =========================================================
-- QUESTION 3
-- NOT NULL constraint add karna
-- =========================================================

ALTER TABLE test10
MODIFY COLUMN name VARCHAR(20) NOT NULL;

ALTER TABLE test10
MODIFY COLUMN newage INT NOT NULL;

-- =========================================================
-- QUESTION 4
-- foreign key add karna
-- =========================================================

-- parent table create
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30)
);

-- child table me column add
ALTER TABLE test10
ADD COLUMN department_id INT;

-- foreign key constraint add
ALTER TABLE test10
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES department(department_id);

-- =========================================================
-- current database check karna
-- =========================================================

SELECT DATABASE();

-- sakila database ki actor table ka data dekhna
SELECT * FROM sakila.actor;

-- =========================================================
-- CTAS -> CREATE TABLE AS SELECT
-- existing table se new table create karna
-- =========================================================

CREATE TABLE ankit123 AS
SELECT actor_id, first_name
FROM sakila.actor;

-- new table ka data check karna
SELECT * FROM ankit123;

-- DML -> INSERT
INSERT INTO ankit123
VALUES (199, 'india');

-- =========================================================
-- SAFE MODE OFF
-- update/delete bina where ke allow karne ke liye
-- =========================================================

SET SQL_SAFE_UPDATES = 0;

-- pura column update ho jayega
UPDATE ankit123
SET first_name = 'sunny';

-- specific row update karna
UPDATE ankit123
SET first_name = 'sunny'
WHERE actor_id = 2;