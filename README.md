# Student Course Management System (MySQL)

## 📌 Project Overview

This project is a **Student Course Management System** implemented using **MySQL**.  
It demonstrates fundamental and advanced SQL concepts such as database creation, table relationships, CRUD operations, joins, subqueries, aggregate functions, window functions, and conditional logic.

The system manages:
- Students
- Courses
- Departments
- Enrollments

---

## 🗄️ Database Details

**Database Name:** `Final`

---

## 📋 Tables Description

### 1. Students
Stores student information.

| Column Name | Description |
|------------|------------|
| StudentID | Primary Key |
| FirstName | Student First Name |
| LastName | Student Last Name |
| Email | Email Address |
| BirthDate | Date of Birth |
| EnrollmentDate | Date of Enrollment |

---

### 2. Courses
Stores course details.

| Column Name | Description |
|------------|------------|
| CourseID | Primary Key |
| CourseName | Name of Course |
| DepartmentID | Foreign Key |
| Credits | Course Credits |

---

### 3. Departments
Stores department information.

| Column Name | Description |
|------------|------------|
| DepartmentID | Primary Key |
| DepartmentName | Department Name |

---

### 4. emp (Enrollments)
Maps students to courses.

| Column Name | Description |
|------------|------------|
| EnrolmentID | Primary Key |
| StudentID | Foreign Key → Students |
| CourseID | Foreign Key → Courses |
| EnrollmentDate | Enrollment Date |

---

## 🔗 Relationships

- One **Department** → Many **Courses**
- One **Student** → Many **Courses**
- Many-to-Many relationship handled using the `emp` table

---

## ⚙️ Features Implemented

- Database and table creation with constraints
- Insert, update, delete operations
- INNER JOIN and LEFT JOIN queries
- Subqueries and nested queries
- Aggregate functions (`COUNT`, `AVG`, `MAX`)
- Grouping with `GROUP BY` and `HAVING`
- Window functions for running totals
- Date handling and classification using `CASE`

---

## 🧠 Sample Queries Included

- Students enrolled after a specific date
- Courses offered by a specific department
- Total students per course and department
- Students enrolled in multiple courses
- Running total of enrollments per course
- Student classification as **Junior** or **Senior**

---

## ▶️ How to Run

1. Open **MySQL Workbench**
2. Create a new SQL file
3. Paste the provided SQL script
4. Execute the script step-by-step
5. View results using the included `SELECT` queries

---

## 🎯 Learning Outcomes

- Strong understanding of relational databases
- Hands-on SQL query writing
- Working with joins, subqueries, and analytics
- Applying constraints and normalization concepts

---

## 🛠️ Technologies Used

- **Database:** MySQL  
- **Language:** SQL

---

## 👨‍💻 Author

Academic project created to demonstrate **DBMS and SQL concepts**.

---

## 📄 License

This project is for educational purposes only.
