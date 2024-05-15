CREATE TABLE IF NOT EXISTS "employee"
(
    "id"            serial PRIMARY KEY,
    "full_name"     varchar(255),
    "supervisor_id" integer NULL
);

ALTER TABLE "employee"
    ADD FOREIGN KEY ("supervisor_id") REFERENCES "employee" ("id") ON DELETE SET NULL;

ALTER TABLE "employee"
    ADD CONSTRAINT "chk_supervisor_not_self" CHECK ("supervisor_id" IS NULL OR "id" <> "supervisor_id");


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE IF NOT EXISTS "employee_info"
(
    "employee_id"   integer PRIMARY KEY,
    "iin"           varchar(128),
    "pasport"       varchar(128),
    "date_of_birth" timestamp,
    "sex"           sex_type,
    "phone_number"  varchar(128),
    "login"         varchar(255),
    "password"      varchar(255)
);
ALTER TABLE "employee_info"
    ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

-- Assuming the IIN needs to be numeric only and exactly 12 digits long
CREATE FUNCTION check_iin_validity(iin varchar) RETURNS boolean AS
$$
BEGIN
    RETURN iin ~ '^[0-9]{12}$';
END;
$$
    LANGUAGE plpgsql;

ALTER TABLE "employee_info"
    ADD CONSTRAINT "chk_iin_valid" CHECK (check_iin_validity(iin));

-- Ensuring the date of birth in the employee_info table is a sensible date (not in the future)
ALTER TABLE "employee_info"
    ADD CONSTRAINT "chk_dob_past" CHECK ("date_of_birth" <= CURRENT_DATE);
ALTER TABLE "employee_info"
    ADD CONSTRAINT "unique_iin" UNIQUE ("iin");
ALTER TABLE "employee_info"
    ADD CONSTRAINT "unique_login" UNIQUE ("login");

