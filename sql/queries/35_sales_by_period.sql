SELECT payment_order.date, product.name, product.company_name, order_item.quantity
FROM order_item
JOIN payment_order ON order_item.payment_id = payment_order.id
JOIN product ON order_item.product_id = product.id
WHERE payment_order.date BETWEEN '2021-01-01' AND '2023-01-01';

