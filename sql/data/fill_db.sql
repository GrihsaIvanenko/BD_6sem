CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- USD EUR CAD CHF JPY GBP AUD
INSERT INTO "currency" ("code", "country", "description")
VALUES ('USD', 'United States', 'US Dollar'),
       ('EUR', 'Eurozone', 'Euro'),
       ('JPY', 'Japan', 'Japanese Yen'),
       ('GBP', 'United Kingdom', 'British Pound'),
       ('CAD', 'Canada', 'Canadian Dollar'),
       ('AUD', 'Australia', 'Australian Dollar'),
       ('CHF', 'Switzerland', 'Swiss Franc');
--        ('CNY', 'China', 'Chinese Yuan'),
--        ('SEK', 'Sweden', 'Swedish Krona'),
--        ('NZD', 'New Zealand', 'New Zealand Dollar'),
--        ('MXN', 'Mexico', 'Mexican Peso'),
--        ('SGD', 'Singapore', 'Singapore Dollar'),
--        ('HKD', 'Hong Kong', 'Hong Kong Dollar'),
--        ('NOK', 'Norway', 'Norwegian Krone'),
--        ('KRW', 'South Korea', 'South Korean Won'),
--        ('TRY', 'Turkey', 'Turkish Lira'),
--        ('INR', 'India', 'Indian Rupee'),
--        ('RUB', 'Russia', 'Russian Ruble'),
--        ('BRL', 'Brazil', 'Brazilian Real'),
--        ('ZAR', 'South Africa', 'South African Rand');

INSERT INTO "employee" ("full_name", "supervisor_id")
VALUES ('John Doe', NULL), -- Top supervisor (assume no supervisor)
       ('Jane Smith', 1),
       ('Alice Johnson', 1),
       ('Bob Brown', 2),
       ('Charlie Davis', 2);

INSERT INTO role ("name")
VALUES ('employee');

INSERT INTO "employee_to_role" (role_id, employee_id)
VALUES ((SELECT id FROM role WHERE name = 'employee'), 1),
       ((SELECT id FROM role WHERE name = 'employee'), 2),
       ((SELECT id FROM role WHERE name = 'employee'), 3),
       ((SELECT id FROM role WHERE name = 'employee'), 4),
       ((SELECT id FROM role WHERE name = 'employee'), 5);

INSERT INTO "employee_info" ("employee_id", "iin", "pasport", "date_of_birth", "sex", "phone_number", "login",
                             "password")
VALUES (1, '123456789012', 'AA1234567', '1985-05-16', 'MALE', '555-0100', 'john.doe', 'password1'),
       (2, '234567890123', 'BB2345678', '1990-08-25', 'FEMALE', '555-0101', 'jane.smith', 'password2'),
       (3, '345678901234', 'CC3456789', '1992-12-14', 'FEMALE', '555-0102', 'alice.johnson', 'password3'),
       (4, '456789012345', 'DD4567890', '1987-09-30', 'MALE', '555-0103', 'bob.brown', 'password4'),
       (5, '567890123456', 'EE5678901', '1995-04-07', 'MALE', '555-0104', 'charlie.davis', 'password5');

INSERT INTO "exchange_rate" ("source_currency", "target_currency", "date", "value")
VALUES ('USD', 'EUR', '2023-01-01 00:00:00', 0.95),
       ('USD', 'EUR', '2023-01-02 00:00:00', 1.95),
       ('USD', 'CAD', '2023-01-01 00:00:00', 1.33),
       ('USD', 'CAD', '2023-01-02 00:00:00', 2.33),
       ('USD', 'CAD', '2023-01-03 00:00:00', 3.33),
       ('USD', 'CHF', '2023-01-01 00:00:00', 0.92),
       ('USD', 'JPY', '2023-01-01 00:00:00', 115.5),
       ('USD', 'JPY', '2023-01-02 00:00:00', 125.5),
       ('EUR', 'USD', '2023-01-01 00:00:00', 1.05),
       ('EUR', 'JPY', '2023-01-01 00:00:00', 122.5),
       ('GBP', 'USD', '2023-01-01 00:00:00', 1.35),
       ('GBP', 'EUR', '2023-01-01 00:00:00', 1.17),
       ('CAD', 'USD', '2023-01-01 00:00:00', 0.75),
       ('AUD', 'USD', '2023-01-01 00:00:00', 0.68);

