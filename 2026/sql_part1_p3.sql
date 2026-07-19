-- ============================================================
-- Problem 3: student(ID, name), takes(ID, course_id),
--            course(course_id, name, dept_name)
-- Query to test: students who have taken a COE course
-- Expected result: Nara, Beam, Chompoo (Chompoo appears once
-- even though she took two COE courses -> good chance to
-- discuss DISTINCT)
-- ============================================================
DROP TABLE IF EXISTS takes;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
CREATE TABLE IF NOT EXISTS students (
    ID   INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    name      VARCHAR(40) NOT NULL,
    dept_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS takes (
    ID        INT,
    course_id INT,
    PRIMARY KEY (ID, course_id),
    FOREIGN KEY (ID) REFERENCES students(ID),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (ID, name) VALUES
(6601, 'Nara'),
(6602, 'Beam'),
(6603, 'Chompoo'),
(6604, 'Dew'),      -- takes only EE course -> excluded
(6605, 'Earn');     -- takes nothing        -> excluded

INSERT INTO courses (course_id, name, dept_name) VALUES
(9101, 'Database Systems',    'COE'),
(9102, 'Web Programming',     'COE'),
(9201, 'Circuit Analysis',    'EE'),
(9301, 'Thermodynamics',      'ME');

INSERT INTO takes (ID, course_id) VALUES
(6601, 9101),   -- Nara     
(6602, 9102),   -- Beam     
(6603, 9101),   -- Chompoo  
(6603, 9102),   -- Chompoo  
(6603, 9201),   -- Chompoo  
(6604, 9201);   -- Dew      

SELECT DATABASE();

-- Expected answer:
SELECT DISTINCT s.ID, s.name
FROM students s
JOIN takes t  ON s.ID = t.ID
JOIN courses c ON t.course_id = c.course_id
WHERE c.dept_name = 'COE';