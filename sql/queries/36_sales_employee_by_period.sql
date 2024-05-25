SELECT 
    e.full_name, 
    po.date, 
    p.name, 
    oi.quantity, 
    oi.quantity * p.price as total_price
FROM 
    payment_order po
JOIN 
    employee_to_role etr ON po.employee_to_role_id = etr.id
JOIN 
    employee e ON etr.employee_id = e.id
JOIN 
    order_item oi ON po.id = oi.payment_id
JOIN 
    product p ON oi.product_id = p.id
WHERE 
    e.full_name = 'John Doe' 
AND 
    po.date BETWEEN '2021-01-01' AND '2023-01-01';

