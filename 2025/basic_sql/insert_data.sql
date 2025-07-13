use student_5829_db;
INSERT INTO students VALUES 
('2024001', 'John', 'Smith', 'john.smith@email.com', '2024-01-15', 3.75),
('2024002', 'Sarah', 'Johnson', 'sarah.j@email.com', '2024-01-16', 3.92),
('2024003', 'Mike', 'Brown', 'mike.brown@email.com', '2024-01-17', 3.58);
INSERT INTO courses VALUES 
('CS101', 'Introduction to Programming', 3, 'Computer Science'),
('MATH201', 'Calculus II', 4, 'Mathematics'),
('ENG102', 'English Composition', 3, 'English'),
('CS401', 'Advanced Database Systems', 4, 'Computer Science'),
('MATH301', 'Statistical Analysis', 3, 'Mathematics');
-- This should work fine (assuming these IDs exist)
INSERT INTO enrollments VALUES 
(NULL, '2024001', 'CS101', '2024-01-20', NULL, 'Spring', 2024, 'Active');

-- This should FAIL because student '9999999' doesn't exist
INSERT INTO enrollments VALUES 
(NULL, '9999999', 'CS101', '2024-01-20', NULL, 'Spring', 2024, 'Active');

-- This should also FAIL because course 'FAKE101' doesn't exist  
INSERT INTO enrollments VALUES 
(NULL, '2024001', 'FAKE101', '2024-01-20', NULL, 'Spring', 2024, 'Active');

-- Insert some sample enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date, semester, year) VALUES 
('2024001', 'MATH201', '2024-01-20', 'Spring', 2024),
('2024002', 'CS101', '2024-01-21', 'Spring', 2024),
('2024003', 'ENG102', '2024-01-22', 'Spring', 2024);

-- Update some grades
UPDATE enrollments SET grade = 'A' WHERE student_id = '2024001' AND course_id = 'CS101';
UPDATE enrollments SET grade = 'B+' WHERE student_id = '2024002' AND course_id = 'CS101';

-- Query to see student enrollments with course details
SELECT s.first_name, s.last_name, c.course_name, e.grade, e.semester, e.year
FROM students s
JOIN enrollments e ON s.student_id = e.student_id  
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.last_name, c.course_name;

