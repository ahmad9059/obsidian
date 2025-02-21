
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


### SQL vs MySQL

SQL is a language used to perform CRUD operations in Relational DB, while MySQL is a RDBMS that uses SQL.


![](1-Notes/DBMS/assets/img.png)

## SQL Data Types

In SQL, data types define the kind of data that can be stored in a column or variable.

|Datatype|Description|Usage|
|---|---|---|
|**CHAR**|String (0-255), can store characters of fixed length|`CHAR(50)`|
|**VARCHAR**|String (0-255), can store characters up to given length|`VARCHAR(50)`|
|**BLOB**|String (0-65535), can store binary large object|`BLOB(1000)`|
|**INT**|Integer (-2,147,483,648 to 2,147,483,647)|`INT`|
|**TINYINT**|Integer (-128 to 127)|`TINYINT`|
|**BIGINT**|Integer (-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)|`BIGINT`|
|**BIT**|Can store x-bit values. x can range from 1 to 64|`BIT(2)`|
|**FLOAT**|Decimal number - with precision to 23 digits|`FLOAT`|
|**DOUBLE**|Decimal number - with 24 to 53 digits|`DOUBLE`|
|**BOOLEAN**|Boolean values 0 or 1|`BOOLEAN`|
|**DATE**|Date in format of YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31|`DATE`|
|**TIME**|HH:MM:SS|`TIME`|
|**YEAR**|Year in 4-digit format ranging from 1901 to 2155|`YEAR`|

*Note* - CHAR is for fixed length & VARCHAR is for variable length strings. Generally, VARCHAR is better as it only occupies necessary memory & works more efficiently.

*Signed & Unsigned* :
We can also use UNSIGNED with datatypes when we only have positive values to add. Eg - UNSIGNED INT

TINYINT UNSIGNED (0 to 255)

TINYINT (-128 to 127)


