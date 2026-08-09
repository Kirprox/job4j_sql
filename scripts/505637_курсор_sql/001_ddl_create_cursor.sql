BEGIN;

DECLARE products_cursor CURSOR FOR
SELECT id, name, price
FROM products;

FETCH 3 FROM products_cursor;

FETCH 2 FROM products_cursor;

CLOSE products_cursor;

COMMIT;

BEGIN;

DECLARE orders_cursor CURSOR FOR
SELECT * FROM orders;

FETCH 5 FROM orders_cursor;

FETCH 5 FROM orders_cursor;

CLOSE orders_cursor;

COMMIT;

BEGIN

DECLARE scroll_orders_cursor SCROLL CURSOR FOR
SELECT * FROM orders;

FETCH 5 FROM scroll_orders_cursor;

MOVE BACKWARD 2 FROM scroll_orders_cursor;

FETCH 2 FROM scroll_orders_cursor;

CLOSE scroll_orders_cursor;

COMMIT;



