create database if not exists integrity_db;
use integrity_db;

-- Create Accounts table
CREATE TABLE if not exists Accounts (
    AccountID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Balance DECIMAL(15, 2) NOT NULL CHECK (Balance >= 0),
    AccountType VARCHAR(20) CHECK (AccountType IN ('Checking', 'Savings', 'Credit'))
);

-- Create Transactions table
CREATE TABLE if not exists Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20) CHECK (TransactionType IN ('Deposit', 'Withdrawal', 'Transfer')),
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0 AND Amount <= 10000),
    TransactionDate DATETIME NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

Delete from Accounts;
-- Insert Data 
INSERT INTO Accounts (AccountID, CustomerName, Balance, AccountType) VALUES
(1001, 'John Doe', 10000.00, 'Savings'),
(1002, 'Jane Smith', 5000.00, 'Checking'),
(1003, 'Bob Johnson', 7500.00, 'Savings');

-- Transaction 

START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 2000
WHERE AccountID = 1001;

UPDATE Accounts
SET Balance = Balance + 2000
WHERE AccountID = 1002;

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate) VALUES
(1, 1001, 'Withdrawal', 2000.00, NOW()),
(2, 1002, 'Deposit', 2000.00, NOW());

COMMIT;

-- Constraint balance >= 0 

ALTER TABLE Accounts
ADD CONSTRAINT check_balance_non_negative
CHECK (Balance >= 0);

-- Add constraint to limit transaction amount to 10,000 Baht
ALTER TABLE Transactions
ADD CONSTRAINT check_max_transaction_amount
CHECK (Amount <= 10000);