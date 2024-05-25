WITH tmp AS (SELECT employee_to_role_id
FROM payment_order
WHERE (id = '10d320c0-412f-4828-91e4-d3db2a763973')),
tmptmp AS (SELECT *
FROM tmp
JOIN employee_to_role ON tmp.employee_to_role_id = employee_to_role.id)
SELECT full_name
FROM tmptmp
JOIN employee ON tmptmp.employee_id = employee.id;
