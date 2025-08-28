# Salary Data  by SQL 

## Description
This project demonstrates SQL skills by performing data cleaning, transformation, aggregation, and analysis on a  employee salary dataset. The dataset includes employee information such as first name, gender, start date, salary, bonus, senior management bonus, team, and login times.
## Goal
The goal of this project is to showcase SQL operations commonly used in data analytics and business intelligence projects.

## Dataset Columns
- First_Name – Employee first name
- Gender – Male/Female
- Start_Date – Employee start date
- Salary – Employee base salary
- Bonus – Employee bonus
- Senior_Management – Bonus for senior management
- Team – Employee team
- Login_Hour, Login_Minute, Login_Second – Last login time

## Skills Demonstrated
- Data Cleaning / Transformation
- Encoding Gender using CASE (Male = 0, Female = 1)
- Dropping unnecessary columns (Start_Date)
- Numeric Calculations
- Total compensation: Salary + Bonus + Senior_Management
- Bonus categorization: High / Medium / Low
- Aggregations & Window Functions
- Team average compensation (AVG)
- String Functions
- Length of first name (LEN)
- Uppercase / lowercase conversion (UPPER, LOWER)
- First letter extraction (LEFT)

 ## How to Run

- Open SQL Server Management Studio (SSMS).
- Create a database (if not already done).
- Open the SQL file Walmart_Sales_Project.sql.
- Execute the script.
- View the updated table using:
``` sql
SELECT * FROM PROC1;
```
## Outcome
After running the script, the table includes:
- Cleaned and encoded columns
- Numeric calculations and bonus categories
- Aggregated team metrics
- String manipulations
- Salary ranks per team
