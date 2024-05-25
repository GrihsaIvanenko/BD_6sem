CREATE TABLE IF NOT EXISTS "product" (
  "id" uuid PRIMARY KEY,
  "name" varchar(255),
  "company_name" varchar(255),
  "price" decimal,
  "quantity" integer,
  "employee_to_role_id" uuid
);
