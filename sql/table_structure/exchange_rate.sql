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
    ADD CONSTRAINT "chk_exchange_rate_unique" UNIQUE (source_currency, target_currency, date);
