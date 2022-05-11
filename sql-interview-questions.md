## Subsets of SQL
**Data Definition Language (DDL)**:<br>
Commands that can be used to define the database schema.

**Data Manipulation Language (DML)**:<br>
Commands used to manipulate data already present in the database.

**Data Definition Language (DCL)**:<br>
Commands that deal with rights, permissions, and other controls of the database. (eg. giving users permission/access)

**Transaction Control Language (TCL)**:<br>
Commands that deal with database transactions.

## Database Management Systems (DBMS)
Software application that interacts with the user, applications, and database itself to capture and analyze data. Data stored in the database can be modified/retrieved/deleted and can be of any type (strings, numbers, images, etc.).<br>
**Hierarchical**<br>
**Relational**<br>
**Network**<br>
**Object-Oriented**<br>

**DELETE:** 
- Deletes row from a table.
- Can be rolled back.
- DML (Data Manipulation) command.
- Slower than TRUNCATE.

**TRUNCATE**: 
- Deletes all rows in a table.
- Can not be rolled back.
- DDL (Data Definition) command.
- TRUNCATE TABLE table_name;

**DROP**: 
- Removes a table.
- Can not be rolled back.
- DROP TABLE table_name;
- DROP object object_name;

**Table**:<br>
Collection of data organized as rows and columns.

**Field**:<br>
Column in a table.

**JOIN**:
- Combine rows from two or more tables based on a related column.
- INNER JOIN: Returns records with matching values in both tables.
- LEFT JOIN: Returns all records from the left table, and also those with matching values in the right table.
- RIGHT JOIN: Returns all records from the right table, and also those with matching values in the left table.
- FULL/OUTER JOIN: Returns records which have a match in either left or right table.

**CHAR**:<br>
- String of fixed length.
- CHAR(10) : Can store EXACTLY 10 characters.

**VARCHAR2**:<br>
- Strings of variable length.
- VARCHAR2(10) : Can store up to 10 characters.

**PRIMARY KEY**:
- An attribute (or set of attributes) that can be used to uniquely identify every row in a table.
- eg. Employee ID#

**Constraints**:
- Specify limit on the data type of the table.
- Can be specified while creating or altering the table statement.
- NOT NULL : Ensures Null value can not be stored in a column.
- UNIQUE : Ensures all values in a column are unique.
- CHECK : Ensures all values in a column satisfy a condition.
- DEFAULT : Default value for a column when no value is specified.
- INDEX : Create and retrieve data from the database very quickly.

**SQL vs MySQL**:
- **SQL**: Structured Query Language, programming language used to access and manage a database.
- **MySQL**: Relational Database Management System.

**Unique Key**:
- Uniquely identifies a single row in the table.
- Multiple values allowed per table.
- Null values are allowed.
- Duplicate values are not allowed.

**FOREIGN KEY**:
- Maintains referential integrity by enforcing a link between the data in two tables.
- The foreign key in one table references the Primary Key in another table.
- The foreign key contraint helps prevent actions that would destory links between two tables.

**Data Integrity**:
- Accuracy of data.
- Consistency of data.
- Contraints to enforce rules on data as it is entered into a database.

**Index**:
- Performance Tuning Method.
- Create index for each record for easier retrieval.

**Unique Index**:
- Does not allow field to have duplicate values in index column.
- If a primary key is define, a unique index can be applied automatically.

**Clustered Index**:
- Faster, easier retrieval of data from database.
- Alters the way records are stored.
- Sorts rows by column that is set as the clustered index.
- A table can only have one clustered index.

**Non-Clustered Index**:
- Slower data retrieval.
- Does not alter the way data is stored.
- A table can have many non-clustered indexes.

**GETDATE() or SELECT GETDATE();**<br>
Returns current date/timestamp.

**Denormalization**:
- Database queries that combine data from various tables into a single table.
- Increase performance by introducing redundancy.

**Normalization**:
- Process of organizing data to avoid duplication/redundancy.
- Better organization
- More tables with less rows
- Efficient data access
- More flexible queries
- Compact
- Easier to find and/or modify information

## Types of Normalization
**1NF**:
- Each table cell has a single value (all records are unique)

**2NF**:
- Database should be 1NF
- Should have a single PRIMARY KEY
- Split into multiple tables linked by PRIMARY KEY

**3NF**:
- Database should be 2NF
- No transitive functional dependencies.

**BCNF**:
- Every column is it's own table with a primary/foreign key relationship.

**Entity**:
- Something about which data can be stored
- Tables store data that represent one entity
- e.g. bank database has a customer table to store customer data.

**Relationship**:
- Links between entities

**Trigger**:
- Stored procedure.
- Execute automatically in place or after data modifications.
- Allows you to execute a batch of code when an insert, update, or any other query is executed.

**Types of Triggers**:
- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE
- AFTER DELETE

**Operators**:
- Arithmetic, Bitwise, Comparison, Compound, Logical

**NULL Values**:<br>
Not the same as zero or blank space. 0 is an integer, blank space is a character. NULL means unavailable/unknown.

