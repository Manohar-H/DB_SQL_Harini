-- Description: QAP-2 Database - Problem 1 SQL script
-- Author: Harini Manohar
-- Date: Feb 7th 2025

-- Problem 1: University Course Enrollment System --

-- Drop tables if they exist to avoid duplicate issues
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS students;

-- Create tables
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    school_enrollment_date DATE
);

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100)
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    professor_id INT REFERENCES professors(id)
);

CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);

-- Insert data
INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '2022-09-01'),
('Bob', 'Smith', 'bob.smith@example.com', '2023-01-15'),
('Charlie', 'Brown', 'charlie.brown@example.com', '2023-02-10'),
('David', 'Wilson', 'david.wilson@example.com', '2022-08-20'),
('Emma', 'Davis', 'emma.davis@example.com', '2023-03-05');

INSERT INTO professors (first_name, last_name, department) VALUES
('Dr. John', 'Williams', 'Physics'),
('Dr. Sarah', 'Miller', 'Mathematics'),
('Dr. Mark', 'Taylor', 'Computer Science'),
('Dr. Emily', 'Clark', 'Biology');

INSERT INTO courses (course_name, course_description, professor_id) VALUES
('Physics 101', 'Introduction to Physics', 1),
('Algebra Basics', 'Fundamentals of Algebra', 2),
('Programming 101', 'Introduction to Programming', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-09-01'),
(2, 1, '2023-09-01'),
(3, 2, '2023-09-10'),
(4, 3, '2023-09-15'),
(5, 3, '2023-09-20');

-- Queries
SELECT CONCAT(s.first_name, ' ', s.last_name) AS full_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE c.course_name = 'Physics 101';

SELECT c.course_name, CONCAT(p.first_name, ' ', p.last_name) AS professor_name
FROM courses c
JOIN professors p ON c.professor_id = p.id;

SELECT DISTINCT c.course_name
FROM courses c
JOIN enrollments e ON c.id = e.course_id;

-- Update statement
UPDATE students
SET email = 'alice.newemail@example.com'
WHERE first_name = 'Alice' AND last_name = 'Johnson';

-- Delete statement
DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 1;