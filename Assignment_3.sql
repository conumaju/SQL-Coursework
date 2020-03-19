/* Answer 1 */
USE my_guitar_shop;
SELECT order_id, COUNT(*) AS num_items, SUM((item_price - discount_amount) * quantity) AS order_total, 
	MAX(discount_amount) AS max_item_discount
FROM order_items
GROUP BY order_id
HAVING max_item_discount > 200
ORDER BY order_id;

/* Answer 2 */
USE my_guitar_shop;
SELECT CONCAT(last_name, ', ', first_name) AS customer_name, email_address, product_name, 
CONCAT(FORMAT(discount_percent, 0), '%') AS discount_percent
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
WHERE discount_percent > 
	(SELECT AVG(discount_percent)
    FROM products)
ORDER BY discount_percent DESC, product_name, email_address;
