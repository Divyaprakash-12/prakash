create database sqltask4

use sqltask4

CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

select * from Trainees
--1.Write an SQL query to get the count of employees in each department.

SELECT DEPARTMENT,  COUNT(*) AS EMPLOYEE_COUNT
FROM Trainees
GROUP BY DEPARTMENT;

--2.Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
select TRAINEE_ID, JOINING_DATE,dateadd(day,5,JOINING_DATE) as 'Induction Program Day' from trainees

--3.Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
select CHOOSE(MONTH(joining_date),'january','february','march','april')as month from Trainees

--4.Write an SQL query to perform the total and subtotal of salary in each department.
select coalesce(department,'all departments') as Department_Salary,sum(salary) as salary from trainees group by rollup (department)

--5.Write an SQL query to retrieve first 3 records randomly.
select top 3 * from Trainees order by TRAINEE_ID 

--6.Show the working of composite key with any example.
create table car
(car_id int,
car_name varchar(20),
amount int,
constraint pk_car_id primary key(car_id),
constraint uk_car_name unique(car_name))

select * from car

--7. Show the working of IIF and CASE for the above table.
select first_name, iif(salary>85000,'high level','middle level')as position from Trainees

--8. Show the working of Sequence.
create sequence seq1 as int
start with 0
increment by 2
minvalue 0
maxvalue 50
cycle;

insert into car  values(next value for seq1,'BMW',7500000)
insert into car  values(next value for seq1,'Thor',2500000)

select * from car

--9.Show the working of creation of Synonym for a table in DB1 from DB2.
--create new database db1
create database db1
use db1
--create table
create table trainees_details(trainee_id int identity(1,1),trainee_name varchar(20))
--ainsert values
insert into trainees_details values('hari'),('prakash')
select * from trainees_details
--create another database db2
create database db2
use db2
--create synonym for table in db1
create synonym b35 for db1.dbo.trainees_details
select * from b35

use sqltask4

--10.Show the working of IDENTITY_INSERT.
create table employee(emp_id int identity(1,1),
emp_name varchar(20),emp_designation varchar(25))

insert into employee values('arun','designer'),('babu','developer')
select *from employee
--set identity insert on
set identity_insert employee on
insert into employee(emp_id,emp_name,emp_designation) values(3,'chandhuru','HR'),(4,'dhana','tester')
--set identity insert off
set identity_insert employee off
insert into employee values('elengo','developer'),('faruk','designer')

