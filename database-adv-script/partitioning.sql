-- Enable extension for UUID if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Step 1: Create parent partitioned table

CREATE TABLE IF NOT EXISTS Booking (
    booking_id UUID  DEFAULT uuid_generate_v4(),
    property_id UUID REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id UUID REFERENCES "User"(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status_type NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(booking_id,start_date)
)PARTITION BY RANGE (start_date);

-- Step 2: Create Yearly child partitions 
CREATE TABLE IF NOT EXISTS Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');

CREATE TABLE IF NOT EXISTS Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2024-12-31');

CREATE TABLE IF NOT EXISTS Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-12-31');

-- Step 3: Optional - Add indexes to child tables to improve performance
CREATE INDEX IF NOT EXISTS booking_2023_start_date_idx ON Booking_2023(start_date);
CREATE INDEX IF NOT EXISTS booking_2024_start_date_idx ON Booking_2024(start_date);
CREATE INDEX IF NOT EXISTS booking_2025_start_date_idx ON Booking_2025(start_date);

-- Step 4: Test performance with a sample EXPLAIN query
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';