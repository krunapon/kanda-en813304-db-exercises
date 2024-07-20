-- Create a sample table with null values
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Insert sample data with null values
INSERT INTO employees (id, name, department, salary, hire_date) VALUES
(1, 'John Doe', 'IT', 75000.00, '2020-01-15'),
(2, 'Jane Smith', 'HR', NULL, '2019-05-20'),
(3, 'Mike Johnson', NULL, 62000.00, '2021-03-10'),
(4, 'Sarah Brown', 'Finance', 80000.00, NULL),
(5, 'Tom Wilson', 'IT', 70000.00, '2018-11-01'),
(6, 'Emily Davis', 'Marketing', NULL, '2022-07-01'),
(7, 'Chris Lee', NULL, 55000.00, NULL);


-- Example 1: Using IS NOT NULL in WHERE clause
SELECT * FROM employees WHERE salary IS NOT NULL;

-- Example 2: Comparison with NULL using three-valued logic
SELECT * FROM employees WHERE salary > 70000 OR salary <= 70000;

-- Example 3: NULL in arithmetic operations
SELECT name, salary, salary + 5000 AS potential_salary FROM employees;


-- Exercise 4: Find employees who might be in the IT department
-- This exercise demonstrates NULL behavior in WHERE clauses

SELECT id, name, department, salary
FROM employees
WHERE department = 'IT' OR department IS NULL;

-- Exercise 5: Join operation with NULL values
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

