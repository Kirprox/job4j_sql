SELECT 
    o.customer_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.order_id
JOIN products AS p ON oi.product_id = p.product_id
GROUP BY o.customer_name
ORDER BY SUM(p.price * oi.quantity) DESC
LIMIT 3;

SELECT
    p.category,
    SUM(oi.quantity) AS total_items_sold,
    SUM(oi.quantity * p.price) AS category_revenue
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.product_id
JOIN orders AS o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.category
HAVING SUM(oi.quantity * p.price) > 30000;

SELECT
    AVG(count_items) AS avg_items_per_order
FROM(
    SELECT
        COUNT(oi.product_id) AS count_items
    FROM order_items AS oi
    JOIN orders AS o ON oi.order_id = o.order_id
    WHERE o.status = 'completed'
    GROUP BY o.order_id
);
