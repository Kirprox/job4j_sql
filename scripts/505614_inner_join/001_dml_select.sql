SELECT 
    o.id AS order_id,
    o.status,
    u.email
FROM orders AS o
INNER JOIN users AS u ON o.user_id = u.id
ORDER BY o.id;

SELECT
    oi.id AS order_item_id,
    oi.order_id,
    p.name,
    oi.quantity
FROM order_items AS oi
INNER JOIN products AS p ON oi.product_id = p.id
WHERE oi.quantity > 1;

SELECT
    o.id AS order_id,
    p.name,
    oi.quantity,
    oi.unit_price
FROM orders AS o
INNER JOIN order_items AS oi ON o.id = oi.order_id
INNER JOIN products AS p ON oi.product_id = p.id
WHERE o.user_id = 1;

SELECT
    o.id AS order_id,
    o.status,
    u.name
FROM orders AS o
INNER JOIN users AS u ON o.user_id = u.id
WHERE o.status = 'NEW';

SELECT
    oi.id AS order_item_id,
    p.name,
    oi.quantity,
    oi.quantity * oi.unit_price AS line_total
FROM order_items AS oi
INNER JOIN products AS p ON oi.product_id = p.id;




