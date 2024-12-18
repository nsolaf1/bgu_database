--Module 1/7 20%

----ПОДСКАЗКА - погуглите их, чтобы найти решение 
 --   WHERE
 --   NOT IN

 -----------------------------------------------------------------------------------------------------------

ВАША ЗАДАЧА: 

Напишите решение, позволяющее найти всех клиентов, которые никогда ничего не заказывают.

-----------------------------------------------------------------------------------------------------------

Table: Customers
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | id          | int     |
    | name        | varchar |
    +-------------+---------+

id - это первичный ключ (столбец с уникальными значениями) для этой таблицы.
В каждой строке этой таблицы указаны ID и имя клиента.


Table: Orders
    +-------------+------+
    | Column Name | Type |
    +-------------+------+
    | id          | int  |
    | customerId  | int  |
    +-------------+------+

ENG - id is the primary key (column with unique values) for this table.
    customerId is a foreign key (reference columns) of the ID from the Customers table.
    Each row of this table indicates the ID of an order and the ID of the customer who ordered it.

RUS - id - это первичный ключ (столбец с уникальными значениями) для этой таблицы.
    CustomerID - foreign key (ссылочные столбцы) идентификатора(id) из таблицы Customers.
    Каждая строка этой таблицы указывает идентификатор заказа и идентификатор(id) клиента, который его заказал.


-----------------------------------------------------------------------------------------------------------

Input: Содержание таблицы

Customers table:
    +----+-------+
    | id | name  |
    +----+-------+
    | 1  | Joe   |
    | 2  | Henry |
    | 3  | Sam   |
    | 4  | Max   |
    +----+-------+

Orders Table:
    +----+------------+
    | id | customerId |
    +----+------------+
    | 1  | 3          |
    | 2  | 1          |
    +----+------------+

Output: Выходные данные таблицы
    +-----------+
    | Customers |
    +-----------+
    | Henry     |
    | Max       |
    +-----------+


-----------------------------------------------------------------------------------------------------------
