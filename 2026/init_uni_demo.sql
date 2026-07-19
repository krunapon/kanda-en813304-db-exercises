CREATE DATABASE IF NOT EXISTS uni_demo;
USE uni_demo;

CREATE TABLE Student (
    student_id   CHAR(10)     NOT NULL,
    national_id  CHAR(13)     NOT NULL,
    email        VARCHAR(100) NOT NULL,
    full_name    VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_id),
    UNIQUE (national_id),
    UNIQUE (email)
);

CREATE TABLE Course (
    course_id    CHAR(8)      NOT NULL,
    course_name  VARCHAR(100) NOT NULL,
    credits      INT          NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE Enrollment (
    student_id   CHAR(10)    NOT NULL,
    course_id    CHAR(8)     NOT NULL,
    semester     CHAR(1)     NOT NULL,
    year         YEAR        NOT NULL,
    grade        CHAR(2),
    PRIMARY KEY (student_id, course_id, semester, year),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);

INSERT INTO Student VALUES
('6401001001', '1100100200015', 's01@kku.ac.th', 'สมชาย ใจดี'),
('6401001002', '1100100200016', 's02@kku.ac.th', 'สมหญิง รักเรียน'),
('6401001003', '1100100200017', 's03@kku.ac.th', 'มานะ ขยันดี');

INSERT INTO Course VALUES
('EN813304', 'Database Systems', 3),
('EN813201', 'Data Structures',  3),
('EN813105', 'Programming I',    3);

INSERT INTO Enrollment VALUES
('6401001001', 'EN813304', '1', 2026, 'A'),
('6401001001', 'EN813201', '1', 2026, 'B+'),
('6401001002', 'EN813304', '1', 2026, NULL),
('6401001003', 'EN813304', '1', 2026, 'A');

