create database practice_problem2
--Consider three tables, "Products," "Orders," and "OrderItems." The "Products" table stores information about products, the "Orders" table stores information about orders, and the "OrderItems" table stores information about the items within each order.
--an inner join is performed between the "Orders," "Customers," "OrderItems," and "Products" tables based on their respective common columns. It retrieves the order date, customer name, product name, and quantity for each order item.

create table customer
(
	customer_id int primary key,
	customer_name varchar(50),
)
insert into customer values(1,'saurabh')
create table products
(
	product_id int primary key,
	product_name varchar(50),
	Product_price decimal(10,2),
	customer_id int,
	foreign key(customer_id)references customer(customer_id)
)
insert into products values (1,'Iphone',200,1)
create table orders
(
	Order_id int Primary key,
	c date,
	customer_id int,
	foreign key(customer_id)references customer(customer_id),
	product_id int,
	foreign key(product_id)references products(product_id)
)
select * from orders
insert into orders values (1,'2022-05-01',1,1)

create table orderItems
(
	Order_Item_Id int primary key,
	OrderQuantity int,
	Order_id int,
	foreign key(Order_id)references orders(Order_id),
	product_id int,
	foreign key(product_id)references products(product_id)
)
insert into orderItems values (1,50,1,1)

select customer_name,product_name,OrderQuantity,Order_date from
customer inner join products on customer.customer_id=products.customer_id,
orders inner join orderItems on orders.Order_id=orderItems.Order_id


--Suppose you have a table called "Employees" that stores employee information, and you want to track any changes made to the table. 
--You can create an "AFTER UPDATE" trigger that captures the old and new values of the modified rows and inserts them into an auditing table. 
--This allows you to maintain a historical record of all changes made to the employee records
create table employess
(
	id int primary key identity,
	name varchar(50),
	department varchar(50),
	salary decimal (10,2)
)
insert into employess(name,department,salary) values('saurabh','sales',5000.00)
create table employees_audit
(
	id int primary key identity,
	action varchar(50),
	old_value varchar(50),
	new_value varchar(50)
)

create trigger afte_employees_update
after update on employess
for each row
begin
insert into employees_audit
(id i
	action ),
	old_value),
	new_value)

--In scenarios where a subset of data is frequently queried, you can create a filtered index to optimize performance for that specific subset. For instance, 
--if you have a table containing orders from different countries, and most queries only target orders from a particular country, you can create a filtered index on 
--the "country" column for that specific country, resulting in faster queries.

create table countries
(
	country_id int primary key,
	name varchar (50)
)
insert into countries values(1,'India')
insert into countries values(2,'China')

create table orderss
(
	order_id int primary key,
	customer_name varchar(50),
	total_amount decimal(10,2),
	country_id int,
	foreign key(country_id)references countries(country_id)
)
insert into orderss values(1,'saurabh',500,1)

create index idx_order_country_id on orderss (country_id) where country_id=1;

select * from orderss with(index (idx_order_country_id))where country_id=1;


--Let's say you have a table with individual sales transactions, including the date, product, and sales amount. 
--You can create an aggregated view that calculates the total sales amount for each day, week, or month.
--This view allows you to quickly retrieve summarized data without having to perform complex aggregations each time.

create table product
(
	product_id int primary key,
	product_name varchar(50),
	unit_price decimal(10,2)
)

insert into product values(1,'Iphone',10.20)
insert into product values(3,'MIcromax',11.20)


create table salesTransection
(
	transection_id int primary key,
	sales_date date,
	sales_amount decimal(10,2),
	product_id int,
    foreign key(product_id)references product(product_id)
)
insert into salesTransection values(1,'2022-05-02',175.75,1);
insert into salesTransection values(2,'2022-05-05',200.00,2);

create view sales as select sales_date,sum(sales_amount) as total
from salesTransection group by sales_date

select * from sales

--In a manufacturing application, you could use a join to retrieve the inventory levels and production schedules for a 
--specific product. For example, you could join the products table with the inventory table and the production schedule 
--table on the product ID to get the current inventory levels, production dates, and quantities for the product.
create table producta
(
	product_id int primary key,
	product_name varchar(50),
	unit_price decimal (10,2),
	category varchar(50)
)
insert into producta values(1,'iphone',12.00,'Mobile') 

create table inventory
(
	id int primary key,
	product_id int,
	quantity int,
	location varchar(50),
	foreign key (product_id)references producta(product_id)
)
insert into inventory values (1,1,50,'nashik')

create table Productio_Schedule
(
	id int primary key identity,
	product_id int,
	production_date date,
	quantity int
	foreign key (product_id)references producta(product_id)
)
insert into Productio_Schedule values(1,'2022-02-05',12)

select product_name,i.quantity,production_date,sc.quantity from producta
inner join inventory as i on producta.product_id=i.product_id
inner join Productio_Schedule sc on producta.product_id=sc.product_id
where producta.product_id=1

--In a manufacturing application, you could create a trigger that generates a production order when 
--the inventory level of a product falls below a certain threshold. The trigger would be fired automatically 
--when an update operation is performed on the inventory table, and it would execute the production order generation code
--to create a new order for the product.
create trigger genrate_production_order on inventory
after update 
as
begin
--declare @current_invertory = (select quantity from inventory) 
declare @threshold int =45;
if exists (select * from inventory where quantity < @threshold)
begin
insert into Productio_Schedule (product_id,production_date,quantity)
select product_id,getdate(),10 from inventory where quantity<@threshold
end 
end
select * from Productio_Schedule

update inventory set quantity=51
SELECT * FROM producta
SELECT * FROM inventory