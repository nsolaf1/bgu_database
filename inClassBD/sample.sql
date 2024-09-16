CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


-- Inserting values into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'Human Resources'), (2, 'Development'), (3, 'Sales');

-- Inserting values into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES (1, 'John', 'Doe', 1), (2, 'Jane', 'Smith', 2), (3, 'Emily', 'Jones', 3);


DROP TABLE films 