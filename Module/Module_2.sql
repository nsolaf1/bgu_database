--Module 2/7 20%

----ПОДСКАЗКА - погуглите их, чтобы найти решение 
 --   Left Join
 --   Where

 -----------------------------------------------------------------------------------------------------------

 
ВАША ЗАДАЧА: 

Напишите решение, позволяющее указать имя и сумму бонуса для каждого сотрудника с бонусом менее 1000.

Верните таблицу результатов в любом порядке.


 -----------------------------------------------------------------------------------------------------------

Table: Employee
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | empId       | int     |
    | name        | varchar |
    | supervisor  | int     |
    | salary      | int     |
    +-------------+---------+

EmpID - это столбец с уникальными значениями для этой таблицы.
В каждой строке этой таблицы указаны имя и идентификатор сотрудника, а также его зарплата и идентификатор руководителя.
 

Table: Bonus
    +-------------+------+
    | Column Name | Type |
    +-------------+------+
    | empId       | int  |
    | bonus       | int  |
    +-------------+------+

ENG - empId is the column of unique values for this table.
    empId is a foreign key (reference column) to empId from the Employee table.
    Each row of this table contains the id of an employee and their respective bonus.

RUS - EmpID - это столбец с уникальными значениями для этой таблицы.
    EmpID - это foreign key (ссылочный столбец) к EmpID из таблицы Employee.
    Каждая строка этой таблицы содержит идентификатор сотрудника и его соответствующий бонус.
 
-----------------------------------------------------------------------------------------------------------

Input: Содержание таблицы

Employee table:
    +-------+--------+------------+--------+
    | empId | name   | supervisor | salary |
    +-------+--------+------------+--------+
    | 3     | Brad   | null       | 4000   |
    | 1     | John   | 3          | 1000   |
    | 2     | Dan    | 3          | 2000   |
    | 4     | Thomas | 3          | 4000   |
    +-------+--------+------------+--------+

Bonus table:
    +-------+-------+
    | empId | bonus |
    +-------+-------+
    | 2     | 500   |
    | 4     | 2000  |
    +-------+-------+

Output: Выходные данные таблицы
    +------+-------+
    | name | bonus |
    +------+-------+
    | Brad | null  |
    | John | null  |
    | Dan  | 500   |
    +------+-------+

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


-- решение задачи
--Module 2
-----------------------------------------------------------------------------------------------------------
SELECT Employee.name,Bonus.bonus FROM Employee 
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
WHERE bonus < 1000 OR Bonus IS NULL ;
