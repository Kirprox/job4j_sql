WITH daily_sales AS (
    SELECT
	DATE(o.created_at) AS sale_date,
	SUM(oi.quantity * oi.unit_price) AS sales_amount
    FROM orders AS o
    JOIN order_items AS oi ON oi.order_id = o.id
    GROUP BY DATE(o.created_at)
),
sales_analysis AS (
    SELECT
        sale_date,
	sales_amount,
	LAG(sales_amount) OVER (
	ORDER BY sale_date
        ) AS previous_day_sales,
        LEAD(sales_amount) OVER (
	ORDER BY sale_date
        ) AS next_day_sales
    FROM daily_sales
)
SELECT
    sale_date,
    sales_amount,
    previous_day_sales,
    next_day_sales,
    sales_amount - previous_day_sales AS sales_diff,
    SUM(sales_amount) OVER (
	ORDER BY sale_date
	ROWS BETWEEN UNBOUNDED PRECEDING
		AND CURRENT ROW
    ) AS running_total,
    AVG(sales_amount) OVER (
	ORDER BY sale_date
	ROWS BETWEEN 2 PRECEDING
		AND CURRENT ROW
    ) AS avg_last_three_days
FROM sales_analysis
ORDER BY sale_date;
