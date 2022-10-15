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

--Explicit Transaction with Save Transaction
-- creates points within the groups of transactions in which to ROLLBACK. 
--A SAVEPOINT is a point in a transaction in which you can roll the transaction back to a certain point without rolling back the entire transaction. 

Select * from Employee


BEGIN TRANSACTION
insert into Employee values(106,'Karuna','9808768908')
SAVE TRANSACTION insert_stmt
delete from Employee  where Emp_ID=105;
ROLLBACK TRANSACTION insert_stmt
COMMIT TRANSACTION

BEGIN TRANSACTION
insert into Employee values(108,'Ankush','8009712345')
update Employee set Emp_Name='Raksha' where Emp_ID=105
SAVE TRANSACTION insert_into_stm
delete from Employee  where Emp_ID=105;
ROLLBACK TRANSACTION insert_into_stm
COMMIT TRANSACTION

--Exception
--1.Throw - 
--System exception
--The THROW statement in SQL Server raises an exception and transfers the control to a CATCH block.
--2.Raiserror -
--Custom execption
--RAISERROR is a SQL Server error handling statement that generates an error message and initiates error processing. 

alter procedure sp_DivideByZeroTryCatch
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	BEGIN TRY
		BEGIN
			IF(@num2=0)
			--RAISERROR('Cannot Divide By Zero',16,127) -- We can either use ERROR_NUMBER() or ERROR_MESSAGE()
			THROW 50001,'Cannot Divide By Zero',1 -- ERROR_NUMBER() & ERROR_MESSAGE() & ERROR_STATE() & ERROR_SEVERITY() is 16 by default
			SET @Result=@num1/@num2
			PRINT 'Value is:' + CAST(@Result as varchar)
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()		
	END CATCH
END

execute sp_DivideByZeroTryCatch 10,0
