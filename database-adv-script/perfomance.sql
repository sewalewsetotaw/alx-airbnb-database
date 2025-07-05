 SELECT b.booking_id,
       b.start_date,
       b.end_date,
       b.total_price ,
       b.status,
       u.user_id ,
       u.first_name,
       u.last_name,
       u.email ,
       p.property_id,
       p.name AS property_name,
       p.description,
       p2.payment_id,
       p2.amount,
       p2.payment_date,
       p2.payment_method
FROM   booking b
       LEFT JOIN "User" u 
              ON b.user_id = u.user_id
       LEFT JOIN property p
              ON b.property_id = p.property_id
       LEFT JOIN payment p2
              ON b.booking_id = p2.booking_id  

--Refactor the query--
 SELECT b.booking_id,
       b.start_date,
       b.end_date,
       b.total_price ,
       b.status,
       u.user_id ,
       u.first_name,
       u.last_name,
       u.email ,
       p.property_id,
       p.name AS property_name,
       p.description,
       p2.payment_id,
       p2.amount,
       p2.payment_date,
       p2.payment_method
FROM   booking b
       JOIN "User" u 
              ON b.user_id = u.user_id
       JOIN property p
              ON b.property_id = p.property_id
       LEFT JOIN payment p2
              ON b.booking_id = p2.booking_id  


CREATE INDEX IF NOT EXISTS  index_payment_booking_id on payment(booking_id)

CREATE INDEX IF NOT EXISTS  index_payment_payment_date on payment(payment_date)