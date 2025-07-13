-- Find students whose first name contains 'John'
SELECT * FROM students WHERE first_name LIKE '%John%';

-- Find students with exactly 4-character student IDs starting with '2024'
SELECT * FROM students WHERE student_id LIKE '2024___';

-- Convert names to uppercase
SELECT UPPER(first_name) AS upper_first_name, 
       UPPER(last_name) AS upper_last_name 
FROM students;

select course_name from courses where course_name like 'En%';

select first_name, last_name from students where last_name like '%n';

select course_name from courses where course_name like '%ng%';

-- Extract the first 3 characters of course names
SELECT course_id, 
       course_name,
       LEFT(course_name, 3) AS name_prefix,
       LENGTH(course_name) AS name_length
FROM courses
ORDER BY course_name;

-- Concatenate first and last names
SELECT student_id,
       first_name,
       last_name,
       CONCAT(first_name, ' ', last_name) AS full_name,
       CONCAT(last_name, ', ', first_name) AS formal_name
FROM students
ORDER BY last_name;

-- Find the length of student email addresses
SELECT student_id,
       first_name,
       last_name,
       email,
       LENGTH(email) AS email_length,
       CHAR_LENGTH(email) AS email_char_count
FROM students
ORDER BY email_length DESC;