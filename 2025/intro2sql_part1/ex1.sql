use student_5829_db;
DROP TABLE IF EXISTS enrollments;

CREATE TABLE enrollments (
    enrollment_id int AUTO_INCREMENT,
    student_id varchar(10) NOT NULL,
    course_id varchar(8) NOT NULL,
    enrollment_date date NOT NULL,
    grade varchar(2),
    semester varchar(10) NOT NULL,
    year int NOT NULL,
    status varchar(15) DEFAULT 'Active',
    
    -- Primary key
    PRIMARY KEY (enrollment_id),
    
    -- Unique constraint
    UNIQUE KEY unique_enrollment (student_id, course_id, semester, year),
    
    -- Foreign key constraints defined during table creation
    CONSTRAINT fk_enrollments_student 
        FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    CONSTRAINT fk_enrollments_course 
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

