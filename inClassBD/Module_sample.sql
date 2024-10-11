+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
-- id - это первичный ключ (столбец с уникальными значениями) для этой таблицы.
-- Каждая строка этой таблицы содержит количество очков в игре. Количество очков указывается с плавающей запятой 
-- значение с двумя знаками после запятой.


-----------------------------------------------------------------------
##Напишите решение, чтобы определить ранг баллов. Рейтинг должен быть рассчитан в соответствии со следующими правилами:

Баллы должны быть ранжированы от самого высокого к самому низкому.
Если два балла совпадают, оба должны иметь одинаковый рейтинг.
После ничьей следующим номером рейтинга должно быть следующее подряд целое значение. Другими словами, между рангами не должно быть пробелов.
Верните таблицу результатов, упорядоченную по количеству баллов в порядке убывания.

Формат результатов приведен в следующем примере.

-----------------------------------------------------------------------
-- create the following table:

Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+


Формат результатов
Output: 
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+