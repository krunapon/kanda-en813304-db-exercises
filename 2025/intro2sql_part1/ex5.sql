-- Order students by GPA (highest first)
SELECT * FROM students ORDER BY gpa DESC;

-- Find students with GPA between 3.5 and 4.0
SELECT first_name, last_name, gpa 
FROM students 
WHERE gpa BETWEEN 3.5 AND 4.0;

-- Multiple column ordering
SELECT * FROM students 
ORDER BY last_name ASC, first_name ASC;

select course_name, credits 
from courses 
order by credits desc, course_name asc;
 
select first_name, last_name, e.enrollment_date 
from enrollments e, students s
where e.student_id = s.student_id
and e.enrollment_date between '2024-01-21' and '2024-01-22';