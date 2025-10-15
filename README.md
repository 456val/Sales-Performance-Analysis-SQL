# Retail Sales Analysis Project

This project provides an in-depth analysis of retail sales data using SQL queries to extract meaningful insights from transactional records. The dataset contains invoices, product quantities, unit prices, invoice dates, and customer information, allowing detailed examination of sales patterns, revenue trends, and operational metrics.

##Data Source

The data used for this project is the Online Retail dataset
 from the UCI Machine Learning Repository. It contains real-world retail transactions for analysis of sales, revenue, and customer behavior.

##Dataset Columns

The dataset includes the following columns:

InvoiceNo – Unique invoice number

StockCode – Product code

Description – Product description

Quantity – Number of units purchased (negative for returns)

InvoiceDate – Date and time of transaction

UnitPrice – Price per unit

CustomerID – Unique customer identifier

Country – Country of the customer

##Objectives

The main goals of this project are:

1.Invoice Generation Trends: Count invoices generated daily, weekly, and monthly; identify busiest hours and days.

2.Revenue Analysis: Calculate daily, weekly, and monthly revenue and average revenue per invoice; evaluate seasonal fluctuations; compare weekdays vs weekends revenue.

3. Sales Volume Insights: Identify months with the highest and lowest sales quantities; recognize peak business periods.

4. Customer Behavior and Refunds: Track cancellations and measure the typical time between purchase and refund.

## Methodology

The analysis is performed using SQL queries with the following techniques:

COUNT(DISTINCT ...) for unique invoice counts.

SUM() and AVG() for revenue calculations.

DATEPART() and FORMAT() for time-based aggregations (daily, weekly, monthly, quarterly).

Conditional logic with CASE statements for weekdays vs weekends.

GROUP BY and ORDER BY to organize results meaningfully.

## SQL Queries

-- How many invoices were generated per day, week, and month?

-- Daily
SELECT COUNT(DISTINCT InvoiceNo) AS InvoiceCount 
FROM class.dbo.Retail1;

SELECT 
  CAST(InvoiceDate AS DATE) AS Day,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount  
FROM class.dbo.Retail1
GROUP BY CAST(InvoiceDate AS DATE)
ORDER BY COUNT(DISTINCT InvoiceNo);

-- Weekly
SELECT 
  DATEPART(week, InvoiceDate) AS WeekNum,
  DATEPART(year, InvoiceDate) AS YearNum,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY DATEPART(week, InvoiceDate), DATEPART(year, InvoiceDate)
ORDER BY COUNT(DISTINCT InvoiceNo) DESC;

-- Monthly
SELECT 
  FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY COUNT(DISTINCT InvoiceNo);

-- Daily Revenue
SELECT
    FORMAT(InvoiceDate, 'yyyy-MM-dd') as daily,  
    SUM(Quantity * UnitPrice) AS Revenue,
    AVG(Quantity * UnitPrice) AS AverageRevenue
FROM class.dbo.Retail1
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM-dd')
ORDER BY SUM(Quantity * UnitPrice) DESC;

-- Weekly Revenue
SELECT
    DATEPART(week, InvoiceDate),
    DATEPART(year, InvoiceDate),
    SUM(Quantity * UnitPrice) AS Revenue,
    AVG(Quantity * UnitPrice) AS AverageRevenue
FROM class.dbo.Retail1
GROUP BY DATEPART(week, InvoiceDate), DATEPART(year, InvoiceDate)
ORDER BY SUM(Quantity * UnitPrice) DESC;

-- Monthly Revenue
SELECT
    FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
    DATEPART(year, InvoiceDate) AS Year,
    SUM(Quantity * UnitPrice) AS Revenue,
    AVG(Quantity * UnitPrice) AS AverageRevenue
FROM class.dbo.Retail1
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM'), DATEPART(year, InvoiceDate)
ORDER BY SUM(Quantity * UnitPrice) DESC;

-- Trend of Total Revenue Over Time
SELECT
    FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
    FORMAT(InvoiceDate, 'yyyy-MM-dd') AS daily,
    DATEPART(week, InvoiceDate) AS WeekNum,
    DATEPART(year, InvoiceDate) AS Year,
    SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM'),
         FORMAT(InvoiceDate, 'yyyy-MM-dd'),
         DATEPART(week, InvoiceDate),
         DATEPART(year, InvoiceDate);

-- Busiest Hours of the Day
SELECT 
  DATEPART(hour, InvoiceDate) AS HourOfDay,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY DATEPART(hour, InvoiceDate)
ORDER BY InvoiceCount DESC;

-- Day of the Week with Highest Orders
SELECT
  DATENAME(weekday, InvoiceDate) AS DayOf_Week,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY DATENAME(weekday, InvoiceDate)
