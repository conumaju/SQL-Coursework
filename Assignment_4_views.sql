USE forestgleninn_a4;
DROP VIEW IF EXISTS weekday_reservations;
CREATE VIEW weekday_reservations AS
SELECT CONCAT(last_name, ', ', first_name) AS guest_name, DATE_FORMAT(check_in_date, '%m/%d/%Y') AS check_in_date,
DAYNAME(check_in_date) AS check_in_day
FROM reservations JOIN guests
	ON reservations.guest_id = guests.guest_id
WHERE DAYNAME(check_in_date) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday')
ORDER BY DATE_FORMAT(check_in_date, '%w'), last_name, first_name;

DROP VIEW IF EXISTS long_reservations;
CREATE VIEW long_reservations AS
SELECT CONCAT(last_name, ', ', first_name) AS guest_name, DATE_FORMAT(check_in_date, '%m/%d/%Y') AS check_in_date,
DATE_FORMAT(check_out_date, '%m/%d/%Y') AS check_out_date, DATEDIFF(check_out_date, check_in_date) AS reservation_length
FROM reservations JOIN guests
	ON reservations.guest_id = guests.guest_id
WHERE DATEDIFF(check_out_date, check_in_date) > 3
ORDER BY reservation_length DESC, last_name, first_name;