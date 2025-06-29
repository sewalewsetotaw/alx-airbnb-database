# Airbnb Database Schema

## Files

- `schema.sql`: Contains all SQL statements to define the Airbnb database schema.

## Tables & Purpose

- **User**: Stores user details and roles.
- **Location**: Holds geographical info for properties.
- **Property**: Listings with pricing, host, and location.
- **Booking**: Manages property reservations.
- **Payment**: Tracks booking payments.
- **Review**: Guest feedback and ratings.
- **Message**: User-to-user communication.

## How to Use

Prerequisites
Ensure PostgreSQL is installed and properly configured on your system.

🔹 Step-by-Step Instructions

1. Open your terminal (or pgAdmin)
2. Create a new database

CREATE DATABASE airbnb_database;
You can run this inside a PostgreSQL session (via psql) or in pgAdmin’s Query Tool.

🔹 Option 1: Command Line / Terminal (Recommended)
👉 On Windows:
Open Command Prompt or PowerShell.

Ensure PostgreSQL’s bin directory is in your PATH (e.g., C:\Program Files\PostgreSQL\15\bin).

Run the following command:
psql -U postgres -d airbnb_database -f "C:\path\to\schema.sql"
Replace "C:\path\to\schema.sql" with the actual full path to your file.

👉 On Linux/macOS:
Open your Terminal.

Run:

psql -U postgres -d airbnb_database -f /full/path/to/schema.sql

You may be prompted for your PostgreSQL password.

🔹 Option 2: Using pgAdmin (Graphical Interface)
Open pgAdmin.

Connect to your PostgreSQL server.

Create a new database named airbnb_database.

Navigate to the airbnb_database database.

Open the Query Tool.

Click the Open File icon and select your schema.sql.

Click Execute (⚡) to run the script.
