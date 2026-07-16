SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(oi.id) AS количество_заказов
FROM users AS u
LEFT JOIN orders AS o ON o.user_id = u.id
LEFT JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY u.id, u.name;

SELECT
    o.id AS order_id,
    o.status AS статус_заказа,
    o.created_at AS время_создания_заказа
FROM orders AS o
LEFT JOIN payments AS p ON p.order_id = o.id 
WHERE p.id IS NULL;

SELECT
    p.id AS product_id,
    p.name AS product_name,
    COUNT(oi.product_id) AS order_count
FROM products AS p
INNER JOIN order_items AS oi ON oi.product_id = p.id
GROUP BY p.id, p.name;

SELECT
    r.name AS role,
    COUNT(ur.user_id ) AS user_count
FROM roles AS r
LEFT JOIN user_roles AS ur ON role_id = r.id
GROUP BY r."name"
ORDER BY r."name";

SELECT
    u.name
FROM users AS u
LEFT JOIN user_roles AS ur ON ur.user_id = u.id
WHERE ur.user_id IS NULL;

SELECT
    r.code AS code,
    ur.user_id AS user_id
FROM roles AS r 
FULL JOIN user_roles AS ur ON r.id = ur.role_id;

SELECT
    r.code,
    e.code
FROM roles AS r
CROSS JOIN environments AS e;

SELECT
    c.name AS category_name,
    p.name AS parent_category_name
FROM categories AS c
LEFT JOIN categories AS p ON c.parent_id = p.id;










