-- Method 1: Basic NULL check
SELECT student_id, first_name, last_name, email, enrollment_date, gpa
FROM students
WHERE gpa IS NULL;

-- Method 1: Using NOT BETWEEN
SELECT course_id, course_name, credits, department
FROM courses
WHERE credits NOT BETWEEN 3 AND 4

-- Find courses that have no enrolled students
SELECT c.course_id, c.course_name, c.credits, c.department
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;


SELECT s.first_name,
       s.last_name,
       c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE s.gpa > 3.5
ORDER BY s.gpa DESC, s.last_name, c.course_name; 