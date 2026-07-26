--Pizza Sales Analysis
--Total Revenue

SELECT
SUM(total_Price) AS Total_Revenue
FROM pizza_sales;

--Total Orders

SELECT(DISTINCT order-id) As Total Orders
From pizza_sales;
