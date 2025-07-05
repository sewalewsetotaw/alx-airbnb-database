-- seed.sql — Sample Data for Airbnb PostgreSQL Schema

-- Insert User

INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('Sewalew', 'Setotaw', 'sewalew@gmail.com', 'hashed_pw_1', '0911111111', 'guest'),
('Liya', 'Alemu', 'liya@gmail.com', 'hashed_pw_2', '0922222222', 'host'),
('Nahom', 'Tadesse', 'nahom@gmail.com', 'hashed_pw_3', '0933333333', 'guest'),
('Sara', 'Bekele', 'sara@gmail.com', 'hashed_pw_4', '0944444444', 'host'),
('Miki', 'Abebe', 'miki@gmail.com', 'hashed_pw_5', '0955555555', 'guest'),
('Ruth', 'Kebede', 'ruth@gmail.com', 'hashed_pw_6', '0966666666', 'host'),
('Amanuel', 'Tesfaye', 'amanuel@gmail.com', 'hashed_pw_7', '0977777777', 'guest'),
('Betelhem', 'Fikru', 'beti@gmail.com', 'hashed_pw_8', '0988888888', 'admin'),
('Daniel', 'Hailu', 'daniel@gmail.com', 'hashed_pw_9', '0999999999', 'host'),
('Hanna', 'Getu', 'hanna@gmail.com', 'hashed_pw_10', '0900000000', 'guest');

-- Insert Location

INSERT INTO Location ( sub_city, city, country) VALUES
('Arada', 'Addis Ababa', 'Ethiopia'),
('Yeka', 'Addis Ababa', 'Ethiopia'),
('Bole', 'Addis Ababa', 'Ethiopia'),
('Kirkos', 'Addis Ababa', 'Ethiopia'),
('Gullele', 'Addis Ababa', 'Ethiopia'),
('Lideta', 'Addis Ababa', 'Ethiopia'),
('Akaki', 'Addis Ababa', 'Ethiopia'),
('Kolfe', 'Addis Ababa', 'Ethiopia'),
('Nifas Silk', 'Addis Ababa', 'Ethiopia'),
('Lafto', 'Addis Ababa', 'Ethiopia');

-- Insert Property

INSERT INTO Property (host_id, name, description, location_id, pricepernight) VALUES
('e37dfd59-bb07-467e-8d46-ba05b7486044', 'Cozy Apartment', 'Modern 2-bedroom in Arada', '00c22559-751a-4170-b81a-271cfdd6526e', 100.00),
('5ae896ab-1b5b-474b-9ee7-27b0b0be5252', 'Luxury Villa', 'Spacious villa with pool', 'fdd92e1a-ea32-42bb-b0c7-f98be07cdfc5', 450.00),
('20ee9a82-bcdb-42b9-b63e-8cd9ac1ee86b', 'Budget Room', 'Affordable room with basic amenities', '1aca439a-e5c3-4079-86f4-710f99dcc52d', 60.00),
('e492ed78-cf70-4e3c-9903-867081e4cdda', 'City Center Flat', 'Central flat with balcony', '58862021-1ab1-42aa-8451-c5b507afaf30', 200.00),
('e37dfd59-bb07-467e-8d46-ba05b7486044', 'Family House', 'Perfect for groups', '6d6dc2c1-fde2-48fe-bb2c-59e6438cfa62', 300.00),
('5ae896ab-1b5b-474b-9ee7-27b0b0be5252', 'Garden Cottage', 'Quiet and green space', '511482d0-89ea-4edc-991a-bde1a191b1dd', 130.00),
('20ee9a82-bcdb-42b9-b63e-8cd9ac1ee86b', 'Top Floor Studio', 'Penthouse experience', 'e1e1f09c-8be0-41ce-875b-5dfa66bb978e', 400.00),
('e492ed78-cf70-4e3c-9903-867081e4cdda', 'Peaceful Loft', 'Ideal for remote work', 'bc383a89-3b2b-4b1e-a78b-0ad5adc4bd1b', 175.00),
('20ee9a82-bcdb-42b9-b63e-8cd9ac1ee86b', 'Stylish Studio', 'Modern interior, city view', '1aca439a-e5c3-4079-86f4-710f99dcc52d', 150.00),
('5ae896ab-1b5b-474b-9ee7-27b0b0be5252', 'Empty Property', 'This property has no bookings.', '511482d0-89ea-4edc-991a-bde1a191b1dd', 199.00);

-- Insert Booking

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status) VALUES
('c9ac892e-6524-4b05-9d6f-c1a3222f27e2', 'f5aced3b-a511-4882-80f3-61ad8ca5c7b8', '2025-07-01', '2025-07-03', 200.00, 'confirmed'),
('ae55213d-a761-4896-89c6-b440c965a507', '059f36e8-3fd8-4c5f-9bcf-5af035a3e4ce', '2025-07-05', '2025-07-07', 900.00, 'pending'),
('b81a2eb5-1fac-464d-8585-1d53268a9cc7', '7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', '2025-07-10', '2025-07-12', 180.00, 'confirmed'),
('0a103441-6e2b-4a83-a26b-2842bb148e5a', '5b24c870-2f5b-49f8-bd0e-6ad51b12a63d', '2025-07-15', '2025-07-18', 600.00, 'confirmed'),
('29ab68da-ee1e-496c-9bee-7516dd7d7128', 'f5aced3b-a511-4882-80f3-61ad8ca5c7b8', '2025-07-20', '2025-07-25', 1500.00, 'canceled'),
('572d5cd3-aef7-49a4-b68c-a2a457529a72', '059f36e8-3fd8-4c5f-9bcf-5af035a3e4ce', '2025-07-01', '2025-07-03', 400.00, 'confirmed'),
('1aa996c2-c34a-4303-b26c-f6409b5f97bd', '7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', '2025-07-07', '2025-07-09', 350.00, 'pending'),
('367b4880-a9b5-4880-ae68-4bc09f93f395', '5b24c870-2f5b-49f8-bd0e-6ad51b12a63d', '2025-07-11', '2025-07-13', 390.00, 'confirmed'),
('c8c4771f-98b1-4cda-ad72-69476ed7b9ca', 'f5aced3b-a511-4882-80f3-61ad8ca5c7b8', '2025-07-14', '2025-07-17', 600.00, 'confirmed'),
('c9ac892e-6524-4b05-9d6f-c1a3222f27e2', '7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', '2025-07-18', '2025-07-20', 800.00, 'pending');  



