SELECT
    o.status,
    COUNT(oi.order_id)
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY o.status
HAVING COUNT(oi.order_id) >= 3;

SELECT
    u.id AS user_id,
    u.name AS user_name,
    SUM(oi.quantity * unit_price) AS total_spent
FROM users AS u
JOIN orders AS o ON o.user_id = u.id
JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY u.id, u.name
HAVING SUM(oi.quantity * unit_price) > 10000;

SELECT
    p.id AS product_id,
    p.name AS product_name,
    SUM(oi.quantity)AS total_quantity
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id
WHERE oi.unit_price >= 1000
GROUP BY p.id, p.name
HAVING SUM(oi.quantity) >= 5;

SELECT
    u.id AS user_id,
    u.name AS user_name,
    o.status,
    COUNT(oi.order_id) AS orders_count
FROM users AS u
JOIN orders AS o ON o.user_id = u.id
JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY u.id, u.name, o.status
HAVING COUNT(oi.order_id) > 1;

SELECT
    oi.order_id,
    SUM(oi.quantity)AS total_quantity
FROM order_items AS oi
GROUP BY oi.order_id
HAVING SUM(oi.quantity) >= 4;

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(o.status) AS paid_order_count
FROM users AS u
JOIN orders AS o ON o.user_id = u.id
WHERE o.status = 'PAID'
GROUP BY u.id, u.name
HAVING COUNT(o.status) >= 2;

SELECT
    p.id AS product_id,
    p.name AS product_name,
    MIN(oi.unit_price) AS min_unit_price,
    MAX(oi.unit_price) AS max_unit_price
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id
GROUP BY p.id, p.name
HAVING MAX(oi.unit_price) > 5000;

SELECT
    o.status,
    AVG(oi.quantity * unit_price) AS avg_line_total
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.id
WHERE o.created_at > DATE '2025-01-01'
GROUP BY o.status
HAVING AVG(oi.quantity * unit_price) > 2000;