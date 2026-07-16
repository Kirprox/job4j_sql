SELECT
    cb.id,
    cb.name
FROM car_bodies as cb
LEFT JOIN cars AS c ON c.body_id = cb.id
WHERE c.id IS NULL;

SELECT
    ce.id,
    ce.name
FROM car_engines AS ce
LEFT JOIN cars AS c ON c.engine_id = ce.id
WHERE c.name IS NULL;

SELECT
    ct.id,
    ct.name
FROM car_transmissions AS ct
LEFT JOIN cars AS c ON c.transmission_id = ct.id
WHERE c.name IS NULL;

SELECT
    c.id,
    c.name,
    cb.name AS body_name
FROM cars AS c
LEFT JOIN car_bodies AS cb ON c.body_id = cb.id;

SELECT
    c.id,
    c.name AS car_name,
    cb.name AS body_name,
    ce.name AS engine_name,
    ct.name AS transmission_name
FROM cars AS c
INNER JOIN car_bodies AS cb ON c.body_id = cb.id
INNER JOIN car_engines AS ce ON c.engine_id = ce.id
INNER JOIN car_transmissions AS ct ON c.transmission_id = ct.id;

SELECT
    c.id,
    c.name AS car_name,
    b.name AS body_name,
    e.name AS engine_name
FROM cars AS c
INNER JOIN car_engines AS e ON c.engine_id = e.id
LEFT JOIN car_bodies AS b ON c.body_id = b.id
WHERE b.name IS NULL;

SELECT
    b.id AS body_id,
    b.name AS body_name,
    c.id AS car_id,
    c.name AS car_name
FROM car_bodies AS b
LEFT JOIN cars AS c ON c.body_id = b.id;

SELECT 
    e.id,
    e.name AS engine_name
FROM car_engines AS e
LEFT JOIN cars AS c ON c.engine_id = e.id
WHERE c.name is null;

SELECT
    c.id,
    c.name AS car_name,
    b.name AS body_name,
    e.name AS engine_name,
    t.name AS transmission_name
FROM cars AS c
LEFT JOIN car_engines AS e ON c.engine_id = e.id
LEFT JOIN car_bodies AS b ON c.body_id = b.id
LEFT JOIN car_transmissions AS t ON c.transmission_id = t.id
WHERE t.name like 'automatic %';

SELECT
    c.id,
    c.name AS car_name,
    b.name AS body_name,
    e.name AS engine_name,
    t.name AS transmission_name
FROM cars AS c
LEFT JOIN car_engines AS e ON c.engine_id = e.id
LEFT JOIN car_bodies AS b ON c.body_id = b.id
LEFT JOIN car_transmissions AS t ON c.transmission_id = t.id
WHERE e.name IS NULL OR b.name IS NULL OR t.name IS NULL;

SELECT
    c.id,
    c.name AS car_name,
    e.name AS engine_name,
    t.name AS transmission_name
FROM cars AS c
INNER JOIN car_engines AS e ON c.engine_id = e.id
LEFT JOIN car_transmissions AS t ON c.transmission_id = t.id;


SELECT 
    'body' AS detail_type,
    b.id,
    b.name AS body_name
FROM car_bodies AS b
LEFT JOIN cars AS c ON c.body_id = b.id
WHERE c.id is null;

UNION

SELECT 
    'engine' AS detail_type,
    e.id,
    e.name AS engine_name
FROM car_engines AS e
LEFT JOIN cars AS c ON c.engine_id = e.id
WHERE c.id is null;

UNION

SELECT 
    'transmission' AS detail_type,
    t.id,
    t.name AS transmission_name
FROM car_transmissions AS t
LEFT JOIN cars AS c ON c.transmission_id = t.id
WHERE c.id is null;


SELECT  
    c.id
    c.name AS car_name,
    b.name AS body_name,
    e.name AS engine_name,
    t.name AS transmission_name
FROM cars AS c
LEFT JOIN car_engines AS e ON c.engine_id = e.id
LEFT JOIN car_bodies AS b ON c.body_id = b.id
LEFT JOIN car_transmissions AS t ON c.transmission_id = t.id
WHERE b.name IN ('sedan', 'hatchback', 'suv');





