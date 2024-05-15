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