ORDER BY InvoiceCount DESC;

-- Seasonal Patterns (Quarterly Revenue)
SELECT 
  CONCAT('Q', DATEPART(quarter, InvoiceDate)) AS Quarter,
  DATEPART(year, InvoiceDate) AS Year,
  SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY DATEPART(quarter, InvoiceDate), DATEPART(year, InvoiceDate)
ORDER BY Revenue DESC;

-- Revenue: Weekdays vs Weekends
SELECT 
  CASE 
    WHEN DATENAME(weekday, InvoiceDate) IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Weekday'
  END AS DayType,
  DATEPART(quarter, InvoiceDate) AS Quarter,
  SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY CASE 
           WHEN DATENAME(weekday, InvoiceDate) IN ('Saturday', 'Sunday') THEN 'Weekend'
           ELSE 'Weekday'
         END,
         DATEPART(quarter, InvoiceDate)
ORDER BY DayType;

-- Months with Highest and Lowest Sales Volume
SELECT TOP 1
    DATENAME(month, InvoiceDate) AS MonthDate,
    DATEPART(year, InvoiceDate) AS YearDate,
    SUM(Quantity) AS Quantity,
    SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY DATENAME(month, InvoiceDate), DATEPART(year, InvoiceDate)
ORDER BY Quantity DESC;

SELECT TOP 1
    DATENAME(month, InvoiceDate) AS MonthDate,
    DATEPART(year, InvoiceDate) AS YearDate,
    SUM(Quantity) AS Quantity,
    SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY DATENAME(month, InvoiceDate), DATEPART(year, InvoiceDate)
ORDER BY Quantity ASC;

-- Cancellations (Negative Quantities)
SELECT COUNT(*) AS CancellationsCount
FROM class.dbo.Retail1
WHERE Quantity < 0;

SELECT
  DATENAME(month, InvoiceDate) AS Month,
  DATENAME(year, InvoiceDate) AS Year,
  COUNT(*) AS Cancellations
FROM class.dbo.Retail1
WHERE Quantity < 0
GROUP BY DATENAME(month, InvoiceDate), DATENAME(year, InvoiceDate)
ORDER BY COUNT(*);

-- Refund Span for Customers
SELECT 
  CustomerID,
  StockCode,
  MIN(InvoiceDate) AS FirstRefundDate,
  MAX(InvoiceDate) AS LastRefundDate,
  DATEDIFF(day, MIN(InvoiceDate), MAX(InvoiceDate)) AS RefundSpan
FROM class.dbo.Retail1
WHERE Quantity < 0
GROUP BY CustomerID, StockCode;


##Key Insights
📅 Daily & Weekly Performance

October 6 had the highest invoice count (219), while February 6 had the lowest (11).

November 14 saw the highest daily revenue (₦112,141).

Week 47 of 2011 was the strongest across all metrics, while Week 52 reflected a post-holiday slowdown.

##🗓️ Monthly & Quarterly Trends

December 2011 was the top month by total revenue.

Q1 2011 generated ₦17.41M.

Q4 2010 followed with ₦748,957, signaling a strong close to the year.

##📈 Weekday vs Weekend Revenue

Weekdays outperformed weekends across most quarters.

In Q3, weekend sales slightly exceeded weekday performance, possibly due to campaigns or seasonal demand.

##🕒 Time-of-Day Behavior

Peak transactions occurred between 12–4 PM, marking midday as the optimal engagement window.

Sales began steadily from 8–12 PM and declined after 4 PM.

##📆 Day-of-Week Performance

Thursday recorded the highest invoice count (5,660), followed by Wednesday and Tuesday.

Sunday consistently had the lowest activity (2,381 invoices), likely due to limited business hours.

##💰 Average vs Median Revenue

Average revenue highlighted transaction profitability, while median provided a more balanced picture of sales distribution, unaffected by high-value outliers.

##Recommendations & Strategies

Based on the analysis, the following strategies can help optimize business performance:

##Staffing & Operations

Allocate more staff and resources during peak hours (12–4 PM) and on high-performing weekdays (Thursday–Tuesday).

##Marketing & Promotions

Launch promotions or campaigns during low-performing periods (Sundays, February) to boost sales.

Target weekend campaigns in Q3 when weekend sales show higher potential.

##Inventory Management

Ensure high-demand products are well-stocked during peak months and quarters.

Monitor slow months for excess inventory to reduce holding costs.

##Revenue Optimization

Analyze high-value transactions to identify profitable product bundles.

Consider median-based strategies to manage outliers and maintain balanced sales distribution.

##Customer Experience

Track returns and refunds to identify potential issues with products or services.

Use insights to improve customer satisfaction and reduce cancellation rates.
