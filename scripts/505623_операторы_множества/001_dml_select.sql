SELECT
    u.id AS user_id
FROM users AS u
JOIN orders AS o ON o.user_id = u.id
WHERE o.status = 'PAID'

UNION

SELECT
    u.id AS user_id
FROM users AS u
JOIN orders AS o ON o.user_id = u.id
WHERE o.status = 'NEW';

SELECT
    'user' AS entity_type,
    id AS entity_id,
    created_at
FROM users

UNION ALL

SELECT
    'product' AS entity_type,
    id AS entity_id,
    created_at
FROM products

UNION ALL

SELECT
    'user' AS entity_type,
    id AS entity_id,
    created_at
FROM orders
ORDER BY created_at DESC;

SELECT
    id AS product_id,
    name AS product_name
FROM products
WHERE is_active = true

INTERSECT

SELECT
    p.id AS product_id,
    p.name AS product_name
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id

SELECT
    id AS product_id,
    name AS product_name
FROM products
WHERE is_active = true

EXCEPT

SELECT
    p.id AS product_id,
    p.name AS product_name
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id

SELECT
    u.id AS user_id,
    u.name AS user_name
FROM users AS u
JOIN orders AS o ON o.user_id = u.id

UNION

SELECT
    id AS user_id,
    name AS user_name
FROM users
WHERE created_at > DATE '2026-06-01';

SELECT
    p.id AS product_id,
    p.name AS product_name,
    p.price AS price
FROM products AS p
WHERE p.price > (
        SELECT AVG(price)
	FROM products
)

INTERSECT

SELECT
    p.id AS product_id,
    p.name AS product_name,
    p.price AS price
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id;

SELECT
    u.id AS user_id,
    u.name AS user_name
FROM users AS u
JOIN orders AS o ON o.user_id = u.id

EXCEPT
 
SELECT
    u.id AS user_id,
    u.name AS user_name
FROM users AS u
JOIN (
    SELECT * FROM orders
    WHERE status = 'CANCELLED'
) AS o ON o.user_id = u.id;

SELECT
    'user' AS entity_type,
    id AS entity_id,
    name AS display_name
FROM users

UNION ALL

SELECT
    'product' AS entity_type,
    id AS entity_id,
    name AS display_name
FROM products;









