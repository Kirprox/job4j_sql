INSERT INTO payments (order_id, amount, status)
VALUES (1, 129990.00, 'PAID'),
       (3, 4990.00, 'FAILED');

INSERT INTO roles (code, name)
VALUES ('ADMIN', 'Administrator'),
       ('CUSTOMER', 'Customer'),
       ('MANAGER', 'Manager'),
       ('SUPPORT', 'Support');

INSERT INTO user_roles (user_id, role_id)
VALUES (1, 1),
       (1, 2),
       (2, 2);

INSERT INTO environments (code)
VALUES ('dev'), ('stage'), ('prod');

INSERT INTO categories (name, parent_id)
VALUES
    ('Электроника', NULL),
    ('Смартфоны', 1),
    ('Ноутбуки', 1),
    ('Аксессуары', 1),
    ('Чехлы', 4);

