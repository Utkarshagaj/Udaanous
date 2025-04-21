create database customers_db;
select * from customers;
select * from orders;
select * from products;

-- 	List all customers and their cities.(select)
select first_name, last_name, city from customers;

-- Display each other with customer full name, product name, total price. (quantity*price) (join)
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    p.product_name,
    o.quantity * p.price AS total_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id;

-- Show all orders placed in March 2024.(Filter and date)
SELECT * FROM orders 
WHERE MONTH(order_date) = 3;

-- Count how many times each product has been ordered. (Group by)
SELECT 
    p.product_name,
    COUNT(o.order_id) AS total_orders
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

-- Revenue Analysis
SELECT 
    p.product_name,
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name, p.category;

-- Calculate total revenue generated from each product.
SELECT 
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

-- Top Customer
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY full_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Identify the customer who spent the most.
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 1;

-- Bonus:
-- Which city has the highest average spending per customer?
SELECT 
    city,
    AVG(total_spent) AS avg_spent_per_customer
FROM (
    SELECT 
        c.city,
        c.customer_id,
        SUM(o.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN products p ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.city
) AS customer_total
GROUP BY city
ORDER BY avg_spent_per_customer DESC
LIMIT 1;





