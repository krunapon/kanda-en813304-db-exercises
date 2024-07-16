-- Exercise 1: Basic WHERE clause with comparison operators
-- Find all employees with a salary greater than $70,000.
SELECT * FROM employees WHERE salary > 70000;

-- Exercise 2: Using BETWEEN in WHERE clause
-- Find all employees hired between January 1, 2019, and December 31, 2020.
SELECT * FROM employees WHERE hire_date BETWEEN '2019-01-01' AND '2020-12-31';

-- Exercise 3: Using IN operator in WHERE clause
-- Find all employees in the IT or Finance departments.
SELECT * FROM employees WHERE department IN ('IT', 'Finance');

-- Exercise 4: Using LIKE operator in WHERE clause
-- Find all employees whose last name ends with 'son'.
SELECT * FROM employees WHERE last_name LIKE '%son';


-- Exercise 5: Combining conditions with AND and OR
-- Find all employees in the IT department with a salary greater than $70,000 or employees in -- the HR department with a salary less than $65,000.
SELECT * FROM employees 
WHERE (department = 'IT' AND salary > 70000) 
   OR (department = 'HR' AND salary < 65000);

-- Exercise 6: INNER JOIN
-- List all employees with their department locations.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, d.location
FROM employees e
INNER JOIN departments d ON e.department = d.department_name;


-- Exercise 7: LEFT JOIN
-- List all departments and the employees in each department (if any).
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT JOIN employees e ON d.department_name = e.department;

-- Exercise 8: Multiple JOINs
-- List all employees, their department locations, and the projects they're working on (if any).
SELECT e.first_name, e.last_name, d.location, p.project_name
FROM employees e
JOIN departments d ON e.department = d.department_name
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id
LEFT JOIN projects p ON ep.project_id = p.project_id;

-- Exercise 9: Self-join
-- Find all employees who earn more than their managers.
SELECT e1.first_name, e1.last_name, e1.salary AS employee_salary, 
       e2.first_name AS manager_first_name, e2.last_name AS manager_last_name, e2.salary AS manager_salary
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE e1.salary > e2.salary;
