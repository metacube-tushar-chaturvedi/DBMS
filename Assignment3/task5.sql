/*
Task 5 - Query 1
*/
CREATE VIEW recent_orders AS
SELECT 
	orders.order_id,
    products.product_id,
    products.price,
	users.user_id, 
	concat(users.first_name, " ", users.last_name) AS user_name,
    users.email,
    orders.order_date,
    orders.status
FROM orders
JOIN users ON users.user_id = orders.user_id
JOIN order_products ON order_products.order_id = orders.order_id
JOIN products ON products.product_id = order_products.product_id
WHERE orders.order_date >= DATE_SUB("2023-11-21", INTERVAL 30 DAY)
ORDER BY orders.order_date;

/*
Task 5 - Query 2
*/
SELECT order_id, product_id
FROM recent_orders
WHERE status LIKE "delivered";

/*
Task 5 - Query 3
*/
select product_id, count(product_id) AS product_count
FROM recent_orders
GROUP BY product_id
ORDER BY product_count DESC;