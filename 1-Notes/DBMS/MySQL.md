
## Database

Database is a collection of interrelated data.

## DBMS

DBMS(Database Management System) is software used to create, manage, and organize databases.

## What is RDBMS

- RDBMS (Relational Database Management System) - is a DBMS based on the concept of tables (also called relations).
- Data is organized into tables(also known as relations) with rows(records) and columns(attributes).
- E.g., MySQL, PostgreSQL, SQL Server etc.

## SQL 

SQL is **Structured Query Language** - used to store, manipulate and retrieve data from RDBMS.

We use SQL for **CRUD** Operations:

- **CREATE** - To Create databases, tables, insert tuples etc.
- **READ** - To read data present int the database.
- **UPDATE** - Modify already insert data.
- **DELETE** - Delete database, table or specific data point/tuple/row or multiple rows.

**NOTE :** SQL keywords are NOT case sensitive. E.g., **select** is the same as **SELECT** in SQL.

#### Create Database

We can use the the following command to create the database.

```sql
CREATE DATABASE database_name;
```

#### Delete Database

We Can use the **DROP** command to delete the database.

```sql
DROP DATABASE database_name;
```

#### Select/Use the Database

We can use the **USE** command to select db and perform operation.

```sql
USE db_name;
```
### SQL vs MySQL

SQL is a language used to perform CRUD operations in Relational DB, while MySQL is a RDBMS that uses SQL.


![](1-Notes/DBMS/assets/img.png)
#### Creating Table

We can create the table in db using the **CREATE TABLE** command whole syntax is given below.

```sql
CREATE TABLE table_name(
column_name1 datatype constraint;
column_name2 datatype constraint;
column_name3 datatype constraint;
);
```

## SQL Data Types

In SQL, data types define the kind of data that can be stored in a column or variable.

| Datatype    | Description                                                        | Usage         |
| ----------- | ------------------------------------------------------------------ | ------------- |
| **CHAR**    | String (0-255), can store characters of fixed length               | `CHAR(50)`    |
| **VARCHAR** | String (0-255), can store characters up to given length            | `VARCHAR(50)` |
| **BLOB**    | String (0-65535), can store binary large object                    | `BLOB(1000)`  |
| **INT**     | Integer (-2,147,483,648 to 2,147,483,647)                          | `INT`         |
| **TINYINT** | Integer (-128 to 127)                                              | `TINYINT`     |
| **BIGINT**  | Integer (-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)  | `BIGINT`      |
| **BIT**     | Can store x-bit values. x can range from 1 to 64                   | `BIT(2)`      |
| **FLOAT**   | Decimal number - with precision to 23 digits                       | `FLOAT`       |
| **DOUBLE**  | Decimal number - with 24 to 53 digits                              | `DOUBLE`      |
| **BOOLEAN** | Boolean values 0 or 1                                              | `BOOLEAN`     |
| **DATE**    | Date in format of YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31 | `DATE`        |
| **TIME**    | HH:MM:SS                                                           | `TIME`        |
| **YEAR**    | Year in 4-digit format ranging from 1901 to 2155                   | `YEAR`        |

*Note* - CHAR is for fixed length & VARCHAR is for variable length strings. Generally, VARCHAR is better as it only occupies necessary memory & works more efficiently.

*Signed & Unsigned* :
We can also use UNSIGNED with datatypes when we only have positive values to add. Eg - UNSIGNED INT

TINYINT UNSIGNED (0 to 255)

TINYINT (-128 to 127)

## Types of SQL Commands

1. **DDL(Database Definition Language):** Used to create, alter, delete database objects like tables, indexes, etc. (CREATE, DROP, ALTER, RENAME, TRUNCATE).
2. **DQL(Database Query Language):** Used to retrieve data from databases. (SELECT).
3. **DML(Database Manipulation Language):** Used to modify the database. (INSERT, UPDATE, DELETE).
4. **DCL(Database Control Language):** Used to grant & revoke permissions. (GRANT, REVOKE).
5. **TCL(Transaction Control Language):** Used to manage transactions, (COMMIT, ROLLBACK, START TRANSACTIONS, SAVEPOINT).

