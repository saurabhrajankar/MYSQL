-- Create the Customers table

CREATE TABLE Customers (
    customerId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50)
);

-- Insert some dummy data into the Customers table
INSERT INTO Customers (customerId, firstName, lastName, email)
VALUES (1, 'John', 'Doe', 'johndoe@example.com'),
       (2, 'Jane', 'Doe', 'janedoe@example.com'),
       (3, 'Bob', 'Smith', 'bobsmith@example.com'),
       (4, 'Alice', 'Jones', 'alicejones@example.com'),
       (5, 'Joe', 'Brown', 'joebrown@example.com');

-- Create the Orders table
CREATE TABLE Orders (
    orderId INT PRIMARY KEY,
    orderDate DATE,
    customerId INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);x

-- Insert some dummy data into the Orders table
INSERT INTO Orders (orderId, orderDate, customerId, amount)
VALUES (1, '2022-01-01', 1, 100.00),
       (2, '2022-01-02', 1, 200.00),
       (3, '2022-01-03', 2, 150.00),
       (4, '2022-01-04', 3, 75.50),
       (5, '2022-01-05', 4, 250.00);

-- Insert some additional dummy data into the Orders table
INSERT INTO Orders (orderId, orderDate, customerId, amount)
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

--Write a query to get : Customer Full Name, OrderId, OrderDate
--Write a query to get : Customer Name, TotalOrderAmount (1 Customer 1 Amount that should be total amount of all orders for that customer)
--Write a query to get : Customer Name, Average Order Amount

select * from customers inner join Orders on Customers.customerId=Orders.customerId
SELECT (lastName +  firstName) as 'Full Name', orders.order_id, orders.order_date
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id;

--select orders.orderId,(lastName +  firstName) as 'Full Name' from Customers

select firstName from customers sum()
