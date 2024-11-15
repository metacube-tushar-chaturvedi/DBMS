USE storefront;

#1.1 Function to calculate number of orders in a month
#    Input: Month in numeric


CREATE FUNCTION number_of_orders(month INT, year INT)
RETURNS INT

BEGIN
    DECLARE orders INT;
    
    SELECT COUNT(id) INTO orders FROM user_order
    WHERE DATE_FORMAT(date, '%Y') = year
    AND DATE_FORMAT(date, '%c') = month
    GROUP BY DATE_FORMAT(date, '%c');
    
    RETURN (orders);
END $$

DELIMITER ;

SELECT number_of_orders(8, 2024) AS "Orders in 08/2024";
SELECT number_of_orders(5, 2024) AS "Orders in 05/2024";
SELECT number_of_orders(4, 2024) AS "Orders in 04/2024";

# ------------------------------------------------------------------
#1.2 Function to return month in a year having maximum orders
#    Input: Year

DROP FUNCTION IF EXISTS storefront.maximum_orders_month;
DELIMITER $$

CREATE FUNCTION maximum_orders_month(year INT)
RETURNS VARCHAR(10)

BEGIN
    DECLARE max_month VARCHAR(10);
    
    SELECT DATE_FORMAT(date, '%M') INTO max_month
    FROM user_order
    WHERE DATE_FORMAT(date, '%Y') = 2024
    GROUP BY DATE_FORMAT(date, '%M')
    ORDER BY 1 DESC
    LIMIT 1;
    
    RETURN (max_month);
END $$

DELIMITER ;

SELECT maximum_orders_month(2024) AS "Month with Maximum Orders";