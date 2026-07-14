SELECT id, name, email 
FROM users
WHERE email LIKE '%mail%';

SELECT id, name, price
FROM products
WHERE name LIKE '%air%';

SELECT id, name, price
FROM products
WHERE name ~ '^i';

SELECT id, name, price
FROM products
WHERE name ~ 'pro$';

SELECT id, name, email 
FROM users
WHERE name ~* '^A|^I';

SELECT id, title, company, description
FROM vacancies
WHERE title ~ '(java|go|postgres)'
or description ~ '(java|go|postgres)';

SELECT id, name, price
FROM products
WHERE name ~ '^IPhone [0-9]+$';



