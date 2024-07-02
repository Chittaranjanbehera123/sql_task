show databases;
show schemas;

-- CREATING DATABASES
create database chittadb;
show databases;
use chittadb;

-- CREATING TABLE
CREATE TABLE EMPLOYEE(
EmpID INT,
FirstName   varchar(255),
LastName    varchar(255),
EmpAge INT,
EmpZone     varchar(255)
);

-- renaming table
-- rename employee table name to authentication
-- desc employee;
-- alter table employee rename authentication;
-- desc authentication;

-- To show the structure of table
DESC EMPLOYEE;
DESCRIBE EMPLOYEE;

-- INSERT INTO VALUES IN TABLE
INSERT INTO EMPLOYEE(EmpID,FirstName,LastName,EmpAge,EmpZone)VALUES(1,'Chintu','Behera',24,'North');
INSERT INTO EMPLOYEE(EmpID,FirstName,LastName,EmpAge,EmpZone)VALUES(2,'Jamuna','Mishara',27,'South');
INSERT INTO EMPLOYEE(EmpID,FirstName,LastName,EmpAge,EmpZone)VALUES(3,'Sunakar','Das',31,'West');
INSERT INTO EMPLOYEE(EmpID,FirstName,LastName,EmpAge,EmpZone)VALUES(4,'Ashok','Senapati',56,'East');
-- to show tables column values i.e rows(DQL)
select * from employee;

-- truncate table employee;
-- drop database chintudb;

-- SELECT STATEMENT
select EmpID from employee;
select EmpID,FirstName,LastName from employee;
select EmpID,FirstName,LastName,EmpAge from employee;
select EmpID,FirstName,LastName,EmpAge,EmpZone from employee;

-- What is Not Null Constraint
-- Ans: The NOT NULL constraint enforces a column to not accept NULL values, which means that you cannot insert or update a record without 
-- adding a value to this field
-- The following SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL Values:

-- NOT NULL CONSTRAINT
-- CREATE TABLE EMPLOYEE{
-- EmpID int not NULL,
-- FirstName varchar(255),
-- LastName  varchar(255),
-- EmpAge int,
-- EmpZone   varchar(255)
-- ); 

alter table employee
modify column EmpID float not null; 
DESC EMPLOYEE;

-- What is Unique Constraint?
-- Ans: The Unique constraint ensures that all values in a column are different
-- Both the UNIQUE and PRIMARY KEY constraint provide a gaurantee for uniqueness for a column or set of columns
-- A PRIMARY KEY constraint automatically has a UNIQUE constraint

-- UNIQUE CONSTRAINT 
-- CREATE TABLE EMPLOYEE(
-- EmpID int NOT NULL,
-- FirstName varchar(255),
-- LastName  varchar(255),
-- EmpAge  int,
-- EmpZone   varchar(255),
-- UNIQUE(EmpID)
-- );

alter table employee
add Primary key(EmpID);
DESC EMPLOYEE;

-- What is Check Constraint
-- Ans: The CHECK constraint is used to limit the value range that can be placed in a column
-- If you define a CHECK constraint on a column it will allow only certain values for this column

-- CHECK CONSTRAINT
-- CREATE TABLE EMPLOYEE(
-- EmpID int NOT NULL,
-- FirstName  varchar(255),
-- LastName   varchar(255),
-- EmpAge  int,
-- EmpZone  varchar(255),
-- CHECK(EmpAge>20)
-- ); 

alter table employee
modify column EmpAge INT CHECK(EmpAge>20);

-- What is the Default Constraint?
-- Ans: The Default constraint used to Check the default value

-- DEFAULT CONSTRAINT
-- CREATE TABLE EMPLOYEE(
-- EmpID int NOT NULL,
-- FirstName varchar(255),
-- LastName  varchar(255),
-- EmpAge int,
-- EmpZone   varchar(255) DEFAULT 'OPERATION'
-- );

alter table employee
alter column EmpZone SET DEFAULT 'OPERATION';
DESC EMPLOYEE;
select * from employee;

