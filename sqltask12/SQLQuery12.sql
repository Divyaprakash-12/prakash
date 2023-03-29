create database sqltask12
use sqltask12

create table country(id int primary key,country_name char(128),
country_name_eng char(128),coutry_code char(8))

create table employee(id int primary key,first_name char(255),
last_name char(255))

create table city(id int primary key,city_name  char(128),lat decimal(9,6),long decimal(9,6),
country_id int references country(id))

create table customer(id int primary key,customer_name  varchar(255),city_id int references city(id),
customer_address varchar(255),next_call_date date,ts_inserted datetime)

create table call_outcome(id int primary key,outcome_text char(128))

create table call(id int primary key,employee_id int references employee(id),
customer_id int references customer(id),start_time datetime,end_time datetime,
call_outcome_id int references call_outcome(id))

