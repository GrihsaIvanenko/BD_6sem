CREATE TABLE "employee_to_role" (
  "id" uuid PRIMARY KEY,
  "role_id" uuid,
  "employee_id" uuid,
  "date_of_admission" date,
  "date_of_dismissal" date,
  "salary" decimal
);