-- MYSQL INDEX CONSTRAINT
CREATE INDEX DEMOINDEX
ON EMPLOYEE (FirstName);
select * from employee;
CREATE INDEX DEMOINDEX2
ON EMPLOYEE(FirstName,LastName,EmpZone);
SHOW INDEXES FROM EMPLOYEE; 

# To remove unique key from table 
SHOW INDEX FROM employee;
ALTER TABLE employee DROP INDEX EmpID;
ALTER TABLE employee DROP FOREIGN KEY EmpID;

-- alter table in my Sql
alter table employee
add column EmpDept varchar(255);
DESC EMPLOYEE;

-- DROP Column in my sql
alter table employee
drop column EmpDept;

-- ALTER TABLE AND ADD NEW COLUMN
-- ADD A NEW COLUMN IN EXISTING TABLE
alter table employee
add column EmpDept varchar(255);
DESC EMPLOYEE;

-- alter table and drop column
alter table employee
drop column EmpDept;
DESC EMPLOYEE; 

-- Alter table and modify column
alter table employee
add column EmpDept varchar(255);
DESC EMPLOYEE;

-- renaming column
-- rename qualification column to education
alter table EMPLOYEE change column
EmpDept EmployeeDept varchar(255);  
DESC EMPLOYEE;

-- Alter table Employee change EmployeeDept varchar to int
alter table employee
modify column EmployeeDept int;
DESC EMPLOYEE;
select * from employee;

-- What is where clause in sql
-- Ans: The 'WHERE' Clause is used to filter records. Where clause is not only used in SELECT statements, it is also used in
-- SELECT statements, it is also used in UPDATE,DELETE, etc!

-- Mysql Where clause
SELECT * FROM EMPLOYEE
WHERE EmpAge=31;

SELECT * FROM EMPLOYEE
WHERE EmpAge<31;

-- Operators
-- 1) Arithmetic   +,-,*,/,%
-- 2) Relational or cnditional >,>=,<,<=,=,<>(not equal to),!=(not equal to)
-- 3) Logical -  and,or,not(!=)
-- 4) Range Operator - between
-- 5) list Operator (in,not in)
-- 6) like Operator - like (__%)
-- 7) is null and is not null

-- What is AND Operator
-- Ans: The AND Operator display a record if all the conditions are TRUE is calles AND Operator
-- AND OPERATOR IN MYSQL 
SELECT * FROM EMPLOYEE
WHERE EmpAge=24 AND EmpZone='North';
select * from employee;

SELECT * FROM EMPLOYEE
WHERE EmpAge=31 AND EmpZone='West' AND LastName='Das';
select * from employee;

-- What is OR Operator
-- Ans: The OR operator display a record if any of the conditions are TRUE 
-- OR OPERATOR
SELECT * FROM EMPLOYEE
WHERE EmpZone='East' OR EmpZone='West';
select * from employee; 

SELECT * FROM EMPLOYEE
WHERE FirstName='Sunakar' OR LastName='Mishra';
select * from employee;

-- What is NOT Operator in Mysql
-- Ans: The NOT operator is used in combination with other operators to give the opposite result, also called 
-- the negative result.
-- OR OPERATOR IN MYSQL
SELECT * FROM EMPLOYEE
WHERE NOT EmpAge=24;
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE
WHERE NOT FirstName='Chintu';
select * from employee;

-- IN OPERATOR IN MY SQL
SELECT * FROM EMPLOYEE
WHERE EmpZone IN('North','South');
SELECT * FROM EMPLOYEE
WHERE EmpZone NOT IN('North','South');

-- Comments-single line Comments Multiple Comments Mysql 
SELECT * FROM EMPLOYEE; #Fetch all records from table
SELECT*
/*
/*Retrive all records from
/* table employee. we are using SELECT
/* Statements
*/
FROM EMPLOYEE;

-- What is Count Function
-- Ans: The Count function returns the number of rows that matches a specified criterion.
-- Count function Mysql
SELECT COUNT(EmpAge) FROM EMPLOYEE
WHERE EmpAge=24;
SELECT COUNT(*)
FROM EMPLOYEE; 

