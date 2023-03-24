create database sqltask8
use sqltask8
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

