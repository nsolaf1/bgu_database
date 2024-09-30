-- liasing Columns with AS
SELECT 
    students.name AS student_name, 
    (SELECT courses.course_name 
     FROM courses 
     WHERE courses.id = enrollments.course_id) AS course_title, 
    (SELECT grades.grade_percentage 
     FROM grades 
     WHERE grades.student_id = students.id 
     AND grades.course_id = enrollments.course_id) AS grade
FROM students, enrollments
WHERE students.id = enrollments.student_id;

-- Maximum Grade for Each Course
SELECT 
    course_name AS course_title, 
    (SELECT MAX(grade_percentage) 
     FROM grades 
     WHERE grades.course_id = courses.id) AS highest_grade
FROM courses;

-- Average Grade for Each Student
SELECT 
    students.name AS student_name, 
    (SELECT AVG(grade_percentage) 
     FROM grades 
     WHERE grades.student_id = students.id) AS average_grade
FROM students;

-- Average Grade for Each Course
SELECT 
    course_name AS course_title, 
    (SELECT AVG(grade_percentage) 
     FROM grades 
     WHERE grades.course_id = courses.id) AS average_grade
FROM courses;

-- Highest Grade for Each Student
SELECT 
    students.name AS student_name, 
    (SELECT MAX(grade_percentage) 
     FROM grades 
     WHERE grades.student_id = students.id) AS highest_grade
FROM students;
