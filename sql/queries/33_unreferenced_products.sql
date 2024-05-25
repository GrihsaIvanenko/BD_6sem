WITH tmp AS (SELECT id AS emp_id
FROM employee_to_role
WHERE (date_of_admission < '2022-03-01' and (date_of_dismissal > '2022-03-01' or date_of_dismissal IS NULL)))
SELECT name
FROM tmp
right join product ON product.employee_to_role_id = tmp.emp_id
WHERE emp_id IS NULL
