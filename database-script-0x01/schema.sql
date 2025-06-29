CREATE TYPE user_role_type as ENUM('guest', 'host', 'admin');

CREATE TYPE booking_status_type as ENUM('pending', 'confirmed', 'canceled');

CREATE TYPE  payment_method_type as ENUM('credit_card', 'paypal', 'stripe');

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- USER TABLE
CREATE TABLE IF NOT EXISTS "User" (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(60) NOT NULL,
    phone_number VARCHAR(15),
    role user_role_type NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS index_user_email on "User"(email);

-- LOCATION TABLE (NEW)
CREATE TABLE IF NOT EXISTS Location (
    location_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sub_city VARCHAR(50),
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- PROPERTY TABLE (Updated to use location_id)
CREATE TABLE IF NOT EXISTS Property (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    host_id UUID REFERENCES "User"(user_id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    location_id UUID REFERENCES Location(location_id) ON DELETE SET NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER to auto-update `updated_at` in PostgreSQL
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = CURRENT_TIMESTAMP;
   RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS trigger_set_updated_at ON Property;

CREATE TRIGGER trigger_set_updated_at
BEFORE UPDATE ON Property
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- BOOKING TABLE
CREATE TABLE IF NOT EXISTS Booking (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id UUID REFERENCES "User"(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status_type NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS index_booking_property_id on Booking(property_id);

-- PAYMENTS TABLE
CREATE TABLE IF NOT EXISTS Payment (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method_type NOT NULL
);

CREATE INDEX IF NOT EXISTS index_payment_booking_id on Payment(booking_id);

-- REVIEW TABLE
CREATE TABLE IF NOT EXISTS Review(
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id UUID REFERENCES "User"(user_id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS index_review_property_id ON Review(property_id);
CREATE INDEX IF NOT EXISTS index_review_user_id ON Review(user_id);

-- MESSAGE TABLE
CREATE TABLE IF NOT EXISTS Message (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID REFERENCES "User"(user_id) ON DELETE CASCADE,
    recipient_id UUID REFERENCES "User"(user_id) ON DELETE CASCADE,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS index_message_sender_id ON Message(sender_id);
CREATE INDEX IF NOT EXISTS index_message_recipient_id ON Message(recipient_id);