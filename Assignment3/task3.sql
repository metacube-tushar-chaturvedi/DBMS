/*
task - 3, query 1 
*/

SELECT  users.user_id, users.name, users.contact,orders.date
FROM users 
LEFT JOIN orders 
ON users.user_id = orders.user_id
WHERE orders.date > "2024-07-15" && users.type ="Shopper";


/*
task - 3 , query 2
*/

SELECT u.user_id, u.name,sum(p.price) as Total
FROM orders o
JOIN users u ON u.user_id = o.user_id
JOIN order_product_list opl ON opl.order_id = o.order_id
JOIN product p ON opl.product_id = p.product_id
WHERE u.type = "Shopper" AND o.date > "2024-01-25"
group by u.user_id
ORDER BY Total DESC
LIMIT 10;

/*
task 3 query 3
*/

SELECT opl.product_id , Count(opl.product_id) as count
FROM orders o
JOIN order_product_list opl ON o.order_id = opl.order_id
WHERE o.date >"2024-07-15"
GROUP BY opl.product_id
ORDER BY count DESC
LIMIT 10;

/*
task 3 query 4
*/
SELECT Month(o.date) as MONTHs, sum(p.price * p.product_id)
FROM orders o
JOIN order_product_list opl ON o.order_id = opl.order_id
JOIN product p ON opl.product_id = p.product_id
GROUP by MONTHs
ORDER BY MONTHs;

/*
task 3 query - 5
*/

SELECT product_id 
From product 
WHERE product_id NOT IN (SELECT opl.product_id as Id 
FROM orders o
JOIN order_product_list opl 
ON o.order_id = opl.order_id
WHERE date> "2024-07-15"
GROUP BY opl.product_id
ORDER BY Id);

/*
task 3 query - 6
*/

SELECT p.product_id, p.name , p.description
FROM product p
JOIN product_category pc
ON p.product_id = pc.product_id
JOIN category c
ON c.category_id = pc.category_id
WHERE c.name = "Footwear"
ORDER BY p.product_id;

/*
task 3 query - 7
*/
SELECT order_id 
FROM orders 
WHERE status = "CANCELLED"
LIMIT 10;