create database sqltask3
use sqltask3

create schema normalization
create table normalization.Department(DeptId int primary key,DeptName varchar(20) not null unique)
select * from normalization.Department
--create a synonym
create synonym Dept for normalization.Department
select * from dept
--insert values
insert into dept values(100,'Developer'),(101,'UI/UX')

create table Address(AddressId int primary key,City varchar(30),State varchar(25),Pincode int )

select * from Address

insert into Address values
(1,'Mannford','Oklahoma(OK)',74044),
(2,'Sidney','Ohio(OH)',45365)
--create table employee
create table Employee1 
(Id int primary key,
Name varchar(30) unique,
Designation varchar(20),
DeptId int references  normalization.Department(DeptId ),
Mobile1 bigint,
Mobile2 bigint,
StreetAddress varchar(30),
AddressId int references Address(AddressId))

select * from Employee1
insert into Employee1 values(1,'John','Developer',100,9865741236,6325478962,'234 Hinton Rd',1)
insert into Employee1(Id,Name,Designation,DeptId,Mobile1,StreetAddress,AddressId) 
values(2,'Jamie','Designer',101,7893245698,'214 Doorley Rd',2)
insert into Employee1 values(3,'Jack','Developer',100,5647896523,9856741236,'214 Hinton Rd',1)
