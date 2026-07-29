INSERT INTO products (product_name, category, price) VALUES
('Ноутбук Apple MacBook Air', 'Электроника', 90000.00),
('Мышь Logitech MX Master', 'Аксессуары', 8000.00),
('Клавиатура Keychron K2', 'Аксессуары', 7500.00),
('Наушники Sony WH-1000XM5', 'Аудио', 25000.00);

INSERT INTO orders (customer_name, order_date, status) VALUES
('Иван Иванов', '2023-10-01', 'completed'),
('Петр Петров', '2023-10-02', 'completed'),
('Анна Смирнова', '2023-10-03', 'completed'),
('Елена Попова', '2023-10-04', 'cancelled'), -- Отмененный заказ!
('Иван Иванов', '2023-10-05', 'completed');



INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), (1, 2, 1), (2, 3, 2), (3, 4, 1), (3, 2, 1),
(4, 1, 1), (5, 2, 1), (5, 3, 1);