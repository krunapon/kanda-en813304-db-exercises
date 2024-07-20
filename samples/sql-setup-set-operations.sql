-- Create tables
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    borrower_name VARCHAR(100) NOT NULL
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Insert sample data
INSERT INTO authors (author_id, author_name) VALUES
(1, 'George Orwell'),
(2, 'Jane Austen'),
(3, 'Ernest Hemingway'),
(4, 'Virginia Woolf');

INSERT INTO books (book_id, title, author_id) VALUES
(1, '1984', 1),
(2, 'Animal Farm', 1),
(3, 'Pride and Prejudice', 2),
(4, 'Emma', 2),
(5, 'The Old Man and the Sea', 3),
(6, 'To the Lighthouse', 4),
(7, 'Unpublished Manuscript', NULL);

INSERT INTO borrowers (borrower_id, borrower_name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown');

INSERT INTO loans (loan_id, book_id, borrower_id, loan_date) VALUES
(1, 1, 1, '2023-06-01'),
(2, 3, 2, '2023-06-15'),
(3, 5, 1, '2023-07-01');

-- 1. INNER JOIN
-- List all books that have been loaned, showing the book title, borrower name, and loan date
SELECT b.title, br.borrower_name, l.loan_date
FROM books b
INNER JOIN loans l ON b.book_id = l.book_id
INNER JOIN borrowers br ON l.borrower_id = br.borrower_id;

-- 2. LEFT JOIN
-- List all books and their loan status, including books that have never been loaned
SELECT b.title, l.loan_date, br.borrower_name
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
LEFT JOIN borrowers br ON l.borrower_id = br.borrower_id;

-- 3. RIGHT JOIN
-- List all borrowers and their borrowed books, including borrowers who haven't borrowed any books
SELECT br.borrower_name, b.title, l.loan_date
FROM books b
RIGHT JOIN loans l ON b.book_id = l.book_id
RIGHT JOIN borrowers br ON l.borrower_id = br.borrower_id;

-- 4. FULL OUTER JOIN (simulated in MySQL)
-- List all books and all borrowers, showing all possible combinations of loans
SELECT b.title, br.borrower_name, l.loan_date
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
LEFT JOIN borrowers br ON l.borrower_id = br.borrower_id
UNION
SELECT b.title, br.borrower_name, l.loan_date
FROM books b
RIGHT JOIN loans l ON b.book_id = l.book_id
RIGHT JOIN borrowers br ON l.borrower_id = br.borrower_id;
