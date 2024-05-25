WITH tmp AS (SELECT *
FROM employee_to_role
WHERE (date_of_admission < '2022-03-01' and (date_of_dismissal > '2022-03-01' or date_of_dismissal IS NULL))),
tmptmp AS (SELECT *
FROM tmp
JOIN employee ON tmp.employee_id = employee.id)
SELECT full_name
FROM tmptmp
JOIN employee_info on tmptmp.employee_id = employee_info.employee_id;
