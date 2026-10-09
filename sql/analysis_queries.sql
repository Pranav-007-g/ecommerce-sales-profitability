-- E-commerce Sales & Profitability Analysis
-- SQLite-compatible. Import data/sales_data.csv into a table named sales_data first.

-- 1. KPI overview
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT OrderID) AS total_orders,
    SUM(Quantity) AS units_sold
FROM sales_data;

-- 2. Monthly sales and profit trend
SELECT
    substr(OrderDate, 1, 7) AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY substr(OrderDate, 1, 7)
ORDER BY order_month;

-- 3. Category performance
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2) AS profit_margin_pct
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;

-- 4. Region performance
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY Region
ORDER BY total_profit DESC;

-- 5. Discount bands and profitability
SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        ELSE 'Above 20%'
    END AS discount_band,
    COUNT(*) AS order_lines,
    ROUND(AVG(Discount) * 100, 2) AS average_discount_pct,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2) AS profit_margin_pct
FROM sales_data
GROUP BY discount_band
ORDER BY average_discount_pct;

-- 6. Sub-categories with negative total profit
SELECT
    SubCategory,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY SubCategory
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;

-- 7. Segment contribution
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT OrderID) AS order_lines
FROM sales_data
GROUP BY Segment
ORDER BY total_sales DESC;
