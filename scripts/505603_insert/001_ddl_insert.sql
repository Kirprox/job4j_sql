INSERT INTO users (name, email)
VALUES ('Ivan Petrov', 'ivan.petrov@example.com')
RETURNING *;


INSERT INTO users (name, email)
VALUES
    ('Anna Smirnova', 'anna.smirnova@example.com'),
    ('Petr Ivanov', 'petr.ivanov@example.com'),
    ('Olga Sidorova', 'olga.sidorova@example.com')
RETURNING id, name, email;


INSERT INTO products (name, price, is_active)
VALUES
    ('iPhone 17', 99990.00, true),
    ('MacBook Air M5', 149990.00, true),
    ('AirPods Pro 2', 24990.00, true),
    ('Old Keyboard', 1500.00, false)
RETURNING id, name, price, is_active;


INSERT INTO orders (user_id, status)
VALUES
    (1, 'NEW'),
    (2, 'PAID')
RETURNING id, user_id, status, created_at;


INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 99990.00),
    (1, 3, 2, 24990.00),
    (2, 2, 1, 149990.00)
RETURNING *;




