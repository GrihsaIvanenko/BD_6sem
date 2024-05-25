SELECT sum(total_sum), employee_to_role_id
FROM payment_order
GROUP BY employee_to_role_id;
