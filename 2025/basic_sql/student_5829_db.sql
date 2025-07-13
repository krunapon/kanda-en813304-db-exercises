-- drop database if it exists
drop database if exists student_5829_db;

-- create database
create database student_5829_db;
use student_5829_db;

-- Create students table
CREATE TABLE students (
    student_id varchar(10) PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100),
    enrollment_date date,
    gpa numeric(3,2)
);

-- Create courses table
CREATE TABLE courses (
    course_id varchar(8) PRIMARY KEY,
    course_name varchar(100) NOT NULL,
    credits int,
    department varchar(50)
);

