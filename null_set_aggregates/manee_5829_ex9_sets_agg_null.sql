-- Exercises

-- 1. Set Operations: Find all students who are either in Computer Science or Physics
SELECT name FROM students WHERE major = 'Computer Science'
UNION
SELECT name FROM students WHERE major = 'Physics';

-- 2. Set Operations: Find students who are taking CS101 but not CS201
SELECT e1.student_id
FROM enrollments e1
WHERE e1.course_id = 'CS101'
EXCEPT
SELECT e2.student_id
FROM enrollments e2
WHERE e2.course_id = 'CS201';


-- 3. Null Values: Find all students with a NULL GPA
SELECT name FROM students WHERE gpa IS NULL;

-- 4. Null Values: Find all enrollments with a NULL grade
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade IS NULL;

-- 5. Aggregate Functions: Calculate the average GPA for each major
SELECT major, AVG(gpa) as avg_gpa
FROM students
GROUP BY major;

-- 6. Aggregate Functions: Find the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) as num_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 7. Aggregate Functions: Find the student(s) with the highest GPA
SELECT name, gpa
FROM students
WHERE gpa = (SELECT MAX(gpa) FROM students);

-- 8. Aggregate Functions with HAVING: Find majors with more than one student
SELECT major, COUNT(*) as num_students
FROM students
GROUP BY major
HAVING COUNT(*) > 1;
