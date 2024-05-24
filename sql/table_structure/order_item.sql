CREATE TABLE "order_item" (
  "id" uuid PRIMARY KEY,
  "payment_id" uuid,
  "product_id" uuid,
  "quantity" integer
);
