UPDATE orders AS o
SET total_amount = (
    SELECT
        SUM(quantity * unit_price)
        FROM order_items AS oi
        WHERE oi.order_id = o.id
);

    