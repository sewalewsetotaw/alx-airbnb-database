# Database Normalization Process

## Objective

Ensure the database schema adheres to the Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

---

## 🔹 First Normal Form (1NF)

**Violation Identified:**

- In the `Property` table, the `location` field had the potential to hold multiple values (non-atomic).

**Action Taken:**

- Split the `location` into a new `Location` table.
- Replaced `location` in `Property` with a foreign key `location_id`.

**Result:** All tables now have atomic values and unique rows.

---

## 🔹 Second Normal Form (2NF)

**Assessment:**

- All tables use a single-column primary key (UUID).
- No partial dependencies exist since there are no composite keys.

**Result:** All tables meet 2NF.

---

## 🔹 Third Normal Form (3NF)

**Assessment:**

- Each non-key attribute depends only on the primary key.
- No transitive dependencies are found in any table.

**Result:** All tables meet 3NF.

---

## ✅ Final Outcome

The database schema is now fully normalized up to the **Third Normal Form (3NF)**.
