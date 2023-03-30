create database sqltask13
use sqltask13

--create user table
create table _user(user_id int primary key,username varchar(16),password varchar(40)) 

--create finaid_main table
create table finaid_main(aid_id int primary key,name varchar(50),category varchar(15))

--create role table
create table role(role_id int primary key,role_name varchar(3),role_full_name  varchar(15))

--create timeslot table
create table time_slot(time_slot_id int primary key,days varchar(8),start_time datetime,end_time datetime)

--create department table
create table department (dept_name varchar(25) primary key,building varchar(20),budget numeric(18,2))

--create course table
create table course(class_id int primary key,
name varchar(25),dept_name varchar(25) references department(dept_name),
credits numeric(5),description varchar(8000))

--create section table
create table section(class_id int references course(class_id),class_num int primary key,
semester varchar(7),year int,room_no varchar(6),
time_slot_id int  references time_slot(time_slot_id),capacity int)

--create takes table
create table takes(user_id int references _user(user_id),
class_id int references course(class_id),
class_num int references section(class_num),
semester varchar(7),year int,grade varchar(7))

--create teaches table
create table teaches(user_id int references _user(user_id),
class_id int references course(class_id),
class_num int references section(class_num),
semester varchar(7),year int)

--create requisite table
create table requisite(
class_id int references course(class_id),
req_id int primary key,type varchar(4))

--create user_salary table
create table user_salary(
user_id int references _user(user_id),
salary numeric(18,2))

--create user_balence table
create table user_balence(
user_id int references _user(user_id),
balence numeric(18,2))


--create user_role table
create table user_role(
user_id int references _user(user_id),
role_id int references role(role_id))

--create user_number table
create table user_number(
user_id int references _user(user_id),
number numeric(15,0),description varchar(15))

--create user_address table
create table user_address(
user_id int references _user(user_id),
address varchar(80),apt_num varchar(15),city varchar(25),state varchar(2),zip numeric(5,0),description varchar(15))

--create user_finaid_map
create table user_finaid_map(user_id int references _user(user_id),
aid_id int references finaid_main(aid_id),semester varchar(7),year int,
offered numeric(18,2),accepted numeric(18,2))




