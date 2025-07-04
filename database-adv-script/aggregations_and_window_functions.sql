-- 1. Aggregation: Total number of bookings made by each user

SELECT u.user_id,
       u.first_name,
       u.last_name,
       Count(b.booking_id) total_bookings
FROM   "user" u
       LEFT JOIN booking b
              ON u.user_id = b.user_id
GROUP  BY u.user_id,
          u.first_name,
          u.last_name
ORDER  BY total_bookings DESC  

-- 2. Window Function: Rank properties by total number of bookings

SELECT p.property_id,
       p."name"  property_name,
       p.description,
       Count(b.booking_id) total_bookings,
       Row_number()
         OVER(
           ORDER BY Count(b.booking_id) DESC),
       Rank()
         OVER(
           ORDER BY Count(b.booking_id) DESC)
FROM   property p
       LEFT JOIN booking b
              ON p.property_id = b.property_id
GROUP  BY p.property_id
ORDER  BY p.property_id,
          p."name" DESC  