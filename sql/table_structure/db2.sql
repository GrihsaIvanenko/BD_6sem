CREATE TABLE IF NOT EXISTS "user_cart"
(
    "id"              serial PRIMARY KEY,
    "date"            timestamp,
    "organization_id" uuid,
    "invoice_id"      integer
);

ALTER TABLE "user_cart"
    ADD FOREIGN KEY ("invoice_id") REFERENCES "invoice" ("id");

CREATE TABLE IF NOT EXISTS "user_item"
(
    "id"              uuid,
    "product_article" uuid,
    "quantity"        integer,
    "organization_id" uuid,
    "user_cart_id"    integer
);

ALTER TABLE "user_item"
    ADD FOREIGN KEY ("user_cart_id") REFERENCES "user_cart" ("id");

CREATE TABLE IF NOT EXISTS "currency"
(
    "code"        varchar(3) PRIMARY KEY,
    "country"     varchar(255),
    "description" varchar(255)
);

ALTER TABLE "currency"
    ADD CONSTRAINT "chk_currency_code_valid" CHECK ("code" ~ '^[A-Z]{3}$');
CREATE TABLE IF NOT EXISTS "currency"
(
    "code"        varchar(3) PRIMARY KEY,
    "country"     varchar(255),
    "description" varchar(255)
);

ALTER TABLE "currency"
    ADD CONSTRAINT "chk_currency_code_valid" CHECK ("code" ~ '^[A-Z]{3}$');
CREATE TABLE IF NOT EXISTS "employee"
(
    "id"            serial PRIMARY KEY,
    "full_name"     varchar(255),
    "supervisor_id" integer NULL
);

ALTER TABLE "employee"
    ADD FOREIGN KEY ("supervisor_id") REFERENCES "employee" ("id") ON DELETE SET NULL;

ALTER TABLE "employee"
    ADD CONSTRAINT "chk_supervisor_not_self" CHECK ("supervisor_id" IS NULL OR "id" <> "supervisor_id");


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "employee_info"
(
    "employee_id"   integer PRIMARY KEY,
    "iin"           varchar(128),
    "pasport"       varchar(128),
    "date_of_birth" timestamp,
    "sex"           sex_type,
    "phone_number"  varchar(128),
    "login"         varchar(255),
    "password"      varchar(255)
);
ALTER TABLE "employee_info"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

-- Assuming the IIN needs to be numeric only and exactly 12 digits long
CREATE FUNCTION check_iin_validity(iin varchar) RETURNS boolean AS
$$
BEGIN
    RETURN iin ~ '^[0-9]{12}$';
END;
$$
    LANGUAGE plpgsql;

ALTER TABLE "employee_info"
    ADD CONSTRAINT "chk_iin_valid" CHECK (check_iin_validity(iin));

ALTER TABLE "employee_info"
    ADD CONSTRAINT "chk_dob_past" CHECK ("date_of_birth" <= CURRENT_DATE);
ALTER TABLE "employee_info"
    ADD CONSTRAINT "unique_iin" UNIQUE ("iin");
ALTER TABLE "employee_info"
    ADD CONSTRAINT "unique_login" UNIQUE ("login");
CREATE TYPE "product_document_type" AS ENUM (
    'SALE',
    'REFUND'
    );

CREATE TYPE "payment_order_type" AS ENUM (
    'INCOMING',
    'OUTCOMING'
    );

CREATE TYPE "sex_type" AS ENUM (
    'MALE',
    'FEMALE',
    'OTHER'
    );
CREATE TABLE IF NOT EXISTS "exchange_rate"
(
    "id"              serial PRIMARY KEY,
    "source_currency" varchar(3),
    "target_currency" varchar(3),
    "date"            timestamp,
    "value"           decimal
);

ALTER TABLE "exchange_rate"
    ADD FOREIGN KEY ("source_currency") REFERENCES "currency" ("code");
ALTER TABLE "exchange_rate"
    ADD FOREIGN KEY ("target_currency") REFERENCES "currency" ("code");

ALTER TABLE "exchange_rate"
    ADD CONSTRAINT "chk_exchange_rate_positive" CHECK ("value" > 0);
CREATE TABLE "invoice"
(
    "id"               serial PRIMARY KEY,
    "date"             timestamp,
    "currency_code"    varchar(3),
    "organization_id"  uuid,
    "payment_order_id" uuid
);

ALTER TABLE "invoice"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");

ALTER TABLE "invoice"
    ADD FOREIGN KEY ("organization_id") REFERENCES "organization" ("id");

ALTER TABLE "invoice"
    ADD FOREIGN KEY ("payment_order_id") REFERENCES "payment_order" ("id");CREATE TABLE IF NOT EXISTS "organization"
(
    "id"             uuid PRIMARY KEY,
    "name"           varchar(255),
    "address"        varchar(255),
    "category"       varchar(255),
    "license_number" varchar(255),
    "phone_number"   varchar(128),
    "bank_details"   varchar(255)
);

ALTER TABLE "organization"
    ADD CONSTRAINT "unique_name" UNIQUE ("name");
