--Module 5/7  20%

----ПОДСКАЗКА - погуглите их, чтобы найти решение
   -- LEFT JOIN

-----------------------------------------------------------------------------------------------------------

ВАША ЗАДАЧА: 

Напишите решение, позволяющее отображать first name, lastname, city и state каждого человека в таблице Person. 
Если в таблице Address отсутствует адрес с id пользователя, вместо него укажите значение null.

Верните таблицу результатов в любом порядке.

-----------------------------------------------------------------------------------------------------------

Table: Person
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | personId    | int     |
    | lastName    | varchar |
    | firstName   | varchar |
    +-------------+---------+
personId - это первичный ключ (столбец с уникальными значениями) для этой таблицы.
Эта таблица содержит информацию об идентификаторах некоторых людей, их именах и фамилиях.


Table: Address
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | addressId   | int     |
    | personId    | int     |
    | city        | varchar |
    | state       | varchar |
    +-------------+---------+

addressId - это первичный ключ (столбец с уникальными значениями) для этой таблицы.
Каждая строка этой таблицы содержит информацию о городе и штате одного человека с идентификатором = PersonID.

-----------------------------------------------------------------------------------------------------------

Формат результата приведен в следующем примере.

Input: 
Person table:
    +----------+----------+-----------+
    | personId | lastName | firstName |
    +----------+----------+-----------+
    | 1        | Wang     | Allen     |
    | 2        | Alice    | Bob       |
    +----------+----------+-----------+

Address table:
    +-----------+----------+---------------+------------+
    | addressId | personId | city          | state      |
    +-----------+----------+---------------+------------+
    | 1         | 2        | New York City | New York   |
    | 2         | 3        | Bishkek       | California |
    +-----------+----------+---------------+------------+

Output: 
    +-----------+----------+---------------+----------+
    | firstName | lastName | city          | state    |
    +-----------+----------+---------------+----------+
    | Allen     | Wang     | Null          | Null     |
    | Bob       | Alice    | New York City | New York |
    +-----------+----------+---------------+----------+

Объяснение: 
В адресной таблице нет адреса для personId = 1, поэтому мы возвращаем значение null в их городе и штате.
адрес Id = 1 содержит информацию об адресе personId = 2.


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
--Module 5
-----------------------------------------------------------------------------------------------------------
select firstName , lastName , city , state
from person p
left join address a
on p.personId = a.personId