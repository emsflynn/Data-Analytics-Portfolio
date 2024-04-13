DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS enrollements;
DROP TABLE IF EXISTS courses;

CREATE TABLE students (
 student_id INT PRIMARY KEY,
 student_name VARCHAR(50),
 age INT,
 grade CHAR(1)
);


INSERT INTO students (student_id, student_name, age, grade)
VALUES (1, 'Alice', 20, 'A'),
 (2, 'Bob', 22, 'B'),
 (3, 'Charlie', 21, 'C'),
 (4, 'Robbie', 23, 'A'),
 (5, 'Emma', 22, 'B');
 
 
 CREATE TABLE courses (
 course_id INT PRIMARY KEY,
 course_name VARCHAR(50)
);

INSERT INTO courses (course_id, course_name)
VALUES (101, 'Mathematics'),
 (102, 'History'),
 (103, 'Computer Science');
 
 CREATE TABLE enrollments (
 enrollment_id INT PRIMARY KEY,
 student_id INT,
 course_id INT,
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (enrollment_id, student_id, course_id)
VALUES (1, 1, 101),
 (2, 1, 102),
 (3, 2, 103),
 (4, 3, 101),
 (5, 3, 103),
 (6, 1, 103),
 (7, 2, 101);
 
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

---- Inner Join : Question 1: Retrieve students and their enrolled courses.
SELECT students.student_id, student_name, course_name
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;


-- Left Join : Question 2: Retrieve all students and their enrolled courses
SELECT students.student_id, student_name, course_name FROM students LEFT
JOIN enrollments ON students.student_id = enrollments.student_id LEFT
JOIN courses ON enrollments.course_id = courses.course_id;

--Question 3: How can we get the count of students in each course?
SELECT course_name, COUNT(students.student_id) AS student_count
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
LEFT JOIN students ON enrollments.student_id = students.student_id
GROUP BY course_name;

-- Full Outer Join : Question 4: Retrieve all students and their enrolled courses
SELECT students.student_id, student_name, course_name
FROM students
FULL OUTER JOIN enrollments ON students.student_id =
enrollments.student_id
FULL OUTER JOIN courses ON enrollments.course_id = courses.course_id;


--Question 5: How can we display only the students who are not enrolled in any course?
SELECT students.student_id, student_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

-- Union : Question 6: Retrieve a list of unique students and courses combined.
SELECT student_name AS name FROM students
UNION
SELECT course_name AS name FROM courses;

-- Question 7: How can we include duplicate names in the result?
SELECT students.student_id, student_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

-- Cross Join : Question 8: Retrieve all possible combinations of students and courses.
SELECT student_name, course_name
FROM students
CROSS JOIN courses;

--Question 9: Show all combinations of students and courses but those with no enrollments?
SELECT student_name, course_name
FROM students
CROSS JOIN courses
LEFT JOIN enrollments ON students.student_id = enrollments.student_id AND
courses.course_id = enrollments.course_id
WHERE enrollments.student_id IS NULL;
