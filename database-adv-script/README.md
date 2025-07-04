# 🧩 Write Complex Queries with Joins

This directory contains advanced SQL queries demonstrating the use of various types of joins in a relational database model for an Airbnb-Database .

## 📁 File Structure

- `joins_queries.sql`: SQL file containing three JOIN queries (`INNER JOIN`, `LEFT JOIN`, `FULL OUTER JOIN`).
- `README.md`: Explanation of how each JOIN type works and what the queries return.

### 🔹 1. INNER JOIN

An `INNER JOIN` returns only the rows that have matching values in both tables involved in the join.

- It excludes records that do not have a match in both tables.
- Useful when you want only the data that exists in both tables.

📌 **Example in this project**:  
Retrieve all bookings and the users who made them. Only users with at least one booking will appear.

---

### 🔹 2. LEFT JOIN (LEFT OUTER JOIN)

A `LEFT JOIN` returns all rows from the **left table**, and the matching rows from the **right table**. If there’s no match, the result is `NULL` for columns from the right table.

- Ensures all records from the left table are included, regardless of matches.
- Helps identify missing or unmatched data.

📌 **Example in this project**:  
Retrieve all properties and any reviews they have. Properties without reviews are still included in the result, with `NULL` in the review fields.

---

### 🔹 3. FULL OUTER JOIN

A `FULL OUTER JOIN` returns all rows from both tables. When there is no match, the result will contain `NULL` in the columns from the table that doesn't have the match.

- Combines the results of `LEFT JOIN` and `RIGHT JOIN`.
- Useful for getting a complete picture of data from both tables, including unmatched rows.

📌 **Example in this project**:  
Retrieve all users and all bookings — even users who haven’t booked, and bookings that aren’t linked to a user (if any exist).

---
