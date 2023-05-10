Create database CursorD

--cursor is a Temomary memomry or temopory work station
--sql cursor is a database object is used to retrive data from a result set one row at a time
--sql cursor is used when the data needs to be updated row by row

--2types of cursor
--implicit cursor:-
	--we are creating the automatically implicit the currsor. and perform the dml operattion
--explicit cursor:-
	--this cursor created by user whenever the user require  them 

 --Method of cursor :- next,prior,first,last,absolute n,relative n

 --steps of cursor
 --1.declaring cursor(storing and performing DML operation) 	
 --2.opening cursor	  
 --3.feching the cursor
 --4.closing cursor
-- 5.de-locating cursor(whenever creating cursor cursor creating the memory )
 --cursor use in 2ways 

 --1.with cursor variable 
declare mycursor cursor scroll for select id,name from emp
declare @emp_id int,@emp_name varchar(50)
open mycursor
fetch first from mycursor into @emp_id, @emp_name
print 'employee is' + cast(@emp_id as varchar(50)) + @emp_name

--fetch next from mycursor
--fetch last from mycursor
--fetch prior from mycursor
--fetch absolute 2 from mycursor --(fix rows recived)
--fetch relative 2 from mycursor --(+ve & -ve value recived)(2+2)
close mycursor
deallocate mycursor

--2.without cursor vairable
create table emp
(
 id int primary key identity,
 name varchar(max),
 age int not null,
 salary decimal (18,2) default 1000,
 jointdate datetime2(3) default getdate(),
 gender char(1),
)
insert into emp (name,age, salary,jointdate,gender)values ('saurabh',10,20000,'2022-12-05','M')
insert into emp (name,age, salary,jointdate,gender)values ('abhi',25,2500,'2022-12-06','M')
insert into emp (name,age, salary,jointdate,gender)values ('sagar',15,5000,'2022-12-08','M')
insert into emp (name,age, salary,jointdate,gender)values ('prem',22,12000,'2022-12-04','M')
insert into emp (name,age, salary,jointdate,gender)values ('Priya',27,40000,'2022-12-03','F')
select * from emp

declare mycursor cursor scroll for select * from emp
open mycursor
fetch first from mycursor
fetch next from mycursor
fetch last from mycursor
fetch prior from mycursor-->privious
fetch absolute 2 from mycursor --(fix rows recived)
fetch relative 2 from mycursor --(+ve & -ve value recived)(2+2)
close mycursor
deallocate mycursor

create table orders
(
	Order_id int primary key,
	Customer_name varchar(255),
	Order_date date,
	Total_amount decimal (10,2)
)
insert into orders values (1,'saurabh','2023-04-01',100)
insert into orders values(2,'ashish','2023-05-01',75)
insert into orders values(3,'pratik','2023-06-01',55)
insert into orders values(4,'sachin','2023-07-01',88)
create table sales_report
(
	Customer_name varchar(255),
	Quarter int,
	Total_sales decimal(10,2)
)
drop table sales_report
declare @Cutomer_name varchar(255);
declare @Order_date Date;
declare @Total_amount decimal(10,2);
declare @Qurter int;

declare order_cursor cursor for select Cutomer_name,Order_date,Total_amount
from orders
open order_cursor
fetch next from order_cursor
into @Cutomer_name, @Order_date,@Total_amount

begin
insert into sales_report (Cutomer_name,qurter,total_sales) values (@Cutomer_name,@Qurter,@Total_amount)
fetch next from