ALTER TABLE "organization"
    ADD CONSTRAINT "unique_license_number" UNIQUE ("license_number");
CREATE TABLE IF NOT EXISTS "payment_order" (
  "id" uuid PRIMARY KEY,
  "processed" bool,
  "date" timestamp,
  "type" payment_order_type,
  "total_sum" decimal,
  "currency_code" varchar(3),
  "bank_id" varchar(255),
  "employee_id" integer
);

ALTER TABLE "payment_order"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");
ALTER TABLE "payment_order"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");
-- Ensure that total sum in the payment order is positive, assuming orders can't be negative
ALTER TABLE "payment_order"
    ADD CONSTRAINT "chk_total_sum_positive" CHECK ("total_sum" >= 0);
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
    "employee_id"      integer,
    "product_group_id" integer
);
ALTER TABLE "product"
    ADD FOREIGN KEY ("article") REFERENCES "product_info" ("article");
ALTER TABLE "product"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");
ALTER TABLE "product"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");


-- Ensuring that the price in the product table cannot be negative
ALTER TABLE "product"
    ADD CONSTRAINT "chk_price_positive" CHECK ("price" >= 0);
-- Ensuring that the quantity in the product table is non-negative
ALTER TABLE "product"
    ADD CONSTRAINT "chk_quantity_nonnegative" CHECK ("quantity" >= 0);
-- Validation for currency_code in product, ensuring it is upper case (standard in currency codes) and consists of 3 letters
ALTER TABLE "product"
    ADD CONSTRAINT "chk_currency_code_valid" CHECK ("currency_code" ~ '^[A-Z]{3}$');
CREATE TABLE IF NOT EXISTS "product_document" (
  "id" uuid PRIMARY KEY,
  "type" product_document_type,
  "date" timestamp,
  "currency_code" varchar(3),
  "product_article" uuid,
  "quantity" integer,
  "exchange_rate_id" integer,
  "employee_id" integer,
  "organization_id" uuid,
  "invoice_id" integer
);

ALTER TABLE "product_document"
    ADD FOREIGN KEY ("product_article") REFERENCES "product_info" ("article");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("invoice_id") REFERENCES "invoice" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("exchange_rate_id") REFERENCES "exchange_rate" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("organization_id") REFERENCES "organization" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");
CREATE TABLE IF NOT EXISTS "product_group"
(
    "id"                      serial PRIMARY KEY,
    "name"                    varchar(255),
    "description"             text,
    "parent_product_group_id" integer
);

ALTER TABLE "product_group"
    ADD FOREIGN KEY ("parent_product_group_id") REFERENCES "product_group" ("id");
-- For product_group, a product group should not be able to be its own parent.
ALTER TABLE "product_group"
    ADD CONSTRAINT "chk_no_self_parenting" CHECK ("id" <> "parent_product_group_id");
CREATE TABLE IF NOT EXISTS "role"
(
    "id"   integer PRIMARY KEY,
    "name" varchar(128)
);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "employee_to_role"
(
    "role_id"     integer,
    "employee_id" integer
);
ALTER TABLE "employee_to_role"
    ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");
ALTER TABLE "employee_to_role"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

CREATE UNIQUE INDEX idx_employee_role_unique ON "employee_to_role" ("role_id", "employee_id");
CREATE TABLE IF NOT EXISTS "employee"
(
    "id"            serial PRIMARY KEY,
    "full_name"     varchar(255),
    "supervisor_id" integer NULL
);

ALTER TABLE "employee"
    ADD FOREIGN KEY ("supervisor_id") REFERENCES "employee" ("id") ON DELETE SET NULL;

ALTER TABLE "employee"
    ADD CONSTRAINT "chk_supervisor_not_self" CHECK ("supervisor_id" IS NULL OR "id" <> "supervisor_id");


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "employee_info"
(
    "employee_id"   integer PRIMARY KEY,
    "iin"           varchar(128),
    "pasport"       varchar(128),
    "date_of_birth" timestamp,
    "sex"           sex_type,
    "phone_number"  varchar(128),
    "login"         varchar(255),
    "password"      varchar(255)
);
ALTER TABLE "employee_info"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

-- Assuming the IIN needs to be numeric only and exactly 12 digits long
CREATE FUNCTION check_iin_validity(iin varchar) RETURNS boolean AS
$$
BEGIN
    RETURN iin ~ '^[0-9]{12}$';
END;
$$
    LANGUAGE plpgsql;

ALTER TABLE "employee_info"
    ADD CONSTRAINT "chk_iin_valid" CHECK (check_iin_validity(iin));

-- Ensuring the date of birth in the employee_info table is a sensible date (not in the future)
ALTER TABLE "employee_info"
    ADD CONSTRAINT "chk_dob_past" CHECK ("date_of_birth" <= CURRENT_DATE);
ALTER TABLE "employee_info"
    ADD CONSTRAINT "unique_iin" UNIQUE ("iin");
ALTER TABLE "employee_info"
    ADD CONSTRAINT "unique_login" UNIQUE ("login");
