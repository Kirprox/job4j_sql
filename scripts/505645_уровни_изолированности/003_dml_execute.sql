-- Блокировка строки

-- Транзакция 1
BEGIN;
SELECT balance
FROM accounts
WHERE id = 1
FOR UPDATE;

-- Транзакция 2
BEGIN;
UPDATE accounts
SET balance = balance + 1
WHERE id = 1;

-- Транзакция 1
COMMIT;

-- Поиск блокирующей транзакции

-- Транзакция 1
BEGIN;
SELECT balance
FROM accounts
WHERE id = 1
FOR UPDATE;

-- Транзакция 2
BEGIN;
UPDATE accounts
SET balance = balance + 1
WHERE id = 1;

--Транзакция 3

SELECT
    pid,
    state,
    wait_event_type,
    wait_event,
    pg_blocking_pids(pid) AS blocking_pids,
    query
FROM pg_stat_activity
WHERE datname = current_database();

SELECT
    pid,
    locktype,
    relation,
    mode,
    granted
FROM pg_locks
WHERE pid IS NOT NULL;

-- Взаимная блокировка

--Транзакция 1

BEGIN;
UPDATE accounts
SET balance = balance + 1
WHERE id = 1;

--Транзакция 2

BEGIN;
UPDATE accounts
SET balance = balance + 2
WHERE id = 2;

--Транзакция 1

UPDATE accounts
SET balance = balance + 2
WHERE id = 2;

--Транзакция 2

UPDATE accounts
SET balance = balance + 1
WHERE id = 1;
-- получена взаимоблокировка
-- Исправление сценария

--Транзакция 1

BEGIN

SELECT balance
FROM accounts
WHERE id IN (1, 2)
ORDER BY id
FOR UPDATE;

--Транзакция 2

BEGIN

SELECT balance
FROM accounts
WHERE id IN (1, 2)
ORDER BY id
FOR UPDATE;

--Транзакция 1

UPDATE accounts
SET balance = balance + 1
WHERE id = 1;

UPDATE accounts
SET balance = balance + 2
WHERE id = 2;

COMMIT;

--Транзакция 2

UPDATE accounts
SET balance = balance + 1
WHERE id = 1;

UPDATE accounts
SET balance = balance + 2
WHERE id = 2;

COMMIT;



