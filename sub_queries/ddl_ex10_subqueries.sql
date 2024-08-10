drop database if exists subqueries_db;

create database subqueries_db;
use subqueries_db;


-- Create tab les
drop table if exists assignment;
drop table if exists project;
drop table if exists employee;
drop table if exists company;
 
CREATE TABLE company (
    company_id INT PRIMARY KEY,
    name VARCHAR(100),
    industry VARCHAR(50),
    founded_year INT
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    company_id INT,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE TABLE assignment (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

-- Insert sample data
INSERT INTO company VALUES 
(1, 'TechCorp', 'Technology', 2000),
(2, 'FinanceHub', 'Finance', 1995),
(3, 'GreenEnergy', 'Energy', 2010);

INSERT INTO employee VALUES 
(101, 'John Doe', 1, 'Engineering', 85000, '2015-03-15'),
(102, 'Jane Smith', 1, 'Marketing', 75000, '2017-06-01'),
(103, 'Mike Johnson', 2, 'Finance', 90000, '2016-01-10'),
(104, 'Emily Brown', 2, 'HR', 70000, '2018-09-20'),
(105, 'David Lee', 3, 'Research', 95000, '2019-04-05'),
(106, 'Sarah Wilson', 3, 'Operations', 80000, '2017-11-11'),
(107, 'Alice Johnson', 1, 'Engineering', 88000, '2018-07-15'),
(108, 'Bob Williams', 2, 'Marketing', 72000, '2019-03-01'),
(109, 'Carol Davis', 3, 'Engineering', 92000, '2020-01-10');

INSERT INTO project VALUES 
(1, 'AI Initiative', '2023-01-01', '2023-12-31', 500000, 1),
(2, 'Financial Software Upgrade', '2023-03-01', '2023-09-30', 300000, 2),
(3, 'Solar Panel Development', '2023-02-15', '2024-02-14', 750000, 3),
(4, 'Mobile App Launch', '2023-06-01', '2023-12-31', 250000, 1),
(5, 'Data Analytics Platform', '2023-05-01', '2024-04-30', 600000, 1),
(6, 'Blockchain Integration', '2023-07-01', '2024-06-30', 450000, 2);

INSERT INTO assignment VALUES 
(101, 1, 'Lead Developer'),
(102, 1, 'Marketing Specialist'),
(103, 2, 'Financial Analyst'),
(104, 2, 'HR Coordinator'),
(105, 3, 'Chief Researcher'),
(106, 3, 'Operations Manager'),
(101, 4, 'Technical Advisor'),
(102, 5, 'Product Manager'),
(103, 6, 'Financial Advisor'),
(105, 5, 'Data Scientist');