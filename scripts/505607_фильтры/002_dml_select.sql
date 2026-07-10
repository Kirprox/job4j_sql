SELECT id, name, price, is_active FROM products
WHERE is_active = true;

SELECT id, name, price FROM products
WHERE price between 10000 and 100000;

SELECT id, user_id, status, created_at FROM orders
WHERE status in ('NEW', 'PAID');

SELECT id, user_id, status, created_at FROM orders
WHERE status <> 'CANCELLED';

SELECT id, name, email, created_at  FROM users
WHERE created_at between 
	timestamptz '2026-07-08 00:00'
    AND timestamptz '2026-07-08 23:59';

SELECT id, name, price FROM products 
WHERE price NOT BETWEEN 20000 AND 80000;

SELECT id, name, price FROM products 
WHERE is_active = true
AND (price < 3000 OR price > 15000);

