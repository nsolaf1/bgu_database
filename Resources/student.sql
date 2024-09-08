-- Create the database
CREATE DATABASE university;

-- Connect to the database
\c university

-- Create the department table
CREATE TABLE department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- Create the faculty table
CREATE TABLE faculty (
    faculty_id SERIAL PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    dept_id INT REFERENCES department(dept_id)
);

-- Create the courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT REFERENCES department(dept_id)
);

-- Create the prerequisites table
CREATE TABLE prerequisites (
    course_id INT REFERENCES courses(course_id),
    prereq_id INT REFERENCES courses(course_id),
    PRIMARY KEY (course_id, prereq_id)
);

-- Create the students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    dept_id INT REFERENCES department(dept_id)
);

-- Insert data into the department table
INSERT INTO department (dept_name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology');

-- Insert data into the faculty table
INSERT INTO faculty (faculty_name, dept_id) VALUES
('Dr. Alice Johnson', 1),
('Dr. Bob Smith', 2),
('Dr. Charlie Brown', 3),
('Dr. Diana Prince', 4),
('Dr. Edward Elric', 5);

-- Insert data into the courses table
INSERT INTO courses (course_name, dept_id) VALUES
('Data Structures', 1),
('Calculus', 2),
('Quantum Mechanics', 3),
('Organic Chemistry', 4),
('Genetics', 5);

-- Insert data into the prerequisites table
INSERT INTO prerequisites (course_id, prereq_id) VALUES
(1, 2), -- Data Structures requires Calculus
(3, 2), -- Quantum Mechanics requires Calculus
(4, 2), -- Organic Chemistry requires Calculus
(5, 2); -- Genetics requires Calculus

-- Insert data into the students table
INSERT INTO students (student_name, age, dept_id) VALUES
('John Doe', 20, 1),
('Jane Smith', 21, 2),
('Emily Davis', 22, 3),
('Michael Brown', 23, 4),
('Sarah Wilson', 24, 5);

-- Alter the students table to add an id column
ALTER TABLE students ADD COLUMN id SERIAL PRIMARY KEY;

-- Create the finance table
CREATE TABLE finance (
    finance_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    balance DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into the finance table
INSERT INTO finance (student_id, balance) VALUES
(1, 1500.00),
(2, 2000.00),
(3, 1800.00),
(4, 2200.00),
(5, 1600.00);


