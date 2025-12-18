Create Database Final;
Use Final;

#---------------------------------Students Table----------------------------------#
# Create Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

#Insert values in students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');

# Retrive data
Select * from students;

#-------------------------------------Course Table-----------------------------------#
# Create Course Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT
);

# Insert values in Course Table
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

# Retrive data
select * from Courses;

#-----------------------------------------Employee table---------------------------------------#
# Create emp table
CREATE TABLE emp (
    EnrolmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

# Insert values in emp table
INSERT INTO emp (EnrolmentID, StudentID, CourseID, EnrollmentDate)VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');
# Retrive Data
select * from emp;

#---------------------------------Department Table--------------------------------#
# Create Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
# Insert values in Departments
INSERT INTO Departments (DepartmentID, DepartmentName)VALUES
(1, 'Computer Science'),
(2, 'Mathematics');
# Retrive Data
Select * from departments;

# Queries to Perform:
#1. Perform CRUD Operations on all tables.
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Departments;
SELECT * FROM emp;

UPDATE Students
SET Email = 'john.new@email.com'
WHERE StudentID = 1;
Select * from students;

DELETE FROM emp
WHERE EnrolmentID = 2;
Select * from emp;

#2. Retrieve students who enrolled after 2022.
SELECT *
FROM Students
WHERE EnrollmentDate > '2022-01-01';

#3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.
SELECT c.CourseID, c.CourseName
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

#4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.
SELECT 
    c.CourseName,
    COUNT(e.StudentID) AS TotalStudents
FROM emp e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName
HAVING COUNT(e.StudentID) > 0;

#5. Find students who are enrolled in both Introduction to SQL and Data Structures.
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN emp e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

#6. Find students who are either enrolled in Introduction to SQL or Data Structures.
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN emp e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

#7. Calculate the average number of credits for all courses.
SELECT AVG(Credits) AS AverageCredits
FROM Courses;

#8. Find the maximum salary of instructors in the Computer Science department.

SELECT MAX(Salary) AS MaxSalary
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

#9. Count the number of students enrolled in each department.
SELECT 
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM emp e
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Departments d ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

#10. INNER JOIN: Retrieve students and their corresponding courses.
SELECT 
    s.FirstName,
    s.LastName,
    c.CourseName
FROM emp e
INNER JOIN Students s ON e.StudentID = s.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

#11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
SELECT 
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
LEFT JOIN emp e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

#12. Subquery: Find students enrolled in courses that have more than 10 students.
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN emp e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM emp
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);

#13. Extract the year from the EnrollmentDate of students.
SELECT 
    StudentID,
    FirstName,
    LastName,
    YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

#15. Calculate the running total of students enrolled in courses.
SELECT
    CourseID,
    COUNT(StudentID) AS StudentsPerCourse,
    SUM(COUNT(StudentID)) OVER (ORDER BY CourseID) AS RunningTotalStudents
FROM emp
GROUP BY CourseID;

#16. Label students as 'Senior' or 'Junior' based on their year of enrollment. (If the enrollmentdate is more than 4 years from the currendate, put the label 'Senior' otherwise 'Junior' )
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        WHEN EnrollmentDate <= CURDATE() - INTERVAL 4 YEAR
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel
FROM Students;
