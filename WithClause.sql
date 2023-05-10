create database withclause
--CTE=Common table expression
--CTE allowed u to define a temporaty result set, that can be linked immegiatly with the select,insert,update,delete statement or sldo create view
--syntax :- with expression_name(column1,columnname2)
				--as
				--(
				--	CTE Defination
				--)
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    age INT
);
INSERT INTO users (id, name, email, age)
VALUES (1, 'John Smith', 'john.smith@example.com', 30),
       (2, 'Jane Doe', 'jane.doe@example.com', 25),
       (3, 'Bob Johnson', 'bob.johnson@example.com', 40);
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10,2),
    description TEXT
);
INSERT INTO products (id, name, price, description)
VALUES (1, 'Product A', 19.99, 'This is a description of Product A.'),
       (2, 'Product B', 29.99, 'This is a description of Product B.'),
       (3, 'Product C', 39.99, 'This is a description of Product C.');


CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO orders (id, user_id, product_id, quantity, order_date)
VALUES (1, 1, 2, 3, '2023-05-01'),
       (2, 2, 3, 1, '2023-05-02'),
       (3, 1, 1, 2, '2023-05-03');

--calculates the total sales of each product based on the "orders" table. 
WITH sales AS (
    SELECT product_id, SUM(quantity) AS total_sales
    FROM orders
    GROUP BY product_id
)
--select 'Hello World'
SELECT name, total_sales
FROM sales
JOIN products ON sales.product_id = products.id
ORDER BY total_sales DESC;
