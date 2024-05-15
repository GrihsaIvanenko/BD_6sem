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
    ADD FOREIGN KEY ("payment_order_id") REFERENCES "payment_order" ("id");

