-- Add more sample data for better examples
INSERT INTO students VALUES
('2024007', 'Alice', 'Chen', 'alice.c@email.com', '2024-02-01', 3.95),
('2024008', 'Bob', 'Davis', 'bob.d@email.com', '2024-02-02', 2.85),
('2024009', 'Carol', 'Wilson', 'carol.w@email.com', '2024-02-03', 3.40);

INSERT INTO enrollments (student_id, course_id, enrollment_date, semester, year, grade) VALUES
('2024007', 'CS401', '2024-02-05', 'Spring', 2024, 'A'),
('2024008', 'ENG102', '2024-02-06', 'Spring', 2024, 'C'),
('2024009', 'MATH201', '2024-02-07', 'Spring', 2024, 'B');
