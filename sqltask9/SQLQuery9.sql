select * from students
--create procedure
create procedure stu_procedure(@s_id int)
as
begin
if(@s_id>0)
begin
if(@s_id>5 and @s_id<9)
select * from students where student_id>5
else if(@s_id<5)
select * from students where student_id<5
else
print'record no found';
end
end
--execute procedure
exec stu_procedure 9
------------------------------------------------
select * from students
create procedure remarks(@id int,@marks int)
as
begin 
update students set
securedmarks=@marks
where student_id=@id
end

exec remarks 3,440
------------------------------------------
select * from students
--create temporary table(local) using select into command
select student_id,student_name,semester,securedmarks,totalmarks 
into #stu
from students
where securedmarks>460

select * from #stu
----------------------------------------
select * from students
--create temporary table(global) using create table command
create table ##stud(studentID int,Name varchar(20),marks int)
--insert into select
insert into ##stud select student_id,student_name,securedmarks from students where semester='2 sem'

select * from ##stud
-----------------------------------------
--create temporary proedure(local)
create procedure #local
as
begin
print 'local procedure'
end

exec #local
--------------------------------------------
--create temporary proedure(global)
create procedure ##global
as
begin
print 'global procedure'
end

exec ##global
---------------------------------------------
--temporary variables(local)
declare @var varchar(10)
set @var='hari'
print @var
----------------------------------------------
--temporary variables(global)
declare @@var1 varchar(10)
set @@var1='prakash'
print @@var1

