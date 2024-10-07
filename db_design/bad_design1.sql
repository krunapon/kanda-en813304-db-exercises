create database sample_dbs;
use sample_dbs;
-- Create the poorly designed Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    BorrowerName VARCHAR(100),
    BorrowerAddress VARCHAR(200),
    BorrowDate DATE
);

-- Insert sample data to illustrate the problems
INSERT INTO Books (BookID, Title, Author, BorrowerName, BorrowerAddress, BorrowDate)
VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'John Smith', '123 Main St, Anytown, USA', '2023-06-01'),
(2, '1984', 'George Orwell', 'John Smith', '123 Main St, Anytown, USA', '2023-06-02'),
(3, 'Pride and Prejudice', 'Jane Austen', 'Sarah Johnson', '456 Elm St, Othertown, USA', '2023-06-03'),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', NULL, NULL, NULL),
(5, 'To Kill a Mockingbird', 'Harper Lee', 'Sarah Johnson', '456 Elm St, Othertown, USA', '2023-06-05');

-- Queries to demonstrate the problems

-- 1. Redundancy: BorrowerName and BorrowerAddress are repeated
SELECT * FROM Books WHERE BorrowerName = 'John Smith';

-- 2. Update Anomaly: Changing a borrower's address requires multiple updates
UPDATE Books SET BorrowerAddress = '789 Oak St, Newtown, USA' WHERE BorrowerName = 'John Smith';

-- 3. Insertion Anomaly: Cannot add a new borrower without them borrowing a book
-- This would fail:
-- INSERT INTO Books (BookID, BorrowerName, BorrowerAddress) VALUES (6, 'Emma Watson', '321 Pine St, Hollywood, USA');

-- 4. Deletion Anomaly: Removing a book also removes borrower information
DELETE FROM Books WHERE Title = 'Pride and Prejudice';

-- 5. Data Integrity Issues: The same book can have different authors
SELECT * FROM Books WHERE Title = 'To Kill a Mockingbird';

-- 6. Null Values: Books not currently borrowed have null borrower information
SELECT * FROM Books WHERE BorrowerName IS NULL;