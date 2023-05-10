create table product_dtails
(
	product_id int primary key,
	product_name varchar(50),
	Product_price decimal(10,2),
	Product_describe varchar(50),
	category_id int,
    foreign key (category_id) references category_table(category_id)
)
drop table product_dtails
drop table category_table
drop table inventory_table
drop table supplier_table

select * from product_dtails
insert into product_dtails (product_id,product_name,Product_price,Product_describe,category_id)values(1,'Iphone',10000,'this tis new phone',1)
insert into product_dtails (product_id,product_name,Product_price,Product_describe,category_id)values(2,'samsung',20000,'this tis samsung phone',2)
insert into product_dtails (product_id,product_name,Product_price,Product_describe,category_id)values(3,'vivio',30000,'this tis vivio phone',3)

create table category_table
(
	category_id int primary key,
	category_name varchar(50)
)
insert into category_table values (1,'saurabh')
insert into category_table values (2,'Lalit')
insert into category_table values (3,'Ashish')

create table inventory_table
(
 product_id int,
 stock_level int,
 foreign key(product_id)references product_dtails(product_id)
)

insert into inventory_table(product_id,stock_level) values (1,2)
insert into inventory_table values (3,5)
insert into inventory_table values (2,0)
select * from inventory_table

create table supplier_table
(
supplier_id int primary key,
suplier_name varchar(255),
contact_num varchar(20),
email varchar(50)
)
insert into  supplier_table values (1,'Nagpur','8087732944','saurabh@gmail.com')
insert into  supplier_table values (2,'pune','8087732944','pune@gmail.com')
insert into  supplier_table values (3,'nashik','8087732944','nashik@gmail.com')
insert into  supplier_table values (4,'mumbai','8087732944','mumbai@gmail.com')

select c.category_name,p.product_name,p.Product_price,p.Product_describe from product_dtails  p
inner join category_table as c on c.category_id= p.product_id
where inventory_table
-------------------------------------------------------------------------------------------------------------------------------------------------------------
select p.product_name,c.catgory_name,s.supplier_name
from 
product p inner join catogiry c on p.product_id=c.catgory_id
inner join supplier s on p.product_id=s.supplier_id

select count(order_id) as orders from Orders

create table product
(
	product_id int primary key,
	product_name varchar(50),
	catgory_id int,
	foreign key (catgory_id) references catogiry(catgory_id),
	supplier_id int,
	foreign key (supplier_id) references supplier(supplier_id)
)
insert into product values(1,'iphone',1,1)

create table catogiry 
(
	catgory_id int primary key,
	catgory_name varchar(50)
)
insert into catogiry values(1,'Mobiles')
create table supplier
(
	supplier_id int primary key,
	supplier_name varchar(50)
)
insert into supplier values(1,'Laxman')
create table Orders
(
	order_id int primary key,
	product_id int,
	foreign key (product_id) references product(product_id),
	Quantity int
)
insert into Orders values(1,1,50)

---------------------------------------------------------------------------------------------------------
select firstname,c.customerId,email,count(amount) as Counts,sum(amount) as totalamount
from Customers c 
inner join Ordersi o on c.customerId=o.customerId
inner join Payments p on p.orderId=o.orderId
group by firstName,email,c.customerId having sum(amount)>400

-- Create the Customers table
CREATE TABLE Customers (
    customerId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);
select * from customers
-- Insert some dummy data into the Customers table
INSERT INTO Customers (customerId, firstName, lastName, email)
VALUES (1, 'John', 'Doe', 'johndoe@example.com'),
       (2, 'Jane', 'Doe', 'janedoe@example.com'),
       (3, 'Bob', 'Smith', 'bobsmith@example.com'),
       (4, 'Alice', 'Jones', 'alicejones@example.com'),
       (5, 'Joe', 'Brown', 'joebrown@example.com');

-- Create the Orders table
CREATE TABLE Ordersi (
    orderId INT PRIMARY KEY,
    orderDate DATE,
    customerId INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);
select * from Ordersi
-- Insert some dummy data into the Orders table
INSERT INTO Ordersi (orderId, orderDate, customerId, amount)
VALUES (1, '2022-01-01', 1, 100.00),
       (2, '2022-01-02', 1, 200.00),
       (3, '2022-01-03', 2, 150.00),
       (4, '2022-01-04', 3, 75.50),
       (5, '2022-01-05', 4, 250.00);

-- Insert some additional dummy data into the Orders table
INSERT INTO Ordersi (orderId, orderDate, customerId, amount)
VALUES (6, '2022-01-06', 1, 175.00),
       (7, '2022-01-07', 1, 225.00),
       (8, '2022-01-08', 2, 80.00),
       (9, '2022-01-09', 2, 100.00),
       (10, '2022-01-10', 2, 50.00),
       (11, '2022-01-11', 3, 150.00),
       (12, '2022-01-12', 4, 300.00),
       (13, '2022-01-13', 4, 125.00),
       (14, '2022-01-14', 5, 200.00),
       (15, '2022-01-15', 5, 175.00);

-- Create the Payments table
CREATE TABLE Payments (
    paymentId INT PRIMARY KEY,
    orderId INT,
    amountPaid DECIMAL(10,2),
    paymentDate DATE,
    FOREIGN KEY (orderId) REFERENCES Ordersi(orderId)
);

