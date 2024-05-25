INSERT INTO employee (id, full_name, supervisor_id)
VALUES
('30b3a2c0-416f-4828-92e4-d2db1a869992', 'John Doe', NULL),
('efa692b0-0150-4fdb-b1be-709c9a42fb62', 'Alice Smith', '30b3a2c0-416f-4828-92e4-d2db1a869992'),
('9b570957-447a-4924-aaf8-8a5287c6d2b6', 'Bob Johnson', '30b3a2c0-416f-4828-92e4-d2db1a869992'),
('20470c74-ee07-48f6-b31a-0df56cf80608', 'Marry Davis', '30b3a2c0-416f-4828-92e4-d2db1a869992'),
('c6745c00-9aeb-48c9-8122-ce9b6f3452aa', 'Kevin Garcia', 'efa692b0-0150-4fdb-b1be-709c9a42fb62'),
('4d4923da-8f9f-45ec-af17-6d428a63ae17', 'Anna Taylor', 'efa692b0-0150-4fdb-b1be-709c9a42fb62'),
('f7acb235-440a-42ed-b758-8787dc33e1c7', 'James Anderson', '9b570957-447a-4924-aaf8-8a5287c6d2b6'),
('0ebac194-8310-4ea8-8eb2-bfe9f91116f2', 'Patricia Miller', '9b570957-447a-4924-aaf8-8a5287c6d2b6'),
('f2a81a60-a7df-4f76-a712-24778999a5e6', 'Jennifer Williams', '20470c74-ee07-48f6-b31a-0df56cf80608'),
('9bb3b300-9221-4716-9c00-a7436aa780a5', 'Michael Brown', '20470c74-ee07-48f6-b31a-0df56cf80608');

INSERT INTO employee_info (employee_id, iin, pasport, date_of_birth, phone_number, login, password)
VALUES
('30b3a2c0-416f-4828-92e4-d2db1a869992', '12345678123456', '98765432', '1980-12-10 00:00:00', '555-55-55', 'jdoe', 'passwordJD'),
('efa692b0-0150-4fdb-b1be-709c9a42fb62', '23456789234567', '87654321', '1985-03-05 00:00:00', '555-55-56', 'asmith', 'passwordAS'),
('9b570957-447a-4924-aaf8-8a5287c6d2b6', '34567890345678', '76543210', '1990-06-01 00:00:00', '555-55-57', 'bjohnson', 'passwordBJ'),
('20470c74-ee07-48f6-b31a-0df56cf80608', '45678901456789', '65432109', '1982-09-12 00:00:00', '555-55-58', 'mdavis', 'passwordMD'),
('c6745c00-9aeb-48c9-8122-ce9b6f3452aa', '56789012567890', '54321098', '1979-02-22 00:00:00', '555-55-59', 'kgarcia', 'passwordKG'),
('4d4923da-8f9f-45ec-af17-6d428a63ae17', '67890123678901', '43210987', '1988-07-17 00:00:00', '555-55-60', 'ataylor', 'passwordAT'),
('f7acb235-440a-42ed-b758-8787dc33e1c7', '78901234789012', '32109876', '1992-05-03 00:00:00', '555-55-61', 'janderson', 'passwordJA'),
('0ebac194-8310-4ea8-8eb2-bfe9f91116f2', '89012345890123', '21098765', '1980-10-28 00:00:00', '555-55-62', 'pmiller', 'passwordPM'),
('f2a81a60-a7df-4f76-a712-24778999a5e6', '90123456901234', '10987654', '1985-04-15 00:00:00', '555-55-63', 'jwilliams', 'passwordJW'),
('9bb3b300-9221-4716-9c00-a7436aa780a5', '01234567012345', '09876543', '1983-06-30 00:00:00', '555-55-64', 'mbrown', 'passwordMB');

