WITH count_total AS (
    SELECT
        oi.order_id,
        oi.quantity * oi.unit_price AS total_price
    FROM order_items AS oi
),
sum_total AS (
    SELECT 
        ct.order_id,
        SUM(ct.total_price) AS sum_total_price
    FROM count_total AS ct
    GROUP BY ct.order_id
)
SELECT
    st.order_id ,
    st.sum_total_price AS total_amount
FROM sum_total AS st;


WITH total_paid_items AS (
    SELECT
	u.id AS user_id,
	SUM(oi.quantity * unit_price) AS paid_sum
    FROM users AS u
    JOIN orders AS o ON o.user_id = u.id
    JOIN order_items AS oi ON oi.order_id = o.id
    WHERE o.status = 'PAID'
    GROUP BY u.id
),
 avg_sum_paid_items AS (
    SELECT AVG(tp.paid_sum) AS avg_total
    FROM total_paid_items AS tp
)
SELECT
    u.id AS user_id,
    u.name AS user_name,
    tp.paid_sum AS total_amount
FROM users AS u
JOIN total_paid_items AS tp ON tp.user_id = u.id
CROSS JOIN avg_sum_paid_items AS sp
WHERE tp.paid_sum > sp.avg_total;


WITH total_order_items AS (
    SELECT 
        DISTINCT(p.id) AS product_id,
        p.name AS product_name
    FROM products AS p
    JOIN order_items AS oi ON oi.product_id = p.id
)
SELECT 
    p.id AS product_id,
    p.name AS product_name
FROM products AS p
WHERE p.id NOT IN(SELECT product_id FROM total_order_items);

WITH total_quantity_items AS (
    SELECT 
        p.id AS product_id,
 	p.name AS product_name,
	SUM(oi.quantity) AS total_quantity
    FROM products AS p
    JOIN order_items AS oi ON oi.product_id = p.id
    GROUP BY p.id, p.name
)
SELECT 
    product_id,
    product_name,
    total_quantity
FROM total_quantity_items
ORDER BY total_quantity DESC
LIMIT 5; 
    










        