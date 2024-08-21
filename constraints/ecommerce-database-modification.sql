-- Step 1: Add new table for product categories
CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Step 2: Modify Products table to include category foreign key
ALTER TABLE Products
ADD COLUMN CategoryID INT;

-- Step 3: Add foreign key constraint to Products table
ALTER TABLE Products
ADD CONSTRAINT fk_product_category
FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID);

-- Step 4: Update existing constraints and add new ones

-- Add NOT NULL constraints to existing tables
ALTER TABLE Customers
MODIFY COLUMN Name VARCHAR(100) NOT NULL,
MODIFY COLUMN Email VARCHAR(100) NOT NULL UNIQUE;

ALTER TABLE Orders
MODIFY COLUMN OrderDate DATE NOT NULL,
MODIFY COLUMN TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0);

ALTER TABLE Products
MODIFY COLUMN ProductName VARCHAR(100) NOT NULL,
MODIFY COLUMN Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
MODIFY COLUMN StockQuantity INT NOT NULL CHECK (StockQuantity >= 0);

ALTER TABLE OrderItems
MODIFY COLUMN Quantity INT NOT NULL CHECK (Quantity > 0);

-- Add foreign key constraints to existing tables (if not already present)
ALTER TABLE Orders
ADD CONSTRAINT fk_order_customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE OrderItems
ADD CONSTRAINT fk_orderitem_order
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
ADD CONSTRAINT fk_orderitem_product
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- Step 5: Create an index on frequently used columns
CREATE INDEX idx_product_category ON Products(CategoryID);
CREATE INDEX idx_order_customer ON Orders(CustomerID);
CREATE INDEX idx_orderitem_order ON OrderItems(OrderID);
CREATE INDEX idx_orderitem_product ON OrderItems(ProductID);
