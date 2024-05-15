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

