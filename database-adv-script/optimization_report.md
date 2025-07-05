# 🛠️ Optimization Report

## 🔍 Initial Query Summary

The initial query retrieved booking data along with related user, property, and payment information using `LEFT JOIN`:

    SELECT
        b.booking_id,
        b.start_date,
        b.end_date,
        b.total_price,
        b.status,
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        p.property_id,
        p.name AS property_name,
        p.description,
        p2.payment_id,
        p2.amount,
        p2.payment_date,
        p2.payment_method
    FROM booking b
    LEFT JOIN "User" u ON b.user_id = u.user_id
    LEFT JOIN property p ON b.property_id = p.property_id
    LEFT JOIN payment p2 ON b.booking_id = p2.booking_id;

📈 Performance Analysis

After running the query with EXPLAIN ANALYZE, the following inefficiencies were observed:

🔁 Sequential scan on payment table
→ Caused by the absence of appropriate indexing.

🧩 Nested loop joins
→ Inefficient join strategy due to lack of indexes.

⚠️ No redundant joins, but the join types could be optimized for performance.

✅ Optimizations Made

🔧 1. Indexing
To reduce sequential scans and improve lookup performance, we created the following indexes:

    CREATE INDEX index_payment_booking_id ON payment(booking_id);
    CREATE INDEX index_payment_payment_date ON payment(payment_date);

booking_id index improves performance for joins between booking and payment.

payment_date index improves performance for date filtering/sorting.

🔧 2. Join Efficiency
We updated the join types to better reflect actual data relationships:

✅ Used INNER JOIN (JOIN) for User and Property tables
→ Every booking must be linked to a user and a property.

✅ Retained LEFT JOIN for the Payment table
→ Not all bookings have an associated payment.

🚀 Final Optimized Query

    SELECT
        b.booking_id,
        b.start_date,
        b.end_date,
        b.total_price,
        b.status,
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        p.property_id,
        p.name AS property_name,
        p.description,
        p2.payment_id,
        p2.amount,
        p2.payment_date,
        p2.payment_method
    FROM booking b
    JOIN "User" u ON b.user_id = u.user_id
    JOIN property p ON b.property_id = p.property_id
    LEFT JOIN payment p2 ON b.booking_id = p2.booking_id;
