SELECT
    id AS order_id,
    user_id,
    total_amount,
    SUM(total_amount) 
        OVER(PARTITION BY user_id) AS user_total
FROM orders;

SELECT
    id AS order_id,
    user_id,
    total_amount,
    AVG(total_amount)
        OVER(PARTITION BY user_id) AS average_order_amount
FROM orders;

SELECT
    id AS order_id,
    user_id,
    created_at,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY created_at
    ) AS row_number
FROM orders;

SELECT
    id AS order_id,
    total_amount,
    RANK() OVER (
	ORDER BY total_amount DESC
    ) AS order_rank
FROM orders;

SELECT
    id AS order_id,
    total_amount,
    DENSE_RANK() OVER (
	ORDER BY total_amount DESC
    ) AS order_rank
FROM orders;

SELECT
    id AS order_id,
    total_amount,
    NTILE(4) OVER (
        ORDER BY total_amount DESC
    ) AS group_number
FROM orders;

SELECT
    id AS order_id,
    user_id,
    total_amount,
    SUM(total_amount) OVER(w) AS user_total,
    AVG(total_amount) OVER(w) AS average_order_amount,
    COUNT(total_amount) OVER(w) AS orders_count
FROM orders
WINDOW w AS (
    PARTITION BY user_id
);
