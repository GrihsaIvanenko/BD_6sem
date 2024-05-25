SELECT product.name, product.company_name, product.price, order_item.quantity, product.price * order_item.quantity AS SUMMA
FROM order_item
JOIN product ON order_item.product_id = product.id
WHERE (order_item.payment_id='10d320c0-412f-4828-91e4-d3db2a763973');
