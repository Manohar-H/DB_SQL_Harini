-- Description: QAP-2 Database - Problem 2 SQL script
-- Author: Harini Manohar
-- Date: Feb 7th 2025

-- Problem 2: Online Store Inventory and Orders System --

-- Drop tables if they exist
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

-- Create tables
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- Insert data
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 1200.00, 10),
('Smartphone', 800.00, 20),
('Tablet', 500.00, 15),
('Headphones', 100.00, 30),
('Smartwatch', 250.00, 25);

INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Robert', 'Johnson', 'robert.johnson@example.com'),
('Emily', 'Davis', 'emily.davis@example.com');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-02-01'),
(2, '2024-02-02'),
(3, '2024-02-03'),
(4, '2024-02-04'),
(1, '2024-02-05');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), (1, 2, 2),
(2, 3, 1), (2, 4, 2),
(3, 5, 1), (3, 2, 1),
(4, 1, 2), (4, 3, 1),
(5, 4, 1), (5, 5, 1);

-- Queries
SELECT product_name, stock_quantity FROM products;

SELECT p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
WHERE oi.order_id = 1;

SELECT o.id AS order_id, oi.product_id, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN customers c ON o.customer_id = c.id
WHERE c.first_name = 'John' AND c.last_name = 'Doe';

-- Update stock after an order
UPDATE products
SET stock_quantity = stock_quantity - oi.quantity
FROM order_items oi
WHERE products.id = oi.product_id AND oi.order_id = 1;

-- Delete an order and related items
DELETE FROM order_items WHERE order_id = 2;
DELETE FROM orders WHERE id = 2;