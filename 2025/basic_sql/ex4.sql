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