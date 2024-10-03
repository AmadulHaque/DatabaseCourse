-- SQL queries for the reports and additional features based on the provided schema:



-- 1. User Order History
-- Retrieve the order history for a specific user, showing order details and the list of dishes in each order.

SELECT 
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status,
    GROUP_CONCAT(d.name) AS dishes
FROM 
    orders o
JOIN 
    order_items oi ON o.id = oi.order_id
JOIN 
    dishes d ON oi.dish_id = d.id
WHERE 
    o.user_id = 1 -- replace with the desired user_id
GROUP BY 
    o.id;


-- 2. Revenue by Cuisine
-- Calculate the total revenue for each cuisine based on completed orders.
SELECT 
    d.cuisine,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.id = oi.order_id
JOIN 
    dishes d ON oi.dish_id = d.id
WHERE 
    o.status = 'Completed'
GROUP BY 
    d.cuisine;


-- 3. Popular Dish
-- Identify the most ordered dish.
SELECT 
    d.name,
    d.description,
    d.price,
    d.cuisine,
    SUM(oi.quantity) AS total_ordered
FROM 
    order_items oi
JOIN 
    dishes d ON oi.dish_id = d.id
GROUP BY 
    d.id
ORDER BY 
    total_ordered DESC
LIMIT 1;


-- 4. Unpopular Dish
-- Identify dishes that have not been ordered recently, with "never ordered" dishes on top.

SELECT 
    d.name,
    d.description,
    d.price,
    d.cuisine,
    MAX(o.order_date) AS last_order_date
FROM 
    dishes d
LEFT JOIN 
    order_items oi ON d.id = oi.dish_id
LEFT JOIN 
    orders o ON oi.order_id = o.id
GROUP BY 
    d.id
ORDER BY 
    last_order_date IS NULL DESC, last_order_date ASC;

-- 5. Repeating Customers
-- Identify the top 10 customers who have ordered most frequently and their total amount spent.
SELECT 
    u.name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM 
    users u
JOIN 
    orders o ON u.id = o.user_id
GROUP BY 
    u.id
ORDER BY 
    total_orders DESC
LIMIT 10;



-- 6. Summary Status for Dashboard
-- Total orders today:

SELECT 
    COUNT(*) AS total_orders_today
FROM 
    orders
WHERE 
    DATE(order_date) = CURDATE();

-- Total incomplete orders at this moment:

SELECT 
    COUNT(*) AS total_incomplete_orders
FROM 
    orders
WHERE 
    status != 'Completed';

-- Total orders this week:
SELECT 
    COUNT(*) AS total_orders_this_week
FROM 
    orders
WHERE 
    YEARWEEK(order_date, 1) = YEARWEEK(CURDATE(), 1);


-- 7. Open Text Search
-- Search in dish name, description, and cuisine, ordering by price descending.
SELECT 
    d.name,
    d.description,
    d.price,
    d.cuisine
FROM 
    dishes d
WHERE 
    d.name LIKE '%search_term%' OR
    d.description LIKE '%search_term%' OR
    d.cuisine LIKE '%search_term%'
ORDER BY 
    d.price DESC;


-- 8. Filter for User Order History
-- Add filters for customer name, order date, and dishes.

SELECT 
    o.id AS order_id,
    o.order_date,
    o.total_amount,
    o.status,
    GROUP_CONCAT(d.name) AS dishes
FROM 
    orders o
JOIN 
    users u ON o.user_id = u.id
JOIN 
    order_items oi ON o.id = oi.order_id
JOIN 
    dishes d ON oi.dish_id = d.id
WHERE 
    (u.name LIKE '%customer_name%' OR '%customer_name%' = '') 
    AND (DATE(o.order_date) = '2024-09-01' OR '2024-09-01' = '') 
    AND (d.name LIKE '%dish_name%' OR '%dish_name%' = '')
GROUP BY 
    o.id;



-- 9. Filter for Revenue by Cuisine
-- Filter revenue by date range.

SELECT 
    d.cuisine,
    SUM(oi.price * oi.quantity) AS total_revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.id = oi.order_id
JOIN 
    dishes d ON oi.dish_id = d.id
WHERE 
    o.status = 'Completed'
    AND o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    d.cuisine;


-- 10. Price Range Filter for Open Text Search
SELECT 
    d.name,
    d.description,
    d.price,
    d.cuisine
FROM 
    dishes d
WHERE 
    (d.name LIKE '%search_term%' OR
    d.description LIKE '%search_term%' OR
    d.cuisine LIKE '%search_term%')
    AND d.price BETWEEN 151 AND 500 -- adjust price range as needed
ORDER BY 
    d.price DESC;


