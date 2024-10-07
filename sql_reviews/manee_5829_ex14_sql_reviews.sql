create database if not exists sql_reviews;
use sql_reviews;

CREATE TABLE if not exists students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    major VARCHAR(50),
    gpa DECIMAL(3,2)
);

CREATE TABLE if not exists courses (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    credits INT
);

CREATE TABLE if not exists enrollments (
    student_id INT,
    course_id VARCHAR(10),
    grade CHAR(1),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

delete from enrollments;
delete from  students;
delete from courses;

INSERT INTO students (student_id, name, major, gpa) VALUES
(1, 'Alice Johnson', 'Computer Science', 3.8),
(2, 'Bob Smith', 'Mathematics', 3.6),
(3, 'Charlie Brown', 'Computer Science', 3.2),
(4, 'Diana Prince', 'Physics', 3.9),
(5, 'Eva Green', 'Mathematics', 3.5),
(6, 'Frank Castle', 'Computer Science', 3.7);


INSERT INTO courses (course_id, title, credits) VALUES
('CS101', 'Introduction to Programming', 3),
('CS102', 'Data Structures', 4),
('MATH201', 'Calculus I', 4),
('PHYS101', 'Physics I', 4);

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 'CS101', 'A'),
(1, 'CS102', 'B'),
(1, 'MATH201', 'A'),
(2, 'CS101', 'B'),
(2, 'MATH201', 'A'),
(3, 'CS101', 'B'),
(3, 'PHYS101', 'C'),
(4, 'CS101', 'A'),
(4, 'CS102', 'A'),
(4, 'MATH201', 'A'),
(4, 'PHYS101', 'A'),
(5, 'MATH201', 'B'),
(6, 'CS101', 'A'),
(6, 'CS102', 'A');

select name, gpa
from students
where gpa > 3.5
order by gpa desc;  

select major, avg(gpa) as avg_gpa
from students
grooup by major
having count(*) > 1;


select name from students s, enrollments e where s.student_id = e.student_id and e.course_id = 'CS101' except
select name from students s, enrollments e where s.student_id = e.student_id and e.course_id = 'CS102';


select s.name, count(*) as num_couress from students s, enrollments e where s.student_id = e.student_i
d group by s.student_id;


SELECT s.name
FROM students s
WHERE NOT EXISTS (
    SELECT c.course_id 
    FROM courses c
    WHERE NOT EXISTS (
        SELECT e.course_id
        FROM enrollments e
        WHERE e.student_id = s.student_id AND e.course_id = c.course_id
    )
);


CREATE VIEW student_enrollments AS
    SELECT s.name, c.title, e.grade
    FROM students s
    JOIN enrollments e ON s.student_id = e.student_id
    JOIN courses c ON e.course_id = c.course_id;

-- students(gpa): For queries filtering or sorting by GPA
-- enrollments(student_id, course_id): For join operations
-- enrollments(grade): For queries involving grade calculations

-- Index on students(gpa)
CREATE INDEX idx_student_gpa ON students(gpa);

-- Index on enrollments(student_id, course_id)
CREATE INDEX idx_enrollment_student_course ON enrollments(student_id, course_id);

-- Index on enrollments(grade)
CREATE INDEX idx_enrollment_grade ON enrollments(grade);




