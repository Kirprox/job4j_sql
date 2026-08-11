CREATE VIEW v_movie_views AS
SELECT
    v.id AS view_id,
    u.full_name AS user_full_name,
    m.title AS movie_title,
    v.watched_at,
    v.watch_time_minutes
FROM views AS v
JOIN users AS u ON v.user_id = u.id
JOIN movies AS m ON v.movie_id = m.id;

CREATE VIEW v_support_users AS
SELECT
    id,
    full_name,
    email,
    created_at
FROM users;

/*
безопаснее предоставить view т.к если предоставить саму таблицу users,
 то сотрудники поддержки увидят все данные.
*/

CREATE VIEW v_delivery_users AS
SELECT
    id,
    full_name,
    '********'||RIGHT(phone, 4) AS phone
FROM users;

CREATE VIEW v_active_subscriptions AS
SELECT * FROM subscriptions
WHERE is_active = TRUE;
WITH CHECK OPTION

/*
если попытаться изменить флаг, то будет ошибка
*/

CREATE MATERIALIZED VIEW mv_movie_statistics AS
SELECT
    m.id AS movie_id,
    m.title,
    COUNT(v.movie_id) AS total_views,
    SUM(v.watch_time_minutes) AS total_watch_time
FROM movies AS m
JOIN views AS v ON v.movie_id = m.id
GROUP BY m.id, m.title
WITH NO DATA;

