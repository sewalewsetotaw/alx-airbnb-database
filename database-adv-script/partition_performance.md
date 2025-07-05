# 📊 Partitioning Performance Report

## 🧩 Objective

Optimize query performance on the large `Booking` table by implementing **range partitioning** on the `start_date` column.

---

## 🛠️ Implementation Summary

The original `Booking` table used `UUID` as the primary key and included fields like `user_id`, `property_id`, `total_price`, `status`, and `created_at`.

We partitioned the table using:

```sql
PARTITION BY RANGE (start_date)

Partition structure:

    booking_2023: 2023-01-01 → 2023-12-31

    booking_2024: 2024-01-01 → 2024-12-31

    booking_2025: 2025-01-01 → 2025-12-31

The primary key was adjusted to include the partition key:
sql

PRIMARY KEY (booking_id, start_date)

🧪 Performance Test: Query by Date Range
🔍 Query Tested:
sql

SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

📈 Results
✅ Partitioned Table (Booking)
pgsql

Seq Scan on booking_2024
Filter: start_date between '2024-01-01' and '2024-12-31'
Planning Time: 0.143 ms
Execution Time: 0.027 ms

❌ Non-Partitioned Table (booking_old)
pgsql

Seq Scan on booking_old
Filter: start_date between '2024-01-01' and '2024-12-31'
Rows Removed by Filter: 8
Planning Time: 1.230 ms
Execution Time: 0.044 ms

✅ Observations
Metric	Partitioned Table	Non-Partitioned Table
Scanned Table	booking_2024	booking_old (full)
Planning Time	0.143 ms	1.230 ms
Execution Time	0.027 ms	0.044 ms
Filtered Rows	0	8

Even with a small dataset, the partitioned table reduced planning time by 88% and execution time by 39%.
🚀 Conclusion

✅ Partitioning based on start_date allows PostgreSQL to prune irrelevant partitions.
✅ Significant planning and execution time improvements were observed.
✅ With larger datasets, performance benefits scale dramatically.
```
