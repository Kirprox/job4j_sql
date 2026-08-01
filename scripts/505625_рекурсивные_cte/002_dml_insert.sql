INSERT INTO categories(name, parent_id)
VALUES 
    ('Электроника', NULL),
    ('Телефоны', 1),
    ('Телевизоры', 1),
    ('Смартфоны', 2),
    ('Кнопочные телефоны', 2),
    ('OLED', 3),
    ('QLED', 3),
    ('Смартфоны Apple', 4),
    ('Смартфоны Samsung', 4);
    
INSERT INTO employees (name, position, manager_id)
VALUES
    ('Василий','Генеральный директор', NULL),
    ('Иван','Руководитель разработки', 1),
    ('Алексей',' Backend-разработчик', 2),
    ('Александр','Frontend-разработчик', 2),
    ('Алена','Руководитель продаж', 1),
    ('Мария','Менеджер', 5);

INSERT INTO comments(post_id, parent_id, author, text)
VALUES
    (100, null, 'Иван','Первый комментарий'),
    (100, 1, 'Петр','Ответ'),
    (100, 2, 'Анна','Ответ'),
    (100, 1, 'Сергей','Еще один ответ');

INSERT INTO folders (name, parent_id)
VALUES ('Projects', NULL),
       ('Backend', 1),
       ('Frontend', 1),
       ('Java', 2),
       ('Python', 2),
       ('src', 4),
       ('test', 4),
       ('React', 3),
       ('components', 8),
       ('utils', 9),
       ('images', 8);