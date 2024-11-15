SELECT city,COUNT(city) as num
FROM address
GROUP BY city;

SELECT * FROM users
where type = "Administrator";

SELECT *
FROM orders 
WHERE user_id = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE address
SET city ="NEW YOKE"
WHERE city = "East Jimville";


SELECT  COUNT(product_id) FROM product 
WHERE price<300;


SELECT status, Count(status) AS count
FROM orders
GROUP BY status;

SELECT product_id ,Count(product_id) as count
FROM image
GROUP BY product_id;

SELECT * FROM image;

SELECT * FROM orders
ORDER BY date DESC
LIMIT 1; 

SELECT * FROM product;
SELECT * FROM category;

SELECT category_id FROM category 
WHERE name = "ELECTRONICS";



SELECT product_id FROM product_category
WHERE category_id = (SELECT category_id FROM category WHERE name = "CLOTHING" );



SELECT category_id,name 
FROM category
WHERE parent_id is NULL;


SELECT category_id, Count(category_id) as count FROM product_category 
GROUP BY category_id;


SELECT category_id, count(product_id) as count
FROM product_category
GROUP BY category_id;

// last 90 revenue 

SELECT order_id, user_id, date 
FROM orders
Where date > "2024-07-15";


SELECT u.user_id, u.name,sum(p.price) as Total
FROM orders o
JOIN users u ON u.user_id = o.user_id
JOIN order_product_list opl ON opl.order_id = o.order_id
JOIN product p ON opl.product_id = p.product_id
WHERE u.type = "Shopper" AND o.date > "2024-01-25"
group by u.user_id
ORDER BY Total DESC
LIMIT 10;

// product that order most 

SELECT opl.product_id , Count(opl.product_id) as count
FROM orders o
JOIN order_product_list opl ON o.order_id = opl.order_id
WHERE o.date >"2024-07-15"
GROUP BY opl.product_id
ORDER BY count DESC
LIMIT 10;

SELECT Month(o.date) as MONTHs, sum(p.price * p.product_id)
FROM orders o
JOIN order_product_list opl ON o.order_id = opl.order_id
JOIN product p ON opl.product_id = p.product_id
GROUP by MONTHs
ORDER BY MONTHs;




SELECT opl.product_id as Id 
FROM orders o
JOIN order_product_list opl 
ON o.order_id = opl.order_id
WHERE date> "2024-07-15"
GROUP BY opl.product_id
ORDER BY Id;

SELECT order_id 
FROM orders 
WHERE status = "CANCELLED"
LIMIT 10;



SELECT p.product_id, p.name , p.description
FROM product p
JOIN product_category pc
ON p.product_id = pc.product_id
JOIN category c
ON c.category_id = pc.category_id
WHERE c.name = "Footwear"
ORDER BY p.product_id;

