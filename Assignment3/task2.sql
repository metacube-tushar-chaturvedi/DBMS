SELECT p.product_id, p.name , COUNT(pc.category_id)
FROM product_category pc
INNER JOIN product p 
ON p.product_id = pc.product_id
GROUP BY p.product_id , p.name
HAVING COUNT(pc.category_id)>1
ORDER BY p.product_id;

SELECT 
CASE  
 WHEN price between 0 and 100 THEN '0-100'
 WHEN price between 101 and 500 THEN '101 - 500'
 WHEN price >500 THEN 'above 500'
 END as price_range,
 Count(*) as count
 FROM product
 GROUP BY price_range;
 
SELECT c.category_id,name ,count(pc.product_id) as count
FROM product_category pc
INNER JOIN category c 
ON pc.category_id = c.category_id
GROUP BY c.category_id , c.name;
 


