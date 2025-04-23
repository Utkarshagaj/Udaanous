create database customer_purchase_db;
show tables;
select * from customers;
select * from order_items;
select * from orders;
select * from products;

-- Monthly Revenue
-- Calculate total revenue per month.
-- Format: YYYY-MM, total_revenue
SELECT
    p.product_name,
    SUM(oi.quantity * oi.price) AS Total_Revenue,
    DATE_FORMAT(o.order_date, '%Y-%m') AS Month
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY p.product_name, Month
ORDER BY Month, Total_Sales DESC;

-- Customer Lifetime Value
-- For each customer, calculate their total spend (total_amount from orders).
-- Show top 5 customers by lifetime value.
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS Total_Spend
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY Total_Spend DESC
LIMIT 5;

-- Most Popular Product by Region
-- Join data to find the most frequently ordered product in each region.
SELECT
    product_id,
    product_name,
    COUNT(*) AS Total_Orders
FROM products
GROUP BY product_id, product_name
ORDER BY Total_Orders DESC
LIMIT 1;

-- Profit Analysis
-- For each product, compute total profit:
-- Profit = (price - cost) * quantity
-- Show top 5 most profitable products.

SELECT
    p.product_name,
    SUM((oi.price - p.cost) * oi.quantity) AS Total_Profit
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY Total_Profit DESC
LIMIT 5;

-- New vs Returning Customers
-- In each month, count how many orders were placed by:
-- New customers (first-time order)
-- Returning customers (second order or later)

WITH FirstOrders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
),
LabeledOrders AS (
    SELECT 
        o.order_id,
        o.customer_id,
        o.order_date,
        CASE
            WHEN o.order_date = fo.first_order_date THEN 'New'
            ELSE 'Returning'
        END AS customer_type
    FROM orders o
    JOIN FirstOrders fo ON o.customer_id = fo.customer_id
)
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS Month,
    customer_type,
    COUNT(*) AS Orders
FROM LabeledOrders
GROUP BY Month, customer_type
ORDER BY Month, customer_type;