INSERT INTO role (id, name)
VALUES
('1ef36080-a9ef-48c2-99f6-a234f6ed3a42', 'Junior Developer'),
('2fd26180-b9ef-48c2-89f6-b234f6ed3a42', 'Senior Developer'),
('3fd36180-c9ef-48c2-79f6-c234f6ed3a42', 'Project Manager'),
('4fd46180-d9ef-48c2-69f6-d234f6ed3a42', 'Scrum Master'),
('5fd56180-e9ef-48c2-59f6-e234f6ed3a42', 'QA Engineer'),
('fea09876-f9d2-384c-26f5-a234f6ed3a42', 'Data Analyst'),
('edb09876-e9d2-284c-16f5-b234f6ed3a42', 'UI/UX Designer'),
('dca09876-d9d2-184c-06f5-c234f6ed3a42', 'Software Architect'),
('cbd09876-c9d2-084c-96f5-d234f6ed3a42', 'DevOps Engineer'),
('dbd09876-c9d2-084c-96f5-d234f6ed3a42', 'Kicker player'),
('bac09876-b9d2-f84c-86f5-f234f6ed3a42', 'Json builder');


INSERT INTO employee_to_role (id, role_id, employee_id, date_of_admission, date_of_dismissal, salary)
VALUES
('10a320c0-412f-4828-91e4-d3db2a763973', '1ef36080-a9ef-48c2-99f6-a234f6ed3a42', '30b3a2c0-416f-4828-92e4-d2db1a869992', '2022-01-01', NULL, 800.00),
('23f261b0-7950-3fdb-b1be-309c9a42fb63', '2fd26180-b9ef-48c2-89f6-b234f6ed3a42', 'efa692b0-0150-4fdb-b1be-709c9a42fb62', '2022-02-01', NULL, 700.00),
('3b960967-336a-6024-aaf8-7a5287c6d2b6', '3fd36180-c9ef-48c2-79f6-c234f6ed3a42', '9b570957-447a-4924-aaf8-8a5287c6d2b6', '2022-03-01', NULL, 600.00),
('40015c74-fe57-48f6-b21f-4df56cf80608', '4fd46180-d9ef-48c2-69f6-d234f6ed3a42', '20470c74-ee07-48f6-b31a-0df56cf80608', '2022-04-01', NULL, 500.00),
('515452c0-8aeb-58c9-8112-fe9b6f3452aa', '5fd56180-e9ef-48c2-59f6-e234f6ed3a42', 'c6745c00-9aeb-48c9-8122-ce9b6f3452aa', '2022-05-01', NULL, 650.00),
('656e23da-9f8f-65ec-af17-7d428a63ae17', 'fea09876-f9d2-384c-26f5-a234f6ed3a42', '4d4923da-8f9f-45ec-af17-6d428a63ae17', '2022-01-01', NULL, 550.00),
('736a1235-751a-22ed-b758-7887dc33e1c7', 'edb09876-e9d2-284c-16f5-b234f6ed3a42', 'f7acb235-440a-42ed-b758-8787dc33e1c7', '2022-02-01', '2022-11-01', 750.00),
('89e1c194-9305-4ea8-7eb2-cfe9f91116f2', 'dca09876-d9d2-184c-06f5-c234f6ed3a42', '0ebac194-8310-4ea8-8eb2-bfe9f91116f2', '2022-03-01', NULL, 400.00),
('937a1a60-a7df-3f76-a513-14778999a5e6', 'cbd09876-c9d2-084c-96f5-d234f6ed3a42', 'f2a81a60-a7df-4f76-a712-24778999a5e6', '2022-04-01', NULL, 600.00),
('9ac3b300-7332-4716-7c00-a6436aa780a5', 'dbd09876-c9d2-084c-96f5-d234f6ed3a42', '9bb3b300-9221-4716-9c00-a7436aa780a5', '2022-10-01', '2022-12-31', 700.00),
('12345678-a1b2-c3d4-e5f6-abcdef123456', 'dbd09876-c9d2-084c-96f5-d234f6ed3a42', '30b3a2c0-416f-4828-92e4-d2db1a869992', '2021-02-01', '2022-01-01', 850.00),
('23456789-b1c2-d3e4-f5a6-bcdef1234567', 'edb09876-e9d2-284c-16f5-b234f6ed3a42', 'efa692b0-0150-4fdb-b1be-709c9a42fb62', '2021-03-01', '2022-02-01', 750.00),
('34567890-c1d2-e3f4-a5b6-cdef12345678', 'dca09876-d9d2-184c-06f5-c234f6ed3a42', '9b570957-447a-4924-aaf8-8a5287c6d2b6', '2021-04-01', '2022-03-01', 650.00),
('45678901-d1e2-f3a4-b5c6-def123456789', 'cbd09876-c9d2-084c-96f5-d234f6ed3a42', '20470c74-ee07-48f6-b31a-0df56cf80608', '2021-05-01', '2022-04-01', 550.00),
('56789012-e1f2-a3b4-c5d6-ef1234567890', 'bac09876-b9d2-f84c-86f5-f234f6ed3a42', 'c6745c00-9aeb-48c9-8122-ce9b6f3452aa', '2021-06-01', '2022-05-01', 700.00);

