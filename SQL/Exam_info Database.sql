-- 19/04/2025 --

Create database Exam_info;

-- Create the table
CREATE TABLE student_info (
    StudentID INT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50)
);
 
-- Insert 10 values for each variable
INSERT INTO student_info (StudentID, FirstNames, LastNames) VALUES
(1, 'John', 'Doe'),
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Emily', 'Brown'),
(5, 'Michael', 'Davis'),
(6, 'Sarah', 'Wilson'),
(7, 'David', 'Lee'),
(8, 'Jessica', 'Taylor'),
(9, 'Chris', 'Evans'),
(10, 'Emma', 'Thompson');
-- Copy and Paste the following code to create a table exam_info within the database

-- Create the table
CREATE TABLE exam_info (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer
);
 
-- Insert 10 values for each variable
INSERT INTO exam_info (StudentID, Subjects, Scores) VALUES
(1, 'Math',  80),
(2, 'English',  75),
(3, 'Science',  78),
(4, 'Math',  60),
(5, 'English', 86),
(6, 'Science', 90),
(7, 'Science', 75),
(8, 'English', 75),
(9, 'Math',  55),
(10, 'Math',  67);
-- Write necessary code to filter all the columns of student_info table where StudentID from student_info tables equals to that of exam_info
-- table and scores is greater than 75. That means you are finding the information of the students who scored more than 75 in the exam 
-- by using ANY sql method.
SELECT * FROM student_info 
WHERE StudentID = ANY (
    SELECT StudentID FROM exam_info WHERE Scores >= 75);











