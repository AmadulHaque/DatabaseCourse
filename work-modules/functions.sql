SELECT id, CONCAT(first_name, ' ', last_name) AS full_name 
FROM users;


SELECT id, INSTR(email, '@'), INSTR(email, '@') + 1, SUBSTRING(email, INSTR(email, '@') + 1), email AS email_domain 
FROM users;


SELECT INSTR('ab@c', '@');
SELECT SUBSTRING(email, INSTR(email, '@') + 1) AS email_domain 
FROM users;

SELECT LEFT('Lorem Ipsum Dolor sit amet', 10);
SELECT SUBSTRING('Lorem Ipsum Dolor sit amet', 1, 10);

SELECT
	CHAR_LENGTH('MySQL for Software Developers') AS length_as_char_eng,
	LENGTH('MySQL for Software Developers') AS length_as_bytes_eng,
	CHAR_LENGTH('টেস্ট উইথ বাংলা') AS length_as_char_bn,
	LENGTH('টেস্ট উইথ বাংলা') AS length_as_bytes_bn;
-- 13 char + 2 space | 13*3 bytes + 2 space

SELECT INSTR("MySQL for Software Developers", "dev");
SELECT SUBSTR("MySQL for Software Developers", 11, 8;

SELECT LPAD("Mobile Phones", 20, "-"),
	LPAD("Android", 20, "-"),
	LPAD("Samesung", 20, "-");

SELECT REPLACE("http://old-site.com/images/logo.png", "old-site", "new-site");


SELECT GREATEST("w3Schools.com", "microsoft.com", "apple.com");

SELECT CURDATE();

SELECT SUBSTRING(email, INSTR(email, '@') + 1) AS email_domain 
FROM users;

SELECT LEFT('Lorem Ipsum Dolor sit amet', 10);
SELECT SUBSTRING('Lorem Ipsum Dolor sit amet', 1, 10);

SELECT
	CHAR_LENGTH('MySQL for Software Developers') AS length_as_char_eng,
	LENGTH('MySQL for Software Developers') AS length_as_bytes_eng,
	CHAR_LENGTH('টেস্ট উইথ বাংলা') AS length_as_char_bn,
	LENGTH('টেস্ট উইথ বাংলা') AS length_as_bytes_bn;
-- 13 char + 2 space | 13*3 bytes + 2 space

SELECT INSTR("MySQL for Software Developers", "dev");
SELECT SUBSTR("MySQL for Software Developers", 11, 8;

SELECT LPAD("Mobile Phones", 20, "-"),
	LPAD("Android", 20, "-"),
	LPAD("Samesung", 20, "-");

SELECT REPLACE("http://old-site.com/images/logo.png", "old-site", "new-site");


SELECT GREATEST("w3Schools.com", "microsoft.com", "apple.com");


SELECT title, 
    LOWER(REPLACE(title, ' ', '-')) AS url_slug 
FROM products;


SELECT product_code, price_each, quantity_ordered, price_each * quantity_ordered, ROUND(price_each * quantity_ordered) AS item_total 
FROM orderd_items
WHERE order_id = 10105;

SELECT MIN(qty_in_stock) from products;

SELECT MAX(buy_price) from products WHERE product_line = 'Motorcycles';
SELECT ROUND(AVG(buy_price), 2) from products WHERE product_line = 'Motorcycles';

SELECT COUNT(*)
FROM users;


-- =========== Date and Time ===============
-- Show orders where shipment was delayed above 3 days
SELECT NOW();
SELECT CURDATE();
SELECT DAYNAME(NOW());
SELECT YEAR(NOW());
SELECT LOCALTIME();
SELECT CURRENT_TIMESTAMP();

SELECT DATEDIFF("2024-01-01", "2024-08-05");
SELECT TIMEDIFF("13:10:11", "13:10:10");
SELECT DATE_SUB("2023-12-30", INTERVAL 5 DAY);

SELECT id, order_date, shipped_date, DATEDIFF(shipped_date, order_date) AS days_delay 
FROM orders
HAVING days_delay > 3;

SELECT check_number, amount
FROM payments
WHERE payment_date > CURDATE();


-- ============ Controle Flow ======================

SELECT id, name, credit_limit, 
	CASE 
		WHEN credit_limit > 100000 THEN 'Premium'
		WHEN credit_limit > 70000 AND credit_limit < 100000 THEN 'Gold'
		WHEN credit_limit > 50000 AND credit_limit < 70000 THEN 'Silver'
		WHEN credit_limit > 20000 THEN 'Bronze'
		WHEN credit_limit > 10000 THEN 'Standard'
		ELSE 'Regular'
	END AS customer_type
FROM customers;


SELECT `code`, buy_price, qty_in_stock, IF(qty_in_stock > 5000, IF (qty_in_stock > 9000, 'Gold Eligible', 'Eligible'), 'Not Eligible') AS discount_status
FROM products;


SELECT MD5('password');
SELECT SHA1('password');


SELECT AES_ENCRYPT('password', 'dbclass');
SELECT AES_DECRYPT(AES_ENCRYPT('password', 'dbclass'), 'dbclass');


SELECT p.*, pp.qty_in_stock AS prev_qty, pp.buy_price AS prev_buy_price, pp.MSRP AS prev_MSRP
FROM products p
LEFT JOIN products_prev pp ON p.code = pp.code
WHERE CRC32(CONCAT(p.code, p.qty_in_stock, p.buy_price, p.MSRP)) != CRC32(CONCAT(pp.code, pp.qty_in_stock, pp.buy_price, pp.MSRP));



-- 18 August, 2024 10:18:33 PM
CREATE TABLE `dbcourse`.`products_2` LIKE `dbcourse`.`products`;

INSERT INTO `dbcourse`.`products_2` SELECT * FROM `dbcourse`.`products` WHERE qty_in_stock > 5000 ;


SELECT *, ROUND(quantity_ordered * price_each) AS total
FROM orderd_items
WHERE product_code = 'S18_2432'
HAVING total > 2000;




