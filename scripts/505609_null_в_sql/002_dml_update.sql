UPDATE users
SET middle_name = 'Ivanovich'
WHERE id IN (1, 3, 5, 9);

UPDATE users
SET phone = '+79111234567'
WHERE id IN (1, 2, 3);

UPDATE users
SET phone = ''
WHERE id IN (5, 6, 7);

UPDATE products
SET description = 'notebook'
WHERE id IN (2, 5);

UPDATE products
SET discount_price = price * 0.9
WHERE id IN (1, 2, 3);
