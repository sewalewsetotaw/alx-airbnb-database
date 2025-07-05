# ⚡ Index Performance Optimization – Airbnb Database

This document outlines how performance was improved by adding indexes to frequently queried columns in the `User`, `Booking`, and `Property` tables.

---

## 🎯 Objective

Enhance query speed and efficiency by creating indexes on high-usage columns and measuring their impact using PostgreSQL's `EXPLAIN` and `EXPLAIN ANALYZE`.

---

## 📌 Indexes Created

### ✅ Booking Table

| Column        | Index Name                  | Use Case                     |
| ------------- | --------------------------- | ---------------------------- |
| `user_id`     | `index_booking_user_id`     | JOIN with User table         |
| `property_id` | `index_booking_property_id` | JOIN with Property table     |
| `start_date`  | `index_booking_start_date`  | Filtering or sorting by date |

### ✅ Property Table

| Column        | Index Name                   | Use Case                    |
| ------------- | ---------------------------- | --------------------------- |
| `host_id`     | `index_property_host_id`     | JOIN with User table (host) |
| `location_id` | `index_property_location_id` | Filtering by location       |

> ℹ️ The **User table** already has automatic indexes on `user_id` (PRIMARY KEY) and `email` (UNIQUE), so no manual indexing was required.

---

## 🧪 Performance Comparison

### 🔹 Query 1: `User JOIN Booking`

**Before Index:**

```sql
Hash Join
  Seq Scan on User
  Seq Scan on Booking

After Index:

Nested Loop
  Index Scan on booking (index_booking_user_id)
  Index Scan on user (User_pkey)

🔹 Query 2: Booking JOIN Property

Before Index:

Hash Join
  Seq Scan on Booking
  Seq Scan on Property

After Index:

Merge Join
  Index Scan on booking (index_booking_property_id)
  Index Only Scan on property (property_pkey)

🔹 Query 3: User JOIN Property (as host)

Before Index:

Hash Join
  Seq Scan on User
  Seq Scan on Property

After Index:

Nested Loop
  Index Scan on property (index_property_host_id)
  Index Scan on user (User_pkey)
```
