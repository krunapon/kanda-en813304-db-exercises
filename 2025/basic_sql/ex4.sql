-- Cartesian product (usually not desired)
SELECT * FROM students, courses;

-- Proper join to find students in CS department
SELECT s.first_name, s.last_name, c.course_name
FROM students s, courses c, enrollments e
WHERE s.student_id = e.student_id 
  AND c.course_id = e.course_id 
  AND c.department = 'Computer Science';


SELECT s.first_name, s.last_name, c.course_name
FROM students s, courses c, enrollments e
WHERE s.student_id = e.student_id 
  AND c.course_id = e.course_id 
  AND c.department = 'Mathematics';


SELECT c.course_id, c.course_name, c.department, c.credits
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

SELECT c.department,
       COUNT(DISTINCT s.student_id) as student_count,
       ROUND(AVG(s.gpa), 2) as average_gpa
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.department;

-- Find students with higher GPA than any CS student
SELECT DISTINCT t1.first_name, t1.last_name
FROM students AS t1, students AS t2, enrollments e, courses c
WHERE t1.gpa > t2.gpa 
  AND t2.student_id = e.student_id
  AND e.course_id = c.course_id
  AND c.department = 'Computer Science';