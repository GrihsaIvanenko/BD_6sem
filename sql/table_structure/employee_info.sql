CREATE TABLE "employee_info" (
  "employee_id" uuid PRIMARY KEY,
  "iin" varchar(128),
  "pasport" varchar(128),
  "date_of_birth" timestamp,
  "phone_number" varchar(128),
  "login" varchar(255),
  "password" varchar(255)
);
