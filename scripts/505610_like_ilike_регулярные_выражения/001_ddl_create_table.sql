DROP TABLE IF EXISTS vacancies;

CREATE TABLE vacancies
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title       TEXT        NOT NULL,
    company     TEXT        NOT NULL,
    description TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);