## DATABASE related Queries
---

```mysql
CREATE DATABASE db_name; -- used to create database
```

```mysql
CREATE DATABASE IF NOT EXISTS db_name; -- create database if database not exist of this name.
```

```mysql
DROP DATABASE db_name; -- delete database
```

```mysql
DROP DATABASE IF EXISTS db_name; -- delete database if exists
```

```mysql
SHOW DATABASES; -- show all databases
```

```mysql
SHOW TABLES; -- used to show all tables in particular database
```


## Table related Queries
---

### Create Tables

We can use the following syntax to create the table or design the scheme of table.

```mysql
CREATE TABLE table_name(
column_name1 datatype constraint;
column_name2 datatype constraint;
);
```

*Example*

```mysql
CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);
```

### Select & View ALL columns

```mysql
SELECT * FROM table_name; -- display whole table
```

#### Insert

```mysql
INSERT INTO table_name
(colname1, colname2);
VALUES
(col1_v1, col2_v1),
(col1_v2, col2_v2);
```


## Keys
---

### Primary Key

It is a column (or set of columns) in a table that uniquely identifies each row. (a unique id). There is only 1 Primary Key and it should not be *NOT null*

### Foreign Key

A foreign key is a column (or set of columns) in a table that refers to the primary key in another table. There can be multiple FKs. FKs can be have duplicate & null values.

![](1-Notes/DBMS/assets/img-1.png)

### Secondary Key

Secondary key may or may not be unique field. Some times records are required to access by a field other than the primary key. In these situations another key that is used is called secondary key.

### Composite Key

Composite key consists of two or more than two fields. Composite key is also designed as a primary key. It is created in a situation when no single field fulfills the property of uniqueness. To make unique more than one field are combined and used as primary key.

## Constraints
---

SQL constraints are used to specify **rules** for data in a table.

- **NOT NULL** : columns cannot have null value. *col1 INT NOT NULL*
- **UNIQUE** : all values in column are different. *col2 UNIQUE*
- **PRIMARY KEY** : makes a column unique & not null but used only for one. *id INT PRIMARY KEY*. also declare as *PRIMARY KEY (id)*.

#### Foreign Key

Prevent actions that would destroy links between tables.

```mysql
CREATE TABLE temp(
cust_id INT,
FOREIGN KEY (cust_id) references customer(id)
);
```

#### DEFAULT

sets the default value of a column

```mysql
salary INT DEFAULT default_value;
```

#### CHECK

It can limit the values allowed in a column.


```mysql
CREATE TABLE city(

	id INT PRIMARY KEY,
	city VARCHAR(50),
	age INT,
	CONSTRAINT age_check CHECK (age>= 16 AND city="Delhi")
);
```

```mysql
CREATE TABLE newTab (
age INT CHECK (age>=18)
);
```

## Select in Detail
---

#### SELECT

The SELECT statement is used to select data from a database.

```mysql
SELECT col1,col2 FROM table_name;
```

#### To Select All

```mysql
SELECT * FROM table_name;
```


*Tip:* **DISTINCT** Keyword Removes duplicate rows from query results.

Syntax: 

```mysql
SELECT DISTINCT column1, column2 FROM table_name;
```


## Where Clause
---

To define some conditions

```mysql
SELECT col1,col2 from table
WHERE condition(s).
```

```mysql
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city="Multan";
```

## Operator in WHERE

- **Arithmetic Operators** : + , - , * , / , %
- **Comparison Operators** : = , != , > , >= , < , <=
- **Logical Operators** : AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
- **Bitwise Operators** : & , |

#### Operators

- *AND* (to check for both conditions to be true)

```mysql
SELECT * FROM student WHERE marks > 80 AND city="Multan";
```

- *OR* (to check for one of the conditions to be true)

