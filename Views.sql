--Views --A views can also be considered as a virtual table(Imaginary table we are creating virtual table)

--we need to go for views we can create creating more table using the existing data

create table MyEmployees 
(
Emp_Id int, 
Emp_Name varchar(50) not null, 
Gender varchar(50) not null, 
Salary int not null, 
City varchar(50), 
Dept_Id int
);

insert into MyEmployees values(100,'Usman','male',25000,'Hyderabad',2);
insert into MyEmployees values(101,'Anas','male',45000,'Karachi',1);
insert into MyEmployees values(102,'Anum','Female',35000,'Sukkur',3);
insert into MyEmployees values(103,'Ali','male',45000,'Hyderabad',4);
insert into MyEmployees values(104,'Aghar','male',35000,'Karachi',2);
insert into MyEmployees values(105,'Osama','male',25000,'Sukkur',1);
insert into MyEmployees values(106,'Asmara','Female',15000,'Hyderabad',3);
select * from MyEmployees
select * from MyDepartment
create table MyDepartment 
(
Id int, 
Dept_Name varchar(50) not null
);
insert into MyDepartment values(1,'Accounts');
insert into MyDepartment values(2,'H-R');
insert into MyDepartment values(3,'Administration');
insert into MyDepartment values(4,'Counselling');

--creating view
create view vWEmployees
as
select * from MyEmployees as A
inner join MyDepartment as B
on A.Dept_Id = B.Id
select * from vWEmployees
select * from vWEmployees1
create view vWEmployees1
as
select A.*,B.Dept_Name from MyEmployees as A --shows A table and B shows only dep.name
inner join MyDepartment as B
on A.Dept_Id = B.Id

select * from vWEmployees2

--Views can be used as a mechanism to implement row and column level security
create view vWEmployees2
as
select A.Emp_Id,A.Emp_Name,A.Gender,A.City,B.Dept_Name from MyEmployees as A
inner join MyDepartment as B
on A.Dept_Id = B.Id

create view vWEmployees3
as
select A.*,B.Dept_Name from MyEmployees as A 
inner join MyDepartment as B
on A.Dept_Id = B.Id
where Dept_Name='H-R' --See only HR Name

select * from vWEmployees3


create table sales
(
	Sales_date date,
	Sales_Person varchar(50),
	Product varchar(50),
	Quantity int,
	Total_amount decimal(10,2)
)
insert into sales values('2022-01-01','saurabh','iphone',10,200.00)
insert into sales values('2022-01-02','ashish','vivio',10,300.00)
insert into sales values('2022-01-03','pratik','samsung',10,400.00)
insert into sales values('2022-01-04','saurabh','iphone',10,500.00)

create view salesemployee 
as 
sum(total_amount)as total_revenuew
from

