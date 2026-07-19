use manee_1234_db;

 -- ============================================================
-- Problem 2: instructor table
-- Query to test: COE instructors with salary > 90000
-- Expected result: Somchai and Manee (2 rows)
-- ============================================================

DROP TABLE IF EXISTS instructors;

CREATE TABLE IF NOT EXISTS instructors (
    ID        INT PRIMARY KEY,
    name      VARCHAR(30) NOT NULL,
    dept_name VARCHAR(20),
    salary    DECIMAL(10,2)
);

INSERT INTO instructors (ID, name, dept_name, salary) VALUES
(1, 'Somchai',  'COE',   95000.00),   
(2, 'Manee',    'COE',  120000.00),   
(3, 'Wichai',   'COE',   85000.00),   
(4, 'Chujai',    'COE',   90000.00),   
(5, 'Preecha',  'EE',   110000.00),   
(6, 'Suda',     'ME',    95000.00),   
(7, 'Anong',    'EE',    70000.00);


SELECT DATABASE();

-- Expected answer:
SELECT * FROM instructors
WHERE dept_name = 'COE' AND salary > 90000;