**Cross Join**:<br>
Cross product or Cartesian product of two tables.

**Natural Join**:
Based on all columns having the same name and data types in both tables.

**Subquery**:
- Query inside another query that is design to retrieve data.
- Subquery is executed first and the result is passed back to the main query.
- Code below gets list of address codes and passes that back to main query.

```SQL
SELECT lastname, firstname
FROM employees
WHERE addresscode IN (SELECT addresscode
                      FROM office
                      WHERE country = "INDIA")
```

**Types of Subqueries**:
**Correlated Subquery**: When sub and main-queries reference the same table.
**Non-Correlated Subquery**: Output of subquery is substituted in the main query.

**COUNT**:
- Count records in a table

```SQL
SELECT COUNT(*) FROM table1;
```

**LIKE**:
- Display list of employee names that begin with A.

```SQL
SELECT *
FROM employees
WHERE name LIKE "A%"
```

**ASC, DESC**:
- Get third highest salary of an employee.

```SQL
SELECT TOP 1 salary
FROM (SELECT TOP 3 salary
      FROM employee_table
      ORDER BY salary DESC) AS emp
ORDER BY salary ASC
```

**Group Functions**:
- Work on set of rows and returns one value.
- AVG
- COUNT
- MIN, MAX
- SUM
- VARIANCE

**Inserting a NULL value**:
- Implicitly by omitting columns from column list during insert.
- Explicity by specifying NULL keyword in the VALUES clause.

**BETWEEN**:
- Used when checking a range.

```SQL
SELECT *
FROM Students
WHERE roll_no BETWEEN 10 AND 50
```

**IN**:
- Used when checking for a specific value or set of values.

```SQL
SELECT *
FROM Students
WHERE roll_no IN (8,15,25)
```

**MERGE**:
- Allows update or insertion of data into a table.
- Performs an UPDATE if a row exists.
- Performs an INSERT if the row does not exist.

**CLAUSE**:
- Helps limit the result set of a query by providing a condition.
- Filters rows from the entire set of records.
- eg. WHERE and HAVING

**HAVING**:
- Can only be used SELECT statement.
- Usually used in a GROUP BY clause.

**WHERE**:
- Applied to each row before they are a part of the GROUP BY function in a query.

**INTERSECT**:
- Return common records between two tables based on a column.

```SQL
SELECT column1, column2
FROM table_names
WHERE condition

INTERSECT

SELECT column1, column2
FROM table_names
WHERE condition
```

```SQL
SELECT studentid
FROM student
INTERSECT
SELECT studentid
FROM exam
```

**Case Manipulation Functions**:
- LOWER("string")
- UPPER("string")
- INITCAP("string")

**Set Operators**:
- UNION : Combine rows from both queries (outer join)
- INTERSECT : Only common rows (inner join)
- MINUS : Only rows from left query that are not included in the right query.

**ALIAS**:
- Can be given to any table or column
- Alias name can be referred to in WHERE clause to identify a particular table or column.

```SQL
SELECT emp.empID, dept.Result
FROM employee emp, department as dept
WHERE emp.empID=dept.empID
```

**Aggregate Functions**:
- Used to perform mathematical calculation on group of values and returns single value.
- eg. MAX(), COUNT()

**Scalar Functions**:
- Return single value based on the single input value.
- eg. UCASE(), NOW()

**Wild Cards**:
- % : Matches zero or more characters.
- _ : Matches exactly one character.

```SQL
SELECT *
FROM students
WHERE studentname LIKE "A%"

SELECT *
FROM students
WHERE studentname LIKE "Abc_"
```

**DISTINCT**:
- Selects unique records from a table.

```SQL
SELECT DISTINCT studentID
FROM students;
```

**SUBSTRING**:
- Multiple ways to get characters from a string.

```SQL
SELECT SUBSTRING(studentname,1,5) AS studentname
FROM students

SELECT RIGHT(studentname,5) AS studentname
FROM students
```

**View**:
- Virtual table which consists of a subset of data contained in a table.
- Less space to store.
- Query can take data from multiple tables and combine into a view.

**What are Views used for**:
- Restrict access to data.
- Make complex queries simpler.
- Ensure data independence.
- Provide different views of the same data.

**Stored Procedure**:
- Function
- Consists of many SQL statements consolidated and executed when required.
- Can only be executed in the database and uses more memory.

**Collation**:
- Set of rules that determine how data can be sorted and compared.

**Collation Sensitivity**:
- Case, Kana, Width, Accent

**Local Variables**:
- Only exist within a function.
- Can not be used or referenced by any other function.

**Global Variables**:
- Can be accessed throughout program.

**Auto Increment**:
- Allows user to create a unique number generated whenever a new record is inserted into a table.
- Usually used whenever PRIMARY KEY is used.

**STUFF**:
- Overwrite existing characters, or inserting a string into another string.

```SQL
STUFF (string_expression, start, length, replacement_characters)
```

**REPLACE**:
- Replace all occurrences of existing characters.

```SQL
REPLACE (string_expression, search_string, replacement_string)
```