-- Insert some dummy data into the Payments table
INSERT INTO Payments (paymentId, orderId, amountPaid, paymentDate)
VALUES (1, 1, 50.00, '2022-01-01'),
       (2, 1, 75.00, '2022-01-02'),
       (3, 2, 200.00, '2022-01-03'),
       (4, 3, 50.00, '2022-01-04'),
       (5, 3, 30.00, '2022-01-05'),
       (6, 3, 50.00, '2022-01-06'),
       (7, 11, 100.00, '2022-01-07'),
       (8, 12, 250.00, '2022-01-08'),
       (9, 12, 50.00, '2022-01-09')
       (10, 15, 100.00, '2022-01-10'),
       (11, 15, 75.00, '2022-01-11');

select * from Customers 
select * from Ordersi
select * from Payments
select c.*,o.*,p.* from Customers c ,Ordersi o ,Payments p
--write a query to get : firstName, totalOrderAmount
--write a query to get : firstName, totalOrderAmount, totalPaymentAmount, Balance -> only those records that have balance > 100, highest balance customer should be first
select count(c.customerId) As counts,firstName,sum(amount) as totalamount from Customers c inner join Ordersi o on o.customerId=c.customerId group by firstName having sum(amount)>400
select amount, count(customerID) as customerCount from Ordersi group by amount

select concat(firstName,' ',lastName) as FullName, lastName,sum (amount) as totalamount from customers c inner join Ordersi O on C.customerId = O.customerId group by concat(firstName,' ',lastName),lastName
select cutomerId,amount from Customers c inner join Ordersi on Customers c

select firstName,sum(amount) totalOrderAmount ,sum(amountPaid)  totalPaymentAmount,(sum(amount)-sum(amountPaid)) as balance 
from customers c inner join Ordersi O on C.customerId = O.customerId inner join Payments p on  p.paymentId=O.orderId group by firstName
having (sum(amount)-sum(amountPaid))> 100 order by (sum(amount)-sum(amountPaid)) desc
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- Create the Employees table
CREATE TABLE Employees (
    employeeId INT PRIMARY KEY,
    name VARCHAR(50),
    jobTitle VARCHAR(50)
);

-- Insert some dummy data into the Employees table
INSERT INTO Employees (employeeId, name, jobTitle)
VALUES (1, 'John Smith', 'Manager'),
       (2, 'Jane Doe', 'Sales Representative'),
       (3, 'Bob Johnson', 'Marketing Coordinator'),
       (4, 'Sarah Williams', 'Software Developer'),
       (5, 'Mike Adams', 'Systems Administrator');

-- Create the Departments table
CREATE TABLE Departments (
    departmentId INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert some dummy data into the Departments table
INSERT INTO Departments (departmentId, name)
VALUES (1, 'Sales'),
       (2, 'Marketing'),
       (3, 'IT');

-- Create the Employee_Departments table
CREATE TABLE Employee_Departments (
    employeeId INT,
    departmentId INT,
    PRIMARY KEY (employeeId, departmentId),
    FOREIGN KEY (employeeId) REFERENCES Employees(employeeId),
    FOREIGN KEY (departmentId) REFERENCES Departments(departmentId)
);

-- Insert some dummy data into the Employee_Departments table
INSERT INTO Employee_Departments (employeeId, departmentId)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 3),
       (5, 3),
       (2, 3),
       (4, 2);

--1.Write a query to retrieve the name and job title of all employees.
select name,jobTitle from Employees
--2. Write a query to retrieve the name of the department that employee with ID 2 is assigned to.
select name,employeeId from Employee_Departments E inner join Departments D on E.departmentId =D.departmentId where employeeId=2
--3. Write a query to retrieve the name and department ID of all employees.
select name,departmentId from Employee_Departments E inner join Employees M on E.employeeId = M.employeeId 
--4. Write a query to retrieve the name of all departments that have at least one employee assigned to them.
select name,count(employeeId) from Departments D inner join Employee_Departments E on D.departmentId=E.departmentId group by name having count(employeeId)>0
--5. Write a query to retrieve the name and job title of all employees who are assigned to department ID 3.
select name,jobTitle,departmentId from Employees E inner join Employee_Departments D on e.employeeId = D.employeeId where departmentId=3
--6. Write a query to retrieve the name and department ID of all employees who have the job title "Manager".

--7. Write a query to retrieve the total number of employees assigned to each department.

--8. Write a query to retrieve the name and department ID of all employees who are assigned to more than one department.
select E.name,count (departmentId) from Employee_Departments D inner join Employees E on D.employeeId=E.employeeId 
--These queries will help you test your understanding of basic SQL concepts like SELECT statements, JOINs, and aggregations.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create  table  customer
(
	customer_id int primary key,
	name varchar(50)
)
create table orderss
(
	id int primary key,
	amount decimal (10,8),
	customer_id int,
	foreign key (customer_id)references customer(customer_id)
)

create proc createorder(@customer_id int, @id int, @name varchar(50),@amount decimal(10,8))
as 
begin
insert into customer values (@customer_id,@name)
insert into orderss values (@id,@amount,@customer_id)
end
createorder 1,1,'Saurabh',50.00
select * from orderss
select * from customer