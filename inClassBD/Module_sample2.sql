+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| gender      | ENUM     |
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