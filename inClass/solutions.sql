--Module 1
-----------------------------------------------------------------------------------------------------------


CREATE TABLE Customers (
    id INT PRIMARY KEY,       -- id is the primary key
    name VARCHAR(50)          -- name of the customer
);



CREATE TABLE Orders (
    id INT PRIMARY KEY,        -- id is the primary key
    customerId INT,            -- customerId is a foreign key
    FOREIGN KEY (customerId) REFERENCES Customers(id)   -- customerId references id in Customers table
);


INSERT INTO Orders (id, customerId)
VALUES
    (1, 3),
    (2, 1);


INSERT INTO Customers (id, name)
VALUES
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');



--SOLUTION
-----------------------------------------------------------------------------------------------------------
SELECT name AS "Customers"
FROM Customers
WHERE id NOT IN (
    SELECT customerId 
    FROM Orders
);




--Module 2
-----------------------------------------------------------------------------------------------------------

-- Create Employee Table
CREATE TABLE Employee (
    empId INT PRIMARY KEY,         -- empId is the primary key
    name VARCHAR(50),              -- name of the employee
    supervisor INT,                -- supervisor's empId (can be NULL)
    salary INT,                    
    FOREIGN KEY (supervisor) REFERENCES Employee(empId) -- self-referencing foreign key for supervisor
);

-- Insert data into Employee Table
INSERT INTO Employee (empId, name, supervisor, salary)
VALUES
    (3, 'Brad', NULL, 4000),
    (1, 'John', 3, 1000),
    (2, 'Dan', 3, 2000),
    (4, 'Thomas', 3, 4000);


INSERT INTO Bonus (empId, bonus)
VALUES
    (2, 500),
    (4, 2000),



-----------------------------------------------------------------------------------------------------------
SELECT Employee.name,Bonus.bonus FROM Employee 
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
WHERE bonus < 1000 OR Bonus IS NULL ;


--Module 3
-----------------------------------------------------------------------------------------------------------
-- решение задачи

-- Create Department Table
CREATE TABLE Department (
    id INT PRIMARY KEY,        
    name VARCHAR(50) NOT NULL   
);

-- Insert data into Department Table
INSERT INTO Department (id, name)
VALUES
    (1, 'IT'),
    (2, 'Sales');


-- Create Employee Table
CREATE TABLE Employee (
    id INT PRIMARY KEY,             
    name VARCHAR(50),               
    salary INT,                     
    departmentId INT,                -- foreign key to Department table
    FOREIGN KEY (departmentId) REFERENCES Department(id)  -- departmentId references id in Department table
);

-- Insert data into Employee Table
INSERT INTO Employee (id, name, salary, departmentId)
VALUES
    (1, 'Joe', 70000, 1),
    (2, 'Jim', 90000, 1),
    (3, 'Henry', 80000, 2),
    (4, 'Sam', 60000, 2),
    (5, 'Max', 90000, 1);



-- решение задачи
-----------------------------------------------------------------------------------------------------------
select dp.name as Department, em.name as Employee, em.salary
from Employee as em join Department as dp 
on em.departmentId = dp.id 
where em.salary = ( select max(salary) from Employee where departmentId = dp.id )


--Module 4
-----------------------------------------------------------------------------------------------------------
-Query for creating the following Tables and Adding data
-- Create Product table
CREATE TABLE Product (
    product_key INT PRIMARY KEY
);

-- Create Customer table
CREATE TABLE Customer (
    customer_id INT NOT NULL,
    product_key INT,
    FOREIGN KEY (product_key) REFERENCES Product(product_key)
);

-- Insert data into Product table
INSERT INTO Product (product_key)
VALUES
(5),
(6);


-- Insert data into Customer table
INSERT INTO Customer (customer_id, product_key)
VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


-----------------------------------------------------------------------------------------------------------
select customer_id from customer
group by 1
having count(distinct product_key) = (select count(product_key) from product)


--Module 5
-----------------------------------------------------------------------------------------------------------

--Query for creating the following Tables and Adding data
--для создания следующих таблиц и добавления данных

-- Create Person table
CREATE TABLE Person (
    personId INT PRIMARY KEY,
    lastName VARCHAR(255),
    firstName VARCHAR(255)
);

-- Create Address table
CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255),
    FOREIGN KEY (personId) REFERENCES Person(personId)
);

-- Insert data into Person table
INSERT INTO Person (personId, lastName, firstName)
VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');


-- Insert data into Address table
INSERT INTO Address (addressId, personId, city, state)
VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Bishkek', 'California');


-----------------------------------------------------------------------------------------------------------
-- решение задачи

-----------------------------------------------------------------------------------------------------------
select firstName , lastName , city , state
from person p
left join address a
on p.personId = a.personId


--Module 6
-----------------------------------------------------------------------------------------------------------
--Query for creating the following Tables and Adding data
--для создания следующих таблиц и добавления данных

-- Create Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    managerId INT
);

-- Insert data into Employee table
INSERT INTO Employee (id, name, salary, managerId)
VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
select a.name as Employee  from employee a ,employee b
where a.managerId = b.id and a.salary > b.salary

--- ИЛИ

SELECT e.name AS "Employee"
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary < m.salary;


--Module 7
-----------------------------------------------------------------------------------------------------------
--Query for creating the following Tables and Adding data
--для создания следующих таблиц и добавления данных

-- Create Activity table
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);


-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);



-----------------------------------------------------------------------------------------------------------
-- решение задачи
--Module 7
-----------------------------------------------------------------------------------------------------------
--Query for creating the following Tables and Adding data
--для создания следующих таблиц и добавления данных

-- Create Activity table
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);


-- Insert data into Activity table
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);



-----------------------------------------------------------------------------------------------------------
-- решение задачи
-----------------------------------------------------------------------------------------------------------
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;