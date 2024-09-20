-- Begin a transaction
BEGIN;

-- Create the students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    dept_id INT
);

-- Insert data into the students table
INSERT INTO students (student_name, age, dept_id) VALUES
('John Doe', 20, 1),
('Jane Smith', 21, 2),
('Emily Davis', 22, 3),
('Michael Brown', 23, 4),
('Sarah Wilson', 24, 5);

-- Commit the transaction to make changes permanent
COMMIT;
