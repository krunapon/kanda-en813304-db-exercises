-- a) Create tables with appropriate constraints

-- Create Genres table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL UNIQUE
);

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    PublicationYear INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0)
);

-- Create Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE NOT NULL,
    MembershipType VARCHAR(20) CHECK (MembershipType IN ('Standard', 'Premium', 'Student'))
);

-- Create Loans table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    CHECK (ReturnDate IS NULL OR ReturnDate >= LoanDate)
);

-- Create BookGenres table
CREATE TABLE BookGenres (
    BookID INT,
    GenreID INT,
    PRIMARY KEY (BookID, GenreID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- b) Insert minimal data to demonstrate that books currently loaned cannot be deleted

-- Insert sample data
INSERT INTO Genres (GenreID, GenreName) VALUES (1, 'Fiction'), (2, 'Non-Fiction');

INSERT INTO Books (BookID, Title, Author, ISBN, PublicationYear, Quantity) VALUES
(1, 'Sample Book 1', 'Author 1', '1234567890123', 2020, 5),
(2, 'Sample Book 2', 'Author 2', '2345678901234', 2021, 3);

INSERT INTO Members (MemberID, Name, Email, JoinDate, MembershipType) VALUES
(1, 'John Doe', 'john@example.com', '2023-01-01', 'Standard');

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate) VALUES
(1, 1, 1, '2023-08-01', '2023-08-15');

INSERT INTO BookGenres (BookID, GenreID) VALUES (1, 1), (2, 2);

select * from books;
select * from loans;

-- c) Resolve the insert violation and modify the Loans table

-- First, delete the book information from the Loans table
DELETE FROM Loans WHERE BookID = 1;

-- Now we can delete the book
DELETE FROM Books WHERE BookID = 1;

select * from books;
select * from loans;

alter table loans
add constraint fk_books
foreign key (BookID) references Books(BookID) on delete cascade;
