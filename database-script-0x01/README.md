# 🏠 Airbnb Database Schema

## 📁 Files

- `schema.sql` – Contains all SQL statements to define the Airbnb database schema.

## 🧱 Tables & Purpose

| Table        | Description                               |
| ------------ | ----------------------------------------- |
| **User**     | Stores user details and roles             |
| **Location** | Holds geographical info for properties    |
| **Property** | Listings with pricing, host, and location |
| **Booking**  | Manages property reservations             |
| **Payment**  | Tracks booking payments                   |
| **Review**   | Guest feedback and ratings                |
| **Message**  | User-to-user communication                |

---

## ⚙️ How to Use

### ✅ Prerequisites

- PostgreSQL must be installed and configured properly on your system.

---

### 🪜 Step-by-Step Instructions

### 🔹 1. Create the Database

Create the database inside a PostgreSQL session (`psql`) or pgAdmin’s Query Tool:

```sql
CREATE DATABASE airbnb_database;
🔹 2. Load the Schema
✅ Option 1: Command Line / Terminal (Recommended)
👉 On Windows:

Open Command Prompt or PowerShell

Ensure PostgreSQL’s bin directory is in your PATH
(e.g., C:\Program Files\PostgreSQL\15\bin)

Run:


psql -U postgres -d airbnb_database -f "C:\path\to\schema.sql"
Replace "C:\path\to\schema.sql" with the actual full path to your file.

👉 On Linux/macOS:

Open Terminal

Run:


psql -U postgres -d airbnb_database -f /full/path/to/schema.sql
📌 Example:

psql -U postgres -d airbnb_database -f ~/Documents/schema.sql
You may be prompted for your PostgreSQL password.

✅ Option 2: Using pgAdmin (Graphical Interface)
Open pgAdmin

Connect to your PostgreSQL server

Create a new database named airbnb_database

Navigate to the database

Open Query Tool

Click the Open File icon and select schema.sql

Click Execute (⚡) to run the script

```
