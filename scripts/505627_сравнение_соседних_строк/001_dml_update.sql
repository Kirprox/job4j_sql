UPDATE orders
SET created_at = '2026-07-21 10:15:00'
WHERE id IN (3, 4);

UPDATE orders
SET created_at = '2026-07-22 12:30:00'
WHERE id IN (5, 6);

UPDATE orders
SET created_at = '2026-07-23 09:45:00'
WHERE id IN (7, 8);

UPDATE orders
SET created_at = '2026-07-24 14:20:00'
WHERE id IN (9, 10, 11);