CREATE TYPE "product_document_type" AS ENUM (
    'SALE',
    'REFUND'
    );

CREATE TYPE "payment_order_type" AS ENUM (
    'INCOMING',
    'OUTCOMING'
    );

CREATE TYPE "sex_type" AS ENUM (
    'MALE',
    'FEMALE',
    'OTHER'
    );
CREATE TABLE IF NOT EXISTS "exchange_rate"
(
    "id"              serial PRIMARY KEY,
    "source_currency" varchar(3),
    "target_currency" varchar(3),
    "date"            timestamp,
    "value"           decimal
);

ALTER TABLE "exchange_rate"
    ADD FOREIGN KEY ("source_currency") REFERENCES "currency" ("code");
ALTER TABLE "exchange_rate"
    ADD FOREIGN KEY ("target_currency") REFERENCES "currency" ("code");

ALTER TABLE "exchange_rate"
    ADD CONSTRAINT "chk_exchange_rate_positive" CHECK ("value" > 0);

ALTER TABLE "exchange_rate"
    ADD CONSTRAINT "chk_exchange_rate_unique" UNIQUE (source_currency, target_currency, date);CREATE TABLE "invoice"
(
    "id"               serial PRIMARY KEY,
    "date"             timestamp,
    "currency_code"    varchar(3),
    "organization_id"  uuid,
    "payment_order_id" uuid
);

ALTER TABLE "invoice"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");

ALTER TABLE "invoice"
    ADD FOREIGN KEY ("organization_id") REFERENCES "organization" ("id");

ALTER TABLE "invoice"
    ADD FOREIGN KEY ("payment_order_id") REFERENCES "payment_order" ("id");
CREATE TABLE IF NOT EXISTS "organization"
(
    "id"             uuid PRIMARY KEY,
    "name"           varchar(255),
    "address"        varchar(255),
    "category"       varchar(255),
    "license_number" varchar(255),
    "phone_number"   varchar(128),
    "bank_details"   varchar(255)
);

ALTER TABLE "organization"
    ADD CONSTRAINT "unique_name" UNIQUE ("name");
ALTER TABLE "organization"
    ADD CONSTRAINT "unique_license_number" UNIQUE ("license_number");
CREATE TABLE IF NOT EXISTS "payment_order"
(
    "id"                  uuid PRIMARY KEY,
    "processed"           bool,
    "date"                timestamp,
    "type"                payment_order_type,
    "total_sum"           decimal,
    "currency_code"       varchar(3),
    "bank_id"             varchar(255),
    "employee_to_role_id" integer
);

ALTER TABLE "payment_order"
    ADD FOREIGN KEY ("currency_code") REFERENCES "currency" ("code");
ALTER TABLE "payment_order"
    ADD FOREIGN KEY ("employee_to_role_id") REFERENCES "employee_to_role" ("id");
-- Ensure that total sum in the payment order is positive, assuming orders can't be negative
ALTER TABLE "payment_order"
    ADD CONSTRAINT "chk_total_sum_positive" CHECK ("total_sum" >= 0);
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
CREATE TABLE IF NOT EXISTS "product_document" (
  "id" uuid PRIMARY KEY,
  "type" product_document_type,
  "date" timestamp,
  "product_id" INTEGER,
  "quantity" integer,
  "exchange_rate_id" integer,
  "employee_to_role_id" integer,
  "invoice_id" integer
);

-- ALTER TABLE "product_document"
--     ADD FOREIGN KEY ("product_article") REFERENCES "product_info" ("article");

ALTER TABLE "product_document"
    ADD FOREIGN KEY ("invoice_id") REFERENCES "invoice" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("exchange_rate_id") REFERENCES "exchange_rate" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("employee_to_role_id") REFERENCES "employee_to_role" ("id");
ALTER TABLE "product_document"
    ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");
CREATE TABLE IF NOT EXISTS "product_group"
(
    "id"                      serial PRIMARY KEY,
    "name"                    varchar(255),
    "description"             text,
    "parent_product_group_id" integer
);

ALTER TABLE "product_group"
    ADD FOREIGN KEY ("parent_product_group_id") REFERENCES "product_group" ("id");

ALTER TABLE "product_group"
    ADD CONSTRAINT "chk_no_self_parenting" CHECK ("id" <> "parent_product_group_id");

ALTER TABLE "product_group"
    ADD CONSTRAINT "product_unique_name" UNIQUE ("name");
CREATE TABLE IF NOT EXISTS "role"
(
    "id"   serial PRIMARY KEY,
    "name" varchar(128)
);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "employee_to_role"
(
    "id"                serial PRIMARY KEY,
    "role_id"           integer,
    "employee_id"       integer,
    "date_of_admission" date,
    "date_of_dismissal" date,
    "salary"            decimal
);

ALTER TABLE "employee_to_role"
    ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");
ALTER TABLE "employee_to_role"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

CREATE UNIQUE INDEX idx_employee_role_unique ON "employee_to_role" ("role_id", "employee_id");

