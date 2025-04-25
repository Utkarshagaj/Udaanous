create database customer_purchase2_db;
show tables;
select * from customers;
select * from orders;

alter table customers change name customer_name varchar(255);

-- Description:
-- Using two datasets—customers.csv and orders.csv—your task is to write an SQL query that identifies the top 3 customers per region 
-- who have made more than 3 purchases in the last 12 months.
-- The query should return the following for each qualifying customer:
-- •	Customer Name
-- •	Region
-- •	Total Amount Spent
-- •	Number of Orders
-- Requirements:
-- •	Join the customers and orders tables using customer_id.
-- •	Filter orders to only include those made in the last 12 months (from the current date).
-- •	Group and aggregate the data to calculate the total spending and number of orders per customer.
-- •	Filter out customers with 3 or fewer orders in the last year.
-- •	Use a ranking function (like ROW_NUMBER() or RANK()) to select the top 3 customers per region based on total spending.
-- Bonus:
-- Make the date filter dynamic using CURRENT_DATE or an equivalent function, so the analysis always reflects the most recent 12-month period.

WITH ranked_customers AS (
  SELECT 
    c.customer_name,
    c.region,
    SUM(o.total_amount) AS total_spent,
    COUNT(*) AS order_count,
    ROW_NUMBER() OVER (PARTITION BY c.region ORDER BY SUM(o.total_amount) DESC) AS rank_in_region
  FROM customers AS c
  JOIN orders AS o ON c.customer_id = o.customer_id
  WHERE o.order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 12 MONTH)
  GROUP BY c.customer_id, c.customer_name, c.region
  HAVING COUNT(*) > 3
)
SELECT 
  customer_name, 
  region, 
  total_spent, 
  order_count
FROM ranked_customers
WHERE rank_in_region <= 3;

