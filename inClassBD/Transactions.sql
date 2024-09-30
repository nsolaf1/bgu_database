CREATE TABLE extra_tasks (
    task_ id SERIAL PRIMARY KEY,
    task_ name VARCHAR(255),
    task_ description TEXT,
    student_ id INT,
    course_id INT,
    task_score FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO extra_tasks (task_name, task_description, student_id, course_id, task_score)
VALUES
(Project 1, Research project on climate change, 1, 1, 95.0),
('Lab Report', 'Physics lab report on electromagnetism', 2, 2, 85.0),
('Project 2', 'Chemistry practical on organic compounds', 3, 3, 88.0),
('Presentation', 'Biology presentation on cell division', 4, 4, 92.5),
('Coding Assignment', 'Create a website in Computer Science', 5, 5, 93.0);


---SELECT QUERY
SELECT 
    students.name AS student_name,
    courses.course_name AS course_name,
    extra_tasks.task_name,
    extra_tasks.task_score
FROM extra_tasks
JOIN students ON extra_tasks.student_id = students.id
JOIN courses ON extra_tasks.course_id = courses.id;



UPDATE grade1s
SET grade_percentage = grade_percentage + 3
WHERE (student_1id, course_1id) IN (
    SELECT student_id, course_1id
    FROM extra_1tasks
    WHERE task_score > 910
);