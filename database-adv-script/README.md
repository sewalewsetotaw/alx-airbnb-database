# 🧩 Implement advanced SQL querying and optimization techniques

This directory contains advanced SQL querying and optimization techniques in a relational database model for an Airbnb-Database .

### 🔹 INNER JOIN

An `INNER JOIN` returns only the rows that have matching values in both tables involved in the join.

- It excludes records that do not have a match in both tables.
- Useful when you want only the data that exists in both tables.

📌 **Example in this project**:  
Retrieve all bookings and the users who made them. Only users with at least one booking will appear.

---

### 🔹 LEFT JOIN (LEFT OUTER JOIN)

A `LEFT JOIN` returns all rows from the **left table**, and the matching rows from the **right table**. If there’s no match, the result is `NULL` for columns from the right table.

- Ensures all records from the left table are included, regardless of matches.
- Helps identify missing or unmatched data.

📌 **Example in this project**:  
Retrieve all properties and any reviews they have. Properties without reviews are still included in the result, with `NULL` in the review fields.

---

### 🔹 FULL OUTER JOIN

A `FULL OUTER JOIN` returns all rows from both tables. When there is no match, the result will contain `NULL` in the columns from the table that doesn't have the match.

- Combines the results of `LEFT JOIN` and `RIGHT JOIN`.
- Useful for getting a complete picture of data from both tables, including unmatched rows.

📌 **Example in this project**:  
Retrieve all users and all bookings — even users who haven’t booked, and bookings that aren’t linked to a user (if any exist).

---

A **subquery** is a SQL query that is embedded inside another query. It is used to perform operations that depend on the results of other queries and is often placed within the `WHERE`, `FROM`, or `SELECT` clauses.

Subqueries help break down complex logic into manageable parts and can make queries more modular and expressive.

There are two main types of subqueries:

---

### 🔹 Non-Correlated Subquery

A **non-correlated subquery** executes independently of the outer query. It does not reference any columns from the outer query, meaning it can be evaluated once and its result reused.

- Runs just once before the outer query
- Does not depend on outer query data
- Can be tested and executed as a standalone query

This type is typically used for filtering results based on aggregated data or specific conditions.

---

### 🔹 Correlated Subquery

A **correlated subquery** is evaluated for each row processed by the outer query. It references columns from the outer query and therefore cannot run independently.

- Executes once per row of the outer query
- Depends on data from the outer query
- Cannot be executed separately

Correlated subqueries are useful when row-by-row comparison or filtering is needed based on related data.

---

## 📚 Understanding SQL Aggregation and Window Functions

This section explains the key SQL functions and clauses used in this task to analyze data from the Airbnb Database.

---

### 🔢 COUNT()

The `COUNT()` function is an **aggregate function** that returns the number of rows matching a specific condition or within a group.

- `COUNT(column_name)` or `COUNT(*)`
- Useful for counting bookings, users, reviews, etc.

---

### 📦 GROUP BY

The `GROUP BY` clause groups rows that have the same values in specified columns into summary rows.

- Often used with aggregate functions like `COUNT()`, `SUM()`, `AVG()`, etc.
- Groups the data based on a column (e.g., by user or by property).

---

### 🔃 ORDER BY

The `ORDER BY` clause sorts the result set by one or more columns.

- Can sort in **ascending** (`ASC`) or **descending** (`DESC`) order.
- Used in combination with `GROUP BY` or window functions to rank or sort output.

---

### 🪟 ROW_NUMBER()

`ROW_NUMBER()` is a **window function** that assigns a unique, sequential number to each row within a partition of the result set.

- Numbers rows in the order specified by `ORDER BY`.
- No ties — each row gets a distinct number.

---

### 🏅 RANK()

`RANK()` is also a **window function** that assigns a rank to each row within a partition based on an ordering condition.

- Rows with **equal values** receive the **same rank**.
- The next rank is skipped accordingly (i.e., not sequential if there are ties).

---
