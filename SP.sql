drop table emp
create table emp
(
 id int primary key identity,
 name varchar(max),
 age int not null,
 salary decimal (18,2) default 1000,
 jointdate datetime2(3) default getdate(),
 gender char(1),
 --iscurrentemployee bit --1true 0 faulse
)
insert into emp (name,age, salary,jointdate,gender)values ('saurabh',10,20000,'2022-12-05','M')
insert into emp (name,age, salary,jointdate,gender)values ('abhi',25,2500,'2022-12-06','M')
insert into emp (name,age, salary,jointdate,gender)values ('sagar',15,5000,'2022-12-08','M')
insert into emp (name,age, salary,jointdate,gender)values ('prem',22,12000,'2022-12-04','M')
insert into emp (name,age, salary,jointdate,gender)values ('Priya',27,40000,'2022-12-03','F')
select * from  emp where name ='sagar' --filter the records only true condition

select * from  emp where age = 15 --filter the records only true condition
select * from  emp where age>15

--upadate name 
update emp set name='saurabh'where id=2
update emp set name='prem' where id =3 
update emp set name ='pratik', age= 26, gender='F' where id=2
-- in operator use Fetch seleted record 
select * from  emp where age in (10,15)
 --between operator--fetch the data from the between operator
select * from  emp where age between 1 and 15
--like operator
select * from  emp where name like 'S%' 
select * from  emp where name like '__a%' --__if u find charactor afer the two charactor
--not in--not show reocrd in table
select * from  emp where name not in ('prem')

-- fuction 
--scaler function --lower(),upper(),cast()
--aggerigate sum(),count,min,avg)()
select COUNT(*) from  emp--calculat the count no. of rows
select COUNT(name) from emp  
select sum(salary) as totalsalary from emp-- if u wnat change name 


--group--if u want to group by same person
select count(gender),sum(salary) from emp group by salary
select gender, sum(salary)  from emp group by  gender
select gender, count(salary) from emp group by gender

--Store Procedure 
--store procedure(function & method) is a collection statement are store in database	
--we can say that sp is preperd for sql code so that can save in SP & this code can reused again and again

--insert store procesure 
create proc In_Inf(@_id int,@p_name varchar(max),@p_age int,@p_salary decimal,@p_jointdate  datetime2,@p_gender char(1))
as 
begin 
insert into emp (id,age, salary,jointdate,gender)values (@_id,@p_name,@p_age,@p_salary,@p_jointdate,@p_gender)
end
In_Inf 1 
--Update Stored procedure
Create Procedure Up_Inf(@p_id int,@p_name varchar(max))
as
begin 
update emp SET
name=@p_name WHERE id = @p_id
end
Up_Inf 3,saurabh

--1=Stored Procedure example
create procedure getemp
as
begin
select name,age from emp
end

--2=single parameter passig
create proc Sp_getemp2
@id int	--PArameter--if u want decleare variable in SQL then use @ symbol 
as 
begin
select * from emp where id =@id;
end

--3=Multiple parameter
create proc sp_getmq3
@id int,@name varchar(max)
as 
begin 
select * from emp where id =@id and name=@name		--use the and operater  for both condition are true
end
sp_getmq3 3,saurabh --multiparameter passigng

--4=alter stored proceture--this alter command use for existing stored procedure
alter proc sp_getmq3
@id int,@name varchar(max)
as 
begin 
select name,salary from emp where id =@id and name=@name		--use the and operater  for both condition are true
end
sp_getmq3 3,sagar --this shows only name and salary 

5--output parameter
create proc getemp4
@gender varchar (50),@Employeecount int output --1 is i/p and 2nd is optput
as 
begin
select @Employeecount = count (id) from emp
where gender=@gender
end

declare @totalemployee int  --declatre the variable
execute getemp4 'M',@totalemployee output
select @totalemployee

--6 Expection handle 
create proc sp_div (@a int,@b int)
as begin
declare @c int
set @c=@a/@b
print @c
end
sp_div 10,5

--exception handling
create proc sp_divE (@a int,@b int)
as begin
begin try 
declare @c int
set @c=@a/@b
print @c
end try 
begin catch 
print 'Denominator must not be 0'
end catch
print 'i will execute even exceotion occur'
end
sp_divE 5,5

drop table table1
drop table table2
create table table1(
	id int,
	firstname varchar(10)
)
create table table2(
	id int,
	lastname varchar(10)
)
insert into table1 values(1,'saurabh')
insert into table1 values(1,'Trisha')

insert into table2 values(2,'ashish')
insert into table2 values(1,'Trisha')


select * from table1,table2

create trigger forinsert 
on table1 
after insert 
as 
begin
print 'adding the new name inserting successfully'
end

select * from table1 inner join table2 on table1.id=table2.id
select * from table1 left join table2 on table1.id=table2.id