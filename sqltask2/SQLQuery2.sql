--create database
create database sqltask2 
--change database
use sqltask2
--create schema
create schema schema1
--create table
create table schema1.task2(id int primary key,Name varchar(20) unique,Salary int check(Salary>15000),
Increment int default 2000,Revised_salary int)
--view our file
select * from schema1.task2

alter table schema1.task2 drop column Revised_salary

insert into schema1.task2 values (1,'Prakash',16000,1000)

insert into schema1.task2(id,Salary,Increment) values (2,16500,1000)

insert into schema1.task2(id,Name,Salary) values (3,'Hari',16500)

create schema schema2

alter schema schema2 transfer schema1.task2

select * from schema1.task2

exec sp_rename 'schema1.task2' ,'schema2.newtask2'

select * from [schema1].[schema2.newtask2]
--change file name
exec sp_rename '[schema1].[schema2.newtask2]' ,'newtask2'

select * from schema1.newtask2
--change schema name
create schema schema3

alter schema schema3 transfer schema1.newtask2

select * from schema3.newtask2

--change new empty database name
exec sp_renamedb 'sqltask2 ','newsqltask2 '
 create database darshandb
 use darshandb
 exec sp_renamedb 'darshandb ','prakashdb '

 use sqltask2

 create table G2(id int identity(1,1),name varchar(15),salary int,increment int)
 select * from G2
 --Multiple insertion
 insert into G2 values
 ('Arun',15000,2000),
 ('Prakash',18000,3000),
 ('Dhana',17000,2500),
 ('Vignesh',25000,4000),
 ('Karthi',35000,5000),
 ('Darshan',45000,7000)
 alter table G2 add revised_salary as (salary+''+increment)
 --Transfer to new table
 select *into NewG2 from G2 where salary>20000
 select * from NewG2