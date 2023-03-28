create database sqltask11
use sqltask11
--1.
create table students(stu_id int primary key,stu_name varchar(30),dept varchar(20),year_of_completion int)

insert into students values
(1,'hari','Bsc-it',2023),
(2,'prasanth','Bsc-cs',2024),
(3,'vikram','Bca',2022),
(4,'vasanth','Bca',2022),
(5,'prakash','Bsc-it',2023),
(6,'selva','Bsc-cs',2024),
(7,'madhu','Bsc-it',2022),
(8,'sakthi','Bsc-it',2023),
(9,'deepak','Bsc-cs',2024),
(10,'ram','Bca',2023),
(11,'ranita','Bsc-it',2023),
(12,'seetha','Bsc-it',2024),
(13,'vignesh','Bsc-it',2022),
(14,'darshan','Bca',2023),
(15,'balaji','Bca',2024),
(16,'vijay','Bsc-it',2022),
(17,'ajith','Bsc-it',2023),
(18,'dhanush','Bsc-cs',2024),
(19,'siva','Bca',2022),
(20,'bharath','Bsc-cs',2023);

select * from students

--pivot based on year
select dept,[2022],[2023],[2024] from (select stu_id,dept,year_of_completion from students) as s pivot
(count(stu_id)for [year_of_completion] in([2022],[2023],[2024])) as p

--unpivot
select dept,year_of_completion,stu_count from(select dept,[2022],[2023],[2024] from
(select stu_id,dept,year_of_completion from students)as t1
pivot(count(stu_id) for [year_of_completion] in ([2022],[2023],[2024]))as pivot1)P
unpivot
(stu_count for [year_of_completion] in ([2022],[2023],[2024])) as up

--------------------------------------------------------------------------------------------

--2.
create table book(
book_id int primary key,book_name varchar(40),author_name varchar(20),release_date date)

insert into book values
(101,'wings of fire','vignesh','2000-04-12')
insert into book values
(102,'Time management','prakash','1950-07-22'),
(103,'python','Guido rossum','1980-01-1'),
(104,'c++','Bjarne Stroustrup','1979-08-18'),
(105,'Autobiograohy of abdhul kalam','abdul kalam','2002-06-14')

select * from book

create table dept(
dept_id int primary key,dept_name varchar(25))

insert into dept values
(201,'BSC-IT'),
(202,'BSC-CS'),
(203,'BCA'),
(204,'BSC-COGNITIVE SYSTEM'),
(205,'BCOM'),
(206,'BCOM-PA'),
(207,'BA-ENGLISH'),
(208,'BA-TAMIL');

select * from dept
select * from book
select * from student

create table student
(student_id int primary key,student_name varchar(30))

insert into student values
(1,'hari'),
(2,'prakash'),
(3,'vikram'),
(4,'srikanth'),
(5,'karthi'),
(6,'siva'),
(7,'bharath'),
(8,'bhavan')

create table library(stu_id int references student(student_id),dept_id int references dept(dept_id),
book_id int references book(book_id),borrow_date date)

insert into library values
(1,201,101,'2023-03-21'),
(2,202,102,'2023-03-18'),
(3,203,103,'2023-03-24'),
(4,204,104,'2023-03-27'),
(5,205,105,'2023-03-28'),
(6,206,101,'2023-03-15'),
(7,207,102,'2023-03-17'),
(8,208,103,'2023-03-22'),
(5,205,104,'2023-03-19'),
(4,204,103,'2023-03-06'),
(3,203,102,'2023-03-20'),
(2,202,101,'2023-03-22'),
(1,201,105,'2023-03-18'),
(6,206,104,'2023-03-21'),
(7,207,103,'2023-03-28'),
(8,208,102,'2023-03-25')

select * from library