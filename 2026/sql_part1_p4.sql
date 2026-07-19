-- ============================================================
-- Problem 4: books table for LIKE pattern practice
-- ============================================================
DROP TABLE IF EXISTS books;

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(60) NOT NULL
);

INSERT INTO books (title) VALUES
-- 4a) matches LIKE 'The%Adventure'  (starts "The", ends "Adventure")
('The Great Adventure'),        -- match
('The Last Jungle Adventure'),  -- match
('The Adventure'),              -- match (% matches just the space)
-- 4a) decoys
('The Great Journey'),          -- starts The, wrong ending
('A Grand Adventure'),          -- ends Adventure, wrong start
('The Adventure Begins'),       -- does not END with Adventure
-- 4b) matches LIKE '___ of%'  (exactly 3 chars before " of")
('Age of Empires'),             -- match (Age = 3 chars)
('Art of War'),                 -- match (Art = 3 chars)
('Sea of Stars'),               -- match (Sea = 3 chars)
-- 4b) decoys
('Lord of the Rings'),          -- 4 chars before of
('Book of Life'),               -- 4 chars before of
('An of Grammar');               -- 2 chars before of


SELECT database();
-- Expected answers:
-- 4a) 
SELECT title FROM books WHERE title LIKE 'The%Adventure';
-- 4b) 
SELECT title FROM books WHERE title LIKE '___ of%';
--     Note: '___of%' (no space) would NOT match "Age of Empires"
--     because the 4th character is a space — a good discussion
--     point about counting the space in LIKE patterns.