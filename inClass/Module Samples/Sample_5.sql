-- Module Sample 5

Table: World

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+

name - это primary key (столбец с уникальными значениями) для этой таблицы.
Каждая строка этой таблицы содержит информацию о названии страны, континенте, к которому она относится, ее площади, населении и величине ВВП.



Страна считается большой, если:

его площадь составляет не менее трех миллионов человек (т.е. 3000000 км2), а
население - не менее двадцати пяти миллионов человек (т.е. 25000000).
Напишите решение, чтобы найти название, численность населения и площадь к big countries..

Верните таблицу результатов в любом порядке.


Example 1:

Input: 

World table:
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+


Output: 
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+