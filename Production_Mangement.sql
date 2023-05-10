create database product_Management
drop database product_Management


create table Admin_Office
(
	Admin_id int Primary key,
	Company_id int,
	Foreign Key (Company_id) references Production_Company(Company_id),
	Productline_id int,
	Foreign Key (Productline_id) references productline(Productline_id),
	Product_id int
	Foreign Key (Product_id) references product(Product_id),

)
create table Production_Company
(
	Company_id int primary key,
	Company_Name varchar(20),
	Company_Desciption varchar(255),
	Product_id int,
	Productline_id int,
	Foreign Key (Product_id) references product(Product_id),
	Foreign Key (Productline_id) references productline(Productline_id)
)
create table productline
(
	Productline_id int primary key,
	Product_Type varchar(50),
	Product_Description varchar(255),
)
create table product
(
	Product_id int primary key,
	Product_Name varchar(255),
	Product_Description varchar(255),
	Product_Price decimal(18,2),
	Product_Vendor varchar(255),
	customer_id int,
	Foreign Key (customer_id) references customer(customer_id),
	Order_Product_id int,
	Foreign Key (Order_Product_id) references order_product(Order_Product_id),
)
create table order_product
(
	Order_Product_id int Primary key,
	Product_Code int,
	Product_Qty int,
	Product_Total_Price varchar(255),
	Order_id int,
	Foreign Key (Order_id) references Orders(Order_id)
)
create table Orders
(
	Order_id int primary key,
	Order_Date Date,
	Shipped_Date Date,
	Order_Comment varchar(255),
	customer_id int,
	Foreign Key (customer_id) references customer(customer_id),

)

create table customer
(
	customer_id int primary key,
	Customer_Name varchar(50),
	customer_phone varchar(20),
	Customer_Address varchar(255),
	Customer_City varchar(255),
	Customer_State varchar(255),
	Customer_PostelCode int
	Admin_id int,
	Foreign Key (Admin_id) references product(Admin_id),
)