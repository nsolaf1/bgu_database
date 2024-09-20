CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    birth_date DATE, 
    hire_date DATETIME,
    salary DECIMAL(10, 2),
    department_id INT,
);

INSERT INTO Departments (department_id, department_name, location) VALUES 
(1, 'Human Resources', 'Building A'),
(2, 'Finance', 'Building B'),
(3, 'IT', 'Building C');

INSERT INTO Employees (employee_id, full_name, birth_date, hire_date, salary, department_id) VALUES 
(101, 'John Doe', '1980-01-15', '2010-06-01', 75000.00, 1),
(102, 'Jane Smith', '1975-09-23', '2012-03-15', 85000.00, 2),
(103, 'Jim Brown', '1990-05-19', '2018-11-01', 65000.00, 3);
