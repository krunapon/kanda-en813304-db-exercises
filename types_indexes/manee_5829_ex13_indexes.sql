create database if not exists types_indexes;

use types_indexes;

drop table books;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn CHAR(13) UNIQUE,
    publication_year YEAR,
    genre VARCHAR(50),
    num_pages SMALLINT UNSIGNED,
    available_copies TINYINT UNSIGNED,
    last_borrowed_date DATE
);

CREATE INDEX idx_author ON books(author);
CREATE INDEX idx_title ON books(title);
CREATE UNIQUE INDEX idx_isbn ON books(isbn);


CREATE ROLE librarian if not exists;
CREATE ROLE assistant if not exists;
CREATE ROLE member if not exists;

GRANT ALL PRIVILEGES ON books TO librarian;

GRANT SELECT, UPDATE (available_copies, last_borrowed_date) ON books TO assistant;

GRANT SELECT (title, author, available_copies) ON books TO member;


-- If not, create the user
CREATE USER if not exists Jane IDENTIFIED BY 'password';
CREATE USER if not exists Bob IDENTIFIED BY 'password';

GRANT librarian TO Jane;
GRANT assistant TO Bob;

Drop table members;
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL,
    membership_type ENUM('Regular', 'Premium') NOT NULL
);

CREATE UNIQUE INDEX idx_email ON members(email);

GRANT ALL PRIVILEGES ON members TO librarian;
GRANT SELECT, UPDATE (membership_type) ON members TO assistant;

drop view member_summary;
CREATE VIEW member_summary AS
SELECT member_id, CONCAT(first_name, ' ', last_name) AS full_name, membership_type
FROM members;

GRANT SELECT ON member_summary TO member;
