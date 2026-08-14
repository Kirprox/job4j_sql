BEGIN;

INSERT INTO orders (
    customer_name,
    status)
VALUES 
    ('Иван Петров', 'NEW');

SAVEPOINT order_created;

INSERT INTO order_items (
    order_id,
    product_name,
    quantity,
    price)
VALUES
    (1, 'Ноутбук', 1, 90000),
    (1, 'Мышь', 2, 2500);

SAVEPOINT items_added;

INSERT INTO order_items (
    order_id,
    product_name,
    quantity,
    price)
VALUES
    (1, 'Монитор', -2, 30000);

ROLLBACK TO items_added;

INSERT INTO order_items (
    order_id,
    product_name,
    quantity,
    price)
VALUES
    (1, 'Монитор', 1, 3000);

UPDATE orders
SET status = 'PROCESSING'
WHERE customer_name = 'Иван Петров';

ROLLBACK TO order_created;

INSERT INTO order_items (
    order_id,
    product_name,
    quantity,
    price)
VALUES
    (1, 'Ноутбук', 1, 85000),
    (1, 'Монитор', 2, 28000),
    (1, 'Клавиатура', 1, 7000);

COMMIT;