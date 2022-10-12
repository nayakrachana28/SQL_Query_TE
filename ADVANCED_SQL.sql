Use ORG

--SCALAR
--------------------------------------
create function fn_sum(@a int,@b int)
returns int
as
begin
	declare @sum int
	set @sum=@b+@a
	return @sum
end

select dbo.fn_sum(35,65) as Result

--Stored Procedures

select * from salesman
select * from customer
select * from orders

--no parameters
create procedure sp_TotalNoSalesmanbycity
as
Begin
select city,count(name) from salesman group by city
end

exec sp_TotalNoSalesmanbycity

--with input parameter

create procedure sp_customerbycity(@customercity varchar(25))
as
Begin
select * from customer where city=@customercity
end

--execute the procedure
execute sp_customerbycity @customercity='New York'

--TRIGGER

create trigger trg_DML
on salesman
for insert,update,delete
as
begin
if DATEPART(HOUR,GETDATE())<=18 and DATEPART(HOUR,GETDATE())>10
Begin
print 'You cannot perform DML operation between 10 am to 6 pm'
rollback transaction
end
end

update salesman set commission=0.12 where salesman_id=5007

--SERVER SCOPE TRIGGER
create trigger trg_DDL
on all server
for Create_Table,Alter_Table,Drop_Table
as
Begin
print'You cannot perform DDL on any of the Database'
rollback Transaction
end

use ORG

create table demo(
id int primary key)


DROP TRIGGER trg_DDL ON all server;  