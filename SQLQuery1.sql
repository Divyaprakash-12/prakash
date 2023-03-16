--CREATING A DATABASE
create database sqltask1
use sqltask1
--CREATE TABLE
create table trainees(Trainee_ID INT PRIMARY KEY,
FIRST_NAME char(25),
LAST_NAME char(25),
SALARY int,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25))
--INSERT VALUES
insert into trainees values(10001,'hari','haran',95000,2023-01-26,'Designer')
--To view our table
select * from trainees
update trainees set JOINING_DATE='2023-01-23 10:30:00 AM' where Trainee_ID=10001
update trainees set SALARY='25000' where Trainee_ID=10010
--multiple insertion method
insert into trainees values
(10002,'Divya','prakash',100000,'2022-05-10 10:15:00 AM','Fullstack Developer'),
(10003,'hari','karthik',75000,'2023-01-22 10:20:00 AM','Designer'),
(10004,'Dhana','prakash',65000,'2023-01-26 10:25:00 AM','Java developer'),
(10005,'Priya','darshan',85000,'2023-01-20 10:35:00 AM',' Developer'),
(10006,'Yamini','priya',85000,'2023-01-28 10:45:00 AM','developer'),
(10007,'Madhumitha','joghee',100000,'2022-05-10 11:15:00 AM','Fullstack Developer'),
(10008,'Vignesh','R',25000,'2023-01-26 9:15:00 AM','Fresher'),
(10009,'Jaya','prakash',15000,'2023-01-26 11:30:00 AM','Fresher'),
(10010,'Babu','akash',265000,'2023-01-26 3:15:00 PM','Fresher'),
(10011,'Suba','darshan',35000,'2023-01-26 10:15:00 AM','Front-End Developer'),
(10012,'Rahul','gunabalan',45000,'2023-01-26 10:15:00 AM','Back-End Developer'),
(10013,'Suresh','R',21000,'2023-01-26 10:15:00 AM','Fresher'),
(10014,'Sathi','prakash',45000,'2023-01-26 11:50:00 AM','Front-End Developer'),
(10015,'Siva','bharath',55000,'2023-01-25 10:35:00 AM','Back-End Developer'),
(10016,'Venkat','raman',75000,'2023-01-24 10:25:00 AM','Ui Designer'),
(10017,'Sakthi','priya',23000,'2023-01-28 10:00:00 AM','Tester'),
(10018,'Nandhini','D',95000,'2023-01-27 10:15:00 AM','HR'),
(10019,'Krithika','Devi',150000,'2023-01-26 10:15:00 AM','Assistant Manager'),
(10020,'Maha','lakshmi',10000000,'2023-01-26 10:15:00 AM','CEO')
--like
select * from trainees where FIRST_NAME like '[J-T]%'
--between
SELECT * FROM trainees WHERE SALARY BETWEEN 20000 AND 50000
--like (name end with i)
select * from trainees where FIRST_NAME like '%i'
--distinct
select distinct SALARY from trainees
--where
select * from trainees where DEPARTMENT='Designer' or DEPARTMENT='Developer'
--where
select * from trainees where Trainee_ID<10005
--Limiting rows(offset and fetch)
select * from trainees order by FIRST_NAME OFFSET 5 rows  FETCH NEXT 10 rows only
--Limiting rows(select top)
select top 5 with ties  FIRST_NAME,LAST_NAME,SALARY from trainees order by SALARY desc
--Sorting(order by)
select * from trainees order by DEPARTMENT desc
--like(last name 3rd letter will be a)
select * from trainees where LAST_NAME like '__a%'
