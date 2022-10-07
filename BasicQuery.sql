create database ORG;

use ORG;

create table worker(
Worker_ID int not null primary key IDENTITY(1,1),
First_Name varchar(25),
Last_Name varchar(25),
Salary int,
Joining_Date datetime,
department varchar(25)
)

select * from worker

Insert into worker(First_Name,Last_Name,Salary,Joining_Date,department) values('Ankur','Kamata',20000,14-02-2022,'HR')
Insert into worker values('Ravi','Nayak',20500,16-09-2021,'Admin')
Insert into worker values('Monika','Arora',100000,14-02-20,'HR')
Insert into worker values('Niharika','Verma',80000,14-06-11,'Admin')
Insert into worker values('Vishal','Sighal',300000,14-02-20,'HR')
Insert into worker values('Amitabh','Sigh',500000,14-02-20,'HR')
Insert into worker values('Vivek','Bhati',500000,14-02-20,'Admin')
Insert into worker values('Vipul','Diwan',200000,14-06-11,'Account')
Insert into worker values('Satish','Kumar',75000,14-01-20,'Account')
Insert into worker values('Geetika','Chauhan',90000,14-04-11,'Admin')


Create table Bonus(
Worker_Ref_ID int,
Bonus_Amount int,
Bonus_Date Datetime,
Foreign key(Worker_Ref_ID) references worker(Worker_ID) on delete cascade
)

Insert into Bonus values(2,5000,16-02-20)
Insert into Bonus values(4,3000,16-06-11)
Insert into Bonus values(3,4000,16-02-20)
Insert into Bonus values(2,4500,16-02-20)
Insert into Bonus values(6,3500,16-02-20)
Insert into Bonus values(4,4700,16-06-11)

select * from Bonus

Create table Title(
Worker_Ref_ID int,
Worker_Title varchar(25),
Affected_From Datetime,
Foreign key(Worker_Ref_ID) references worker(Worker_ID) on delete cascade
)

Insert into Title values(2,'Manager',2016-02-20)
Insert into Title values(4,'Executive',2016-06-11)
Insert into Title values(8,'Executive',2016-06-11)
Insert into Title values(3,'Asst. Manager',2016-06-11)
Insert into Title values(7,'Manager',2016-06-11)
Insert into Title values(5,'Asst. Manager',2016-02-20)
Insert into Title values(6,'Executive',2016-02-20)
Insert into Title values(9,'Manager',2016-06-11)
Insert into Title values(11,'Lead',2016-02-20)
Insert into Title values(10,'Lead',2016-06-11)

select * from worker
select * from Bonus
select * from Title

--1--
select First_Name as WORKER_NAME from worker

--2--
select UPPER(First_Name) as WORKER_NAME from worker

--3--
select DISTINCT department as DEPARTMENT from worker

--4--
select SUBSTRING(First_Name,1,3) as FIRST_NAME from worker

--5--
SELECT DISTINCT department, LEN(department) AS departmentNameLength FROM worker;
--select distinct(department), count(department) as Department_Length from Worker group by department


--6--
select CONCAT(First_Name,' ' ,Last_name) as COMPLETE_NAME from worker

--7--
select * from worker where First_Name IN('Vipul','Satish')

--8--
select * from worker where department='Admin'

--9--
select * from worker where First_Name Like '%a'

--10--
select * from worker where First_Name Like '%a%'