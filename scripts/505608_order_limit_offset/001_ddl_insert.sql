INSERT INTO products(name, price, is_active)
VALUES  
    ('Packard bell', 18990, true),
    ('Samsung A16', 15000, false),
    ('Nikon d60', 30000, true);

INSERT INTO orders(user_id, status)
VALUES 
    (3,'NEW'),
    (3, 'PAID'),
    (5, 'CANCELLED'),
    (4, 'PAID'),
    (6, 'NEW');

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
    (3, 5, 2, 18990),
    (4, 7, 1, 30000),
    (5, 3, 5, 24900),
    (6, 1, 4, 99990),
    (7, 2, 1, 149990),
    (8, 5, 2, 18990),
    (9, 7, 2, 30000),
    (10, 5, 2, 18990),
    (11, 5, 2, 18990);

INSERT INTO users(name, email)
VALUES
    ('Andrey Smirnov','andrey.smirnov@example.com'),
    ('Uliana Zimina','uliana.zimina@example.com'),
    ('Alexey Kuznecov','alexey.kuznecov@example.com'),
    ('Ivan Smirnov','ivan.smirnov@example.com'),
    ('Nikolay Petrov','nikolay.petrov@example.com');

