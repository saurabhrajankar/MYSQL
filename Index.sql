--index support faster data storege and retrival capabilities
--there are no index to help the query then query engine performs a entire table scan
-
--if do not space index key then mysql automatically indexes primery key 
--Ex.suppose we have 50 records and retrive the 50th no. but query engine searching for all records and then given to you


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

create index salary_index on MyEmployees (Salary);
show index from MyEmployees;
select * from MyEmployees where Salary=25000;
explain select * from MyEmployees where Salary=25000;
--
--if u want to drop 
--Alter table name  drop indexname
--creates a clustered index named idx_OrderDate on the OrderDate column of the Orders table.
create table orderss
(
	OrderId int ,
	OrderDate date not null,
	ordertotal decimal(10,2) not null
)
drop table orderss
insert into orderss values(1,'2022-01-01',520.00)
insert into orderss values(2,'2022-01-02',530.00)
insert into orderss values(3,'2022-01-03',540.00)
insert into orderss values(4,'2022-01-04',550.00)

create clustered index idx_orderdate on orderss (OrderDate)
select * from orderss with(index (idx_orderdate))where OrderDate='2022-01-04'