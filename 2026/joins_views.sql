select name, dept_name from instructors natural join departments;

select title, name, room_number 
from courses natural join sections natural join teaches natural join instructors 
where building = 'Taylor';

create view dept_salary_total as 
select dept_id, sum(salary) as total_salary
from instructors  
group by dept_id;

select dept_name, total_salary
from dept_salary_total natural join departments
where total_salary = (SELECT MAX(total_salary) from dept_salary_total);

CREATE VIEW fall_2023_courses AS
SELECT s.course_id, c.title, s.section_id, s.building, s.room_number
FROM sections s
JOIN courses c ON s.course_id = c.course_id
WHERE s.semester = 'Fall' AND s.year = 2023;

SELECT course_id, title, room_number 
FROM fall_2023_courses WHERE building = 'Watson';

create view instructor_course_load as
select instructor_id, name, count(section_id) as course_count, salary
from instructors natural join teaches
group by instructor_id;

select * from instructor_course_load order by salary desc;

create view dept_avg_credits as
select dept_id, avg(credits) as avg_credits
from courses
group by dept_id;

select dept_name, avg_credits
from avg_credit natural join departments
where avg_credit > select avg(avg_credits) from dept_avg_credits;