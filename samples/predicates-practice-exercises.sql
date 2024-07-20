-- Create the employees table
create database if not exists practices_db;

use practices_db;

CREATE TABLE if not exists employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary REAL,
    hire_date TEXT
);

delete from employees;
-- Insert sample data into employees
INSERT INTO employees (id, name, department, salary, hire_date) VALUES
(1, 'John Doe', 'IT', 75000.00, '2015-03-15'),
(2, 'Jane Smith', 'HR', 65000.00, '2018-07-22'),
(3, 'James Brown', 'Marketing', 72000.00, '2016-01-10'),
(4, 'Jennifer Wilson', 'IT', 80000.00, '2019-11-05'),
(5, 'Michael Johnson', 'Finance', 90000.00, '2014-09-18');

-- Create the products table
CREATE TABLE if not exists products (
    id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    price REAL,
    stock INTEGER
);

delete from products;
-- Insert sample data into products
INSERT INTO products (id, name, category, price, stock) VALUES
(11, 'iPhone 12', 'Electronics', 999.99, 0),
(22, 'Samsung Galaxy S21', 'Electronics', 899.99, 0),
(33, 'Laptop Pro', 'Electronics', 1299.99, 25),
(44, 'Wireless Earphones', 'Electronics', 159.99, 100),
(55, 'Smart Watch', 'Electronics', 299.99, 0);

-- Create the orders table
CREATE TABLE if not exists orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    total_amount REAL
);

delete from orders;

-- Insert sample data into orders
INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(111, 101, '2023-06-01', 1299.99),
(222, 102, '2023-06-15', 999.99),
(333, 103, '2023-06-30', 459.98),
(444, 104, '2023-07-05', 1199.99),
(555, 105, '2023-07-10', 299.99);

-- Exercise 1: Find employees whose names start with 'J' and have been with the company for more than 5 years
SELECT * FROM employees
WHERE name LIKE 'J%'
AND hire_date <= date_sub(current_date(), interval 5 year);

-- Output:
-- id | name        | department | salary  | hire_date
-- 1  | John Doe    | IT         | 75000.0 | 2015-03-15
-- 3  | James Brown | Marketing  | 72000.0 | 2016-01-10

-- Exercise 2: List products that have 'phone' in their name (case insensitive) and are currently out of stock
SELECT * FROM products
WHERE LOWER(name) LIKE '%phone%'
AND stock = 0;

-- Output:
-- id | name                | category    | price   | stock
-- 2  | Samsung Galaxy S21  | Electronics | 899.99  | 0

-- Exercise 3: Retrieve employees who are not in the 'HR' department and earn more than the average salary
SELECT * FROM employees
WHERE department != 'HR'
AND salary > (SELECT AVG(salary) FROM employees);

-- Output:
-- id | name             | department | salary  | hire_date
-- 4  | Jennifer Wilson  | IT         | 80000.0 | 2019-11-05
-- 5  | Michael Johnson  | Finance    | 90000.0 | 2014-09-18
