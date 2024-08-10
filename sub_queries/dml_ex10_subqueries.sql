-- 1. Find all employees who work on projects with a budget higher than the average project budget.
SELECT DISTINCT e.name
FROM employee e
JOIN assignment a ON e.emp_id = a.emp_id
JOIN project p ON a.project_id = p.project_id
WHERE p.budget > (SELECT AVG(budget) FROM project);


-- 2. Find all projects that have more than 1 employee assigned to them. 
SELECT p.name AS project_name
FROM project p
WHERE (
    SELECT COUNT(*)
    FROM assignment a
    WHERE a.project_id = p.project_id
) > 1;

-- 3. Increase the salary by 10% for employees who are working on projects with a budget over $500,000. 
UPDATE employee
SET salary = salary * 1.1
WHERE emp_id IN (
    SELECT DISTINCT a.emp_id
    FROM assignment a
    JOIN project p ON a.project_id = p.project_id
    WHERE p.budget > 500000
);

-- 4. Find the company with the highest average employee salary
WITH avg_salaries AS (
    SELECT c.company_id, c.name, AVG(e.salary) AS avg_salary
    FROM company c
    JOIN employee e ON c.company_id = e.company_id
    GROUP BY c.company_id, c.name
)
SELECT name, avg_salary
FROM avg_salaries
WHERE avg_salary = (SELECT MAX(avg_salary) FROM avg_salaries);


-- 5. List employees who are not assigned to any project.
SELECT name
FROM employee
WHERE emp_id NOT IN (SELECT emp_id FROM assignment);


-- 6. Add new assignments for employees who are currently not assigned to any project in their own company. 
INSERT INTO assignment (emp_id, project_id, role) 
SELECT e.emp_id, p.project_id, 'New Member' 
FROM employee e JOIN project p ON e.company_id = p.company_id 
WHERE NOT EXISTS (     
    SELECT 1 FROM assignment a
     WHERE a.emp_id = e.emp_id );

-- Extra credits
-- 1. List all companies along with their highest paid employees. 
SELECT c.name AS company_name, e.name AS employee_name, e.salary
FROM company c
JOIN employee e ON c.company_id = e.company_id
WHERE (c.company_id, e.salary) IN (
    SELECT company_id, MAX(salary)
    FROM employee
    GROUP BY company_id
);

-- 2. Find the employee with the highest salary in each department, but only for departments with more than one employee.

WITH dept_counts AS (
    SELECT department, COUNT(*) AS emp_count
    FROM employee
    GROUP BY department
    HAVING COUNT(*) > 1
)
SELECT e.department, e.name, e.salary
FROM employee e
JOIN dept_counts dc ON e.department = dc.department
WHERE (e.department, e.salary) IN (
    SELECT department, MAX(salary)
    FROM employee
    GROUP BY department
);