create database sqltask14
use sqltask14

--(a)create hoppies table
create table hobbies(hoppy_id int primary key,hoppy_name varchar(30) unique)

--1.insert values using stored procedure
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

--2.insert duplicate records into the table and show the working of exception handling using Try/catch blocks.

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
print error_state()
print error_line()

end catch
--3.store the error details in error backup table
create table error_backup (ErrorId int identity(1,1),ErrorMsg varchar(max),ErrorNumber int ,ErrorSeverity int,
ErrorState int,ErrorLine int)

begin try
exec inserthoppy 6,'chess'
end try
begin catch
print error_message()
print error_number()
print error_severity()
print error_state()
print error_line()
insert into error_backup(ErrorMsg,ErrorNumber,ErrorSeverity,ErrorState,ErrorLine)
values( error_message(),
 error_number(),
 error_severity(),
 error_state(),
 error_line())
 end catch

 select * from error_backup

 --------------------------------------------------------------------

/*(b).Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR
to show the working of exception handling.*/

alter procedure product (@num1 int,@num2 int)
as
begin
declare @value int
set @value=0
begin try
if @num1<>@num2
raiserror('different numbers cannot be multiplied',16,1)with log
set @value=@num1*@num2
print 'product of two numbers value is: '+ cast(@value as varchar)
end try
begin catch
    print 'Error number :' + cast(ERROR_NUMBER()as varchar)
    print  'Error message :' + cast(ERROR_MESSAGE()as varchar(max))
    print  'Error severity :' + cast(ERROR_SEVERITY()as varchar)
    print  'Error state :' + cast(ERROR_STATE()as varchar)
	print  'Error line :' + cast(ERROR_LINE()as varchar)
	print 'Error procedureName :' + cast(ERROR_PROCEDURE()as varchar)
end catch
end

exec product 5,5

exec product 5,6

--------------------------------------------------------------

/*(c). Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
    Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.*/

create table friends(id int identity(1,1),name varchar(30) unique)

--insert values using procedure
create procedure pro_friends(@name varchar(30))
as
begin
if(@name like '[ADHKPRSTVY]%')
begin
insert into friends(name)values(@name)
end
else begin
throw 50005,'Error! Restricted Name',1
end
end

select * from friends

exec  pro_friends divyaprakash
exec  pro_friends Ananth
exec  pro_friends madhan



