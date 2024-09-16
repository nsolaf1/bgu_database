-- CRUD Operations 
--------------------------------------------------------------


-- INSERT Statement
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
-- Example:
INSERT INTO students (name, age, grade)
VALUES ('John Doe', 20, 'A');

--  SELECT Statement
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- Example:
SELECT name, grade
FROM students
WHERE age > 18; --Retrieves the names and grades of students older than 18.

-- SELECT with Aggregation
-- Aggregates:
 -- COUNT(), SUM(), AVG(), MAX(), MIN()
--Example:
SELECT COUNT(*) AS total_students
FROM students;
--Example 2:
SELECT name
FROM students
WHERE age = (SELECT MAX(age) FROM students);



--UPDATE Statement:
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

--Example:
UPDATE students
SET grade = 'B'
WHERE name = 'John Doe';


-- DELETE Statement
DELETE FROM table_name
WHERE condition;

--Example:
DELETE FROM students
WHERE name = 'John Doe';


-- Altering Operations 
--------------------------------------------------------------

-- Adding Columns to a Table
ALTER TABLE table_name
ADD column_name data_type;

-- Deleting (Dropping) a Column:
ALTER TABLE table_name
DROP COLUMN column_name;


-- Renaming a Column:
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;

-- Dropping a Table (Deleting a Table):
DROP TABLE table_name;



-- JOIN 
--------------------------------------------------------------


--  Combining SELECT with JOIN
    -- INNER JOIN, LEFT JOIN
--Example:
SELECT students.name, courses.course_name
FROM students
INNER JOIN enrollments ON students.id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.id;
--Retrieves the courses that each student is enrolled in.



-- 1. JOIN in SQL
-- A JOIN in SQL is used to combine rows from two or more tables based on a related column between them. 
-- It's a way to retrieve data from multiple tables by establishing a connection between them using a 
-- common key or field.

-- There are different types of JOINs, and the most commonly used are:

-- INNER JOIN
-- OUTER JOIN (which includes LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN)
-- 2. INNER JOIN
-- An INNER JOIN returns records that have matching values in both tables. It filters out 
-- rows that do not match the specified condition, i.e., it only includes rows that have matches in both tables.
SELECT columns
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;

-- Now, if you want to retrieve only students who are enrolled in a course,
--  you can use an INNER JOIN:

SELECT students.name, enrollments.course_name
FROM students
INNER JOIN enrollments
ON students.id = enrollments.student_id;

-- 3. OUTER JOIN
-- An OUTER JOIN returns all the records from one table, along with the matched records from the other table. 
-- If no match is found, NULL values are returned for columns from the second table.

There are three types of outer joins:

-- LEFT JOIN (or LEFT OUTER JOIN): Returns all records from the left table and the matched records 
--     from the right table. If no match is found, NULL is returned for columns from the right table.
-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all records from the right table and the matched records
--     from the left table. If no match is found, NULL is returned for columns from the left table.
-- FULL JOIN (or FULL OUTER JOIN): Returns all records when there is a match in 
--     either the left or right table. It returns NULL for non-matching rows from both tables.

--Left JOIN EXAMPLE:
SELECT students.name, enrollments.course_name
FROM students
LEFT JOIN enrollments
ON students.id = enrollments.student_id;

--RIGHT JOIN EXAMPLE:
SELECT students.name, enrollments.course_name
FROM students
RIGHT JOIN enrollments
ON students.id = enrollments.student_id;

--FULL JOIN EXAMPLE:
SELECT students.name, enrollments.course_name
FROM students
FULL OUTER JOIN enrollments
ON students.id = enrollments.student_id;
