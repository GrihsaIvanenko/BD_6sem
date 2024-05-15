CREATE TABLE IF NOT EXISTS "product_info"
(
    "article"            uuid PRIMARY KEY,
    "name"               varchar(255),
    "certificate_number" varchar(255),
    "packaging"          varchar(255),
    "company_name"       varchar(255)
);

ALTER TABLE "product_info"
    ADD CONSTRAINT "unique_article" UNIQUE ("article");

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "product"
(
    "id"               bigserial PRIMARY KEY,
    "is_active"        bool,
    "article"          uuid,
    "price"            decimal,
    "currency_code"    varchar(3),
    "quantity"         integer,
    "employee_to_role_id" integer,
    "product_group_id" integer
);
ALTER TABLE "product"
    ADD FOREIGN KEY ("article") REFERENCES "product_info" ("article");
ALTER TABLE "product"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");
ALTER TABLE "product"
    ADD FOREIGN KEY ("employee_to_role_id") REFERENCES "employee_to_role" ("id");


ALTER TABLE "product"
    ADD CONSTRAINT "chk_price_positive" CHECK ("price" >= 0);
ALTER TABLE "product"
    ADD CONSTRAINT "chk_quantity_nonnegative" CHECK ("quantity" >= 0);
ALTER TABLE "product"
    ADD CONSTRAINT "chk_currency_code_valid" CHECK ("currency_code" ~ '^[A-Z]{3}$');

