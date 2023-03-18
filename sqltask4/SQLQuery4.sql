create database TRAINEES
USE TRAINEES
--create a table worker
create table worker(WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)
select * from worker

--insert values into worker table
INSERT INTO Worker VALUES
(002, 'Niharika', 'Verma', 80000, '2000-02-02', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2000-02-02', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2000-02-02', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2000-02-02', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin')

INSERT INTO Worker VALUES(001, 'Hari', 'prakash', 90000, '2000-01-01', 'Admin')
--create table Bonus
CREATE TABLE Bonus (
WORKER_REF_ID INT FOREIGN KEY (WORKER_REF_ID)REFERENCES Worker(WORKER_ID) ON DELETE CASCADE,
BONUS_AMOUNT INT, BONUS_DATE DATETIME)

select *from Bonus
--insert values into bonus table
INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001,	5000,	'2016-02-02'),
(002,	3000,	'2016-06-01'),
(003,	4000,	'2016-02-02'),
(001,	4500,	'2016-02-02'),
(002,	3500,	'2016-06-01')

--create table title
CREATE TABLE Title (
WORKER_REF_ID INT, WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME, FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);
--insert values into title table
INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

select *from title
--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as worker_name from worker
select * from worker
--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(FIRST_NAME) from worker
--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct
DEPARTMENT from worker
--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT LEFT(FIRST_NAME, 3) FROM worker;
select substring(FIRST_NAME, 1,3)FROM worker;
--Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct department, len(DEPARTMENT) as length from worker
--Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name,last_name)as complete_name from worker
--Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name='vipul'or first_name='satish'
--Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department='Admin'
--Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like ('%a')
--Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like ('%a%')



