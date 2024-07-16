-- Create tables

use university university_db_5829;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(50),
    credits INT
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    year INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE IF NOT EXISTS professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

delete from enrollments;
delete from students;
delete from courses;
delete from professors;

-- Insert minimal data
INSERT INTO students VALUES
(1, 'Manee', 'Jaidee', 'john.doe@university.edu'),
(2, 'Jane', 'Smith', 'jane.smith@university.edu'),
(3, 'Mike', 'Johnson', 'mike.johnson@university.edu');


INSERT INTO courses VALUES
(101, 'Intro to Programming', 'Computer Engineering', 3),
(102, 'Database Systems', 'Computer Engineering', 4),
(103, 'Data Structures', 'Computer Engineering', 4),
(201, 'Linear Algebra', 'Mathematics', 3);


INSERT INTO professors VALUES
(1, 'Kanda', 'Saikaew', 'Computer Engineering'),
(2, 'Elizabeth', 'Davis', 'Computer Science'),
(3, 'Richard', 'Miller', 'Mathematics');


INSERT INTO enrollments VALUES
(1, 1, 101, 'Fall', 2023, 'A'),
(2, 1, 102, 'Spring', 2024, NULL),
(3, 1, 103, 'Spring', 2024, NULL),
(4, 2, 101, 'Fall', 2023, 'B'),
(5, 2, 102, 'Spring', 2024, NULL),
(6, 2, 103, 'Spring', 2024, NULL),
(7, 3, 101, 'Fall', 2023, 'A'),
(8, 3, 201, 'Spring', 2024, NULL);

-- Queries

-- 1. List all students enrolled in a specific course (e.g., 'Database Systems') in the current semester.
SELECT s.first_name, s.last_name
FROM students s, enrollments e, courses c 
WHERE s.student_id = e.student_id
AND e.course_id = c.course_id
AND c.course_name = 'Database Systems' AND e.semester = 'Spring' AND e.year = 2024;



-- 2. List all courses in the 'Computer Engineering' department, along with the semester and year that these courses are open
SELECT c.course_name, e.semester, e.year
FROM courses c, enrollments e 
WHERE c.course_id = e.course_id
AND c.department = 'Computer Engineering';


-- 3. Find all students enrolled in courses with "Programming" in the name
SELECT DISTINCT s.student_id, s.first_name, s.last_name, c.course_name
FROM students s, enrollments e, courses c
WHERE s.student_id = e.student_id
AND e.course_id = c.course_id
AND c.course_name LIKE '%Programming%';

-- 4. List all professors teaching courses in the same department as their own, where the course name contains "Systems"
SELECT p.professor_id, p.first_name, p.last_name, c.course_name, c.department
FROM professors p, courses c
WhERE p.department = c.department
AND c.course_name LIKE '%Systems%';

-- 5. Find all students whose last name starts with 'J' and are enrolled in a course taught by a professor whose last name  starts with 'S'
SELECT DISTINCT s.student_id, s.first_name, s.last_name, c.course_name, p.first_name AS prof_first_name, p.last_name AS prof_last_name
FROM students s, enrollments e, courses c, professors p
WHERE s.student_id = e.student_id
AND e.course_id = c.course_id
AND s.last_name LIKE 'J%'
AND p.last_name LIKE 'S%';