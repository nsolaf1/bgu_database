------------------------------------------------
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade_percentage FLOAT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
-----------------------------------------------

INSERT INTO students (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Eve');

INSERT INTO courses (id, course_name) VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'Biology'),
(5, 'Computer Science');

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 4),
(4, 5),
(5, 2),
(5, 3);


INSERT INTO grades (student_id, course_id, grade_percentage) VALUES
(1, 1, 85.5), 
(1, 3, 90.0),
(2, 2, 78.0),  
(3, 1, 88.5),
(3, 4, 92.0), 
(4, 5, 75.5), 
(5, 2, 88.0),
(5, 3, 91.0);  


SELECT students.name, courses.course_name, grades.grade_percentage
FROM students
INNER JOIN enrollments ON students.id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.id
INNER JOIN grades ON enrollments.student_id = grades.student_id AND enrollments.course_id = grades.course_id;