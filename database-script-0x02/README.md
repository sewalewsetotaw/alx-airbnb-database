# 🌍 Airbnb Database — Sample Data Scripts

This directory contains SQL scripts used to populate the Airbnb PostgreSQL database with realistic sample data for testing and demonstration purposes.

---

## 📁 Files Included

- `seed.sql`:  
  Inserts sample records into all main tables:
  - `User`
  - `Location`
  - `Property`
  - `Booking`
  - `Payment`
  - `Review`
  - `Message`

---

## 🚀 How to Use

### 1. Setup Your Database

Make sure your schema is already created by running the `schema.sql` file from the root of the project.

    psql -U your_postgres_user -d airbnb_database -f path/to/schema.sql

### 2. Load the Sample Data

Once the schema is in place, run the seed file:

    psql -U your_postgres_user -d airbnb_database -f seed.sql

This will populate your database with test users, properties, bookings, and related records.