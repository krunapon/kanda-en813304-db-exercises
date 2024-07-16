-- Create and populate the employees table
create database predicates_joins1_db;
use predicates_joins1_db;

CREATE TABLE if not exists employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', 'IT', 75000, '2020-01-15', NULL),
(2, 'Jane', 'Smith', 'HR', 65000, '2019-05-11', 1),
(3, 'Mike', 'Johnson', 'Marketing', 70000, '2021-03-20', 1),
(4, 'Emily', 'Brown', 'IT', 78000, '2018-11-07', 1),
(5, 'David', 'Lee', 'Finance', 80000, '2017-08-30', 2),
(6, 'Sarah', 'Wilson', 'HR', 62000, '2022-02-14', 2),
(7, 'Chris', 'Anderson', 'Marketing', 69000, '2020-07-22', 3),
(8, 'Lisa', 'Taylor', 'IT', 72000, '2019-09-01', 4);

-- Create and populate the departments table
CREATE TABLE if not exists departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT', 'New York'),
(2, 'HR', 'Chicago'),
(3, 'Marketing', 'Los Angeles'),
(4, 'Finance', 'Boston');

-- Create and populate the projects table
CREATE TABLE if not exists projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    department_id INT
);

INSERT INTO projects VALUES
(1, 'Website Redesign', '2023-01-01', '2023-06-30', 1),
(2, 'Employee Training Program', '2023-03-15', '2023-12-31', 2),
(3, 'Product Launch Campaign', '2023-05-01', '2023-08-31', 3),
(4, 'Financial System Upgrade', '2023-02-01', '2023-11-30', 4),
(5, 'Mobile App Development', '2023-04-01', '2023-09-30', 1);

-- Create and populate the employee_projects table
CREATE TABLE if not exists employee_projects (
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO employee_projects VALUES
(1, 1, 'Project Manager'),
(4, 1, 'Developer'),
(8, 1, 'Designer'),
(2, 2, 'Trainer'),
(6, 2, 'Coordinator'),
(3, 3, 'Campaign Manager'),
(7, 3, 'Content Creator'),
(5, 4, 'Financial Analyst'),
(1, 5, 'Technical Lead'),
(4, 5, 'Developer');