INSERT INTO "organization" ("id", "name", "address", "category", "license_number", "phone_number", "bank_details")
VALUES (uuid_generate_v4(), 'Company One', '1234 Market St', 'Technology', 'LN12345', '555-0200', 'BANK1001'),
       (uuid_generate_v4(), 'Company Two', '5678 Trade Blvd', 'Retail', 'LN23456', '555-0201', 'BANK1002'),
       (uuid_generate_v4(), 'Company Three', '91011 Industrial Ave', 'Manufacturing', 'LN34567', '555-0202',
        'BANK1003'),
       (uuid_generate_v4(), 'Company Four', '1213 High St', 'Finance', 'LN45678', '555-0203', 'BANK1004'),
       (uuid_generate_v4(), 'Company Five', '1415 Small Town Rd', 'Healthcare', 'LN56789', '555-0204', 'BANK1005');

INSERT INTO "product_info" ("article", "name", "certificate_number", "packaging", "company_name")
VALUES (uuid_generate_v4(), 'Widget A', 'CN12345', 'Box', 'Widgets Inc.'),
       (uuid_generate_v4(), 'Gadget B', 'CN23456', 'Blister Pack', 'Gadgets Co.'),
       (uuid_generate_v4(), 'Device C', 'CN34567', 'Bag', 'Devices LLC'),
       (uuid_generate_v4(), 'Tool D', 'CN45678', 'Crate', 'Tools Corp.'),
       (uuid_generate_v4(), 'Instrument E', 'CN56789', 'Box', 'Instruments Ltd.');

INSERT INTO "product_group" ("name", "description", "parent_product_group_id")
VALUES ('Electronics', 'All electronic gadgets and devices', NULL),
       ('Gadgets', 'Portable electronic devices', 1),
       ('Home Appliances', 'Electronic appliances used at home', 1),
       ('Tools', 'All sorts of tools', 3),
       ('Power Tools', 'Electronically powered tools', 4);

INSERT INTO "product" ("is_active", "article", "price", "currency_code", "quantity", "employee_to_role_id",
                       "product_group_id")
VALUES (TRUE, (SELECT article FROM product_info WHERE name = 'Widget A'), 9.99, 'USD', 100, 1, 1),
       (FALSE, (SELECT article FROM product_info WHERE name = 'Widget A'), 8.99, 'USD', 100, 1, 2),
       (FALSE, (SELECT article FROM product_info WHERE name = 'Widget A'), 7.99, 'USD', 100, 1, 3),
       (TRUE, (SELECT article FROM product_info WHERE name = 'Gadget B'), 19.99, 'USD', 200, 1, 4),
       (TRUE, (SELECT article FROM product_info WHERE name = 'Device C'), 29.99, 'USD', 150, 2, 5),
       (FALSE, (SELECT article FROM product_info WHERE name = 'Device C'), 4, 'USD', 150, 2, 5),
       (TRUE, (SELECT article FROM product_info WHERE name = 'Tool D'), 49.99, 'USD', 75, 2, 4),
       (FALSE, (SELECT article FROM product_info WHERE name = 'Instrument E'), 59.99, 'USD', 50, 3, 3);

INSERT INTO "payment_order" ("id", "processed", "date", "type", "total_sum", "currency_code", "employee_to_role_id")
VALUES (uuid_generate_v4(), TRUE, '2023-01-02 10:00:00', 'INCOMING', 1000.00, 'USD', 1),
       (uuid_generate_v4(), FALSE, '2023-01-03 11:00:00', 'OUTCOMING', 500.00, 'USD', 2),
       (uuid_generate_v4(), TRUE, '2023-01-04 12:00:00', 'INCOMING', 1500.00, 'USD', 1),
       (uuid_generate_v4(), FALSE, '2023-01-05 13:00:00', 'OUTCOMING', 750.00, 'USD', 3),
       (uuid_generate_v4(), TRUE, '2023-01-06 14:00:00', 'INCOMING', 2500.00, 'USD', 2);

