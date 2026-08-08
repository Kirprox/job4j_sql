CREATE OR REPLACE FUNCTION add_updated()
RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER update_updated_at
BEFORE UPDATE
ON employees
FOR EACH ROW
EXECUTE FUNCTION add_updated();


CREATE OR REPLACE FUNCTION save_status_history()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO order_status_history (
        order_id,
        old_status,
        new_status
    )
    VALUES (
        OLD.id,
        OLD.status,
        NEW.status
    );

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER order_status_history_trigger
AFTER UPDATE OF status
ON orders
FOR EACH ROW
EXECUTE FUNCTION save_status_history();


CREATE OR REPLACE FUNCTION check_employee_salary()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION 'Зарплата не может быть отрицательной.';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER check_employee_salary_trigger
BEFORE INSERT OR UPDATE
ON employees
FOR EACH ROW
EXECUTE FUNCTION check_employee_salary();


CREATE OR REPLACE FUNCTION trim_product_name()
RETURNS TRIGGER AS
$$
BEGIN
    NEW.name := TRIM(NEW.name);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trim_product_name_trigger
BEFORE INSERT OR UPDATE
ON products
FOR EACH ROW
EXECUTE FUNCTION trim_product_name();


CREATE OR REPLACE FUNCTION save_only_price_history()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.price = OLD.price THEN
        RETURN NEW;
    END IF;
    INSERT INTO product_price_history (
        product_id,
        old_price,
        new_price
    )
    VALUES (
        OLD.id,
        OLD.price,
        NEW.price
    );

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER product_price_history_trigger
AFTER UPDATE OF price
ON products
FOR EACH ROW
EXECUTE FUNCTION save_only_price_history();