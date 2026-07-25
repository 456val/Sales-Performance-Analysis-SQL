## Retail Sales Analysis Using SQL

## Executive Summary

This project analyzes transactional retail sales data using SQL to uncover trends in revenue, customer purchasing behavior, sales activity, and operational performance. Through time-based analysis and business-focused SQL queries, the project provides insights into invoice generation, revenue growth, peak shopping periods, seasonality, and customer returns.

The analysis demonstrates how SQL can be used not only for querying data but also for generating actionable business intelligence that supports operational planning, inventory management, and revenue optimization.

---

## Business Context

Retail businesses generate thousands of transactions every day. Without structured analysis, it becomes difficult to answer critical business questions such as:

- When are customers most likely to purchase?
- Which periods generate the highest revenue?
- Are there seasonal sales patterns?
- When should staffing levels be increased?
- How frequently do refunds occur?

This project addresses these questions using SQL-based exploratory and business analysis.

---

## Project Objectives

The analysis aims to answer the following business questions:

### Invoice Activity

- How many invoices are generated daily?
- How many invoices are generated weekly?
- How many invoices are generated monthly?

### Revenue Performance

- What is the daily revenue?
- What is the weekly revenue?
- What is the monthly revenue?
- How does revenue trend over time?

### Customer Purchasing Behavior

- Which hours of the day have the highest purchasing activity?
- Which weekday generates the highest number of orders?

### Seasonal Analysis

- Are there seasonal sales patterns?
- Which quarters generate the most revenue?
- Which months have the highest and lowest sales volume?

### Operational Performance

- How does weekday revenue compare with weekend revenue?
- When do cancellations occur most frequently?
- How long after purchase do refunds occur?

---

## Dataset

The analysis uses the **Online Retail Dataset** from the UCI Machine Learning Repository.

The dataset contains transactional sales records from an online retail business.

### Dataset Columns

| Column | Description |
|---------|-------------|
| InvoiceNo | Unique invoice identifier |
| StockCode | Product code |
| Description | Product description |
| Quantity | Number of units purchased |
| InvoiceDate | Transaction date and time |
| UnitPrice | Price per unit |
| CustomerID | Customer identifier |
| Country | Customer country |

---

## Tools and Technologies

- SQL Server
- T-SQL
- Aggregate Functions
- Window and Date Functions
- Business Intelligence
- Data Analysis

---

## SQL Concepts Demonstrated

This project demonstrates the use of:

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT()
- COUNT(DISTINCT)
- SUM()
- AVG()
- DATEPART()
- DATENAME()
- FORMAT()
- CASE Statements
- DATEDIFF()

---

## Business Questions Solved

- Invoice trends by day, week, and month
- Revenue trends over time
- Daily, weekly, and monthly revenue analysis
- Peak shopping hours
- Highest-performing weekdays
- Quarterly sales performance
- Seasonal sales analysis
- Weekday vs weekend comparison
- Highest and lowest sales months
- Cancellation analysis
- Refund timing analysis

---

## Key Insights

### Invoice Trends

- October 6 recorded the highest invoice count (219).
- February 6 recorded the lowest invoice count (11).

### Revenue Performance

- November 14 generated the highest daily revenue.
- Week 47 of 2011 recorded the strongest weekly performance.
- December 2011 generated the highest monthly revenue.

### Seasonal Trends

- Q1 2011 generated approximately ₦17.41 million in revenue.
- Q4 2010 closed the year with strong sales performance.

### Customer Purchasing Behavior

- Purchasing activity peaked between 12 PM and 4 PM.
- Thursday generated the highest number of invoices.
- Sunday consistently recorded the lowest customer activity.

### Weekday vs Weekend

- Weekdays generated significantly more revenue than weekends.
- Weekend revenue slightly exceeded weekday revenue during Q3.

### Returns Analysis

- No cancellation transactions (negative quantities) were identified in the dataset used for analysis.
- Refund analysis returned no meaningful trend because cancellation records were unavailable.

---

## Business Recommendations

### Operations

- Increase staffing during midday peak periods.
- Schedule more resources on Thursdays and other high-volume weekdays.

### Marketing

- Launch promotions during slower periods such as Sundays and lower-performing months.
- Capitalize on stronger weekend demand observed during Q3.

### Inventory Management

- Increase stock levels before peak sales periods.
- Reduce excess inventory during slower months.

### Revenue Optimization

- Identify frequently purchased products for bundle offers.
- Analyze high-value transactions to improve pricing and promotional strategies.

### Customer Experience

- Continue monitoring returns and refunds to identify product quality or service issues.
- Capture return data more consistently to support future analysis.

---

## Repository Structure

```text
Retail-Sales-SQL-Analysis/
├── Retail_Sales_Analysis.sql
└── README.md
```

---

## Repository Contents

- SQL queries for business analysis
- Time-based sales analysis
- Revenue analysis
- Customer behavior analysis
- Seasonal trend analysis
- Operational performance analysis
- Business recommendations

---

## Limitations

- The dataset contains no negative quantity transactions; therefore, cancellation and refund analyses are limited.
- Product profitability and customer segmentation were outside the scope of this project.
- Currency conversion and inflation adjustments were not considered.

---

## Skills Demonstrated

- SQL
- T-SQL
- Data Cleaning
- Business Intelligence
- Retail Analytics
- Time Series Analysis
- Revenue Analysis
- Customer Behavior Analysis
- Exploratory Data Analysis
- Business Problem Solving

---

## Author

**Valerie Kelechukwu**

**Data Analyst | Business Intelligence Analyst**

