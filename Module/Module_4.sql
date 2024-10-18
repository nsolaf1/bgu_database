--Module 4/7 20%

----ПОДСКАЗКА - погуглите их, чтобы найти решение 
 --   Group BY
 --   Having Count()
 --   Distinct

 -----------------------------------------------------------------------------------------------------------

ВАША ЗАДАЧА: 

Напишите решение для отображения id клиентов из таблицы клиентов, которые купили все продукты в таблице продуктов.

Верните таблицу результатов в любом порядке.

-----------------------------------------------------------------------------------------------------------

Table: Customer
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | customer_id | int     |
    | product_key | int     |
    +-------------+---------+

Эта таблица может содержать повторяющиеся строки. 
customer_id не равен нулю.
product_key - это foreign key(внешний ключ) таблицы Product.
 

Table: Product
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | product_key | int     |
    +-------------+---------+
product_key - это primary key (столбец с уникальными значениями) для этой таблицы.
 

-----------------------------------------------------------------------------------------------------------
Формат результата приведен в следующем примере.


Example 1:

Input: 
Customer table:
    +-------------+-------------+
    | customer_id | product_key |
    +-------------+-------------+
    | 1           | 5           |
    | 2           | 6           |
    | 3           | 5           |
    | 3           | 6           |
    | 1           | 6           |
    +-------------+-------------+

Product table:
    +-------------+
    | product_key |
    +-------------+
    | 5           |
    | 6           |
    +-------------+


Output: 
    +-------------+
    | customer_id |
    +-------------+
    | 1           |
    | 3           |
    +-------------+

Объяснение: 
Клиенты, купившие все продукты (5 и 6), являются клиентами с идентификаторами 1 и 3.




-----------------------------------------------------------------------------------------------------------
--Query for creating the following Tables and Adding data
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

-- решение задачи
--Module 4
-----------------------------------------------------------------------------------------------------------
select customer_id from customer
group by 1
having count(distinct product_key) = (select count(product_key) from product)