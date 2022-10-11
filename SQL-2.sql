use ORG

create table Employee(
Emp_ID int not null,
Emp_Name varchar(25),
Emp_Phone int
)
alter table Employee alter column Emp_Phone varchar(25);

insert into Employee values(101,'Karuna','9876789876')
insert into Employee values(102,'Amar','8765438909')
insert into Employee values(103,'Kavya','7689043215')
insert into Employee values(104,'Anusha','9087543267')
insert into Employee values(105,'Jeera','8760098213')

select * from Employee

--Synonyms
---------------------------------------------

--Table Alias/Alternative name for Table,View,Procedure,Function,Trigger
--Create a short name form long name we use synonym
create synonym emp for Employee

--Access the synonym name 
select * from emp

--Where they get stored in SQL server
select * from sys.synonyms

--VIEWS
-------------------------------------------------

--Virtual Tables -> They depend on the table -> We can create view for one or more table
--Views can be Divides into two types
--1.System views( SQL server created ) 2. Userdefined ( custom )
-- Two types of UserDefined view 1. Simple View ( Single Table ) 2. Complex View ( More than one table )

--Simple View
--Doesnot contain group by clause or function
--Can perform DML Operation

--Create a View
create view emp_Name
as 
select Emp_ID, Emp_Name from Employee

--Retrive details from view
select * from emp_Name

select * from Employee

--insert into simple view
insert into emp_Name values(106,'Raju')

--update in simple View
update emp_Name set Emp_Name='Raksha' where Emp_Name='Jeera'

--delete from simple view
delete from emp_Name where Emp_ID=106

--Complex View

--View can be created for more than one table
--group by clause, join, order by clause, function
--Cannot perform DML Operation
--Insert and delete can not be performed but update can be performed

--Create a complex view

create view Worker_Details
as
select w.First_Name , w.Last_Name ,b.Bonus_Amount from worker w inner join Bonus b on w.Worker_ID=b.Worker_Ref_ID

select * from worker
select * from Bonus

--Insert operation cannot be performed in Complex view
 
select * from Worker_Details

insert into Worker_Details values('Rachana','Nayak',3900)

--update in complex view

update Worker_Details set Bonus_Amount=4500 where Bonus_Amount=4700

--Delete in complex view --Cannot be done

delete from Worker_Details where First_Name='Ankur'

--INDEX
--------------------------------------------

--For Faster retrival of data / Improve preformance
--Types: 1. Clustered Index 2. Non-Clustered Index

--1.Clustered Index

--When ever the primary key is created clustered index is created automatically
--Only one Clustered is created for each table
--Structred Formate

--create a cluster index 
create clustered index Emp_clus_index on Employee(Emp_ID)

--2.Non-Clustered Index

--When ever the unique key is created automatically non-clustered is created
--Any number of non-clustered index can be created
--UnStructred Formate
--Only the cloumns which is frequency used only for that create index avoid creation of too many columns

select * from Employee

create index Emp_Phone on Employee(Emp_Phone)

--3.Filtered Index

create index fil_index on Employee(Emp_Name) where Emp_Name='Raksha'

select * from Employee where Emp_Name='Raksha'

--SEQUENCE

create table student(
SID int primary key,
SName varchar(25),
SDep varchar(25)
)

select * from student

--Create a sequence
create sequence stu_ID as int start with 200 increment by 2

--Insert into table using the sequence
insert into student values(NEXT value for stu_ID,'Amar','CS')
insert into student values(NEXT value for stu_ID,'Rajesh','CS')
insert into student values(NEXT value for stu_ID,'Rom','CS')
insert into student values(NEXT value for stu_ID,'Ruchitha','CS')
insert into student values(NEXT value for stu_ID,'Suraj','CS')
insert into student values(NEXT value for stu_ID,'Ankur','CS')

--But when used with other table it will continue from the next value of the sequence

create table dem0(
DID int,
DName varchar(25)
)

insert into dem0 values(NEXT value for stu_ID,'Amar')
insert into dem0 values(NEXT value for stu_ID,'Rajesh')
insert into dem0 values(NEXT value for stu_ID,'Rom')
insert into dem0 values(NEXT value for stu_ID,'Ruchitha')

select * from student
select * from dem0

--so first truncate table then use 

Truncate table dem0

--Alter the sequence
alter sequence stu_ID  restart with 1000 increment by 1

insert into dem0 values(NEXT value for stu_ID,'Amar')
insert into dem0 values(NEXT value for stu_ID,'Rajesh')
insert into dem0 values(NEXT value for stu_ID,'Rom')
insert into dem0 values(NEXT value for stu_ID,'Ruchitha')

--drop sequence 
drop sequence stu_ID


--STRING FUNCTION
-------------------------------------------

--1.CHAR() -> Returns character based on the ASCII code
select CHAR(65) as NumberCodeToCharacter

--2.ASCII() -> Return the ASCII Code based on character
select ASCII('A') as ChartoCode

select * from student

select SName, ASCII(SName) as ChartoCode from student

--3.CHARINDEX -> Position of string
select CHARINDEX('t','student') as PositionChar

--4. CONCAT -> ADD two or more string
select CONCAT('Rachana ','Nayk') as FullName
--or
select 'Rachana ' + 'Nayak' as FullNmae

--5.CONCAT_WS() -> Add two or more string using separator
select CONCAT_WS('.','WWW','google','com') as Fuction_sep

--6.LEN() -> Used to return the length of the string
select LEN('Rachana') as Length

--7.Left() -> extract the number of characters from left. Right()-> Extract the number of characters from right
select LEFT('Rachana',3) as Left_characters, Right('Rachana',3) as Right_characters

--8. Upper() -> Convert the character into upper case. Lower()-> Convert the character into Lower case
select upper('Rachana') as upper_characters, lower('Rachana') as lower_characters

--9.Reverse() -> Reverse a string
select REVERSE('Hi World') as Reverse_String

--10 LTRIM() -> remove the space from left
select LTRIM('          Hi World') as Reverse_String


--DATETIME FUNCTION
-------------------------------------------

--1.