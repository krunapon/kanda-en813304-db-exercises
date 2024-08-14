-- Create the database
CREATE DATABASE university;
USE university;

-- Create the Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    major VARCHAR(50),
    gpa DECIMAL(3,2)
);

-- Create the Courses table
CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(50),
    credits INT
);

-- Create the Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id VARCHAR(10),
    semester VARCHAR(20),
    year INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create the Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    head_professor VARCHAR(100),
    budget DECIMAL(10,2)
);

-- Insert sample data into Students
INSERT INTO Students VALUES
(1, 'John', 'Doe', '2000-05-15', 'Computer Science', 3.75),
(2, 'Jane', 'Smith', '2001-08-22', 'Biology', 3.90),
(3, 'Mike', 'Johnson', '1999-11-30', 'Mathematics', 3.60),
(4, 'Emily', 'Brown', '2002-02-10', 'Physics', 3.85),
(5, 'David', 'Lee', '2000-07-05', 'Chemistry', 3.70);

-- Insert sample data into Courses
INSERT INTO Courses VALUES
('CS101', 'Introduction to Programming', 'Computer Science', 3),
('BIO201', 'Cell Biology', 'Biology', 4),
('MATH301', 'Advanced Calculus', 'Mathematics', 4),
('PHYS202', 'Quantum Mechanics', 'Physics', 3),
('CHEM101', 'General Chemistry', 'Chemistry', 4);

-- Insert sample data into Enrollments
INSERT INTO Enrollments VALUES
(1, 1, 'CS101', 'Fall', 2023, 'A'),
(2, 2, 'BIO201', 'Fall', 2023, 'A'),
(3, 3, 'MATH301', 'Spring', 2024, 'B'),
(4, 4, 'PHYS202', 'Spring', 2024, 'A'),
(5, 5, 'CHEM101', 'Fall', 2023, 'B'),
(6, 1, 'MATH301', 'Spring', 2024, 'B'),
(7, 2, 'PHYS202', 'Spring', 2024, 'A');

-- Insert sample data into Departments
INSERT INTO Departments VALUES
(1, 'Computer Science', 'Dr. Alan Turing', 500000.00),
(2, 'Biology', 'Dr. Jane Goodall', 450000.00),
(3, 'Mathematics', 'Dr. Andrew Wiles', 400000.00),
(4, 'Physics', 'Dr. Stephen Hawking', 550000.00),
(5, 'Chemistry', 'Dr. Marie Curie', 480000.00);
