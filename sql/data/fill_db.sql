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