-- What is Avg() Function in Mysql
-- Ans: The AVG() Function returns the average value of a numeric column.
SELECT * FROM EMPLOYEE;
SELECT AVG(EmpAge)
FROM EMPLOYEE;

-- What is SUM Function in My SQL.
-- Ans: The SUM() function returns the total sum of a numeric column
SELECT SUM(EmpAge)
FROM EMPLOYEE; 

-- MAX() Function in my sql
SELECT MAX(EmpAge) AS LargestAge
From Employee;

-- MIN() Function in my sql
SELECT MIN(EmpAge) AS SamllestAge
FROM EMPLOYEE;

-- What is Alias in Mysql
-- Ans: SQL aliases are used to give a table, or a column in a table,a temporary name.
-- An alias is created with the AS Keyword.
-- Alias in Mysql
SELECT * FROM EMPLOYEE;
SELECT EmpAge AS AGE_OF_EMPLOYEES
FROM EMPLOYEE;

SELECT FirstName as NameA,LastName as NameB
FROM EMPLOYEE;
SELECT * FROM EMPLOYEE;


-- LIKE OPERATOR 
-- search for specified patterns two wildcards
-- % Zero, one or more characters
SELECT * FROM EMPLOYEE
WHERE FirstName Like '%s';

SELECT * FROM EMPLOYEE
WHERE LastName Like 'b%';

SELECT * FROM EMPLOYEE
WHERE EmpZone Like '%h';

SELECT * FROM EMPLOYEE
WHERE EmpZone Like '%t';

-- BETWEEN OPERATOR
-- What is Between Operator?
-- Ans: The BETWEEN Operator selects values within a given range. The Values can be numbers,text,or dates
-- The BETWEEN operator is inclusive: begin and end values are included.
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE
WHERE EmpAge BETWEEN 24 AND 27;

SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE
WHERE EmpAge NOT BETWEEN 24 AND 27;

-- UPDATE STATEMENT EMPLOYEE
UPDATE EMPLOYEE
SET EmpAge = 57
WHERE EmpID = 4;
SELECT * FROM EMPLOYEE;
UPDATE EMPLOYEE
SET EmpAge = 25
WHERE EmpID = 1;

-- case Statement in Mysql
SELECT * FROM EMPLOYEE; 
DESCRIBE EMPLOYEE;
SELECT FirstName,LastName,EmpAge,EmpZone,EmployeeDept,
case
WHEN EmpAge>25 THEN 'Employee with experience. English for fr.Profile'
WHEN EmpAge=24 THEN 'Employee is mid-experienced level.Elgible'
ELSE 'Freshers...new to the company'
END AS Eligibility
FROM EMPLOYEE;

-- MySQL DELETE Statement
DELETE FROM EMPLOYEE
WHERE EmpZone = 'South';
DELETE FROM EMPLOYEE;

-- MySQL LIMIT Clause
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE
WHERE FirstName = 'Jamuna' LIMIT 3;

-- What is Joins
-- Ans: A join is a query that combines records of two or More tables together based on acommon column
-- A Join is Performed whenever multiple tables appear within the Form clause of the query
-- The select list of the query can select any columns from any of these tables.
-- Join is used with SELECT, UPDATE, and DELETE Statements.

-- 1.INNER JOIN 
-- An inner join is Performed on two or more tables based Join condition.
-- It returns all those rows that have matching values in both the tables based on the join condition
CREATE TABLE EMPLOYEE1(
EmpID INT NOT NULL,
DeptID     varchar(255),
EmpAddress varchar(255),
UNIQUE(EmpID)
);
DESC EMPLOYEE1;
INSERT INTO EMPLOYEE1(EmpID,DeptID,EmpAddress)VALUES(100,2,'Bangolore');
INSERT INTO EMPLOYEE1(EmpID,DeptID,EmpAddress)VALUES(101,4,'Delhi');
INSERT INTO EMPLOYEE1(EmpID,DeptID,EmpAddress)VALUES(102,3,'Mumbai');
select * from employee1;

