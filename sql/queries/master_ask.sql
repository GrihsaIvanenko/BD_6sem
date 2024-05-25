WITH PART AS (SELECT id as bill_id, CONCAT(EXTRACT(year FROM payment_order.date), EXTRACT(month FROM payment_order.date))  as month_name
FROM payment_order),

tmp as (SELECT *
FROM PART
JOIN order_item ON PART.bill_id = order_item.payment_id),

tmptmp as (SELECT price, tmp.quantity, tmp.month_name
FROM tmp
JOIN product ON tmp.product_id = product.id)

SELECT month_name, SUM(price * quantity) as TOTAL_COST, SUM(quantity) as TOTAL_COUNT, MAX(price * quantity) as MAX_COST, MAX(quantity) as MAX_COUNT
FROM tmptmp
GROUP BY month_name

