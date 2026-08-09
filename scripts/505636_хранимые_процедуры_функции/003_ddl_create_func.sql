CREATE OR REPLACE FUNCTION calculate_discount(
    price NUMERIC, 
    discount_percent NUMERIC
)
RETURNS NUMERIC
LANGUAGE SQL
AS
$$
    SELECT price * (100 - discount_percent)/100;
$$;

CREATE OR REPLACE FUNCTION full_name(
    name VARCHAR(50),
    surname VARCHAR(50)
)
RETURNS VARCHAR(50)
LANGUAGE SQL
AS
$$
    SELECT name||' '||surname AS full_name;
$$;

CREATE OR REPLACE PROCEDURE increase_category_prices
    category_name TEXT,
    percent NUMERIC
)
LANGUAGE SQL
AS
$$
    UPDATE products
    SET price = price * (100 + percent) / 100
    WHERE name = category_name;
$$;

CREATE OR REPLACE PROCEDURE archive_old_orders()
LANGUAGE SQL
AS
$$
    INSERT INTO orders_archive(id, user_id, created_at)
        SELECT id, user_id, created_at
            FROM orders
	WHERE created_at < CURRENT_TIMESTAMP - INTERVAL '1 year';
    DELETE FROM orders
    WHERE created_at < CURRENT_TIMESTAMP - INTERVAL '1 year';
$$;




