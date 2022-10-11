use ORG

create table salesman(
salesman_id int primary key,
name varchar(25),
city varchar(25),
commission int
)

alter table salesman alter column commission float(7)

insert into salesman values(5001,'James Hoog','New York',0.15)
insert into salesman values(5002,'Nail Knite','Paris',0.13)
insert into salesman values(5005,'Pit Alex','Ladon',0.11)
insert into salesman values(5006,'Mc Lyon','Paris',0.14)
insert into salesman values(5007,'Paul Adam','Rome',0.13)
insert into salesman values(5003,'Lauson Hen','San Jose',0.12)


--delete from salesman where salesman_id=5001

select * from salesman

--1--
create view sales_new_york
as
select * from salesman where city='New York'

select * from sales_new_york

--2--

create view sales_detail
as
select salesman_id, name as salesman_name, city as salesman_city from salesman

select * from sales_detail

--3--
create view count_salesman_city
as
select city, count(DISTINCT salesman_id) as 'number of salespersons' from salesman group by city

select * from count_salesman_city

--4--

create table customer(
customer_id int primary key,
cust_name varchar(25),
city varchar(25),
grade int,
salesman_id int foreign key references  salesman(salesman_id) on delete cascade
)

insert into customer values(3002,'Nick Rimando','New York',100,5001)
insert into customer values(3007,'Brad Davis','New York',200,5001)
insert into customer values(3005,'Graham Zusi','Califoria',200,5002)
insert into customer values(3008,'Julian Green','Ladon',300,5002)
insert into customer values(3004,'Fabian Johnson','Paris',300,5006)
insert into customer values(3009,'Geoff Cameron','Berlin',100,5003)
insert into customer values(3003,'Jozy Altidor','Moscow',200,5007)


select * from customer

create view count_grade_cust
as 
select grade, count(customer_id) 'Number of Customer' from customer group by grade

select * from count_grade_cust

--5--

create table orders(
order_no int primary key,
purch_amt float(10),
order_date datetime,
customer_id int foreign key references  customer(customer_id) on delete cascade
)

alter table orders add salesmanid int foreign key references  salesman(salesman_id) ON UPDATE CASCADE ON DELETE No Action

insert into orders values(70001,150.5,'2012-10-05',3005,5002)
insert into orders values(70009,270.65,'2012-09-10',3004,5005)
insert into orders values(70002,65.26,'2012-10-05',3002,5001)
insert into orders values(70004,110.5,'2012-08-17',3009,5003)
insert into orders values(70007,948.5,'2012-09-10',3005,5002)
insert into orders values(70005,2400.6,'2012-07-27',3007,5001)
insert into orders values(70008,5760,'2012-09-10',3002,5001)



select * from orders
select * from customer
select * from salesman

create view sales_customer_name
as
select o.order_no,o.purch_amt,s.salesman_id,s.name,c.cust_name from orders o,salesman s,customer c where o.customer_id=c.customer_id and c.salesman_id=s.salesman_id

select * from sales_customer_name