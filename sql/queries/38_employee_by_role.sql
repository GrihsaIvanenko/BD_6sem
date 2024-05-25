SELECT e.full_name
FROM employee e
JOIN employee_to_role etr ON e.id = etr.employee_id
JOIN role r ON etr.role_id = r.id
WHERE r.name = 'Kicker player';

