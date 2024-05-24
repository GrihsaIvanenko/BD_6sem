CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO "currency"("code")
VALUES ('USD'),
       ('EUR'),
       ('JPY');

WITH nums AS (SELECT generate_series(1, 10000) AS n),
     info AS (
         INSERT INTO "product_info" ("article", "name", "certificate_number", "packaging", "company_name")
             SELECT UUID_generate_v4(), --generates random UUID
                    'Item ' || n,
                    'Certificate ' || n,
                    'Package ' || n,
                    'Company ' || n
             FROM nums
             RETURNING "article"),
     curr AS (SELECT (CASE
                          WHEN n % 3 = 1 THEN 'USD'
                          WHEN n % 3 = 2 THEN 'EUR'
                          ELSE 'JPY' END) AS code
              FROM nums),
     role AS (
         INSERT INTO "employee_to_role" ("id")
             SELECT n FROM nums
             RETURNING "id")
INSERT
INTO "product" ("is_active", "article", "price", "currency_code", "quantity", "employee_to_role_id", "product_group_id")
SELECT n % 2 = 0,
       (SELECT "article" FROM info ORDER BY "article" LIMIT 1 OFFSET (n - 1)),
       n * 10.0,
       (SELECT "code" FROM curr ORDER BY "code" LIMIT 1 OFFSET (n - 1)),
       n * 100,
       (SELECT "id" FROM role ORDER BY "id" LIMIT 1 OFFSET (n - 1)),
       n
FROM nums;