CREATE TABLE DEPARTMENT(
DeptID INT NOT NULL,
DeptAddress  varchar(255),
DeptZone     varchar(255),
UNIQUE(DeptID)
);
DESC DEPARTMENT;
INSERT INTO DEPARTMENT(DeptID,DeptAddress,DeptZone)VALUES(1,'Gujurat','North');
INSERT INTO DEPARTMENT(DeptID,DeptAddress,DeptZone)VALUES(2,'Delhi','South');
INSERT INTO DEPARTMENT(DeptID,DeptAddress,DeptZone)VALUES(3,'Bangolore','East');
DESC DEPARTMENT;
SELECT * FROM DEPARTMENT;

-- Q.S-1 Solve INNER JOIN
SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM EMPLOYEE1
INNER JOIN DEPARTMENT ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID;

-- FULL OUTER JOIN: An outer join returns all rows that satisfy the join condition and also returns some or all of those 
-- rows form one table for which no rows  from the other table satisfy the join condition such rows are not satisfy by a simple join
-- LEFT JOIN IN MYSQL
-- What is Left Join
-- Ans: Left Join returns all rows from left table and matching records from the right table. 
-- It gives the matching are in left table but not in right table
SELECT * FROM EMPLOYEE1;
SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM DEPARTMENT
LEFT JOIN EMPLOYEE1 ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID;

SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM EMPLOYEE1
LEFT JOIN DEPARTMENT ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID;

UPDATE EMPLOYEE1
SET DeptID = 2
where EmpID=102;
SELECT * FROM EMPLOYEE1;

SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM EMPLOYEE1
LEFT OUTER JOIN DEPARTMENT ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID;

-- RIGHT OUTER JOIN:
-- Ans: This Join returns all the rows from the right table and matching rows from the left table
-- It gives the matching rows and the rows which are in right table but not in left table

UPDATE EMPLOYEE1
SET DeptID = 3
where EmpID=102;
SELECT * FROM EMPLOYEE1;

SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM EMPLOYEE1
RIGHT OUTER JOIN DEPARTMENT ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID;

-- NATURAL JOIN
-- JOIN = CROSSPRODUCT + CONDITION
-- Find the EmpID,EmpAddress,DeptID, who is working in a departments?
SELECT EmpID,EmpAddress,DEPARTMENT.DeptID From EMPLOYEE1,DEPARTMENT WHERE EMPLOYEE1.DeptID = DEPARTMENT.DeptID;
select * from employee1;
select * from department;

-- Equi JOIN
-- Find the EmpID,EmpAddress,DeptID is working in a departments having EmpAddress same as their DeptAddress?
-- JOIN = CROSSPRODUCT + CONDITION
UPDATE DEPARTMENT
SET DeptID = 4
where DeptZone='South';
SELECT * FROM DEPARTMENT;
SELECT EmpAddress,DeptAddress From EMPLOYEE1,DEPARTMENT 
WHERE EMPLOYEE1.DeptID = DEPARTMENT.DeptID AND EMPLOYEE1.EmpAddress=DEPARTMENT.DeptAddress; 

-- On Clause: The ON clause is used to join tables where the column names don't match in both tables The join conditions  are removed from the filter conditions 
-- in the WHERE clause. In other words the ON clause is similar to the WHERE clause In other words, the ON clause is similar 
-- to the WHERE clause as you can put multiple conditions in the ON clause.

-- FULL OUTER JOIN
SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM DEPARTMENT
LEFT JOIN EMPLOYEE1 ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID 
UNION
SELECT EMPLOYEE1.EmpID,DEPARTMENT.DeptAddress,DeptZone
FROM EMPLOYEE1
RIGHT OUTER JOIN DEPARTMENT ON EMPLOYEE1.DeptID = DEPARTMENT.DeptID;

-- COMPLETE DATABASE BASICS TO JOINS CHAPTER