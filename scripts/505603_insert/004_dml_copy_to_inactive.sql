INSERT INTO inactive_products_archive(product_id, product_name, price, archived_at)
SELECT id, name, price, created_at
FROM products
WHERE is_active = false;