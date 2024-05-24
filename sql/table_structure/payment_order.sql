CREATE TABLE "payment_order" (
  "id" uuid PRIMARY KEY,
  "date" timestamp,
  "total_sum" decimal,
  "bank_id" varchar(255),
  "employee_to_role_id" uuid
);
