--Module 7/7  20%

--ПОДСКАЗКА - погуглите их, чтобы найти решение
    -- MIN()
    -- GROUP BY
-----------------------------------------------------------------------------------------------------------

ВАША ЗАДАЧА: 

Напишите решение, позволяющее определить дату первого входа в систему для каждого игрока.

Верните таблицу результатов в любом порядке.

-----------------------------------------------------------------------------------------------------------
Table: Activity
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
 
(player_id, event_date) - это primary key (комбинация столбцов с уникальными значениями) этой таблицы.
В этой таблице показана активность игроков в некоторых играх.
Каждая строка представляет собой запись об игроке, который вошел в систему и сыграл несколько игр (возможно, 0), 
прежде чем когда-нибудь выйти из системы с помощью какого-либо устройства.

-----------------------------------------------------------------------------------------------------------
Input: 

Activity table:
    +-----------+-----------+------------+--------------+
    | player_id | device_id | event_date | games_played |
    +-----------+-----------+------------+--------------+
    | 1         | 2         | 2016-03-01 | 5            |
    | 1         | 2         | 2016-05-02 | 6            |
    | 2         | 3         | 2017-06-25 | 1            |
    | 3         | 1         | 2016-03-02 | 0            |
    | 3         | 4         | 2018-07-03 | 5            |
    +-----------+-----------+------------+--------------+

Output: 
    +-----------+-------------+
    | player_id | first_login |
    +-----------+-------------+
    | 1         | 2016-03-01  |
    | 2         | 2017-06-25  |
    | 3         | 2016-03-02  |
    +-----------+-------------+


-----------------------------------------------------------------------------------------------------------


