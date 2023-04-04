create database sqltask16
use sqltask16

create table CGVAK(id int primary key,name varchar(30),position varchar(20))

insert into CGVAK values 
(1,'Arun','Developer'),
(2,'selva','Production'),
(3,'Divyaprakash','backend developer'),
(4,'Vignesh','backend developer'),
(5,'Harshan','UI-Designer'),
(6,'Karthikeyan','Project lead'),
(7,'Venkat','Designer')

select * from cgvak

--1.restrict dml operations on saturday and monday
alter trigger tdays 
on cgvak 
for insert,update,delete
as
begin
if DATEPART(DW,GETDATE())=7 and DATEPART(DW,GETDATE())=1
begin
print 'DML operations are restricted saturday and sunday'
rollback tran
end
end

insert into CGVAK values (8,'Arun','Developer')--it's now inserted it cant't inserted only saturday and sunday
update cgvak set name='Arun kumar' where id=1

---------------------------------------------------------------
--2.restrict dml operations between 11:00AM to 15:00PM.
alter trigger ttime
on cgvak
for insert,update,delete
as
begin
if DATEPART(HH,GETDATE())>11 and  DATEPART(HH,GETDATE())<15
begin
print 'DML operations are restrictedbetween 11:00AM to 15:00PM'
rollback tran
end
end

update cgvak set name='Arun kumar' where id=1
---------------------------------------------------------
--3.Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

create trigger ddlName
on database
for create_table,alter_table,drop_table,rename
as
begin
print 'DDL operations are restricted'
rollback tran
end

create table tb(age int)
alter table cgvak drop column  position
drop table cgvak
sp_rename 'cgvak','cg'

-------------------------------------------
--practice
alter trigger dht
on cgvak
for insert,update,delete
as
begin
if DATEPART(day,GETDATE())=4 
begin
print 'cant do dml operations on 4 th day in the month'
rollback tran
end
end
delete CGVAK where id=1
select * from cgvak
