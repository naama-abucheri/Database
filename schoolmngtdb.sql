-- Student Records Management System
-- Author: Naama Abucheri


-- Create the main database
CREATE DATABASE IF NOT EXISTS StudentRecordsDB;
USE StudentRecordsDB;


CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL
);


FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)

-- Create Database
CREATE DATABASE IF NOT EXISTS student_records;
USE student_records;

-- 1. Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);




-- 3. Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Enrollments Table (Many-to-Many between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (student_id, course_id) -- prevent duplicate enrollments
);

-- 5. Grades Table 
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Insert data into Departments
INSERT INTO Departments (department_id, name) VALUES
(1, 'Computer Science'),
(2, 'Business Administration'),
(3, 'Engineering'),
(4, 'Mathematics'),
(5, 'Psychology'),
(6, 'Biology'),
(7, 'Education'),
(8, 'Economics'),
(9, 'History'),
(10, 'Art & Design');

-- Insert data into Instructors
INSERT INTO Instructors (instructor_id, first_name, last_name, email, department_id) VALUES
(1, 'Alice', 'Smith', 'alice.smith@gmail.com', 1),
(2, 'Bob', 'Johnson', 'bob.johnson@gmail.com', 2),
(3, 'Carol', 'Williams', 'carol.williams@gmail.com', 3),
(4, 'David', 'Brown', 'david.brown@gmail.com', 4),
(5, 'Ella', 'Jones', 'ella.jones@gmail.com', 5),
(6, 'Frank', 'Miller', 'frank.miller@gmail.com', 6),
(7, 'Grace', 'Davis', 'grace.davis@gmail.com', 7),
(8, 'Henry', 'Garcia', 'henry.garcia@gmail.com', 8),
(9, 'Irene', 'Martinez', 'irene.martinez@gmail.com', 9),
(10, 'Jack', 'Wilson', 'jack.wilson@gmail.com', 10);

-- Insert data into Courses
INSERT INTO Courses (course_id, course_name, course_code, department_id, instructor_id) VALUES
(1, 'Intro to Programming', 'CS101', 1, 1),
(2, 'Marketing Basics', 'BA102', 2, 2),
(3, 'Thermodynamics', 'ENG201', 3, 3),
(4, 'Calculus I', 'MATH101', 4, 4),
(5, 'Intro to Psychology', 'PSY101', 5, 5),
(6, 'Biology Lab', 'BIO110', 6, 6),
(7, 'Teaching Methods', 'EDU205', 7, 7),
(8, 'Microeconomics', 'ECO101', 8, 8),
(9, 'World History', 'HIS150', 9, 9),
(10, 'Graphic Design', 'ART202', 10, 10);

-- Insert data into Students
INSERT INTO Students (student_id, first_name, last_name, email, department_id) VALUES
(1, 'Liam', 'Anderson', 'liam@gmail.com', 1),
(2, 'Mia', 'Baker', 'mia@gmail.com', 2),
(3, 'Noah', 'Clark', 'noah@gmail.com', 3),
(4, 'Olivia', 'Davis', 'olivia@gmail.com', 4),
(5, 'Ethan', 'Evans', 'ethan@gmail.com', 5),
(6, 'Ava', 'Foster', 'ava@gmail.com', 6),
(7, 'Lucas', 'Green', 'lucas@gmail.com', 7),
(8, 'Sophia', 'Hill', 'sophia@gmail.com', 8),
(9, 'James', 'Ivy', 'james@gmail.com', 9),
(10, 'Isabella', 'Jones', 'isabella@gmail.com', 10);

-- Insert data into Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2025-01-10'),
(2, 2, 2, '2025-01-11'),
(3, 3, 3, '2025-01-12'),
(4, 4, 4, '2025-01-13'),
(5, 5, 5, '2025-01-14'),
(6, 6, 6, '2025-01-15'),
(7, 7, 7, '2025-01-16'),
(8, 8, 8, '2025-01-17'),
(9, 9, 9, '2025-01-18'),
(10, 10, 10, '2025-01-19');

-- Insert data into Grades
INSERT INTO Grades (grade_id, enrollment_id, grade) VALUES
(1, 1, 'A'),
(2, 2, 'B+'),
(3, 3, 'A-'),
(4, 4, 'B'),
(5, 5, 'A'),
(6, 6, 'C+'),
(7, 7, 'B-'),
(8, 8, 'A'),
(9, 9, 'B+'),
(10, 10, 'A-');


