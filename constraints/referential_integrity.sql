create database simple_university_db;
use simple_university_db;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments VALUES (1, 'Computer Science'), (2, 'Physics');
INSERT INTO Students VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2), 
(3, 'Alice Johnson', 1);
INSERT INTO Courses VALUES (101, 'Introduction to Programming', 1), 
(201, 'Quantum Mechanics', 2), (102, 'Data Structures', 1);
INSERT INTO Enrollments VALUES (1, 101, 'A'), (1, 102, 'B'), 
(2, 201, 'A'), (3, 101, 'B');