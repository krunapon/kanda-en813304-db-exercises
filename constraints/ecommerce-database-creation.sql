create database if not exists ecommerce_db;
use ecommerce_db;
-- Create Customers table
drop table if exists OrderItems;
drop table if exists Orders;
drop table if exists Products;
drop table if exists Customers;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Create Orders table
CREATE TABLE if not exists Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Products table
CREATE TABLE if not exists Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0)
);

-- Create OrderItems table
CREATE TABLE if not exists OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


