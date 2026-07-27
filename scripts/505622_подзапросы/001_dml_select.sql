SELECT
    p.id AS product_id,
    p.name AS product_name,
    p.price AS price
FROM products AS p
WHERE p.price < (
    SELECT
        AVG(p.price)
    FROM products AS p
    );

SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email AS email
FROM users AS u
JOIN orders AS o ON o.user_id = u.id
WHERE EXISTS (
    SELECT 1
    FROM orders AS o2
    WHERE status = 'PAID' AND o2.user_id = u.id
);

SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email AS email
FROM users AS u
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o2
    WHERE o2.user_id = u.id
);

SELECT
    p.id AS product_id,
    p.name AS product_name,
    p.price AS price
FROM products AS p
WHERE id IN (
    SELECT oi.product_id
    FROM order_items AS oi
    WHERE oi.product_id = p.id
);

SELECT
    t.order_id,
    t.order_total
FROM (
    SELECT
    o.id AS order_id,
    SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o
    JOIN order_items AS oi ON oi.order_id = o.id
    GROUP BY o.id
    
) AS t
WHERE t.order_total > 10000;

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    (
        SELECT
	COUNT(*)
	FROM orders AS o
	WHERE o.user_id = u.id
    ) AS orders_count
FROM users;

SELECT
    product_id,
    SUM(quantity)
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > (
    SELECT AVG(total_quantity)
    FROM (
	SELECT
	    product_id,
            SUM(quantity) AS
total_quantity
	FROM order_items
	GROUP BY product_id
    ) AS product_totals
); 

SELECT
    t.order_id,
    t.order_total
FROM (
    SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
     ) AS t
WHERE t.order_total > (
    SELECT AVG(order_total)
    FROM (
        SELECT
            order_id,
 	    SUM(quantity * unit_price) AS order_total
	FROM order_items
	GROUP BY order_id
	) AS order_totals
);