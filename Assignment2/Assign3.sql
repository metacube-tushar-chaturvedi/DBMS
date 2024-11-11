
SELECT p.Id, p.Name AS Title, c.name AS Category_Title, p.Price
FROM product p
JOIN category c ON p.category_id = c.category_id
WHERE p.active = 1
ORDER BY p.added_date DESC;


SELECT p.Id, p.Name AS Title
FROM product p
LEFT JOIN image i ON p.Id = i.product_id
WHERE i.product_id IS NULL;


SELECT c.category_id AS Id, c.name AS Title,
       COALESCE(pc.name, 'Top Category') AS Parent_Category_Title
FROM category c
LEFT JOIN category pc ON c.parent_id = pc.category_id
ORDER BY Parent_Category_Title, c.name;


SELECT c.category_id AS Id, c.name AS Title,
       COALESCE(pc.name, 'Top Category') AS Parent_Category_Title
FROM category c
LEFT JOIN category pc ON c.parent_id = pc.category_id
WHERE NOT EXISTS (SELECT 1 FROM category WHERE parent_id = c.category_id);


SELECT p.Name AS Title, p.Price, p.Description
FROM product p
JOIN category c ON p.category_id = c.category_id
WHERE c.name = 'Mobile';


SELECT Id, Name AS Title, Stock_quantity AS Inventory
FROM product
WHERE Stock_quantity < 50;



/*
Display Recent 50 Orders Placed (Id, Order Date, Order Total)
*/

SELECT id, date AS Order_Date, amount AS Order_Total
FROM user_order
ORDER BY date DESC
LIMIT 50;

/*
Display 10 Most Expensive Orders
*/

SELECT id, date AS Order_Date, amount AS Order_Total
FROM user_order
ORDER BY amount DESC
LIMIT 10;


/*
Display Orders Placed More than 10 Days Ago with Unshipped Items
*/

SELECT o.id, o.date, o.amount
FROM user_order o
JOIN order_list ol ON o.id = ol.order_id
WHERE o.date < DATE_SUB(CURDATE(), INTERVAL 10 DAY)
AND ol.shipped_status != 'shipped';


/*
Display List of Shoppers Who Haven't Ordered Anything Since Last Month
*/

SELECT u.user_id, u.name
FROM users u
LEFT JOIN user_order o ON u.user_id = o.user_id AND o.date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
WHERE o.id IS NULL;


/*
Display List of Shoppers and Orders Placed by Them in the Last 15 Days
*/

SELECT u.user_id, u.name, o.id AS Order_Id, o.date AS Order_Date
FROM users u
JOIN user_order o ON u.user_id = o.user_id
WHERE o.date >= DATE_SUB(CURDATE(), INTERVAL 15 DAY);




/*
Display List of Order Items in “Shipped” State for a Specific Order Id (e.g., 1020)
*/
SELECT ol.product_id, ol.order_id
FROM order_list ol
WHERE ol.order_id = 1020
AND ol.shipped_status = 'shipped';


/*
Display List of Order Items with Order Date Between Rs 20 to Rs 50
*/

SELECT ol.product_id, o.date AS Order_Date, ol.price
FROM order_list ol
JOIN user_order o ON ol.order_id = o.id
WHERE ol.price BETWEEN 20 AND 50;


