-- 1. Find all students majoring in Computer Science with a GPA above 3.5.
-- Basic SELECT and WHERE:
SELECT * FROM Students
WHERE major = 'Computer Science' AND gpa > 3.5;



-- 2. List all students and the courses they are enrolled -- in for the Fall 2023 semester.
-- JOIN operation:
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.semester = 'Fall' AND e.year = 2023;

-- 3. Calculate the average GPA for each major.
-- Aggregate function with GROUP BY:
 SELECT major, AVG(gpa) as average_gpa
FROM Students
GROUP BY major;


-- 4. Find all courses that have a higher number of credits 
-- than the average credits of all courses.
-- Subquery in WHERE clause:
SELECT *
FROM Courses
WHERE credits > (SELECT AVG(credits) FROM Courses);


-- 5. List departments with a total budget greater than $450,000.
-- HAVING clause:
SELECT department_name, SUM(budget) as total_budget
FROM Departments
GROUP BY department_name
HAVING total_budget > 450000;


-- 6. List all Computer Science students and all students enrolled in MATH301.
-- UNION operation
SELECT first_name, last_name
FROM Students
WHERE major = 'Computer Science'
UNION
SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 'MATH301';

-- 7. Find students who have a higher GPA than the average GPA of their major.
-- Correlated subquery:
SELECT *
FROM Students s1
WHERE gpa > (
    SELECT AVG(gpa)
    FROM Students s2
    WHERE s2.major = s1.major
);

-- 8. Rank students within each major based on their GPA
-- Window function:
SELECT 
    first_name,
    last_name,
    major,
    gpa,
    RANK() OVER (PARTITION BY major ORDER BY gpa DESC) as rank_in_major
FROM Students;

-- WITH and Subquery
WITH RankedStudents AS (
    SELECT 
        student_id,
        first_name,
        last_name,
        major,
        gpa,
        (SELECT COUNT(DISTINCT gpa) 
         FROM Students s2 
         WHERE s2.major = s1.major AND s2.gpa >= s1.gpa) AS rank_in_major
    FROM 
        Students s1
)
SELECT 
    student_id,
    first_name,
    last_name,
    major,
    gpa,
    rank_in_major
FROM 
    RankedStudents
ORDER BY 
    major, rank_in_major, gpa DESC, student_id;

-- 9. Find the department with the highest average student GPA
-- Common Table Expression (CTE):
WITH DeptAvgGPA AS (
    SELECT d.department_name, AVG(s.gpa) as avg_gpa
    FROM Departments d
    JOIN Courses c ON d.department_name = c.department
    JOIN Enrollments e ON c.course_id = e.course_id
    JOIN Students s ON e.student_id = s.student_id
    GROUP BY d.department_name
)
SELECT department_name, avg_gpa
FROM DeptAvgGPA
WHERE avg_gpa = (SELECT MAX(avg_gpa) FROM DeptAvgGPA);

-- 10. Increase the budget by 10% for departments where the average student GPA is above 3.8.
-- UPDATE statement with subquery:
UPDATE Departments d
JOIN (
    SELECT c.department, AVG(s.gpa) as avg_gpa
    FROM Courses c
    JOIN Enrollments e ON c.course_id = e.course_id
    JOIN Students s ON e.student_id = s.student_id
    GROUP BY c.department
    HAVING avg_gpa > 3.8
) high_gpa ON d.department_name = high_gpa.department
SET d.budget = d.budget * 1.1;
select * from departments;
