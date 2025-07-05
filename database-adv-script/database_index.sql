    -- Measure query performance before adding indexes
    EXPLAIN SELECT
    u.user_id, u.first_name, u.last_name, b.booking_id, b.start_date, b.status FROM "User" u JOIN booking b ON u.user_id =b.user_id  
    
    EXPLAIN select
    b.booking_id,b.property_id,b.user_id,b.start_date,b.status FROM booking b join property p on b.property_id =p.property_id
    
    EXPLAIN SELECT
    u.user_id,u.first_name,u.last_name,p."name" property_name,p.description FROM "User" u join property p on u.user_id =p.host_id 

    -- Creating index for Booking and Property table 
    
    -- Booking table: filtered by user_id, property_id, and ordered by start_date
    
    CREATE INDEX IF NOT EXISTS index_booking_user_id on booking(user_id)
    
    CREATE INDEX IF NOT EXISTS index_booking_property_id on booking(property_id)
    
    CREATE INDEX IF NOT EXISTS index_booking_start_date ON booking(start_date);
 	
    -- Property table: often joined or filtered by location_id and host_id
    
    CREATE INDEX IF NOT EXISTS index_property_host_id on property(host_id)
    
    CREATE INDEX IF NOT EXISTS index_property_location_id on property(location_id)

    -- Note: 
    -- User table already has indexes on user_id (PRIMARY KEY) and email (UNIQUE), 
    -- so no need to create additional ones manually.

        -- Measure query performance after adding indexes
    EXPLAIN SELECT
    u.user_id, u.first_name, u.last_name, b.booking_id, b.start_date, b.status FROM "User" u JOIN booking b ON u.user_id =b.user_id  
    
    EXPLAIN select
    b.booking_id,b.property_id,b.user_id,b.start_date,b.status FROM booking b join property p on b.property_id =p.property_id
    
    EXPLAIN SELECT
    u.user_id,u.first_name,u.last_name,p."name" property_name,p.description FROM "User" u join property p on u.user_id =p.host_id 
