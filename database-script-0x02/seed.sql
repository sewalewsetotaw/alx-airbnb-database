-- seed.sql — Sample Data for Airbnb PostgreSQL Schema

-- Insert Users
INSERT INTO "User" (first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('Sewalew', 'Setotaw', 'sewalews29@gmail.com', 'hashed_password_123', '0955400102', 'guest'),
('Liya', 'Alemu', 'liya@gmail.com', 'hashed_password_456', '0923456789', 'host');

-- Insert Locations
INSERT INTO Location (sub_city, city, country)
VALUES 
('Arada', 'Addis Ababa', 'Ethiopia'),
('Yeka', 'Addis Ababa', 'Ethiopia');

-- Insert Property (replace UUIDs with actual values returned from SELECTs if needed)
INSERT INTO Property (host_id, name, description, location_id, pricepernight)
VALUES (
  '80470fa7-7866-4a5d-8556-5baf8ce3d270',
  'Cozy Apartment in Bole',
  'A modern 2-bedroom apartment near restaurants and cafes.',
  '00c22559-751a-4170-b81a-271cfdd6526e',
  1200.50
);

-- Insert Booking
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES (
  '1484a31f-e30d-4ab1-808c-7f21dbc64ea1',
  '80470fa7-7866-4a5d-8556-5baf8ce3d270',
  '2025-07-01',
  '2025-07-05',
  2500.00,
  'confirmed'
);

-- Insert Payment
INSERT INTO Payment (booking_id, amount, payment_date, payment_method)
VALUES (
  'ccc81935-a58b-461a-82ab-f0ca317e56bf',
  25000.00,
  '2025-07-05',
  'paypal'
);

-- Insert Review
INSERT INTO Review (property_id, user_id, rating, comment)
VALUES (
  '1484a31f-e30d-4ab1-808c-7f21dbc64ea1',
  '80470fa7-7866-4a5d-8556-5baf8ce3d270',
  5,
  'Amazing apartment, great location!'
);

-- Insert Message
INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES (
  '80470fa7-7866-4a5d-8556-5baf8ce3d270',
  '9675c7bf-6bc0-4618-87ab-c3746c0486a0',
  'Hi! I’m interested in booking your property. Is it available on the 1st of July?'
);