INSERT INTO "invoice" ("date", "currency_code", "payment_order_id", "organization_id")
VALUES ((SELECT date FROM payment_order ORDER BY date LIMIT 1),
        (SELECT currency_code FROM payment_order ORDER BY date LIMIT 1),
        (SELECT id FROM payment_order ORDER BY date LIMIT 1),
        (SELECT id FROM organization WHERE name = 'Company One')),
       ((SELECT date FROM payment_order ORDER BY date OFFSET 1 LIMIT 1),
        (SELECT currency_code FROM payment_order ORDER BY date OFFSET 1 LIMIT 1),
        (SELECT id FROM payment_order ORDER BY date OFFSET 1 LIMIT 1),
        (SELECT id FROM organization WHERE name = 'Company Two')),
       ((SELECT date FROM payment_order ORDER BY date OFFSET 2 LIMIT 1),
        (SELECT currency_code FROM payment_order ORDER BY date OFFSET 2 LIMIT 1),
        (SELECT id FROM payment_order ORDER BY date OFFSET 2 LIMIT 1),
        (SELECT id FROM organization WHERE name = 'Company Three')),
       ((SELECT date FROM payment_order ORDER BY date OFFSET 3 LIMIT 1),
        (SELECT currency_code FROM payment_order ORDER BY date OFFSET 3 LIMIT 1),
        (SELECT id FROM payment_order ORDER BY date OFFSET 3 LIMIT 1),
        (SELECT id FROM organization WHERE name = 'Company Four')),
       ((SELECT date FROM payment_order ORDER BY date OFFSET 4 LIMIT 1),
        (SELECT currency_code FROM payment_order ORDER BY date OFFSET 4 LIMIT 1),
        (SELECT id FROM payment_order ORDER BY date OFFSET 4 LIMIT 1),
        (SELECT id FROM organization WHERE name = 'Company Five'));

INSERT INTO "product_document" ("id", "type", "date", "product_id", "quantity",
                                "exchange_rate_id", "employee_to_role_id", "invoice_id")
VALUES (uuid_generate_v4(), 'SALE', '2023-01-01 15:00:00',
        (SELECT p.id
         FROM product p
                  JOIN product_info pi ON pi.article = p.article
         WHERE pi.name = 'Widget A'
           AND p.is_active = true), 10, 1, 1, (SELECT id FROM invoice OFFSET 0 LIMIT 1)),
       (uuid_generate_v4(), 'REFUND', '2023-01-02 16:00:00',
        (SELECT p.id
         FROM product p
                  JOIN product_info pi ON pi.article = p.article
         WHERE pi.name = 'Gadget B'
           AND p.is_active = true), 5, 2, 2, (SELECT id FROM invoice OFFSET 1 LIMIT 1)),
       (uuid_generate_v4(), 'SALE', '2023-01-03 17:00:00',
        (SELECT p.id
         FROM product p
                  JOIN product_info pi ON pi.article = p.article
         WHERE pi.name = 'Device C'
           AND p.is_active = true), 15, 3, 1, (SELECT id FROM invoice OFFSET 2 LIMIT 1)),
       (uuid_generate_v4(), 'REFUND', '2023-01-04 18:00:00',
        (SELECT p.id
         FROM product p
                  JOIN product_info pi ON pi.article = p.article
         WHERE pi.name = 'Tool D'
           AND p.is_active = true), 7, 1, 3, (SELECT id FROM invoice OFFSET 3 LIMIT 1)),
       (uuid_generate_v4(), 'SALE', '2023-01-05 19:00:00',
        (SELECT p.id
         FROM product p
                  JOIN product_info pi ON pi.article = p.article
         WHERE pi.name = 'Instrument E'
           AND p.is_active = true), 20, 2, 2, (SELECT id FROM invoice OFFSET 4 LIMIT 1));

