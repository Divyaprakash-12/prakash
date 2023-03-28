create database sqltask10
use sqltask10

create table employees(EMPLOYEE_ID int primary key, FIRST_NAME varchar(20), LAST_NAME varchar(20),EMAIL varchar(30) not null unique,
PHONE_NUMBER int, HIRE_DATE date, JOB_ID int, SALARY int)

insert into employees values
(1,'Divyaprakash','B.M','prakashhari120@gmail.com',1234567890,'2023-01-21',1,50000),
(2,'vignesh','R','vignesh22@gmail.com',1234567891,'2023-01-21',1,50000),
(3,'venkat','raman','venkat34@gmail.com',1234567892,'2023-01-21',1,50000),
(4,'arun','joseph','arun001@gmail.com',1234567893,'2023-01-21',1,50000),
(5,'selva','ganabathy','selva66@gmail.com',1234567890,'2023-01-25',5,40000),
(6,'dhana','prakash','dhana10@gmail.com',1234567894,'2023-01-22',2,60000),
(7,'priya','dharshan','dharshan45@gmail.com',1234567895,'2023-01-22',2,60000),
(8,'srikanth','A','mysteryeditor@gmail.com',1234567896,'2023-01-22',2,60000),
(9,'harita','S','harita29@gmail.com',1234567897,'2023-01-22',2,60000),
(10,'ranita','S','ranita29@gmail.com',1234567898,'2023-01-25',5,40000),
(11,'harishmitha','K','harish16@gmail.com',1234567899,'2023-01-23',3,55000),
(12,'Yamini','priya','yami12@gmail.com',1234567810,'2023-01-23',3,55000),
(13,'karthikeyan','K','rockstar@gmail.com',1234527890,'2023-01-23',3,55000),
(14,'siva','bharath','kohlifan@gmail.com',1234563890,'2023-01-23',3,55000),
(15,'sharon','david','varromking@gmail.com',1234467890,'2023-01-25',5,40000),
(16,'hari','karthik','ttplayer@gmail.com',1234565890,'2023-01-24',4,45000),
(17,'vikram','R','master@gmail.com',1234567860,'2023-01-24',4,45000),
(18,'hemanth','B','jimboy@gmail.com',1234567790,'2023-01-24',4,45000),
(19,'Harshan','C','artist@gmail.com',1234567890,'2023-01-24',4,45000),
(20,'vasanth','G','hacker@gmail.com',1234567990,'2023-01-24',5,40000)

select * from employees

--1. find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

select first_name,last_name from employees where salary >(select salary from 
employees where EMPLOYEE_ID=16)

--2.  find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
select first_name,last_name,job_id from employees where HIRE_DATE=(select HIRE_DATE from employees
where EMPLOYEE_ID=11)

--3.find those employees who earn more than the average salary. Return employee ID, first name, last name.
select employee_id,first_name,last_name from (select avg(salary) as avgsalary from employees )as s, 
 employees as em where em.salary>s.avgsalary;

 --5.find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.
 select * from (select min(salary) as minsal from employees)as ms,employees as em
 where em.salary>2500 and em.salary<=ms.minsal;

 --4.find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
 select employee_id,first_name,last_name,salary from employees where job_id=
 (select JOB_ID from employees where first_name='yamini')