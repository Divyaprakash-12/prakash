select * from students

--implicit transaction
set implicit_transactions on
update students set year_of_completion=2022 where stu_id=1
select iif(@@OPTIONS &2=2,
'implicit transaction mode on',
'implicit transaction mode off')as 'transaction mode'
select @@TRANCOUNT as count_transaction
commit transaction
select @@TRANCOUNT as count_transaction
set implicit_transactions off

--explicit transaction

--without commit
/*select * from students
begin tran
update students set year_of_completion=2023 where stu_id=1
select @@TRANCOUNT as count_transaction
--with commit
select * from students
begin tran
update students set year_of_completion=2023 where stu_id=1
select @@TRANCOUNT as count_transaction
commit tran
select @@TRANCOUNT as count_transaction*/
-----------------------------------------------------------------
--only commit-insert statement
select * from students
begin tran
insert into students values(21,'murugan','Bsc-it',2022)
select @@TRANCOUNT as transaction_count
commit
select @@TRANCOUNT as transaction_count
select * from students
-----------------------------------------------------
--only rollback-update statement
begin tran
update students set stu_name='Bala murugan' where stu_id=21
select * from students where stu_id=21
rollback tran
select * from students where stu_id=21
---------------------------------
--savepoint
select * from students
begin tran
insert into students values(22,'venkatesh','Bsc-cs',2024)
update students set stu_name='siva bharath' where stu_id=19
save tran insertstatement
delete students where stu_id=10
select * from students
rollback tran insertstatement
commit tran 
select * from students
----------------------------------------------------
--auto rollback
begin tran
insert into students values(23,'sasi','Bsc-it',2024)
update students set stu_name='ajith kumar' where stu_id=17
select * from students
commit tran
select * from students

-------------------------------------------------------
--auto commit
set auto commit on
begin tran
update students set stu_name='ajith' where stu_id=17

select * from students
