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


