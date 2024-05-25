SELECT name, date_of_admission, date_of_dismissal
FROM employee
JOIN employee_to_role ON employee.id = employee_to_role.employee_id
JOIN role ON employee_to_role.role_id = role.id
WHERE employee.full_name = 'John Doe';
