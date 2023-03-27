create database newsqltask8
use  newsqltask8

create table student(student_id int identity(1,1),student_name varchar(25),
semester varchar(8),securedmarks int,totalmarks int)

insert into student values
('arun','1 sem',450,500),
('ashwin','1 sem',440,500),
('boobathy','1 sem',430,500),
('divya','1 sem',426,500),
('moni','1 sem',465,500),
('kindhu','1 sem',470,500);

select * from student

--1. Create User-define Scalar function to calculate percentage of all students
CREATE FUNCTION  dbo.fn_percentage(@x int,@y int)
RETURNS FLOAT
AS
BEGIN
DECLARE @percentage FLOAT
SET @percentage=(@x*100.0)/@y
RETURN @percentage
END

select student_id,student_name,
semester,securedmarks,totalmarks,dbo.fn_percentage(securedmarks,totalmarks)
as percentage from student

--update
update student set semester='1 sem' where student_id=1 or student_id=6
update student set semester='2 sem' where student_id=2 or student_id=4
update student set semester='3 sem' where student_id=3 or student_id=5

--2.Create user-defined function to generate a table that contains result of Sem 3 students.
create function dbo.getsem3()
returns table
as
return select * from student where semester='3 sem'
--select
select * from dbo.getsem3()

--3.Write SQL stored procedure to retrieve all students details. (No parameters)
create procedure sp_getalldetails
as
begin
select * from student
end

exec sp_getalldetails

--4.Write SQL store procedure to display Sem 1 students details. (One parameter)
create procedure sp_sem3details(@sem varchar(8))
as
begin
select * from student where semester=@sem
end

exec sp_sem3details @sem='1 sem'

--5.Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create procedure sp_nstudents(@nstudents int output)
as
begin
select @nstudents= count(student_id) from student
end

declare @Total int

exec sp_nstudents @Total output

print ('The no:of students:'+convert(varchar(6),@Total))

select count(student_id ) as number_of_students from student

/*6.Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
Note: Update few values in students details so that you can see the working of UPDATE.*/

--create new source table
create table students(student_id int ,student_name varchar(25),
semester varchar(8),securedmarks int,totalmarks int)

insert into students values--insert values
(1,'arun','1 sem',450,500),
(2,'ashwin','1 sem',440,500),
(3,'boobathy','1 sem',430,500),
(4,'divya','1 sem',426,500),
(5,'moni','1 sem',465,500),
(6,'kindhu','1 sem',470,500);

--update source table
update students set semester='1 sem' where student_id=1 or student_id=6
update students set semester='2 sem' where student_id=2 or student_id=4
update students set semester='3 sem' where student_id=3 or student_id=5

select * from students

--auto create new s1table
select * into s1backup from students where semester='1 sem';

select * from s1backup--target table
select * from students--source table

--insert values in s1backup
insert into s1backup values(09,'hari','1 sem',470,500)

--update values in source table
update students set student_name='arun' where student_id=1
update students set securedmarks=470 where student_id=6

--merge statement
merge s1backup s1 using students s on (s1.student_id=s.student_id) 
when matched
then update set
s1.student_id=s.student_id,
s1.student_name=s.student_name,
s1.semester=s.semester,
s1.securedmarks=s.securedmarks,
s1.totalmarks=s.totalmarks
when not matched BY TARGET 
then insert (student_id,student_name,semester,securedmarks,totalmarks)
values(s.student_id,s.student_name,s.semester,s.securedmarks,s.totalmarks)
when not matched by source
then delete ;

select * from s1backup order by student_id
select * from students


