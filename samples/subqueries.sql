use 
-- Create section table
CREATE TABLE section (
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4,0),
    PRIMARY KEY (course_id, sec_id, semester, year)
);

-- Create takes table
CREATE TABLE takes (
    ID NUMERIC(9,0),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4,0),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

-- Create teaches table
CREATE TABLE teaches (
    ID NUMERIC(5,0),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4,0),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);


-- Populate section table
INSERT INTO section (course_id, sec_id, semester, year) VALUES
('CS101', 'A', 'Fall', 2009),
('CS101', 'B', 'Spring', 2010),
('CS102', 'A', 'Fall', 2009),
('CS103', 'A', 'Spring', 2010),
('CS104', 'A', 'Fall', 2009);

-- Populate takes table
INSERT INTO takes (ID, course_id, sec_id, semester, year) VALUES
(1001, 'CS101', 'A', 'Fall', 2009),
(1002, 'CS101', 'B', 'Spring', 2010),
(1003, 'CS102', 'A', 'Fall', 2009),
(1001, 'CS103', 'A', 'Spring', 2010);

-- Populate teaches table
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES
(10101, 'CS101', 'A', 'Fall', 2009),
(10101, 'CS101', 'B', 'Spring', 2010),
(10102, 'CS102', 'A', 'Fall', 2009),
(10101, 'CS103', 'A', 'Spring', 2010);


select distinct course_id
from section
where semester = ’Fall’ and year= 2009 and
     course_id  not in (
        select course_id
            from section
                where semester = ’Spring’ and year= 2010);

use predicates_joins1_db;

select distinct e1.first_name, e1.salary
    from employees e1, employees e2
    where e1.salary > e2.salary and e2.department = "Marketing";

select first_name, salary
    from employees
    where salary > some (select salary
                         from employees
                         where department = 'Marketing');

use subqueries_db;

select course_id
from section as s1
where semester = 'Fall' and year = 2009 and
    not exists (select *
                from section as s2
                where semester = 'Spring' and year = 2010 and
                    s1.course_id = s2.course_id);


use predicates_joins1_db;


select department, avg_salary
    from (select department, avg(salary) as avg_salary
    from employees
    group by department) as avg_salary_group
    where avg_salary > 70000;


 with max_salary(value) as (select max(salary) from employees)
    select first_name, last_name 
    from employees, max_salary
    where employees.salary = max_salary.value;

use university;

SELECT dept_name,
       (SELECT COUNT(*)
        FROM instructor
        WHERE department.dept_name = instructor.dept_name)
       AS num_instructors
FROM department;

update instructor
    set salary = case
    when salary <= 100000 then salary * 1.05 
         else salary * 1.03
         end;




