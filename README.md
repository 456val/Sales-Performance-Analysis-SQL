# Retail Sales Analysis Project

This project provides an in-depth analysis of retail sales data using SQL queries to extract meaningful insights from transactional records. The dataset contains invoices, product quantities, unit prices, invoice dates, and customer information, allowing detailed examination of sales patterns, revenue trends, and operational metrics.

### Data Source

The data used for this project is the Online Retail dataset
 from the UCI Machine Learning Repository. It contains real-world retail transactions for analysis of sales, revenue, and customer behavior.

### Dataset Columns

The dataset includes the following columns:

InvoiceNo – Unique invoice number

StockCode – Product code

Description – Product description

Quantity – Number of units purchased (negative for returns)

InvoiceDate – Date and time of transaction

UnitPrice – Price per unit

CustomerID – Unique customer identifier

Country – Country of the customer

### Objectives

The main goals of this project are:

1.Invoice Generation Trends: Count invoices generated daily, weekly, and monthly; identify busiest hours and days.

2.Revenue Analysis: Calculate daily, weekly, and monthly revenue and average revenue per invoice; evaluate seasonal fluctuations; compare weekdays vs weekends revenue.

3.Sales Volume Insights: Identify months with the highest and lowest sales quantities; recognize peak business periods.

4.Customer Behavior and Refunds: Track cancellations and measure the typical time between purchase and refund.

### Methodology

The analysis is performed using SQL queries with the following techniques:

COUNT(DISTINCT ...) for unique invoice counts.

SUM() and AVG() for revenue calculations.

DATEPART() and FORMAT() for time-based aggregations (daily, weekly, monthly, quarterly).

Conditional logic with CASE statements for weekdays vs weekends.

GROUP BY and ORDER BY to organize results meaningfully.

### Key Insights
📅 Daily & Weekly Performance

October 6 had the highest invoice count (219), while February 6 had the lowest (11).

November 14 saw the highest daily revenue (₦112,141).

Week 47 of 2011 was the strongest across all metrics, while Week 52 reflected a post-holiday slowdown.

### 🗓️ Monthly & Quarterly Trends

December 2011 was the top month by total revenue.

Q1 2011 generated ₦17.41M.

Q4 2010 followed with ₦748,957, signaling a strong close to the year.

### 📈 Weekday vs Weekend Revenue

Weekdays outperformed weekends across most quarters.

In Q3, weekend sales slightly exceeded weekday performance, possibly due to campaigns or seasonal demand.

### 🕒 Time-of-Day Behavior

Peak transactions occurred between 12–4 PM, marking midday as the optimal engagement window.

Sales began steadily from 8–12 PM and declined after 4 PM.

### 📆 Day-of-Week Performance

Thursday recorded the highest invoice count (5,660), followed by Wednesday and Tuesday.

Sunday consistently had the lowest activity (2,381 invoices), likely due to limited business hours.

### 💰 Average vs Median Revenue

Average revenue highlighted transaction profitability, while median provided a more balanced picture of sales distribution, unaffected by high-value outliers.

### Recommendations & Strategies

Based on the analysis, the following strategies can help optimize business performance:

### Staffing & Operations

Allocate more staff and resources during peak hours (12–4 PM) and on high-performing weekdays (Thursday–Tuesday).

### Marketing & Promotions

Launch promotions or campaigns during low-performing periods (Sundays, February) to boost sales.

Target weekend campaigns in Q3 when weekend sales show higher potential.

### Inventory Management

Ensure high-demand products are well-stocked during peak months and quarters.

Monitor slow months for excess inventory to reduce holding costs.

### Revenue Optimization

Analyze high-value transactions to identify profitable product bundles.

### Customer Experience

Track returns and refunds to identify potential issues with products or services.

Use insights to improve customer satisfaction and reduce cancellation rates.




