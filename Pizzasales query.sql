CREATE TABLE pizza_sales(
pizza_id DECIMAL(10,2),
order_id DECIMAL(10,2),
pizza_name_id VARCHAR(50),
quantity DECIMAL(10,2),
order_date DATE,
order_time TIME,
unit_price DECIMAL(10,2),
total_price DECIMAL(10,2),
pizza_size VARCHAR(10),
pizza_category VARCHAR(50),
pizza_ingredients TEXT,
pizza_name VARCHAR(100)
);


\COPY pizza_sales
FROM 'C:\Users\ravig\Downloads\archive\pizza_sales.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM pizza_sales
LIMIT 50;

TRUNCATE TABLE pizza_sales;

SELECT*
FROM pizza_sales
LIMIT 5;

SELECT table_schema,table_name
FROM information_schema.tables
ORDER BY table_schema,table_name;

SELECT current_database();

SELECT Column_name
FROM information_schema.columns
WHERE table_name='pizza_sales';

DROP TABLE pizza_sales;

SET datestyle='MDY';

ALTER DATABASE pizza_sales SET datestyle TO 'DMY';

SELECT COUNT(*) AS total_rows
FROM pizza_sales;

SELECT
sum(total_price) AS total_revenue
FROM pizza_sales;

SELECT
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

SELECT 
SUM (quantity) AS total_pizzas_sold
FROM pizza_sales;

SELECT
SUM(total_price)/COUNT(DISTINCT order_id) as average_order_value
FROM pizza_sales;

SELECT pizza_name,
SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 10;

SELECT pizza_category, SUM(total_price) as revenue, SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY pizza_category
ORDER BY revenue DESC;

SELECT order_id, COUNT(*) AS order_count
FROM pizza_sales
GROUP BY order_id
HAVING COUNT(*)>1
ORDER BY order_count DESC
LIMIT 10;