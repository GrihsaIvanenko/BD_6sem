ALTER TABLE "product" ADD FOREIGN KEY ("employee_to_role_id") REFERENCES "employee_to_role" ("id");

ALTER TABLE "employee_to_role" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "employee_to_role" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

ALTER TABLE "employee" ADD FOREIGN KEY ("supervisor_id") REFERENCES "employee" ("id");

ALTER TABLE "employee_info" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id");

ALTER TABLE "payment_order" ADD FOREIGN KEY ("employee_to_role_id") REFERENCES "employee_to_role" ("id");

ALTER TABLE "order_item" ADD FOREIGN KEY ("payment_id") REFERENCES "payment_order" ("id");

ALTER TABLE "order_item" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");
