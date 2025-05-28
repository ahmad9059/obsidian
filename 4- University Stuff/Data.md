Perfect! Here's a full SQL practice setup including:

- **Table creation scripts**
- **Sample data inserts**
- **Practice questions** for DDL, DML, DQL, DCL, and TCL
---

## 🏗️ 1. Table Creation (DDL)

```sql
-- Departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    building VARCHAR(50)
);

-- Faculty
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    dept_id INT,
    designation VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    dept_id INT,
    year INT,
    gender CHAR(1),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    credits INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Library
CREATE TABLE Library (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    available BOOLEAN
);

-- Fees
CREATE TABLE Fees (
    fee_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    paid_date DATE,
    method VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
```

---

## 🧾 2. Sample Data (INSERTs)

```sql
-- Departments
INSERT INTO Departments VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Mechanical', 'Block B'),
(3, 'Electrical', 'Block C');

-- Faculty
INSERT INTO Faculty VALUES
(101, 'Dr. Smith', 'smith@campus.edu', 1, 'Professor'),
(102, 'Dr. Ray', 'ray@campus.edu', 2, 'Lecturer');

-- Students
INSERT INTO Students VALUES
(201, 'Alice', 'alice@campus.edu', 1, 2, 'F'),
(202, 'Bob', 'bob@campus.edu', 1, 3, 'M'),
(203, 'Charlie', 'charlie@campus.edu', 2, 2, 'M');

-- Courses
INSERT INTO Courses VALUES
(301, 'Data Structures', 4, 1),
(302, 'Thermodynamics', 3, 2),
(303, 'Circuits', 3, 3);

-- Enrollments
INSERT INTO Enrollments VALUES
(401, 201, 301, 'Fall', 'A'),
(402, 202, 301, 'Fall', 'B+'),
(403, 203, 302, 'Fall', 'A');

-- Library
INSERT INTO Library VALUES
(501, 'Database Systems', 'Korth', TRUE),
(502, 'Thermodynamics 101', 'Moran', FALSE);

-- Fees
INSERT INTO Fees VALUES
(601, 201, 50000.00, '2024-07-10', 'UPI'),
(602, 202, 48000.00, '2024-08-05', 'Card');
```

---

## 🧠 3. Practice Questions

### 🔧 DDL

1. Add a column `phone VARCHAR(15)` to the `Students` table.
    
2. Rename `dept_name` in `Departments` to `department_name`.
    
3. Drop the `Library` table.
    

### 📝 DML

1. Update Bob's year to 4.
    
2. Delete the fee entry for student 201.
    
3. Insert a new student in the Electrical department.
    

### 🔍 DQL

1. List all students in the Computer Science department.
    
2. Find students who got an 'A' grade.
    
3. List all available books in the library.
    
4. Join `Enrollments`, `Students`, and `Courses` to show student names with course titles and grades.
    

### 🔐 DCL

1. Grant SELECT on `Students` to user `readonly_user`.
    
2. Revoke UPDATE on `Fees` from user `intern_user`.
    

### 🔄 TCL

1. Start a transaction to:
    
    - Insert a new fee for student 203
        
    - Then rollback
        
2. Start a transaction to:
    
    - Update a course credit to 5
        
    - Commit it
        

---
