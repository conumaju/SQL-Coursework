/* For this assignment, the instructions were to write queries that replicate the tables in the INST 327 - Assignment 1 - Questions.pdf 
file */
/*Query 1*/
USE EX;
SELECT CONCAT(customer_last_name,', ', customer_first_name) AS customer_name, customer_address AS customer_address_line1,
CONCAT(customer_city, ', ', customer_state, ' ', customer_zip) AS customer_address_line2, 
CONCAT('Ph #: ', customer_phone) AS customer_phone
FROM customers
WHERE customer_last_name >= 'H' AND customer_last_name < 'T'
ORDER BY customer_name;
/*Query 2*/
USE EX;
SELECT CONCAT('inv #: ', invoice_number) AS invoice_number, 
DATE_FORMAT(invoice_due_date, '%Y/%m/%d') AS invoice_due_date, invoice_total,
'balance over $1000' AS balance_level
FROM active_invoices
WHERE invoice_total > 1000
UNION
SELECT CONCAT('inv #: ', invoice_number) AS invoice_number, 
DATE_FORMAT(invoice_due_date, '%Y/%m/%d') AS invoice_due_date, invoice_total,
'LOW BALANCE' AS balance_level
FROM active_invoices
WHERE invoice_total < 1000
ORDER BY invoice_due_date DESC;
/*Query 3*/
USE EX;
SELECT CONCAT(first_name, ' ', last_name) AS employee_name, department_name, project_number
FROM employees
LEFT JOIN departments ON employees.department_number = departments.department_number
LEFT JOIN projects ON employees.employee_id = projects.employee_id
ORDER BY last_name;
/*Query 4*/
USE AP;
SELECT invoice_id, account_description, line_item_description, line_item_amount
FROM invoice_line_items
INNER JOIN general_ledger_accounts ON general_ledger_accounts.account_number = invoice_line_items.account_number
WHERE line_item_amount BETWEEN 2000 AND 38000
ORDER BY line_item_amount;
