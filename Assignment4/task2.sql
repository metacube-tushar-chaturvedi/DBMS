


CREATE PROCEDURE get_average_sales(month INT, year INT)
BEGIN
    
    SELECT DATE_FORMAT(date, '%M') AS "Month", p.id, p.name, 
    ROUND( SUM(i.quantity * p.price) / DAY( LAST_DAY( o.date ) ),1 ) as average_sales
    FROM user_order o JOIN item i
    ON o.id = i.order_id
    JOIN product p
    ON p.id = i.product_id
    WHERE DATE_FORMAT(date, '%c') = month AND DATE_FORMAT(date, '%Y') = year
    GROUP BY 2;

END $$
DELIMITER ;

CALL get_average_sales(8, 2021);

# ------------------------------------------------------------------


CREATE PROCEDURE orders_in_range(start_date DATE, end_date DATE)
BEGIN

    IF DATEDIFF(end_date, start_date) < 0 THEN
        SELECT MAKEDATE(YEAR(end_date), MONTH(end_date)) INTO start_date;
    END IF;
    
    SELECT o.id AS "order id", o.date, p.name, i.status
    FROM user_order o JOIN item i
    ON o.id = i.order_id
    JOIN product p
    ON p.id = i.product_id
    WHERE o.date BETWEEN start_date AND end_date
    ORDER BY o.id;

END $$
DELIMITER ;

CALL orders_in_range('2024-05-01', '2024-06-15');       
CALL orders_in_range('2024-06-10', '2024-05-20');     