create database sqltask14
use sqltask14

--create hoppies table
create table hobbies(hoppy_id int primary key,hoppy_name varchar(30) unique)

--insert values using stored procedure
create procedure inserthoppy
@hoppy_id int,@hoppy_name varchar(30)
as
begin
insert into hobbies(hoppy_id,hoppy_name)values(@hoppy_id,@hoppy_name)
end

--execute procedure
exec inserthoppy 1,'cricket'
exec inserthoppy 2,'singing'
exec inserthoppy 3,'chess'


--by using select statement we check values are added or not in our table
select * from hobbies order by hoppy_id

--insert duplicate records into the table and show the working of exception handling using Try/catch blocks.

--initially insert original values
begin try
exec inserthoppy 4,'reading'
end try
begin catch
print error_number()
print error_message()
print error_severity()
print error_state()
end catch
--insert dublicate values
begin try
exec inserthoppy 5,'reading'
end try
begin catch
print error_message()
print error_number()
print error_severity()
print getdate()
end catch

--store the error details in error backup table
create table error_backup (ErrorMsg varchar(max),ErrorId int ,ErrorSeverity int,GetDate date)
