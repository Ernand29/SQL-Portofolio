
-- 1. Combine the menu_items and order_details tables into a single table
SELECT 
    *
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id;
    
    
-- 2. What were the least and most ordered items? What categories were they in?
-- LEAST ORDER ITEMS
SELECT 
    item_name, COUNT(order_details_id) AS num_order
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
GROUP BY item_name
ORDER BY num_order ASC
LIMIT 1;

-- MOST ORDER ITEMS
SELECT 
    item_name, COUNT(order_details_id) AS num_order
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
GROUP BY item_name
ORDER BY num_order DESC
LIMIT 1;

-- CATEGORY
SELECT 
    item_name, COUNT(order_details_id) AS num_order, category
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
GROUP BY item_name , category
ORDER BY num_order ASC;


-- 3. What were the top 5 orders that spent the most money?
SELECT 
    order_id, SUM(price) AS total_spend
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;


-- 4. View the details of the highest spend order. Which specific items were purchased?
SELECT 
    *
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
WHERE
    order_id = 440;
    
-- PER CATEGORY MOST ORDER FROM order_id = 440
SELECT 
    category, COUNT(item_id) AS num_items
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
WHERE
    order_id = 440
GROUP BY category
ORDER BY num_items DESC;
    

-- 5. View the details of the top 5 highest spend orders
SELECT 
    *
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
WHERE
    order_id IN (440, 2075, 1957, 330, 2675);
    
-- PER CATEGORY MOST ORDER ITEMS
SELECT 
    order_id, category, COUNT(item_id) AS num_items
FROM
    menu_items mi
        JOIN
    order_details od ON mi.menu_item_id = od.item_id
WHERE
    order_id IN (440 , 2075, 1957, 330, 2675)
GROUP BY order_id , category
ORDER BY order_id ASC , num_items DESC;