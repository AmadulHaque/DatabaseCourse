-- a. Display a list of 20 latest available menu items.

SELECT * FROM MenuItem
ORDER BY menu_item_id DESC
LIMIT 20;


-- b. Retrieve a list of all incomplete orders of today, in oldest to newest order.
SELECT * FROM `Order`
WHERE status != 'completed'
AND DATE(order_date) = CURDATE()
ORDER BY order_date ASC;



-- c. Delete all complete orders that have been placed before 15 days.
DELETE FROM `Order`
WHERE status = 'completed'
AND order_date < (CURDATE() - INTERVAL 15 DAY);
