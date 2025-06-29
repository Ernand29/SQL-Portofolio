-- 1. View the order_details table.
SELECT
	*
FROM
	order_details;
    

-- 2. What is the date range of the table?
SELECT 
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order
FROM
    order_details;
    
    
-- 3. How many orders were made within this date range?
SELECT 
    COUNT(DISTINCT (order_id)) AS total_order
FROM
    order_details;
    
    
-- 4. How many items were ordered within this date range?
SELECT 
    COUNT(*) AS total_order
FROM
    order_details;
    
    
-- 5. Which orders had the most number of items?
SELECT 
    order_id, COUNT(*) AS num_of_item
FROM
    order_details
GROUP BY order_id
ORDER BY num_of_item DESC
LIMIT 1;


-- 6. How many orders had more than 12 items?
SELECT 
    order_id, COUNT(*) AS num_of_item
FROM
    order_details
GROUP BY order_id
HAVING num_of_item > 12;