INSERT INTO product (id, name, company_name, price, quantity, employee_to_role_id)
VALUES
('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Product A', 'Company A', 10.00, 100, '10a320c0-412f-4828-91e4-d3db2a763973'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Product B', 'Company B', 20.00, 200, '23f261b0-7950-3fdb-b1be-309c9a42fb63'),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Product C', 'Company C', 30.00, 300, '3b960967-336a-6024-aaf8-7a5287c6d2b6'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Product D', 'Company D', 40.00, 400, '40015c74-fe57-48f6-b21f-4df56cf80608'),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Product E', 'Company E', 50.00, 500, '515452c0-8aeb-58c9-8112-fe9b6f3452aa'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Product F', 'Company F', 15.00, 150, '656e23da-9f8f-65ec-af17-7d428a63ae17'),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Product G', 'Company G', 25.00, 250, '736a1235-751a-22ed-b758-7887dc33e1c7'),
('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Product H', 'Company H', 35.00, 350, '89e1c194-9305-4ea8-7eb2-cfe9f91116f2'),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Product I', 'Company I', 45.00, 450, '937a1a60-a7df-3f76-a513-14778999a5e6'),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'Product J', 'Company J', 55.00, 550, '9ac3b300-7332-4716-7c00-a6436aa780a5'),
('0a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', 'Product K', 'Company K', 60.00, 600, '12345678-a1b2-c3d4-e5f6-abcdef123456'),
('1b2c3d4e-5f6a-7b8c-9d0e-1f2a3b4c5d6e', 'Product L', 'Company L', 45.00, 450, '23456789-b1c2-d3e4-f5a6-bcdef1234567'),
('2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', 'Product M', 'Company M', 35.00, 350, '34567890-c1d2-e3f4-a5b6-cdef12345678'),
('3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a', 'Product N', 'Company N', 70.00, 700, '45678901-d1e2-f3a4-b5c6-def123456789'),
('4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', 'Product O', 'Company O', 75.00, 750, '56789012-e1f2-a3b4-c5d6-ef1234567890'),
('5f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b0c', 'Product P', 'Company P', 65.00, 650, '10a320c0-412f-4828-91e4-d3db2a763973'),
('6a7b8c9d-0e1f-2a3b-4c5d-6e7f8a9b0c1d', 'Product Q', 'Company Q', 85.00, 850, '23f261b0-7950-3fdb-b1be-309c9a42fb63'),
('7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e', 'Product R', 'Company R', 95.00, 950, '3b960967-336a-6024-aaf8-7a5287c6d2b6'),
('8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'Product S', 'Company S', 100.00, 1000, '40015c74-fe57-48f6-b21f-4df56cf80608'),
('9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f4a', 'Product T', 'Company T', 200.00, 2000, '515452c0-8aeb-58c9-8112-fe9b6f3452aa');

INSERT INTO payment_order (id, date, total_sum, bank_id, employee_to_role_id) VALUES
('10d320c0-412f-4828-91e4-d3db2a763973', '2022-01-02 10:00:00', 100.00, 'BANK1', '10a320c0-412f-4828-91e4-d3db2a763973'),
('3940322a-af2c-4317-923a-4ea285e1b329', '2022-03-03 13:00:00', 700.00, 'BANK2', '3b960967-336a-6024-aaf8-7a5287c6d2b6'),
('525452c0-8f45-5821-8161-fe9b6f3452aa', '2022-05-15 13:30:00', 1500.00, 'BANK1', '515452c0-8aeb-58c9-8112-fe9b6f3452aa'),
('724a1478-7b5b-42bc-9468-7887dc33e1c7', '2022-07-07 15:45:00', 2000.00, 'BANK1', '736a1235-751a-22ed-b758-7887dc33e1c7'),
('914a2b88-641d-6179-a6a8-14778999a5e6', '2022-09-09 11:00:00', 1400.00, 'BANK1', '10a320c0-412f-4828-91e4-d3db2a763973'),
('1472a3c4-e1b6-c321-ef0f-abcdef123456', '2022-11-11 10:00:00', 3000.00, 'BANK1', '12345678-a1b2-c3d4-e5f6-abcdef123456'),
('3456a9d7-5c7e-4b6d-2f1a-cdef12345678', '2023-01-01 11:45:00', 4000.00, 'BANK1', '515452c0-8aeb-58c9-8112-fe9b6f3452aa'),
('5947c3a0-6d5e-2d1f-0a2b-ef1234567890', '2023-03-03 12:15:00', 1600.00, 'BANK1', '56789012-e1f2-a3b4-c5d6-ef1234567890');

INSERT INTO order_item (id, payment_id, product_id, quantity)
VALUES
('d0dab50a-edb6-45c8-965a-a0b2c3d4e5f6', '10d320c0-412f-4828-91e4-d3db2a763973', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 5),
('c1c6b5a4-fe7d-8a9b-0c1d-2e3f4a5b6c7d', '914a2b88-641d-6179-a6a8-14778999a5e6', '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 2),
('b2b547a3-f8e6-9a0b-c1d2-e3f4a5b6c7d8', '10d320c0-412f-4828-91e4-d3db2a763973', '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 1),
('a3a538b2-6f8d-9a0c-1d2e-3f4a5b6c7d8e', '5947c3a0-6d5e-2d1f-0a2b-ef1234567890', '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 3),
('94a529b3-8d6e-9a1b-0c1d-2e3f4a5b6c7d', '3456a9d7-5c7e-4b6d-2f1a-cdef12345678', '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 1),
('85b51a4c-8d7f-9a1c-2d3e-4f5a6b7c8d90', '3940322a-af2c-4317-923a-4ea285e1b329', '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 4),
('76c51b45-e8d7-f9a2-1d3e-5f6a7b8c9d07', '914a2b88-641d-6179-a6a8-14778999a5e6', '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 2),
('65d41b50-f7e8-9a2b-3d4e-6f7a8b9c0d12', '10d320c0-412f-4828-91e4-d3db2a763973', '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 1),
('54e43b59-8f7e-9b2c-4d5e-7f8a9b0c1d26', '3456a9d7-5c7e-4b6d-2f1a-cdef12345678', '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 3),
('43f45ba0-af7e-9c2b-5d6e-8f9a0b1c2d31', '3456a9d7-5c7e-4b6d-2f1a-cdef12345678', '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 2),
('32a56b49-bf7e-9c3b-6d7e-9f0a1b2c3d48', '3456a9d7-5c7e-4b6d-2f1a-cdef12345678', '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 3),
('21b59a4e-cf7e-9d3b-7e8f-9a0b1c2d3e5c', '914a2b88-641d-6179-a6a8-14778999a5e6', '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 1),
('10c54b94-df7e-9d4b-8e9f-0a1b2c3d4e6c', '10d320c0-412f-4828-91e4-d3db2a763973', '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 4),
('0b1d5ba3-f7e9-8d5b-9e0f-1a2b3c4d5e7c', '525452c0-8f45-5821-8161-fe9b6f3452aa', '0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 1),
('0b659b46-a7f9-8b6c-9d1e-2a3b4c5d6e8c', '724a1478-7b5b-42bc-9468-7887dc33e1c7', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', 5),
('0b4c6b55-a9f8-8b7c-9e1f-2a3b4c5d6e9c', '1472a3c4-e1b6-c321-ef0f-abcdef123456', '2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', 2),
('0b3a7b94-a9f8-8b8c-9d2f-3b4c5d6e7f9c', '914a2b88-641d-6179-a6a8-14778999a5e6', '2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', 3),
('0b2a8b97-a9f8-8b9c-9d3f-4b5c6d7e8f9c', '914a2b88-641d-6179-a6a8-14778999a5e6', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', 1),
('0b1b9c99-a9f8-8b0c-9d4f-5c6d7e8f9a9c', '10d320c0-412f-4828-91e4-d3db2a763973', '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 4),
('0b0a0ab9-a9f8-8b1c-9d5f-6d7e8f9a0a9c', '3940322a-af2c-4317-923a-4ea285e1b329', '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 1);
