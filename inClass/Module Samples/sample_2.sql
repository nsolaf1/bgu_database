+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| gender      | CHAR     |
| salary      | int      |
+-------------+----------+
id - это первичный ключ (столбец с уникальными значениями) для этой таблицы.
Столбец gender - это значение типа ENUM (категория) ('m', 'f').
Таблица содержит информацию о сотруднике.

------------------------------------------------------------------------
TASk:
Напишите решение для замены всех значений 'f' и 'm' (т.е. измените все 
значения 'f' на 'm' и наоборот) с помощью одного оператора update и без 
промежуточных временных таблиц.

------------------------------------------------------------------------

-- (CASE  WHEN 'm'  'f' ELSE 'm' END)

Table sample:
Salary table:
+----+------+-----+--------+
| id | name | gender | salary |
+----+------+-----+--------+
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
+----+------+-----+--------+

Output:
+----+------+-----+--------+
| id | name | gender | salary |
+----+------+-----+--------+
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
+----+------+-----+--------+

Объяснение: 
(1, A) и (3, C) были изменены с "m" на "f".
(2, B) и (4, D) были изменены с "f" на "m".


-- Createing table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    sex Char(2),
    salary INT
);

-- Inserting into table
INSERT INTO Employee (id, name, sex, salary) VALUES
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 500);


-- Solution
UPDATE Employee 
SET gender = (CASE gender WHEN 'm' THEN 'f' ELSE 'm' END)