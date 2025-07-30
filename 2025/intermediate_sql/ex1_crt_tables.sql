-- Create e-commerce database
/*DROP DATABASE IF EXISTS ecommerce_<yourid>_db;
CREATE DATABASE ecommerce_<yourid>_db;
USE ecommerce_<yourid>_db; */

DROP DATABASE IF EXISTS ecommerce_5829_db;
CREATE DATABASE ecommerce_5829_db;
USE ecommerce_5829_db; 

-- Create tables for e-commerce system
CREATE TABLE customers (
    customer_id varchar(10) PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) UNIQUE,
    phone varchar(15),
    registration_date date,
    loyalty_level enum('Bronze', 'Silver', 'Gold', 'Platinum') DEFAULT 'Bronze'
);

CREATE TABLE products (
    product_id varchar(10) PRIMARY KEY,
    product_name varchar(100) NOT NULL,
    category varchar(50),
    price decimal(10,2),
    stock_quantity int DEFAULT 0,
    supplier_id varchar(10)
);

CREATE TABLE orders (
    order_id varchar(15) PRIMARY KEY,
    customer_id varchar(10),
    order_date date NOT NULL,
    total_amount decimal(10,2),
    order_status enum('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    shipping_address text,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id int AUTO_INCREMENT PRIMARY KEY,
    order_id varchar(15),
    product_id varchar(10),
    quantity int NOT NULL,
    unit_price decimal(10,2),
    discount_amount decimal(10,2) DEFAULT 0.00,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE suppliers (
    supplier_id varchar(10) PRIMARY KEY,
    supplier_name varchar(100) NOT NULL,
    contact_person varchar(100),
    country varchar(50),
    rating decimal(3,2)
);

-- Add foreign key for products table
ALTER TABLE products 
ADD CONSTRAINT fk_products_supplier 
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);
