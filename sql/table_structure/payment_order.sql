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

