CREATE TABLE IF NOT EXISTS "currency"
(
    "code"        varchar(3) PRIMARY KEY,
    "country"     varchar(255),
    "description" varchar(255)
);

ALTER TABLE "currency"
    ADD CONSTRAINT "chk_currency_code_valid" CHECK ("code" ~ '^[A-Z]{3}$');