-- Insert Payment

INSERT INTO Payment (booking_id, amount, payment_date, payment_method) VALUES
('e634c0fd-b9e0-4123-b39a-3f420d3bf2f6', 200.00, '2025-07-03', 'paypal'),
('c932bdd2-1e5e-4f43-a922-571a4adaeadb', 900.00, '2025-07-07', 'credit_card'),
('0d94fe0b-6ea2-43ec-b0e8-4f8a58a6902a', 180.00, '2025-07-12', 'stripe'),
('34a5860c-60bc-44c5-b624-b3a8fc0ae273', 600.00, '2025-07-18', 'paypal'),
('0afd9c63-d436-4bee-9fbb-a18f6ac6b84b', 1500.00, '2025-07-25', 'stripe'),
('7af3b349-b835-42fb-add0-ac74dbea754c', 400.00, '2025-07-03', 'credit_card'),
('50cfcd3d-f10a-4dc9-b64e-5d2192dc6c64', 350.00, '2025-07-09', 'stripe'),
('a55545b8-8b7e-4f03-80e8-f4081bf8d411', 390.00, '2025-07-13', 'paypal'),
('92b0774a-b46e-47eb-9fc4-f27dbd6b73ed', 600.00, '2025-07-17', 'credit_card');

-- Insert Review

INSERT INTO Review (property_id, user_id, rating, comment) VALUES
('c9ac892e-6524-4b05-9d6f-c1a3222f27e2', 'f5aced3b-a511-4882-80f3-61ad8ca5c7b8',5, 'Loved it!'),
('c8c4771f-98b1-4cda-ad72-69476ed7b9ca', '059f36e8-3fd8-4c5f-9bcf-5af035a3e4ce',4, 'Very clean and comfy.'),
('367b4880-a9b5-4880-ae68-4bc09f93f395', '7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2',3, 'Average experience.'),
('1aa996c2-c34a-4303-b26c-f6409b5f97bd', '5b24c870-2f5b-49f8-bd0e-6ad51b12a63d',2, 'Not worth the price.'),
('572d5cd3-aef7-49a4-b68c-a2a457529a72', 'f5aced3b-a511-4882-80f3-61ad8ca5c7b8',1, 'Very disappointing.'),
('29ab68da-ee1e-496c-9bee-7516dd7d7128', '059f36e8-3fd8-4c5f-9bcf-5af035a3e4ce',5, 'Great host, beautiful house.'),
('0a103441-6e2b-4a83-a26b-2842bb148e5a', '7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2',4, 'Would stay again.'),
('b81a2eb5-1fac-464d-8585-1d53268a9cc7', '5b24c870-2f5b-49f8-bd0e-6ad51b12a63d',5, 'Perfect for weekend.'),
('ae55213d-a761-4896-89c6-b440c965a507', 'f5aced3b-a511-4882-80f3-61ad8ca5c7b8',4, 'Nice location.'),
('c9ac892e-6524-4b05-9d6f-c1a3222f27e2', '7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', 3, 'Good overall.');

-- Insert Message

INSERT INTO Message (sender_id, recipient_id, message_body) VALUES
('f5aced3b-a511-4882-80f3-61ad8ca5c7b8', 'e37dfd59-bb07-467e-8d46-ba05b7486044', 'Is this available?'),
('059f36e8-3fd8-4c5f-9bcf-5af035a3e4ce', '5ae896ab-1b5b-474b-9ee7-27b0b0be5252', 'Can I get a discount?'),
('7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', '20ee9a82-bcdb-42b9-b63e-8cd9ac1ee86b', 'Do you provide WiFi?'),
('5b24c870-2f5b-49f8-bd0e-6ad51b12a63d', 'e492ed78-cf70-4e3c-9903-867081e4cdda', 'Is parking included?'),
('f5aced3b-a511-4882-80f3-61ad8ca5c7b8', 'e37dfd59-bb07-467e-8d46-ba05b7486044', 'How far from airport?'),
('059f36e8-3fd8-4c5f-9bcf-5af035a3e4ce', '5ae896ab-1b5b-474b-9ee7-27b0b0be5252', 'Can I bring a pet?'),
('7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', '20ee9a82-bcdb-42b9-b63e-8cd9ac1ee86b', 'Any restaurants nearby?'),
('5b24c870-2f5b-49f8-bd0e-6ad51b12a63d', 'e492ed78-cf70-4e3c-9903-867081e4cdda', 'What is your cancellation policy?'),
('f5aced3b-a511-4882-80f3-61ad8ca5c7b8', '20ee9a82-bcdb-42b9-b63e-8cd9ac1ee86b', 'Can I check in early?'),
('7a3cdd9b-7f37-4be4-aeb0-b7ca559dbee2', '5ae896ab-1b5b-474b-9ee7-27b0b0be5252', 'Do you have AC?');