use manee_1234_db;

DROP TABLE IF EXISTS departments;
CREATE TABLE IF NOT EXISTS departments (
    dept_name VARCHAR(20) PRIMARY KEY,
    bulding_name VARCHAR(20)
);

DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    department VARCHAR(20), 
    credit NUMERIC(2,1),
    FOREIGN KEY (department) REFERENCES departments(dept_name)
);

SHOW tables;

DESCRIBE departments;

DESCRIBE courses;
