select first_name from students where gpa > 3.8;
select course_name from courses where department = "Computer Science";
SELECT first_name, last_name, email FROM students ORDER BY last_name ASC, first_name ASC;
SELECT DISTINCT department FROM courses;
SELECT student_id, first_name, gpa, gpa*25 AS percentage FROM students;