-- 1. Total Sales per Region
SELECT
    o.Region,
    SUM(oli.Sales) AS TotalSales
FROM
    order_line_items oli
JOIN
    orders o ON oli.Order_ID = o.Order_ID
GROUP BY
    o.Region
ORDER BY
    TotalSales DESC;

-- 2. Top 10 Customers by Sales
SELECT TOP 10 -- Changed LIMIT 10 to TOP 10
    c.Customer_Name,
    SUM(oli.Sales) AS TotalSales
FROM
    order_line_items oli
JOIN
    orders o ON oli.Order_ID = o.Order_ID
JOIN
    customers c ON o.Customer_ID = c.Customer_ID
GROUP BY
    c.Customer_Name
ORDER BY
    TotalSales DESC;

-- 3. Sales Trend by Month (Assuming Order_Date is DATE type)
-- Using T-SQL FORMAT function (SQL Server 2012+)
SELECT
    FORMAT(o.Order_Date, 'yyyy-MM') AS SalesMonth, -- Changed strftime to FORMAT
    SUM(oli.Sales) AS MonthlySales
FROM
    order_line_items oli
JOIN
    orders o ON oli.Order_ID = o.Order_ID
GROUP BY
    FORMAT(o.Order_Date, 'yyyy-MM') -- Group by the formatted month
ORDER BY
    SalesMonth;

-- 4. Average Order Value
SELECT
    AVG(OrderTotal) AS AverageOrderValue
FROM (
    SELECT
        oli.Order_ID,
        SUM(oli.Sales) AS OrderTotal
    FROM
        order_line_items oli
    GROUP BY
        oli.Order_ID
) AS OrderTotals; -- Subquery alias syntax is generally fine in T-SQL

-- 5. Sales by Product Sub-Category
SELECT
    p.Sub_Category,
    SUM(oli.Sales) AS TotalSales
FROM
    order_line_items oli
JOIN
    products p ON oli.Product_ID = p.Product_ID
GROUP BY
    p.Sub_Category
ORDER BY
    TotalSales DESC;

-- 6. Most Frequent Shipping Mode
SELECT TOP 1 -- Changed LIMIT 1 to TOP 1
    o.Ship_Mode,
    COUNT(*) AS Frequency
FROM
    orders o
GROUP BY
    o.Ship_Mode
ORDER BY
    Frequency DESC;

-- 7. Sales Performance by State
SELECT
    o.State,
    SUM(oli.Sales) AS TotalSales
FROM
    order_line_items oli
JOIN
    orders o ON oli.Order_ID = o.Order_ID
GROUP BY
    o.State
ORDER BY
    TotalSales DESC;

-- 8. Number of Orders per Customer
SELECT
    c.Customer_Name,
    COUNT(DISTINCT o.Order_ID) AS NumberOfOrders
FROM
    orders o
JOIN
    customers c ON o.Customer_ID = c.Customer_ID
GROUP BY
    c.Customer_Name
ORDER BY
    NumberOfOrders DESC;

-- 9. Top 10 Products with Highest Sales
SELECT TOP 10 -- Changed LIMIT 10 to TOP 10
    p.Product_Name,
    SUM(oli.Sales) AS TotalSales
FROM
    order_line_items oli
JOIN
    products p ON oli.Product_ID = p.Product_ID
GROUP BY
    p.Product_Name
ORDER BY
    TotalSales DESC;

-- 10. Sales Distribution by Customer Segment and Region
SELECT
    c.Segment,
    o.Region,
    SUM(oli.Sales) AS TotalSales
FROM
    order_line_items oli
JOIN
    orders o ON oli.Order_ID = o.Order_ID
JOIN
    customers c ON o.Customer_ID = c.Customer_ID
GROUP BY
    c.Segment, o.Region
ORDER BY
    c.Segment, o.Region, TotalSales DESC;

