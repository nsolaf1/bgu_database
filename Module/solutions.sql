--Module 1
-----------------------------------------------------------------------------------------------------------
SELECT name AS "Customers"
FROM Customers
WHERE id NOT IN (
    SELECT customerId 
    FROM Orders
);


--Module 2
-----------------------------------------------------------------------------------------------------------
SELECT Employee.name,Bonus.bonus FROM Employee 
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
WHERE bonus < 1000 OR Bonus IS NULL ;



--Module 3
-----------------------------------------------------------------------------------------------------------
select dp.name as Department, em.name as Employee, em.salary
from Employee as em join Department as dp 
on em.departmentId = dp.id 
where em.salary = ( select max(salary) from Employee where departmentId = dp.id )



--Module 4
-----------------------------------------------------------------------------------------------------------
select customer_id from customer
group by 1
having count(distinct product_key) = (select count(product_key) from product)



--Module 5
-----------------------------------------------------------------------------------------------------------
select firstName , lastName , city , state
from person p
left join address a
on p.personId = a.personId



--Module 6
-----------------------------------------------------------------------------------------------------------
select a.name as Employee  from employee a ,employee b
where a.managerId = b.id and a.salary > b.salary

--- OR

SELECT e.name AS "Employee"
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary < m.salary;


--Module 7
-----------------------------------------------------------------------------------------------------------
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;