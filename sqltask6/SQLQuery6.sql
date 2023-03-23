create database sqltask6
use sqltask6
--create salesman table
create table Salesman
(
salesman_id int primary key,
name varchar(25) not null,
city varchar(25) not null,
commission decimal (4,2)
)

--inserting values
insert into Salesman values 
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12)
select * from salesman

--create salesman customer
create table Customer
(
customer_id int primary key,
cust_name varchar(25) not null,
city varchar(25) not null,
grade int,
salesman_id int 
)

--inserting values
insert into Customer values 
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',null,5005);
select * from customer

--create order table
create table Orders
(
ord_no int primary key,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int
)
--insert values
insert into Orders values 
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70013,75.29,'2012-08-17',3003,5007),
(70011,3045.6,'2012-04-25',3002,5001)
select * from orders
select * from Salesman
select * from Customer

--1. find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
select s.salesman_id,s.name,c.customer_id,c.cust_name,c.city from Salesman as s inner join Customer as c on s.city=c.city;

/*2.find salespeople who received commissions of more than 12 percent from the company.
 Return Customer Name, customer city, Salesman, commission.*/
select  s.salesman_id,s.name,c.customer_id,c.cust_name ,s.commission from Salesman as s left join Customer as c on s.salesman_id=c.salesman_id 
where s.commission>0.12;

select C.customer_id , C.cust_name, S.salesman_id, S.name, C.city, S.commission from
Customer as C full join Salesman as S on S.salesman_id = C.salesman_id where S.commission > 0.12

/*3.find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.*/
select o.ord_no,o.ord_date,0.purch_amt,c.customer_id,c.cust_name,c.grade,s.salesman_id,s.name,s.commission from Orders as o 
full join Customer as c on o.salesman_id=c.salesman_id full join Salesman as s on o.salesman_id=s.salesman_id;

/*4. find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.*/
select o.ord_no,o.purch_amt,c.customer_id,c.cust_name,c.city from Orders as o full join Customer as c on o.customer_id=c.customer_id 
where o.purch_amt between 500 and 2000

/*5.to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.*/
select c.customer_id,c.cust_name,c.city as customer_city,c.grade,s.name as salesman_name,s.city as salesman_city from Customer as c full join Salesman as s on 
c.salesman_id=s.salesman_id order by c.customer_id


