use TE_ASP_DOTNET_MVC

select * from student

drop table student
--MVC DATA FIRST APPROACH 

create table student(
student_ID int primary key Identity(1,1),
student_name varchar(25),
student_Age int
)

set identity_insert student on
set identity_insert student off


--API MVC DATA FIRST APPROACH 
create database API_MVC

use API_MVC

create table Registration(
id int primary key Identity(1,1),
name varchar(25), 
email varchar(40),
mobile varchar(25),
password varchar(25)
)

select * from Registration

set identity_insert Registration on

