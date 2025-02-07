SQL Mastery Assignment

University Course Enrollment & Online Store Inventory System

Author: Harini Manohar
Date Submitted: February 7, 2025
Database: PostgreSQL

📁 Project Overview

This repository contains SQL scripts for two separate database systems:
	1.	University Course Enrollment System (university.sql)
	2.	Online Store Inventory System (store.sql)

Each script includes:
	•	Table Creation
	•	Data Insertion
	•	Required Queries
	•	Data Updates
	•	Data Deletions


How to Run the Scripts:

1. Running the SQL Scripts

Open a terminal and run these commands:
psql -U postgres -f university.sql
psql -U postgres -f store.sql
***If prompted, enter your PostgreSQL password.***

2. Verifying the Data

After running the scripts, check if the data was inserted correctly:
SELECT * FROM students;
SELECT * FROM products;

Queries Included

Each SQL file contains the following queries:

🏫 University System (university.sql)
✔️ Retrieve students enrolled in “Physics 101”
✔️ Retrieve all courses with their professors
✔️ Retrieve courses that have enrollments
✔️ Update a student’s email
✔️ Remove a student from a course

🛒 Online Store (store.sql)
✔️ Retrieve product names and stock quantities
✔️ Retrieve products and quantities for a specific order
✔️ Retrieve all orders placed by a customer
✔️ Simulate stock reduction after an order
✔️ Delete an order and its items