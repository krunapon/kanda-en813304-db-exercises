-- Find students enrolled in courses worth exactly 3 or 4 credits
SELECT DISTINCT s.first_name, s.last_name, s.student_id
FROM students s
WHERE s.student_id IN (
    SELECT e.student_id 
    FROM enrollments e 
    JOIN courses c ON e.course_id = c.course_id
    WHERE c.credits IN (3, 4)
);

-- List departments that have students with GPA above 3.5
SELECT DISTINCT c.department
FROM courses c
WHERE c.course_id IN (
    SELECT e.course_id
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    WHERE s.gpa > 3.5
);

-- Find courses NOT offered in Fall semester
SELECT course_name, department, course_id
FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM enrollments
    WHERE semester = 'Fall'
    AND course_id IS NOT NULL
);

-- Find courses with credits equal to SOME Mathematics course
SELECT course_name, credits, department
FROM courses
WHERE credits = SOME (
    SELECT credits 
    FROM courses 
    WHERE department = 'Mathematics'
    AND credits IS NOT NULL
);

--List students with GPA higher than ALL students in English courses
SELECT s.first_name, s.last_name, s.gpa
FROM students s
WHERE s.gpa > ALL (
    SELECT s2.gpa 
    FROM students s2
    JOIN enrollments e ON s2.student_id = e.student_id
    JOIN courses c ON e.course_id = c.course_id
    WHERE c.department = 'English' 
    AND s2.gpa IS NOT NULL
);

--  Find departments where average credits is greater than ANY other department
SELECT c1.department, AVG(c1.credits) as avg_credits
FROM courses c1
WHERE c1.credits IS NOT NULL
GROUP BY c1.department
HAVING AVG(c1.credits) > ANY (
    SELECT AVG(c2.credits)
    FROM courses c2
    WHERE c2.department != c1.department
    AND c2.credits IS NOT NULL
    GROUP BY c2.department
);

-- Find students who have received an 'A' grade in any course
SELECT DISTINCT s.first_name, s.last_name, s.student_id
FROM students s
WHERE EXISTS (
    SELECT 1 
    FROM enrollments e 
    WHERE e.student_id = s.student_id 
    AND e.grade = 'A'
);


-- List courses that have no students with GPA below 3.0
SELECT c.course_name, c.department, c.course_id
FROM courses c
WHERE NOT EXISTS (
    SELECT 1 
    FROM enrollments e 
    JOIN students s ON e.student_id = s.student_id
    WHERE e.course_id = c.course_id 
    AND s.gpa < 3.0
);

-- Find students enrolled in courses from at least 2 different departments
SELECT s.first_name, s.last_name, s.student_id
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM enrollments e1
    JOIN courses c1 ON e1.course_id = c1.course_id
    WHERE e1.student_id = s.student_id
    AND EXISTS (
        SELECT 1
        FROM enrollments e2
        JOIN courses c2 ON e2.course_id = c2.course_id
        WHERE e2.student_id = s.student_id
        AND c2.department != c1.department
    )
);

-- Alternative solution using GROUP BY:
SELECT s.first_name, s.last_name, s.student_id
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM enrollments e1
    JOIN courses c1 ON e1.course_id = c1.course_id
    WHERE e1.student_id = s.student_id
    AND EXISTS (
        SELECT 1
        FROM enrollments e2
        JOIN courses c2 ON e2.course_id = c2.course_id
        WHERE e2.student_id = s.student_id
        AND c2.department != c1.department
    )
);

SELECT s.first_name, s.last_name, s.student_id
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(DISTINCT c.department) >= 2;