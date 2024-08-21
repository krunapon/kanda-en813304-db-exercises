create database if not exists contraints;
use contraints;

drop table students;
CREATE TABLE if not exists students (
    student_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO students (student_id, first_name, last_name, email) VALUES
(1, 'Alice',null, null)

drop table courses;
CREATE TABLE if not exists courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

INSERT INTO courses (course_id, course_name, credits) VALUES
('C001', 'Introduction to Databases', 3),
('C001', 'Data Structures and Algorithms', 4);

drop table professors;
CREATE TABLE if not exists professors (
    professor_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20) UNIQUE
);

INSERT INTO professors (professor_id, email, phone_number) VALUES
(1, 'a@b.edu', 2222),
(2, 'c@d.ac.th',null),
(3, 'd@z.ac.th', 2222);


drop table grades;
CREATE TABLE if not exists grades (
    student_id INT,
    course_id VARCHAR(10),
    grade CHAR(1),
    CONSTRAINT valid_grade CHECK (grade IN ('A', 'B', 'C', 'D', 'F'))
);

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 'C001', 'A'),
(1, 'C001', 'G');


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2),
    CONSTRAINT valid_salary CHECK (salary > 0 AND salary < 1000000)
);

INSERT INTO employees (employee_id, first_name, last_name, hire_date, salary) VALUES
(1, 'Alice', 'Smith', '2019-01-01', -2);

