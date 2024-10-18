--Module 3/7 20%

----ПОДСКАЗКА - погуглите их, чтобы найти решение 
 --   JOIN
 --   WHERE
 --   MAX()


 -----------------------------------------------------------------------------------------------------------

ВАША ЗАДАЧА: 

Напишите решение для поиска сотрудников с самой высокой зарплатой в каждом из отделов.

Верните таблицу результатов в любом порядке.


-----------------------------------------------------------------------------------------------------------

Table: Employee
    +--------------+---------+
    | Column Name  | Type    |
    +--------------+---------+
    | id           | int     |
    | name         | varchar |
    | salary       | int     |
    | departmentId | int     |
    +--------------+---------+

id - это primary key (столбец с уникальными значениями) для этой таблицы.
department - это foreign key (ссылочные столбцы) для ID из таблицы Department.
Каждая строка этой таблицы указывает id, name и salary сотрудника. Она также содержит ID его department.
 

Table: Department
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | id          | int     |
    | name        | varchar |
    +-------------+---------+

id - это primary key (столбец с уникальными значениями) для этой таблицы. Гарантируется, что название отдела не равно NULL.
Каждая строка этой таблицы указывает ID отдела и его название.

-----------------------------------------------------------------------------------------------------------


Input: Содержание таблицы

    Employee table:
    +----+-------+--------+--------------+
    | id | name  | salary | departmentId |
    +----+-------+--------+--------------+
    | 1  | Joe   | 70000  | 1            |
    | 2  | Jim   | 90000  | 1            |
    | 3  | Henry | 80000  | 2            |
    | 4  | Sam   | 60000  | 2            |
    | 5  | Max   | 90000  | 1            |
    +----+-------+--------+--------------+

    Department table:
    +----+-------+
    | id | name  |
    +----+-------+
    | 1  | IT    |
    | 2  | Sales |
    +----+-------+


Output: Выходные данные таблицы
    +------------+----------+--------+
    | Department | Employee | Salary |
    +------------+----------+--------+
    | IT         | Jim      | 90000  |
    | Sales      | Henry    | 80000  |
    | IT         | Max      | 90000  |
    +------------+----------+--------+
Пояснение: У Макса и Джима самая высокая зарплата в ИТ-отделе, а у Генри самая высокая зарплата в отделе продаж.


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
--Module 3 
-----------------------------------------------------------------------------------------------------------
select dp.name as Department, em.name as Employee, em.salary
from Employee as em join Department as dp 
on em.departmentId = dp.id 
where em.salary = ( select max(salary) from Employee where departmentId = dp.id )