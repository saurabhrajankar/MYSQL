create database Joinstable
--Join two tables to retrieve a list of all customers who have made at least one purchase in the last 30 days, 
--along with the details of their most recent purchase.
CREATE TABLE customers (
    customer_id INT identity PRIMARY KEY,
	sales_rep_id INT NOT NULL,
    name varchar(255) NOT NULL,
	ph_number varchar(50), 
	regoin varchar(50)
);

select * from customers
select * from purchases
CREATE TABLE purchases (
    purchase_id INT identity PRIMARY KEY,
    customer_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    purchase_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
drop table customers
drop table purchases
drop table orders
drop table product

INSERT INTO customers (name,sales_rep_id, ph_number, regoin) VALUES
('Saurabh Rajanakr',1,8087732944,'Nashik'),
('Ashish Patil',2,2111001144,'Nagpur'),
('praveen sheikh',3,2111001144,'Pune')

INSERT INTO purchases (customer_id, purchase_date, purchase_amount) VALUES
(1, '2023-04-20', 30.99),
(2, '2023-04-22', 50.99),
(1, '2023-04-23', 20.00),
(3, '2023-04-24', 50.00),
(2, '2023-04-24', 10.00),
(1, '2023-04-24', 15.00);

SELECT c.name,p.purchase_date, p.purchase_amount
FROM customers c
JOIN purchases p ON c.customer_id = p.customer_id
WHERE p.purchase_date >= DATEADD(DAY, -30, GETDATE()) 
AND p.purchase_date = (
    SELECT MAX(p2.purchase_date) 
    FROM purchases p2
    WHERE p2.customer_id = p2.customer_id
)

--Join three tables to retrieve a list of all products that were ordered by customers 
--in a specific region, along with the names and contact information of the customers who ordered them.

create table product(
product_id  int primary key identity,
product_name varchar(50),
Product_price varchar(50),
)
select * from product
insert into product values('iphone',50000)
insert into product values('samsung',10000)
insert into product values('Nokia',15000)
insert into product values('vivo',20000)

drop table orders
create table orders(
order_id int primary key identity,
customer_id int,
product_id int,
item_id int,
order_date Date,
quantity int,
order_fulfilled bit default 0,
expected_delivery_date DATE,
foreign key (item_id)references inventory(item_id),
foreign key (customer_id)references customers(customer_id),
foreign key (product_id)references product(product_id)
)
INSERT INTO orders (customer_id, product_id, order_date,quantity)
VALUES
  (1, 1,'2023-04-25',100),
  (2, 1, '2023-04-24',50),
  (3, 2, '2023-04-23',20);

SELECT p.product_name,c.name,c.ph_number,c.regoin
FROM product p
INNER JOIN orders o ON p.product_id = o.product_id
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.regoin = 'pune'

--Combine data from multiple tables to generate a report on the performance of sales representatives,
--including the number of sales they have made, the total revenue generated by their sales, and their current sales targets.
CREATE TABLE sales_reps (
  sales_rep_id INT PRIMARY KEY IDENTITY,
  sales_rep_name VARCHAR(50) NOT NULL,
  sales_target DECIMAL(10,2) NOT NULL
);

INSERT INTO sales_reps (sales_rep_name, sales_target)
VALUES
  ('Saurabh', 100000.00),
  ('Prati', 150000.00),
  ('Kiran', 75000.00);

SELECT s.sales_rep_name, COUNT(o.order_id) AS num_sales, SUM(p.Product_price * o.quantity) AS total_revenue, s.sales_target
FROM sales_reps s
inner JOIN customers c ON c.sales_rep_id = s.sales_rep_id
inner JOIN orders o ON o.customer_id = c.customer_id
inner JOIN product p ON p.product_id = o.product_id
GROUP BY s.sales_rep_name, s.sales_target;

--Merge data from two tables to create a view of all invoices issued to customers, 
--including the total amount due, the date the invoice was issued, and the date by which payment is due.
CREATE TABLE invoices (
  invoice_id INT PRIMARY KEY IDENTITY,
  customer_id INT,
  invoice_number VARCHAR(50),
  total_amount_due FLOAT,
  invoice_date DATE,
  payment_due_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO invoices (customer_id, invoice_number, total_amount_due, invoice_date, payment_due_date)
VALUES (1,'INVOICE-1', 100.00, '2023-04-20', '2023-05-20'),
       (2,'INVOICE-2', 200.00, '2023-04-25', '2023-05-25'),
       (3,'INVOICE-3', 300.00, '2023-04-15', '2023-05-15');

CREATE VIEW all_invoices AS
SELECT c.name, i.invoice_number, i.total_amount_due, i.invoice_date, i.payment_due_date
FROM customers c
INNER JOIN invoices i ON c.customer_id = i.customer_id;
select * from all_invoices

--Merge data from two tables to create a view of all payments made by customers, including the payment amount, 
--the date of the payment, and any additional comments or notes associated with the payment.
CREATE TABLE payments (
    payment_id INT PRIMARY KEY IDENTITY,
    customer_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    comments TEXT
);

INSERT INTO payments (customer_id, payment_date, amount, comments)
VALUES
    (1, '2022-03-01', 100.00, 'Payment for invoice 222'),
    (2, '2022-03-02', 50.00, 'Partial payment for invoice 333'),
    (3, '2022-03-03', 75.00, 'Payment for invoice 325'),
    (1, '2022-03-04', 25.00, 'Payment for invoice 444'),
    (2, '2022-03-05', 100.00, 'Payment for invoice 402');

CREATE VIEW all_customer_payments AS
SELECT c.customer_id, c.name,p.payment_id, p.payment_date, p.amount, p.comments
FROM customers c
INNER JOIN payments p ON c.customer_id = p.customer_id;
select * from all_customer_payments

--Join a table of customer reviews with a table of product ratings to identify all products that have received high ratings from
--customers, along with the comments they have left about the product.

CREATE TABLE product_ratings (
  rating_id INT PRIMARY KEY,
  product_id INT,
  rating DECIMAL(3, 2),
  date_posted DATE,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
insert into product_ratings values(1,1,5,'2023-04-25')
insert into product_ratings values(2,2,4,'2023-04-25')
CREATE TABLE product_reviews (
  review_id INT PRIMARY KEY,
  product_id INT,
  customer_id INT,
  review_text TEXT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
drop table product_reviews
insert into product_reviews values(1,1,1,'Brillent mobile')
insert into product_reviews values(2,2,2,'Please Do not by this Mobile')
SELECT 
  product.product_name,
  product_ratings.rating,
  product_reviews.review_text
FROM 
  product
  JOIN product_ratings ON product.product_id = product_ratings.product_id
  JOIN product_reviews ON product.product_id = product_reviews.product_id
WHERE 
  product_ratings.rating >=5;

  --Join a table of customer orders with a table of inventory items to identify all orders that have not yet been fulfilled, 
  --along with the expected delivery date for each order

  CREATE TABLE inventory (
   item_id INT PRIMARY KEY,
   item_name VARCHAR(50) NOT NULL,
   description VARCHAR(200),
   quantity INT NOT NULL,
   warehouse_id INT NOT NULL,
   last_updated DATETIME DEFAULT GETDATE()
);
