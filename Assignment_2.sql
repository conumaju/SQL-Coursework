/* Answer 1 */
USE my_guitar_shop;
DROP TABLE IF EXISTS address_copy;
CREATE TABLE address_copy AS
SELECT * FROM addresses;

DROP TABLE IF EXISTS orders_copy;
CREATE TABLE orders_copy AS
SELECT * FROM orders;

/* Answer 2 */
INSERT INTO addresses
	(customer_id, line1, line2, city, state, zip_code, phone, disabled)
VALUES
	(6, '12765 Jefferson Str.', 'Apt 217', 'College Park', 'MD', '20742', '301-217-8888', 0);

/* Answer 3 */
INSERT INTO orders
	(customer_id, order_date, ship_amount, tax_amount, ship_date, ship_address_id, card_type, card_number, card_expires, billing_address_id)
VALUES
	(6, '2017-09-25 11:35:18', 5, 0, CURRENT_TIMESTAMP(), (SELECT address_id FROM addresses WHERE address_id = 13), 'Visa', '1234567890123456', '06/2020', 8);
    
/* Answer 4 */
UPDATE orders
SET tax_amount = 4.20, card_type = 'Mastercard'
WHERE order_id = 10;

/* Answer 5 */
UPDATE addresses
SET disabled = 1
WHERE state = 'CA';

/* Answer 6 */
SET SQL_SAFE_UPDATES = 0;
DELETE FROM addresses
WHERE address_id = 13;

DELETE FROM orders
WHERE ship_address_id = 13;