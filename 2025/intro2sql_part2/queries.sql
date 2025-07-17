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


SELECT DISTINCT c.course_id, c.course_name, c.department, c.credits
FROM courses c
WHERE EXISTS (
    SELECT 1 FROM enrollments e1 
    WHERE e1.course_id = c.course_id 
      AND e1.semester = 'Spring' 
      AND e1.year = 2024
)
AND EXISTS (
    SELECT 1 FROM enrollments e2 
    WHERE e2.course_id = c.course_id 
      AND e2.semester = 'Fall' 
      AND e2.year = 2024
)
ORDER BY c.course_name;

-- Method 1: Using NOT EXISTS (Recommended)
SELECT DISTINCT s.student_id, s.first_name, s.last_name, s.gpa
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE c.department = 'Computer Science'
  AND NOT EXISTS (
      SELECT 1 
      FROM enrollments e2 
      INNER JOIN courses c2 ON e2.course_id = c2.course_id
      WHERE e2.student_id = s.student_id 
        AND c2.department = 'Mathematics'
  )
ORDER BY s.last_name, s.first_name;

SELECT student_id, first_name, last_name, enrollment_date, gpa
FROM students
WHERE enrollment_date IS NULL OR gpa IS NULL;

SELECT student_id, first_name, last_name,
       COALESCE(gpa, 0.0) AS adjusted_gpa,
       CASE 
         WHEN gpa IS NULL THEN 'Default assigned'
         ELSE 'Original value'
       END AS gpa_source
FROM students;

SELECT c.department, AVG(s.gpa) AS avg_gpa
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE s.gpa IS NOT NULL
GROUP BY c.department
ORDER BY avg_gpa DESC
LIMIT 1;


SELECT s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    s.gpa AS current_gpa,
    COUNT(e.course_id) AS courses_enrolled,
    SUM(c.credits) AS total_credits,
    AVG(c.credits) AS avg_course_credits,
    GROUP_CONCAT(DISTINCT c.department) AS departments
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY s.first_name, s.last_name, s.gpa
HAVING COUNT(e.course_id) > 0
ORDER BY s.gpa DESC;