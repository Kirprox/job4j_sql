CREATE OR REPLACE FUNCTION check_movie_price()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.price < 0 THEN
        RAISE EXCEPTION 'Цена фильма не может быть отрицательной.';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER check_movie_price_trigger
BEFORE INSERT OR UPDATE
ON movies
FOR EACH ROW
EXECUTE FUNCTION check_movie_price();

CREATE OR REPLACE FUNCTION save_price_history()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO movie_price_history (
        movie_id,
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

CREATE TRIGGER movie_price_history_trigger
AFTER UPDATE OF price
ON movies
FOR EACH ROW
EXECUTE FUNCTION save_price_history();

