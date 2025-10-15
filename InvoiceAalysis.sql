--How many invoices were generated per day, week, and month?
-- Daily
SELECT  COUNT(DISTINCT InvoiceNo) AS InvoiceCount FROM class.dbo.Retail1
SELECT 
  CAST(InvoiceDate AS DATE) AS Day,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount  
FROM class.dbo.Retail1
GROUP BY CAST(InvoiceDate AS DATE)
ORDER BY COUNT(DISTINCT InvoiceNo) ;

-- Weekly
SELECT 
  DATEPART(week, InvoiceDate) AS WeekNum,
  DATEPART(year, InvoiceDate) AS YearNum,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY DATEPART(week, InvoiceDate), DATEPART(year, InvoiceDate)
--ORDER BY YearNum, WeekNum;
ORDER BY  COUNT(DISTINCT InvoiceNo) DESC;

-- Monthly
SELECT 
  FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
--ORDER BY Month;
ORDER BY COUNT(DISTINCT InvoiceNo);

--daily revenue
SELECT
    FORMAT(InvoiceDate, 'yyyy-MM-dd')  as daily,  
    sum(Quantity * UnitPrice) AS Revenue,
	avg(Quantity * UnitPrice) as AverageRevenue
FROM class.dbo.Retail1
GROUP BY 
    FORMAT(InvoiceDate, 'yyyy-MM-dd')
ORDER BY sum(Quantity * UnitPrice) desc;

--weekly revenue
SELECT
    DATEPART(week, InvoiceDate),
	DATEPART(year, InvoiceDate),
    sum(Quantity * UnitPrice) AS Revenue,
	avg(Quantity * UnitPrice) as AverageRevenue
FROM class.dbo.Retail1
GROUP BY 
    DATEPART(week, InvoiceDate),
    DATEPART(year, InvoiceDate)
ORDER BY sum(Quantity * UnitPrice) desc;
--Monthly
SELECT
    FORMAT(InvoiceDate, 'yyyy-MM') as Month,
    DATEPART(year, InvoiceDate) AS Year,
    sum(Quantity * UnitPrice) AS Revenue,
	avg(Quantity * UnitPrice) as AverageRevenue
FROM class.dbo.Retail1
GROUP BY 
    FORMAT(InvoiceDate, 'yyyy-MM'),
    DATEPART(year, InvoiceDate)
ORDER BY sum(Quantity * UnitPrice) desc;

--What is the trend of total revenue over time (daily, weekly, monthly)?
SELECT
    FORMAT(InvoiceDate, 'yyyy-MM') as Month,   -- for monthly
    FORMAT(InvoiceDate, 'yyyy-MM-dd')  as daily,  -- for daily
    DATEPART(week, InvoiceDate) AS WeekNum,
    DATEPART(year, InvoiceDate) AS Year,
    SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY 
    FORMAT(InvoiceDate, 'yyyy-MM'),
    FORMAT(InvoiceDate, 'yyyy-MM-dd'),
    DATEPART(week, InvoiceDate),
    DATEPART(year, InvoiceDate)

--What are the busiest hours of the day for purchases?
SELECT 
  DATEPART(hour, InvoiceDate) AS HourOfDay,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY DATEPART(hour, InvoiceDate)
ORDER BY InvoiceCount DESC;

--which day of the week has the highest number of orders?
SELECT
  DATENAME(weekday, InvoiceDate) as DayOf_Week,
  COUNT(DISTINCT InvoiceNo) AS InvoiceCount
FROM class.dbo.Retail1
GROUP BY  DATENAME(weekday, InvoiceDate)
ORDER BY InvoiceCount DESC

--Are there seasonal patterns in sales across months or quarters?
-- Quarterly Revenue
SELECT 
  CONCAT('Q', DATEPART(quarter, InvoiceDate)) AS Quarter,
  DATEPART(year, InvoiceDate) AS Year,
  SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY DATEPART(quarter, InvoiceDate), DATEPART(year, InvoiceDate)
ORDER BY Revenue desc;

--How does revenue vary between weekdays and weekends?

SELECT 
  CASE 
    WHEN DATENAME(weekday, InvoiceDate) IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Weekday'
  END AS DayType,
  DATEPART(quarter, InvoiceDate) AS Quarter,
  SUM(Quantity * UnitPrice) AS Revenue
FROM class.dbo.Retail1
GROUP BY 
  CASE 
    WHEN DATENAME(weekday, InvoiceDate) IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Weekday'
  END,
  DATEPART(quarter, InvoiceDate)
ORDER BY DayType;
 
--Which months have the highest and lowest sales volume?
SELECT TOP 1
    DATENAME(month, InvoiceDate) as MonthDate,
	DATEPART(year, InvoiceDate) as yearDate,
	SUM(Quantity) as Quantity,
	SUM(Quantity * UnitPrice) as Revenue
FROM class.dbo.Retail1
GROUP BY 
    DATENAME(month, InvoiceDate),
	DATEPART(year, InvoiceDate) 

ORDER By Quantity desc


SELECT TOP 1
    DATENAME(month, InvoiceDate) as MonthDate,
	DATEPART(year, InvoiceDate) as yearDate,
	SUM(Quantity) as Quantity,
	SUM(Quantity * UnitPrice) as Revenue
FROM class.dbo.Retail1
GROUP BY 
    DATENAME(month, InvoiceDate),
	DATEPART(year, InvoiceDate) 

ORDER By Quantity asc

--When are cancellations (negative quantities) most frequent?
--cancellations are 0
SELECT count(*) as CancellationsCount
FROM class.dbo.Retail1
WHERE Quantity < 0;

SELECT
  DATENAME(month, InvoiceDate) as Month,
  DATENAME(year, InvoiceDate) as Year,
  --DATENAME(day, InvoiceDate) as Day,
  Count(*) as Cancellations
FROM class.dbo.Retail1
WHERE Quantity < 0
GROUP BY 
  DATENAME(month, InvoiceDate),
  DATENAME(year, InvoiceDate)
 -- DATENAME(day, InvoiceDate)

ORDER BY Count(*);

--How long after purchase do refunds typically occur?
SELECT 
  CustomerID,
  StockCode,
  MIN(InvoiceDate) AS FirstRefundDate,
  MAX(InvoiceDate) AS LastRefundDate,
  DATEDIFF(day, MIN(InvoiceDate), MAX(InvoiceDate)) AS RefundSpan
FROM class.dbo.Retail1
WHERE Quantity < 0
GROUP BY CustomerID, StockCode;

