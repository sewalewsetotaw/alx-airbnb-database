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
