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

