create database sqltask7
use sqltask7
--(a)create table
create table student(student_id int primary key,student_name varchar(25),
department varchar(20),score int);
--insert values
insert into student values
(101,'arun','Bsc-cs',89),
(102,'babu','Bsc-it',95),
(103,'akash','Bca',70),
(104,'selva','Bsc-it',67),
(105,'karthi','Bsc-cs',89),
(106,'venkat','Bca',92),
(107,'dhana','Bsc-it',79),
(108,'prakash','Bsc-it',84),
(109,'vijay','Bsc-cs',80),
(110,'ajith','Bsc-cs',65),
(111,'keerthana','Bca',72),
(112,'madhu','Bsc-it',97),
(113,'darshan','Bsc-cs',90),
(114,'hemanth','Bca',60),
(115,'siva','Bca',69),
(116,'bharath','Bsc-cs',70),
(117,'surya','Bsc-cs',79),
(118,'dev','Bca',81),
(119,'androose','Bca',83),
(120,'srikanth','Bsc-it',84),
(121,'suba','Bca',69),
(122,'vignesh','Bsc-it',79),
(123,'sathish','Bsc-it',99),
(124,'hariharan','Bsc-cs',85),
(125,'harikrishnan','Bca',90);

select *from student
--1.create noncluster index for department
create index dept on student(department asc)

--2.Create a filtered index for department='BCA'
create nonclustered index BCA on student(department) where department='BCA'

--viewing of creating index in database
exec sp_helpindex student

--3.Create a view for students in BCA department.
create view BCA_studs as select * from Student where department = 'BCA'
select * from BCA_studs

--4.Apply Rank() for all the students based on score.
select student_id,student_name,department,score,rank() over(order by score desc)as rank_no from student


--5.Apply Dense_Rank() for students in each department based on score.
select student_id,student_name,department,score,dense_rank() over(partition by department order BY score desc)as rank_no from student

--(b)create manager table
create table manager(m_id int primary key,m_name varchar(20))

--insert values
insert into manager values(1,'hari'),(2,'prakash'),(3,'vasanth'),(4,'vikram')
--view manager table
select * from manager

--create employee table
create table employee(emp_id int primary key,emp_name varchar(25),m_id int references  manager(m_id),
department varchar(20))
--insert values
insert into employee values(1,'madhu',1,'HR'),(2,'divyaprakash',2,'manager'),
(3,'ajay',3,'Hacker'),(4,'rahul',4,'developer')
insert into employee values
(5,'vignesh',3,'tester'),(6,'krish',4,'developer'),
(7,'sunil',2,'HR'),(8,'suresh',1,'designer')

--view employee table
select * from employee

--(b)1.Create a complex view by retrieving the records from Manager and Employee table.
create view em as select e.emp_id,e.emp_name,e.department,m.m_id,m.m_name 
from employee as e full join manager as m on m.m_id=e.m_id;
--select
select * from em

--(b)2. Show the working of 'on delete cascade on update set default' for the above tables
alter table employee drop constraint [FK__employee__m_id__5165187F]
--drop column
alter table employee drop column  m_id 
--add new column and specify foreign key
alter table employee add  m_id int default 3 constraint fk_emp_manager_id 
foreign key(m_id) references manager(m_id) on delete cascade on update  set default
--update values
update employee set m_id=1 where emp_id=1 or emp_id=8
update employee set m_id=2 where emp_id=2 or emp_id=7
update employee set m_id=3 where emp_id=3 or emp_id=6
update employee set m_id=4 where emp_id=4 or emp_id=5

--update values in manager table
update manager set m_id=11 where m_id=1
--select
select * from employee