```mysql
SELECT * FROM student WHERE marks > 90 OR city="Lahore";
```

- **BETWEEN** : select for a given range

```mysql
SELECT * FROM student WHERE marks 80 AND 90;
```


- **IN** : (matches any value in the list)

```mysql
SELECT * FROM student WHERE city IN ("Multan","Karachi")
```

- **NOT** : (to negate the given condition)

```mysql
SELECT * FROM student WHERE city NOT IN ("Multan", "Karachi")
```

## Limit Clause

The limit clause is used to sets an upper limit on number of(tuples)rows to be returned.

```mysql
SELECT * FROM student LIMIT 3;
```

```mysql
SELECT col1,col2 FROM table_name
LIMIT number;
```


## Order by Clause

To sort in ascending (ASC) or descending (DESC) order.

```mysql
SELECT * FROM student ORDER BY city ASC;
```

```mysql
SELECT col1,col2 FROM table_name ORDER BY col_name(s) ASC;
```


## Aggregate Functions

Aggregate functions perform a calculation on a set of values, and return a single value.

- COUNT()
- MAX()
- MIN()
- SUM()
- AVG()

Get Maximum Marks

```mysql
SELECT MAX(marks) FROM student;
```

Get Average marks

```mysql
SELECT AVG(marks) FROM student;
```


## Group By Clause

Group rows that have the same values into summary rows.
It collect data from multiple records(rows) and groups the result by one ore more column.

Generally we use the group by with some *aggregation function*.

Count number of students in each city

```mysql
SELECT city, count(name)
FROM student
GROUP BY city;
```


## HAVING Clause
---

Similar to WHERE i.e., applies some condition on rows.
Used when we want to apply any *condition after grouping*.

Count number of students in each city where max marks cross 90.

```mysql
SELECT city, count(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;
```


## General Order
---

*SELECT* column(s)
*FROM* table_name
*WHERE* condition
*GROUP BY* column(s)
*HAVING* condition
*ORDER BY* column(s) *ASC*;

Example:

```mysql
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city DESC;
```


## Table related Queries
---

*UPDATE* is used to update existing rows in a table.

```mysql
UPDATE table_name
SET col1=val1, col2=val2
WHERE condition;
```

```mysql
UPDATE student
SET grade = "O"
WHERE grade = "A";
```


*DELETE* is used to delete the existing rows in a table

```mysql
DELETE FROM table_name
WHERE condition;
```

```mysql
DELETE FROM student
WHERE marks < 33;
```


## Foreign Key
---
A **foreign key (FK)** is a column or a set of columns in a table that establishes a link between data in two tables. It refers to the **primary key (PK)** in another table, ensuring data integrity and enforcing referential constraints.

```mysql
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

## Cascading for FK
---

#### On Delete Cascade

When we create a foreign key using this option, it deletes the referencing rows in the child table when the referenced row is deleted in the parent table which has a primary key.
#### On Update Cascade

When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child table when the referenced row is updated in the parent table which has a primary key.

```mysql
CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) references dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
    
);
```


## Alter

The **ALTER** is used to change the schema of table in a database.

1. **ADD** Column

```mysql
ALTER TABLE table_name
ADD COLUMN column_name datatype constraint;
```


2. **DROP** Column

```mysql
ALTER TABLE table_name
DROP COLUMN column_name;
```


3. **RENAME** Column

```mysql
ALTER TABLE table_name
RENAME TO new_table_name;
```


4. **CHANGE** Column(rename)

```mysql
ALTER TABLE table_name
CHANGE COLUMN old_name new_name new_datatype new_constraint;
```


5. **MODIFY** Column(modify datatype/ constraint)

```mysql
ALTER TABLE table_name
MODIFY col_name new_datatype new_constraint;
```


## Truncate
---

The **TRUNCATE** is used to delete the data of table in database.

```mysql
TRUNCATE TABLE table_name ;
```


## Joins in SQL
---

