-- Create and populate the 'departments' table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Create and populate the 'instructors' table
CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);

INSERT INTO instructors (instructor_id, name, dept_id) VALUES
(101, 'John Doe', 1),
(102, 'Jane Smith', 2),
(103, 'Bob Johnson', 1),
(104, 'Alice Brown', 3),
(105, 'Charlie Davis', NULL);

-- 1. INNER JOIN
SELECT d.dept_name, i.name
FROM departments d
INNER JOIN instructors i ON d.dept_id = i.dept_id;

-- Result:
-- dept_name       | name
-- ----------------|------------
-- Computer Science| John Doe
-- Computer Science| Bob Johnson
-- Mathematics     | Jane Smith
-- Physics         | Alice Brown

-- 2. LEFT JOIN
SELECT d.dept_name, i.name
FROM departments d
LEFT JOIN instructors i ON d.dept_id = i.dept_id;

-- Result:
-- dept_name       | name
-- ----------------|------------
-- Computer Science| John Doe
-- Computer Science| Bob Johnson
-- Mathematics     | Jane Smith
-- Physics         | Alice Brown
-- Chemistry       | NULL
-- Biology         | NULL

-- 3. RIGHT JOIN
SELECT d.dept_name, i.name
FROM departments d
RIGHT JOIN instructors i ON d.dept_id = i.dept_id;

-- Result:
-- dept_name       | name
-- ----------------|------------
-- Computer Science| John Doe
-- Mathematics     | Jane Smith
-- Computer Science| Bob Johnson
-- Physics         | Alice Brown
-- NULL            | Charlie Davis

-- 4. FULL JOIN
-- Note: Not all databases support FULL JOIN directly.
-- This example uses a UNION of LEFT and RIGHT JOINs to simulate a FULL JOIN.
SELECT d.dept_name, i.name
FROM departments d
LEFT JOIN instructors i ON d.dept_id = i.dept_id
UNION
SELECT d.dept_name, i.name
FROM departments d
RIGHT JOIN instructors i ON d.dept_id = i.dept_id
WHERE d.dept_id IS NULL;

-- Result:
-- dept_name       | name
-- ----------------|------------
-- Computer Science| John Doe
-- Computer Science| Bob Johnson
-- Mathematics     | Jane Smith
-- Physics         | Alice Brown
-- Chemistry       | NULL
-- Biology         | NULL
-- NULL            | Charlie Davis
