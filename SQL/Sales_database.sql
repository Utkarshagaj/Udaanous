select * from sales_data;
select count(*) from sales_data;

-- Total Sales Value
-- Calculate the total sales value across all orders.
-- Hint: quantity * price gives the value per item.
select
	product_name,
	sum(quantity * price) as Total_Sales
from sales_data
group by product_name;

-- Monthly Sales Trends
-- Show total sales value by month.
-- Format: YYYY-MM, total_sales
SELECT
    product_name,
    SUM(quantity * price) AS Total_Sales,
    DATE_FORMAT(order_date, '%Y-%m') AS Month
FROM sales_data
GROUP BY product_name, Month;

-- Top 5 Products by Sales Value
-- List the top 5 best-selling products based on total revenue.
select
	product_name,
	sum(quantity * price) as Total_Revenue
from sales_data
order by Total_Revenue desc
limit 5;

SELECT
    product_name,
    SUM(quantity * price) AS Total_Revenue
FROM sales_data
GROUP BY product_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Sales by Region
-- Show total sales value per region.
SELECT
    product_name,
    SUM(quantity * price) AS Total_Revenue
FROM sales_data
GROUP BY product_name
ORDER BY Total_Revenue ASC;

-- Customer Purchase Frequency
-- Find the number of orders placed by each customer. Return top 10 most frequent buyers.
SELECT
    customer_id AS Buyer,
    COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY customer_id
ORDER BY Total_Orders DESC
LIMIT 10;

-- Category-wise Revenue Contribution
-- What percentage of total revenue does each product category contribute?
SELECT
    category,
    SUM(quantity * price) AS Category_Revenue,
    ROUND(
        (SUM(quantity * price) / 
         (SELECT SUM(quantity * price) FROM sales_data) * 100), 
        2
    ) AS Revenue_Percentage
FROM sales_data
GROUP BY category
ORDER BY Category_Revenue DESC;

-- Repeat Customer Rate
-- Calculate how many customers have made more than one purchase.
SELECT
    COUNT(DISTINCT customer_id) AS Repeat_Customers
FROM (
    SELECT customer_id
    FROM sales_data
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS repeat_group;

