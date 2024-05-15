CREATE TABLE IF NOT EXISTS "role"
(
    "id"   serial PRIMARY KEY,
    "name" varchar(128)
);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "employee_to_role"
(
    "id"                serial PRIMARY KEY,
    "role_id"           integer,
    "employee_id"       integer,
    "date_of_admission" date,
    "date_of_dismissal" date,
    "salary"            decimal
);

ALTER TABLE "employee_to_role"
    ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");
ALTER TABLE "employee_to_role"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

CREATE UNIQUE INDEX idx_employee_role_unique ON "employee_to_role" ("role_id", "employee_id");

