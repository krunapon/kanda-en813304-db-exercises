-- Problem 1: List the names of instructors along with their department names using a natural join.
SELECT name, dept_name
FROM instructors NATURAL JOIN departments;


-- Problem 2: Find all courses taught in the 'Taylor' building along with the instructor names.
SELECT c.title, i.name, s.room_number
FROM courses c
JOIN sections s ON c.course_id = s.course_id
JOIN teaches t ON s.section_id = t.section_id
JOIN instructors i ON t.instructor_id = i.instructor_id
WHERE s.building = 'Taylor';



-- Problem 3: Create a view of department salary totals and then query it to find the department with the highest total salary.
DROP view if exists department_salary_totals;
CREATE VIEW department_salary_totals AS
SELECT d.dept_name, SUM(i.salary) AS total_salary
FROM departments d
JOIN instructors i ON d.dept_id = i.dept_id
GROUP BY d.dept_name;

SELECT dept_name, total_salary
FROM department_salary_totals
WHERE total_salary = (SELECT MAX(total_salary) FROM department_salary_totals); 

-- Problem 4: Create a view for courses offered in Fall 2023, then use it to find courses in the 'Watson' building.
DROP VIEW if exists fall_2023_courses;
CREATE VIEW fall_2023_courses AS
SELECT c.course_id, c.title, s.building, s.room_number
FROM courses c
JOIN sections s ON c.course_id = s.course_id
WHERE s.semester = 'Fall' AND s.year = 2023;

SELECT course_id, title, room_number
FROM fall_2023_courses
WHERE building = 'Watson';

-- Problem 5: Create a view of instructors with their course loads and display it.
DROP VIEW if exists instructor_course_load;
CREATE VIEW instructor_course_load AS
SELECT i.instructor_id, i.name, COUNT(t.section_id) AS course_count, i.salary
FROM instructors i
LEFT JOIN teaches t ON i.instructor_id = t.instructor_id
GROUP BY i.instructor_id;
select * from instructor_course_load;


-- Problem 6: Create a materialized view of the average credits per department, then query it to find departments with above-average credits.
-- Note: The syntax for materialized views might vary depending on the database system
drop table dept_avg_credits;
CREATE table dept_avg_credits AS
SELECT d.dept_name, AVG(c.credits) AS avg_credits
FROM departments d
JOIN courses c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_name, avg_credits
FROM dept_avg_credits
WHERE avg_credits > (SELECT AVG(avg_credits) FROM dept_avg_credits);

-- Extra problem 7: Use a subquery in the FROM clause to find the average salary of instructors who teach in the 'Taylor' building.
SELECT AVG(salary) AS avg_salary
FROM (
    SELECT DISTINCT i.instructor_id, i.salary
    FROM instructors i
    JOIN teaches t ON i.instructor_id = t.instructor_id
    JOIN sections s ON t.section_id = s.section_id
    WHERE s.building = 'Taylor'
) AS taylor_instructors;


-- Extra problem 8: Use the WITH clause to create a temporary named result set of instructors with above-average salaries, then join it with the departments table to show their department names.
WITH high_paid_instructors AS (
    SELECT *
    FROM instructors
    WHERE salary > (SELECT AVG(salary) FROM instructors)
)
SELECT h.name, d.dept_name
FROM high_paid_instructors h
JOIN departments d ON h.dept_id = d.dept_id;
