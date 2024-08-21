create database if not exists transactions;
use transactions;

drop table accounts;
CREATE TABLE accounts (
    account_id VARCHAR(10) PRIMARY KEY,
    balance DECIMAL(10, 2) NOT NULL
);

-- Insert data for accounts A001 and A002
INSERT INTO accounts (account_id, balance) VALUES
('A001', 5000.00),
('A002', 3000.00);

-- Verify the data
SELECT * FROM accounts;


START TRANSACTION;

UPDATE accounts 
SET balance = balance - 1000 
WHERE account_id = 'A001';

UPDATE accounts 
SET balance = balance + 1000 
WHERE account_id = 'A002';

COMMIT;

-- Create the inventory table
drop table if exists inventory;
CREATE TABLE inventory (
    item_id VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into the inventory table
INSERT INTO inventory (item_id, item_name, quantity, price) VALUES
('I001', 'Widget A', 100, 9.99),
('I002', 'Gadget B', 50, 24.99),
('I003', 'Doohickey C', 75, 14.99),
('I004', 'Thingamajig D', 30, 39.99);

-- Verify the data
SELECT * FROM inventory;

-- Transaction to update inventory
START TRANSACTION;

UPDATE inventory SET quantity = quantity - 5 WHERE item_id = 'I001';
-- ... other operations could go here

COMMIT;

START TRANSACTION;
UPDATE inventory SET quantity = quantity + 3 WHERE item_id = 'I001';
-- ... other operations
COMMIT;
-- Verify the changes
SELECT * FROM inventory WHERE item_id = 'I001';