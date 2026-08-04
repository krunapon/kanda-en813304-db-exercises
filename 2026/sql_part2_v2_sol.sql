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

-- Exercise 10: Using the NOT operator
-- Find employees who are neither in IT nor hired before 2019.
SELECT * FROM employees
WHERE NOT (department = 'IT' OR hire_date < '2019-01-01');

-- Exercise 11: Find all employees who are managers — i.e., at least one other employee reports to them. (EXISTS)
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM employees r WHERE r.manager_id = e.employee_id);
-- expect: John, Jane, Mike, Emily

-- Exercise 12: Find employees who earn more than at least one employee in HR. (> ANY)
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department = 'HR');
-- > ANY = greater than the MIN of the set (62000) → all except Sarah

-- Exercise 13: Find employees who earn more than every employee in HR (> ALL)
SELECT * FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department = 'HR');
-- > ALL = greater than the MAX of the set (65000) → 6 employees

-- Exercise 14: Report total employee count, average, minimum, and maximum salary, and total salary expense. (COUNT/AVG/MIN/MAX/SUM)
SELECT COUNT(*) AS total_employees,
       AVG(salary) AS avg_salary,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary,
       SUM(salary) AS total_salary_expense
FROM employees;


-- Exercise 15: Count how many different departments employees belong to. (COUNT DISTINCT)
SELECT COUNT(DISTINCT department) AS department_count FROM employees;  

-- Exercise 16: Show COUNT(*) next to COUNT(manager_id) to demonstrate that COUNT(*) counts every row while COUNT(column) ignores NULLs. (NULL + aggregates, slide 34)
SELECT COUNT(*) AS all_employees,
       COUNT(manager_id) AS with_manager
FROM employees;

-- Exercise 17: Find the number of employees in each department. (GROUP BY + COUNT)
SELECT department, COUNT(*) AS num_employees
FROM employees GROUP BY department;

-- Exercise 18: Find the average salary per department, highest first. (GROUP BY + ORDER BY)
SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department ORDER BY avg_salary DESC;

-- Exercise 19: Find departments with more than one employee. (HAVING + COUNT)
SELECT department, COUNT(*) AS num_employees
FROM employees GROUP BY department HAVING COUNT(*) > 1;

-- Exercise 20: Find departments whose average salary exceeds $70,000 — contrast HAVING (post-grouping) with WHERE (pre-grouping). (HAVING + AVG, slide 39)
SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department HAVING AVG(salary) > 70000;