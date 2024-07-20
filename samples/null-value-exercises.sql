-- Assuming we're using the employees table from the previous examples

-- Exercise 1: Find employees who might be in the IT department
-- This exercise demonstrates NULL behavior in WHERE clauses

SELECT id, name, department, salary
FROM employees
WHERE department = 'IT' OR department IS NULL;

-- Exercise 2: Join operation with NULL values
-- First, let's create a new table for departments

CREATE TABLE departments (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
('IT', 'Information Technology', 'Building A'),
('HR', 'Human Resources', 'Building B'),
('FIN', 'Finance', 'Building C'),
('MKT', 'Marketing', NULL);

-- Now, let's perform a LEFT JOIN and filter the results

SELECT e.id, e.name, e.department, d.location
FROM employees e
LEFT JOIN departments d ON e.department = d.dept_name
WHERE d.location IS NULL OR e.salary IS NULL;
